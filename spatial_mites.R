library(RTMB)
library(vegan)
library(viridis)
library(ggplot2); theme_set(theme_bw())
library(tmbstan)
library(bayestestR) ## diagnostic_posterior() etc.
library(bayesplot) ## mcmc_trace() etc.

data("mite")     ## Counts for each mite species we use column 31 (LRUG)
data("mite.env") ## Environmental covariate data
data("mite.xy")  ## Locations

xy <- mite.xy
dat <- list(Y=mite[["LRUG"]],
            X=drop(scale(mite.env[["SubsDens"]])),
            D=as.matrix(dist(xy)))
param <- list(mu=0, alpha=0, logPhi=0, logSigma=0, omega=numeric(nrow(mite)))
f <- function(par) {
  getAll(par, dat)
  phi <- exp(logPhi)
  sigma <- exp(logSigma)
  ## 'Gaussian' correlation function
  S <- sigma^2*exp(-(D/phi)^2)
  nll <- -dmvnorm(omega, mu=0, Sigma=S, log=TRUE)
  lambda <- exp(mu+alpha*X+omega)
  nll <- nll-sum(dpois(Y, lambda, log=TRUE))
  nll
}
obj <- MakeADFun(f, param, random="omega", silent=TRUE)
fit <- with(obj, nlminb(par, fn, gr))
sdr <- sdreport(obj)
pl <- as.list(sdr, "Est")
plsd <- as.list(sdr, "Std")

cc <- viridis::mako(500)
lamCol <- cc[as.numeric(cut(pl$omega, breaks=501))]
plot(xy, col=lamCol, pch=16, cex=5)

## or:

dd <- data.frame(xy, est = pl$omega, sd = plsd$omega)
ggplot(dd, aes(x, y, colour = est)) +
  geom_point(size=4, aes(alpha=1/sd)) +
  scale_color_viridis(option="mako")
 
## Now with tmbstan
## Too lazy to set real priors (!!!)
## Set bounds (uniform priors) to keep away from terrible places
bound <- 3
npar <- length(obj$env$par)
chains <- tmbstan(obj,
        lower = rep(-bound, npar),
        upper = rep(bound, npar),
        cores = 4)

diagnostic_posterior(chains, parameters="^[[:alpha:]]+$")
mcmc_trace(chains, regex_pars = "^[[:alpha:]]+$") + scale_colour_manual(values = palette())


## ------------------------------------------------------------------
## Sparse Gauss-Markov random field (GMRF) version
##
## Instead of specifying a (dense) covariance matrix as a function of
## distance, specify a (sparse) precision matrix: Q[i,j] is nonzero only
## if sites i and j are neighbours, i.e. if their Voronoi cells share an
## edge. Non-neighbours are conditionally independent given all the
## other sites.

library(Matrix)
library(deldir)

n <- nrow(xy)

## Voronoi (Dirichlet) tessellation, clipped to the 2.5 x 10 m study plot
vor <- deldir(xy$x, xy$y, rw = c(0, 2.5, 0, 10))
op <- par(mar=c(0,0,0,0)) ## turn off plot margins
plot(vor)
par(op) ## reset

## one row per edge: cells ind1 and ind2 share the edge (x1,y1)-(x2,y2)
edges <- vor$dirsgs
edges <- transform(edges,
                   len = sqrt((x1-x2)^2 + (y1-y2)^2),
                   dist = dat$D[cbind(ind1, ind2)])
## some sites lie on a regular grid, so cells can touch only at a corner
## (edge length zero up to rounding error); don't count these as neighbours
edges <- subset(edges, len > 1e-6)

## weights: stronger connection for longer shared edges, closer sites
## (use x = 1 instead for an unweighted neighbourhood graph)
W <- with(edges,
          sparseMatrix(i = pmin(ind1, ind2), j = pmax(ind1, ind2),
                       x = len/dist, dims = c(n, n), symmetric = TRUE))
