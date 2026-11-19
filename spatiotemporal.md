> **Note:** this file is generated from [`spatiotemporal.rmd`](spatiotemporal.rmd) by `make spatiotemporal.md`. Edit the `.rmd`, not this `.md`.

# Readings: Bayesian spatial and temporal models

Material for introducing the basic ideas needed to fit Bayesian temporal and spatial models (Gaussian processes, Gauss-Markov random fields, log-Gaussian Cox processes, AR/ARMA/state-space models), with an applied focus (INLA, Stan, TMB/RTMB). ★ = especially accessible.

## Overviews and bridges between topics

- ★ Hefley *et al.* (2017): very readable; shows that GPs, splines, and random effects are all the same idea. A good first reading for the unit.
- ★ Miller, Glennie and Seaton (2020): links the SPDE/GMRF approach to penalized splines/GAMs, which students may already know.
- Gelfand and Schliep (2016): short conceptual review.
- ★ Hodges and Reich (2010): a cautionary reading on spatial confounding.
- Wikle, Zammit-Mangion and Cressie (2019): free online at <https://spacetimewithr.org>, with applied R labs.

## Gaussian processes

- ★ Görtler, Kehlbeck and Deussen (2019): interactive ([link](https://distill.pub/2019/visual-exploration-gaussian-processes/)); a good first exposure.
- ★ McElreath (2020), Ch. 14: covers GPs in an applied way (Oceanic tools / island distance example); lecture videos available.
- Betancourt (2020): excellent on priors for length-scales and non-identifiability, but long.
- Stan Development Team (2025), [GP chapter](https://mc-stan.org/docs/stan-users-guide/gaussian-processes.html): practical implementation.
- Riutort-Mayol *et al.* (2023): Hilbert-space approximate GPs; the method behind `brms::gp(..., k = )` (Bürkner, 2017).
- Rasmussen and Williams (2006): the standard reference, free online at <http://gaussianprocess.org/gpml/>, but it leans toward machine learning.
- Fuglstad *et al.* (2019): PC priors for Matérn range and variance. Dan Simpson’s [blog](https://dansblog.netlify.app/) also has accessible posts on GP priors and on sparse matrices.

## GMRFs, SPDE, and INLA

- ★ Moraga (2019) ([online](https://www.paulamoraga.com/book-geospatial/)) and Moraga (2023) ([online](https://www.paulamoraga.com/book-spatial/)): very applied (R-INLA; areal, geostatistical, and some point process data).
- ★ Gómez-Rubio (2020): free [online](https://becarioprecario.bitbucket.io/inla-gitbook/).
- Krainski *et al.* (2018): free [online](https://becarioprecario.bitbucket.io/spde-gitbook/); the go-to for SPDE meshes.
- Lindgren and Rue (2015): R-INLA for spatial models.
- Rue *et al.* (2017): review of INLA (see also Rue, Martino and Chopin, 2009).
- Lindgren, Bolin and Rue (2022): ten-year retrospective on the SPDE approach.
- Areal (CAR/BYM) models: Riebler *et al.* (2016) (the BYM2 parameterization) and Morris *et al.* (2019) (BYM in Stan). The companion Stan case study (Morris, 2019) shows the sparse-precision trick explicitly.

## Log-Gaussian Cox processes

- Diggle *et al.* (2013): the best review to start with.
- Simpson *et al.* (2016): the theory behind the mesh-based LGCP.
- Illian, Sørbye and Rue (2012): fitting complex point process models with INLA.
- ★ Bachl *et al.* (2019): the [inlabru website](https://inlabru-org.github.io/inlabru/articles/) has worked LGCP examples (e.g. gorilla nests) that would make good labs.
- Renner *et al.* (2015): an applied ecology framing (presence-only data).

## AR/ARMA and state-space models (Bayesian)

- ★ Auger-Méthé *et al.* (2021): very applied, with TMB and Stan code.
- ★ Holmes, Scheuerell and Ward (2024): free online; chapters on Bayesian DLMs and AR models in Stan.
- Stan Development Team (2025), [time-series chapter](https://mc-stan.org/docs/stan-users-guide/time-series.html) (AR, MA, ARMA, GARCH, HMMs): short and concrete.
- Sørbye and Rue (2017): PC priors for AR processes; useful for students coming from the time-series course.
- Petris, Petrone and Campagnoli (2009): a bridge from classical to Bayesian time series.

## TMB/RTMB and sparse precision matrices

- ★ Osgood-Zimmerman and Wakefield (2023): compares TMB (Laplace approximation) directly with INLA.
- Thorson and Kristensen (2024): builds AR, GMRF, and SPDE models in TMB step by step ([code](https://github.com/James-Thorson/Spatio-temporal-models-for-ecologists)).
- Anderson *et al.* (2025): a high-level interface ([site](https://pbs-assess.github.io/sdmTMB/)) using SPDE meshes, which students can use before writing their own RTMB code.
- Kristensen (2023): the CRAN vignettes; `dgmrf()`, `dautoreg()`, and `dseparable()` are the building blocks for GMRF, AR, and separable space-time models. Kristensen *et al.* (2016) is the TMB reference.
- The glmmTMB [covariance structures vignette](https://glmmtmb.github.io/glmmTMB/articles/covstruct.html) (`ar1`, `ou`, `exp`, `mat`) gives a frequentist counterpart (Brooks *et al.*, 2017).

## Suggested order

1.  Hefley *et al.* (2017) → Görtler, Kehlbeck and Deussen (2019) → McElreath (2020) Ch. 14: intuition for “correlated random effects”.
2.  AR(1) as a sparse-precision GMRF (Holmes, Scheuerell and Ward, 2024; Stan Development Team, 2025).
3.  Areal (ICAR/BYM2) models and the SPDE (Gómez-Rubio, 2020; Miller, Glennie and Seaton, 2020; Moraga, 2023).
4.  LGCPs with inlabru: Diggle *et al.* (2013) for concepts, inlabru tutorials for practice.
5.  The same models in RTMB, with Osgood-Zimmerman and Wakefield (2023) for the INLA vs. Laplace comparison.

## References

<div id="refs" class="references csl-bib-body">

<div id="ref-andersonSdmTMB2025" class="csl-entry">

Anderson, S.C. *et al.* (2025) ‘<span class="nocase">sdmTMB</span>: An R package for fast, flexible, and user-friendly generalized linear mixed effects models with spatial and spatiotemporal random fields’, *Journal of Statistical Software*, 115(2). doi:[10.18637/jss.v115.i02](https://doi.org/10.18637/jss.v115.i02).

</div>

<div id="ref-auger-metheGuide2021" class="csl-entry">

Auger-Méthé, M. *et al.* (2021) ‘A guide to state–space modeling of ecological time series’, *Ecological Monographs*, 91(4), p. e01470. doi:[10.1002/ecm.1470](https://doi.org/10.1002/ecm.1470).

</div>

<div id="ref-bachlInlabru2019" class="csl-entry">

Bachl, F.E. *et al.* (2019) ‘<span class="nocase">inlabru</span>: An R package for Bayesian spatial modelling from ecological survey data’, *Methods in Ecology and Evolution*, 10(6), pp. 760–766. doi:[10.1111/2041-210X.13168](https://doi.org/10.1111/2041-210X.13168).

</div>

<div id="ref-betancourtRobust2020" class="csl-entry">

Betancourt, M. (2020) ‘Robust Gaussian process modeling’. Case study. Available at: <https://betanalpha.github.io/assets/case_studies/gaussian_processes.html>.

</div>

<div id="ref-brooksGlmmTMB2017" class="csl-entry">

Brooks, M.E. *et al.* (2017) ‘<span class="nocase">glmmTMB</span> balances speed and flexibility among packages for zero-inflated generalized linear mixed modeling’, *The R Journal*, 9(2), pp. 378–400. doi:[10.32614/RJ-2017-066](https://doi.org/10.32614/RJ-2017-066).

</div>

<div id="ref-burknerBrms2017" class="csl-entry">

Bürkner, P.-C. (2017) ‘<span class="nocase">brms</span>: An R package for Bayesian multilevel models using Stan’, *Journal of Statistical Software*, 80(1), pp. 1–28. doi:[10.18637/jss.v080.i01](https://doi.org/10.18637/jss.v080.i01).

</div>

<div id="ref-diggleSpatial2013" class="csl-entry">

Diggle, P.J. *et al.* (2013) ‘Spatial and spatio-temporal log-Gaussian Cox processes: Extending the geostatistical paradigm’, *Statistical Science*, 28(4), pp. 542–563. doi:[10.1214/13-STS441](https://doi.org/10.1214/13-STS441).

</div>

<div id="ref-fuglstadConstructing2019" class="csl-entry">

Fuglstad, G.-A. *et al.* (2019) ‘Constructing priors that penalize the complexity of Gaussian random fields’, *Journal of the American Statistical Association*, 114(525), pp. 445–452. doi:[10.1080/01621459.2017.1415907](https://doi.org/10.1080/01621459.2017.1415907).

</div>

<div id="ref-gelfandSpatial2016" class="csl-entry">

Gelfand, A.E. and Schliep, E.M. (2016) ‘Spatial statistics and Gaussian processes: A beautiful marriage’, *Spatial Statistics*, 18, pp. 86–104. doi:[10.1016/j.spasta.2016.03.006](https://doi.org/10.1016/j.spasta.2016.03.006).

</div>

<div id="ref-gomez-rubioBayesian2020" class="csl-entry">

Gómez-Rubio, V. (2020) *Bayesian inference with INLA*. Chapman; Hall/CRC. doi:[10.1201/9781315175584](https://doi.org/10.1201/9781315175584).

</div>

<div id="ref-gortlerVisual2019" class="csl-entry">

Görtler, J., Kehlbeck, R. and Deussen, O. (2019) ‘A visual exploration of Gaussian processes’, *Distill*, 4(4), p. e17. doi:[10.23915/distill.00017](https://doi.org/10.23915/distill.00017).

</div>

<div id="ref-hefleyBasis2017" class="csl-entry">

Hefley, T.J. *et al.* (2017) ‘The basis function approach for modeling autocorrelation in ecological data’, *Ecology*, 98(3), pp. 632–646. doi:[10.1002/ecy.1674](https://doi.org/10.1002/ecy.1674).

</div>

<div id="ref-hodgesAdding2010" class="csl-entry">

Hodges, J.S. and Reich, B.J. (2010) ‘Adding spatially-correlated errors can mess up the fixed effect you love’, *The American Statistician*, 64(4), pp. 325–334. doi:[10.1198/tast.2010.10052](https://doi.org/10.1198/tast.2010.10052).

</div>

<div id="ref-holmesApplied2024" class="csl-entry">

Holmes, E.E., Scheuerell, M.D. and Ward, E.J. (2024) ‘Applied time series analysis for fisheries and environmental sciences’. Online book. Available at: <https://atsa-es.github.io/atsa-labs/>.

</div>

<div id="ref-illianToolbox2012" class="csl-entry">

Illian, J.B., Sørbye, S.H. and Rue, H. (2012) ‘A toolbox for fitting complex spatial point process models using integrated nested Laplace approximation (INLA)’, *The Annals of Applied Statistics*, 6(4), pp. 1499–1530. doi:[10.1214/11-AOAS530](https://doi.org/10.1214/11-AOAS530).

</div>

<div id="ref-krainskiAdvanced2018" class="csl-entry">

Krainski, E. *et al.* (2018) *Advanced spatial modeling with stochastic partial differential equations using R and INLA*. Chapman; Hall/CRC. doi:[10.1201/9780429031892](https://doi.org/10.1201/9780429031892).

</div>

<div id="ref-kristensenTMB2016" class="csl-entry">

Kristensen, K. *et al.* (2016) ‘TMB: Automatic differentiation and Laplace approximation’, *Journal of Statistical Software*, 70(5), pp. 1–21. doi:[10.18637/jss.v070.i05](https://doi.org/10.18637/jss.v070.i05).

</div>

<div id="ref-kristensenRTMB2023" class="csl-entry">

Kristensen, K. (2023) ‘RTMB: R bindings for TMB’. R package. doi:[10.32614/CRAN.package.RTMB](https://doi.org/10.32614/CRAN.package.RTMB).

</div>

<div id="ref-lindgrenSPDE2022" class="csl-entry">

Lindgren, F., Bolin, D. and Rue, H. (2022) ‘The SPDE approach for Gaussian and non-Gaussian fields: 10 years and still running’, *Spatial Statistics*, 50, p. 100599. doi:[10.1016/j.spasta.2022.100599](https://doi.org/10.1016/j.spasta.2022.100599).

</div>

<div id="ref-lindgrenBayesian2015" class="csl-entry">

Lindgren, F. and Rue, H. (2015) ‘Bayesian spatial modelling with R-INLA’, *Journal of Statistical Software*, 63(19), pp. 1–25. doi:[10.18637/jss.v063.i19](https://doi.org/10.18637/jss.v063.i19).

</div>

<div id="ref-mcelreathStatistical2020" class="csl-entry">

McElreath, R. (2020) *Statistical rethinking: A Bayesian course with examples in R and Stan*. CRC Press.

</div>

<div id="ref-millerUnderstanding2020" class="csl-entry">

Miller, D.L., Glennie, R. and Seaton, A.E. (2020) ‘Understanding the stochastic partial differential equation approach to smoothing’, *Journal of Agricultural, Biological and Environmental Statistics*, 25(1), pp. 1–16. doi:[10.1007/s13253-019-00377-z](https://doi.org/10.1007/s13253-019-00377-z).

</div>

<div id="ref-moragaGeospatial2019" class="csl-entry">

Moraga, P. (2019) *Geospatial health data: Modeling and visualization with R-INLA and Shiny*. Chapman; Hall/CRC. doi:[10.1201/9780429341823](https://doi.org/10.1201/9780429341823).

</div>

<div id="ref-moragaSpatial2023" class="csl-entry">

Moraga, P. (2023) *Spatial statistics for data science: Theory and practice with R*. Chapman; Hall/CRC. doi:[10.1201/9781032641522](https://doi.org/10.1201/9781032641522).

</div>

<div id="ref-morrisBayesian2019" class="csl-entry">

Morris, M. *et al.* (2019) ‘Bayesian hierarchical spatial models: Implementing the Besag York Mollié model in Stan’, *Spatial and Spatio-temporal Epidemiology*, 31, p. 100301. doi:[10.1016/j.sste.2019.100301](https://doi.org/10.1016/j.sste.2019.100301).

</div>

<div id="ref-morrisSpatial2019" class="csl-entry">

Morris, M. (2019) ‘Spatial models in Stan: Intrinsic auto-regressive models for areal data’. Stan case study. Available at: <https://mc-stan.org/learn-stan/case-studies/icar_stan.html>.

</div>

<div id="ref-osgood-zimmermanStatistical2023" class="csl-entry">

Osgood-Zimmerman, A. and Wakefield, J. (2023) ‘A statistical review of Template Model Builder: A flexible tool for spatial modelling’, *International Statistical Review*, 91(2), pp. 318–342. doi:[10.1111/insr.12534](https://doi.org/10.1111/insr.12534).

</div>

<div id="ref-petrisDynamic2009" class="csl-entry">

Petris, G., Petrone, S. and Campagnoli, P. (2009) *Dynamic linear models with R*. New York: Springer. doi:[10.1007/b135794](https://doi.org/10.1007/b135794).

</div>

<div id="ref-rasmussenGaussian2006" class="csl-entry">

Rasmussen, C.E. and Williams, C.K.I. (2006) *Gaussian processes for machine learning*. Cambridge, MA: MIT Press. doi:[10.7551/mitpress/3206.001.0001](https://doi.org/10.7551/mitpress/3206.001.0001).

</div>

<div id="ref-rennerPoint2015" class="csl-entry">

Renner, I.W. *et al.* (2015) ‘Point process models for presence-only analysis’, *Methods in Ecology and Evolution*, 6(4), pp. 366–379. doi:[10.1111/2041-210X.12352](https://doi.org/10.1111/2041-210X.12352).

</div>

<div id="ref-rieblerIntuitive2016" class="csl-entry">

Riebler, A. *et al.* (2016) ‘An intuitive Bayesian spatial model for disease mapping that accounts for scaling’, *Statistical Methods in Medical Research*, 25(4), pp. 1145–1165. doi:[10.1177/0962280216660421](https://doi.org/10.1177/0962280216660421).

</div>

<div id="ref-riutort-mayolPractical2023" class="csl-entry">

Riutort-Mayol, G. *et al.* (2023) ‘Practical Hilbert space approximate Bayesian Gaussian processes for probabilistic programming’, *Statistics and Computing*, 33(1), p. 17. doi:[10.1007/s11222-022-10167-2](https://doi.org/10.1007/s11222-022-10167-2).

</div>

<div id="ref-rueBayesian2017" class="csl-entry">

Rue, H. *et al.* (2017) ‘Bayesian computing with INLA: A review’, *Annual Review of Statistics and Its Application*, 4(1), pp. 395–421. doi:[10.1146/annurev-statistics-060116-054045](https://doi.org/10.1146/annurev-statistics-060116-054045).

</div>

<div id="ref-rueApproximate2009" class="csl-entry">

Rue, H., Martino, S. and Chopin, N. (2009) ‘Approximate Bayesian inference for latent Gaussian models by using integrated nested Laplace approximations’, *Journal of the Royal Statistical Society: Series B (Statistical Methodology)*, 71(2), pp. 319–392. doi:[10.1111/j.1467-9868.2008.00700.x](https://doi.org/10.1111/j.1467-9868.2008.00700.x).

</div>

<div id="ref-simpsonGoing2016" class="csl-entry">

Simpson, D. *et al.* (2016) ‘Going off grid: Computationally efficient inference for log-Gaussian Cox processes’, *Biometrika*, 103(1), pp. 49–70. doi:[10.1093/biomet/asv064](https://doi.org/10.1093/biomet/asv064).

</div>

<div id="ref-sorbyePenalised2017" class="csl-entry">

Sørbye, S.H. and Rue, H. (2017) ‘Penalised complexity priors for stationary autoregressive processes’, *Journal of Time Series Analysis*, 38(6), pp. 923–935. doi:[10.1111/jtsa.12242](https://doi.org/10.1111/jtsa.12242).

</div>

<div id="ref-stanUsersGuide" class="csl-entry">

Stan Development Team (2025) ‘Stan user’s guide’. Available at: <https://mc-stan.org/docs/stan-users-guide/>.

</div>

<div id="ref-thorsonSpatioTemporal2024" class="csl-entry">

Thorson, J.T. and Kristensen, K. (2024) *Spatio-temporal models for ecologists*. Chapman; Hall/CRC. doi:[10.1201/9781003410294](https://doi.org/10.1201/9781003410294).

</div>

<div id="ref-wikleSpatioTemporal2019" class="csl-entry">

Wikle, C.K., Zammit-Mangion, A. and Cressie, N. (2019) *Spatio-temporal statistics with R*. Chapman; Hall/CRC. doi:[10.1201/9781351769723](https://doi.org/10.1201/9781351769723).

</div>

</div>