ifun <- function(M) image(M, xlab = "", ylab = "", sub = "")
ifun(W)
## weighted graph Laplacian: omega' G omega = sum of w_ij*(omega_i - omega_j)^2
G <- as(Diagonal(x = rowSums(W)) - W, "generalMatrix")
ifun(G)
## cell areas
A <- as(as(Diagonal(x = vor$summary$dir.area), "generalMatrix"), "CsparseMatrix")

## Q = tau^2*(kappa^2*A + G)
##  - G penalizes differences between neighbours
##  - kappa^2*A pulls values toward zero, making Q positive definite
##    (kappa = 0 would be an 'intrinsic' CAR model); 1/kappa is a length scale
##  - this is a finite-volume approximation of the SPDE
##    (kappa^2 - Laplacian)^(1/2) omega = white noise/tau
## A smoother field (approximately Matern with nu = 1) would use
##    tau^2*(kappa^4*A + 2*kappa^2*G + G %*% solve(A) %*% G),
## which also connects neighbours of neighbours
make_Q <- function(logKappa, logTau) {
  exp(2*logTau)*(exp(2*logKappa)*A + G)
}

param_gmrf <- list(mu=0, alpha=0, logKappa=0, logTau=0, omega=numeric(n))
f_gmrf <- function(par) {
  getAll(par, dat)
  Q <- make_Q(logKappa, logTau)
  nll <- -dgmrf(omega, mu=0, Q=Q, log=TRUE)
  lambda <- exp(mu+alpha*X+omega)
  nll <- nll-sum(dpois(Y, lambda, log=TRUE))
  ## add priors (fake)
  ## nll <- nll - dgamma(logKappa, prior_shape, scale=prior_scale, log = TRUE)
  nll
}
obj_gmrf <- MakeADFun(f_gmrf, param_gmrf, random="omega", silent=TRUE)
fit_gmrf <- with(obj_gmrf, nlminb(par, fn, gr))
sdr_gmrf <- sdreport(obj_gmrf)
pl_gmrf <- as.list(sdr_gmrf, "Est")
plsd_gmrf <- as.list(sdr_gmrf, "Std")

bound <- 3
npar <- length(obj_gmrf$env$par)
chains <- tmbstan(obj_gmrf,
        lower = rep(-bound, npar),
        upper = rep(bound, npar),
        cores = 4)

diagnostic_posterior(chains, parameters="^[[:alpha:]]+$")
mcmc_trace(chains, regex_pars = "^[[:alpha:]]+$") + scale_colour_manual(values = palette())

## sparsity: fraction of nonzero elements in Q
Q_hat <- make_Q(pl_gmrf$logKappa, pl_gmrf$logTau)
nnzero(Q_hat)/n^2
image(Q_hat)

## marginal SDs of omega vary among sites (unlike in the GP model, where they
## all equal sigma)
summary(sqrt(diag(solve(Q_hat))))
exp(pl$logSigma)

## compare fixed effects. Length scales phi (GP) and 1/kappa (GMRF) are defined
## differently, so they aren't directly comparable
summary(sdr, "fixed")
summary(sdr_gmrf, "fixed")
c(GP = fit$objective, GMRF = fit_gmrf$objective)  ## negative log-likelihoods

## compare estimated fields at the sites (no alpha = 1/sd here: the GMRF SDs are
## larger at every site because the mean is only weakly identified when the
## field has a long range, cf. the SEs of mu)
dd_both <- rbind(data.frame(model = "GP", dd),
                 data.frame(model = "GMRF", xy, est = pl_gmrf$omega,
                            sd = plsd_gmrf$omega))
ggplot(dd_both, aes(x, y)) +
  geom_segment(data = edges, aes(x = x1, y = y1, xend = x2, yend = y2),
               colour = "gray70") +
  geom_point(size=4, aes(colour = est)) +
  facet_wrap(~model) +
  coord_equal() +
  scale_x_continuous(breaks = 0:2) +
  labs(x = "x", y = "y") +
  scale_color_viridis(option="mako") +
  theme(panel.spacing = grid::unit(0, "pt"))

plot(pl$omega, pl_gmrf$omega, las = 1, bty = "l",
     xlab = "GP estimate", ylab = "GMRF estimate")
abline(a = 0, b = 1, lty = 2)
