The main text for the course is Hoff (2010) ([McMaster-accessible
link](https://link.springer.com/book/10.1007/978-0-387-92407-6))
([author’s page](https://pdhoff.github.io/book/), with errata/code/data;
[CrossValidated question about solutions
manual](https://stats.stackexchange.com/q/44016/2126)

## Miscellaneous refs/links

- Priors: Crome, Thomas and Moore (1996), Carpenter (2017), Gelman
  (2006), Sarma and Kay (2020), Banner, Irvine and Rodhouse (2020),
  Lemoine (2019), Kallioinen *et al.* (2022)
- Pima Indians: Radin (2017), Smith-Morris (2004)
- missing data: van Buuren (2018), Harrell Jr. (2015)
- high dimensions/concentration of measure?
- Greenland and Oke (2026)

## Priors and parameterizations for covariance/correlation matrices

- Pinheiro and Bates (1996): unconstrained parameterizations of
  covariance matrices (Cholesky, log-Cholesky, matrix logarithm, …)
- Lewandowski, Kurowicka and Joe (2009): the origin of the LKJ
  distribution on correlation matrices
- Chung *et al.* (2013): weakly regularizing (boundary-avoiding) gamma
  priors on random-effect standard deviations
- rstanarm, [“Priors on covariance
  matrices”](https://mc-stan.org/rstanarm/articles/glmer.html#priors-on-covariance-matrices)
  (the `decov()` prior: covariance matrix decomposed into scale, simplex
  and LKJ correlation matrix)
- glmmTMB vignettes on [covariance
  structures](https://glmmtmb.github.io/glmmTMB/articles/covstruct.html)
  and [priors](https://glmmtmb.github.io/glmmTMB/articles/priors.html)
- Tokuda *et al.* (2025): visualizing distributions of covariance
  matrices (Wishart, inverse-Wishart, LKJ, …); `VisCov` package

## MCMC diagnostics

We assume the basics (trace plots, R-hat, effective sample size).
References in each subsection are ordered roughly from least to most
technical.

### Divergences

- Stan, [“How to diagnose and resolve convergence problems: divergent
  transitions”](https://mc-stan.org/learn-stan/diagnostics-warnings.html#divergent-transitions-after-warmup)
  (what the warning means and what to try)
- bayesplot vignette, [“Visual MCMC
  diagnostics”](https://mc-stan.org/bayesplot/articles/visual-mcmc-diagnostics.html#divergent-transitions)
  (plotting where divergences occur)
- Betancourt (2017b) (the best single reference: the eight-schools
  funnel, why divergences signal biased inference, and how non-centred
  parameterization fixes it)
- Betancourt (2017a), section 6.2 (divergences in the theory of HMC; see
  also [Hamiltonian Monte Carlo](#hamiltonian-monte-carlo) below)

### Other diagnostics (e.g. R-hat)

- Vehtari *et al.* (2021): rank-normalized, folded R-hat, bulk and tail
  ESS, rank plots (the version now used by Stan and the `posterior`
  package); the [online
  appendix](https://avehtari.github.io/rhat_ess/rhat_ess.html) has code
  and examples
- Vats and Knudson (2018): R-hat in terms of effective sample size, with
  a principled cutoff
- Margossian *et al.* (2025): nested R-hat, for running many short
  chains (`posterior::rhat_nested()`)
- Lambert and Vehtari (2022): R\*, a convergence diagnostic based on
  machine-learning classifiers
- Säilynoja, Bürkner and Vehtari (2022): ECDF plots with simultaneous
  confidence bands, for rank plots and SBC (below)

### Simulation-based calibration (SBC)

- Stan User’s Guide, [“Simulation-Based Calibration
  Checking”](https://mc-stan.org/docs/stan-users-guide/simulation-based-calibration.html)
  (begins with “Bayes is calibrated by construction”)
- Nicenboim, Schad and Vasishth (2025), [section 10.2, “Validation of a
  computed posterior
  distribution”](https://bruno.nicenboim.me/bayescogsci/ch-custom.html#sec-validSBC)
  (includes an example where SBC finds a problem)
- The `SBC` R package (Modrák, Moon, Kim, Säilynoja): vignettes
  [“Getting
  started”](https://hyunjimoon.github.io/SBC/articles/SBC.html), [“Small
  model
  workflow”](https://hyunjimoon.github.io/SBC/articles/small_model_workflow.html),
  [“Limits of
  SBC”](https://hyunjimoon.github.io/SBC/articles/limits_of_SBC.html).
  Not on CRAN; install with `remotes::install_github("hyunjimoon/SBC")`
  or from [R-multiverse](https://r-multiverse.r-universe.dev/SBC).
- Schad, Betancourt and Vasishth (2021) (SBC as one step in a Bayesian
  workflow)
- Cook, Gelman and Rubin (2006) (the original idea)
- Talts *et al.* (2020) (the standard reference)
- Modrák *et al.* (2025) (the choice of test quantities, e.g. the joint
  likelihood, determines which problems SBC can detect)
- Säilynoja *et al.* (2026) (posterior SBC: checking calibration
  conditional on the observed data)

## Hamiltonian Monte Carlo

Roughly from least to most technical:

- Richard McElreath, [“Markov Chains: Why Walk When You Can
  Flow?”](https://elevanth.org/blog/2017/11/28/build-a-better-markov-chain/)
  (blog post with animations comparing Metropolis, Gibbs and HMC)
- Chi Feng, [interactive MCMC
  gallery](https://chi-feng.github.io/mcmc-demo/) (watch different
  samplers explore difficult target distributions in the browser)
- Alex Rogozhnikov, [“Hamiltonian Monte Carlo
  explained”](https://arogozhnikov.github.io/2016/12/19/markov_chain_monte_carlo.html)
  (interactive, light on maths)
- Betancourt (2017a) (conceptual rather than rigorous; sections 1–4 are
  the core)
- Michael Betancourt, [“Markov Chain Monte
  Carlo”](https://betanalpha.github.io/assets/case_studies/markov_chain_monte_carlo.html)
  (case study on MCMC in general and its diagnostics)
- Neal (2011) (the standard technical reference; [arXiv
  preprint](https://arxiv.org/abs/1206.1901))

## References

Banner, K.M., Irvine, K.M. and Rodhouse, T.J. (2020) ‘The use of
Bayesian priors in Ecology: The good, the bad and the not great’,
*Methods in Ecology and Evolution*, 11(8), pp. 882–889.
doi:[10.1111/2041-210X.13407](https://doi.org/10.1111/2041-210X.13407).

Betancourt, M. (2017a) ‘A conceptual introduction to Hamiltonian Monte
Carlo’. arXiv.
doi:[10.48550/arXiv.1701.02434](https://doi.org/10.48550/arXiv.1701.02434).

Betancourt, M. (2017b) ‘Diagnosing biased inference with divergences’.
Stan case study. Available at:
<https://mc-stan.org/learn-stan/case-studies/divergences_and_bias.html>
(Accessed: 27 October 2026).

Carpenter, B. (2017) ‘Computational and statistical issues with uniform
interval priors’, *Statistical Modeling, Causal Inference, and Social
Science*. Available at:
<http://andrewgelman.com/2017/11/28/computational-statistical-issues-uniform-interval-priors/>
(Accessed: 15 May 2018).

Chung, Y. *et al.* (2013) ‘A Nondegenerate Penalized Likelihood
Estimator for Variance Parameters in Multilevel Models’,
*Psychometrika*, 78(4), pp. 685–709.
doi:[10.1007/s11336-013-9328-2](https://doi.org/10.1007/s11336-013-9328-2).

Cook, S.R., Gelman, A. and Rubin, D.B. (2006) ‘Validation of software
for Bayesian models using posterior quantiles’, *Journal of
Computational and Graphical Statistics*, 15(3), pp. 675–692.
doi:[10.1198/106186006X136976](https://doi.org/10.1198/106186006X136976).

Crome, F.H.J., Thomas, M.R. and Moore, L.A. (1996) ‘A Novel Bayesian
Approach to Assessing Impacts of Rain Forest Logging’, *Ecological
Applications*, 6, pp. 1104–1123.

Gelman, A. (2006) ‘Prior distributions for variance parameters in
hierarchical models (comment on article by Browne and Draper)’,
*Bayesian Analysis*, 1(3), pp. 515–534.
doi:[10.1214/06-BA117A](https://doi.org/10.1214/06-BA117A).

Greenland, S. and Oke, J. (2026) ‘Dangers of Bayesian analyses and how
to address them’. arXiv.
doi:[10.48550/arXiv.2609.14082](https://doi.org/10.48550/arXiv.2609.14082).

Harrell Jr., F.E. (2015) *Regression Modeling Strategies: With
Applications to Linear Models, Logistic and Ordinal Regression, and
Survival Analysis*. 2nd edn. Springer.

Hoff, P.D. (2010) *A first course in Bayesian statistical methods*.
Springer.

Kallioinen, N. *et al.* (2022) ‘Detecting and diagnosing prior and
likelihood sensitivity with power-scaling’. arXiv.
doi:[10.48550/arXiv.2107.14054](https://doi.org/10.48550/arXiv.2107.14054).

Lambert, B. and Vehtari, A. (2022) ‘R<sub>\*</sub>: A Robust MCMC
Convergence Diagnostic with Uncertainty Using Decision Tree
Classifiers’, *Bayesian Analysis*, 17(2), pp. 353–379.
doi:[10.1214/20-BA1252](https://doi.org/10.1214/20-BA1252).

Lemoine, N.P. (2019) ‘Moving beyond noninformative priors: Why and how
to choose weakly informative priors in Bayesian analyses’, *Oikos*,
128(7), pp. 912–928.
doi:[10.1111/oik.05985](https://doi.org/10.1111/oik.05985).

Lewandowski, D., Kurowicka, D. and Joe, H. (2009) ‘Generating random
correlation matrices based on vines and extended onion method’, *Journal
of Multivariate Analysis*, 100(9), pp. 1989–2001.
doi:[10.1016/j.jmva.2009.04.008](https://doi.org/10.1016/j.jmva.2009.04.008).

Margossian, C.C. *et al.* (2025) ‘Nested *R̂*: Assessing the convergence
of Markov chain Monte Carlo when running many short chains’, *Bayesian
Analysis*, 20(4), pp. 1587–1614.
doi:[10.1214/24-BA1453](https://doi.org/10.1214/24-BA1453).

Modrák, M. *et al.* (2025) ‘Simulation-based calibration checking for
Bayesian computation: The choice of test quantities shapes sensitivity’,
*Bayesian Analysis*, 20(2), pp. 461–488.
doi:[10.1214/23-BA1404](https://doi.org/10.1214/23-BA1404).

Neal, R.M. (2011) ‘MCMC using Hamiltonian dynamics’, in Brooks, S. et
al. (eds) *Handbook of Markov chain Monte Carlo*. Boca Raton, FL:
Chapman and Hall/CRC, pp. 113–162.
doi:[10.1201/b10905-6](https://doi.org/10.1201/b10905-6).

Nicenboim, B., Schad, D.J. and Vasishth, S. (2025) *Introduction to
Bayesian data analysis for cognitive science*. Boca Raton, FL: Chapman
and Hall/CRC (Chapman & Hall/CRC statistics in the social and behavioral
sciences).
doi:[10.1201/9780429342646](https://doi.org/10.1201/9780429342646).

Pinheiro, J.C. and Bates, D.M. (1996) ‘Unconstrained parametrizations
for variance-covariance matrices’, *Statistics and Computing*, 6(3), pp.
289–296. doi:[10.1007/BF00140873](https://doi.org/10.1007/BF00140873).

Radin, J. (2017) ‘“Digital Natives”: How Medical and Indigenous
Histories Matter for Big Data’, *Osiris*, 32(1), pp. 43–64.
doi:[10.1086/693853](https://doi.org/10.1086/693853).

Säilynoja, T. *et al.* (2026) ‘Posterior SBC: Simulation-based
calibration checking conditional on data’, *Statistics and Computing*,
36(2).
doi:[10.1007/s11222-026-10825-9](https://doi.org/10.1007/s11222-026-10825-9).

Säilynoja, T., Bürkner, P.-C. and Vehtari, A. (2022) ‘Graphical test for
discrete uniformity and its applications in goodness-of-fit evaluation
and multiple sample comparison’, *Statistics and Computing*, 32(2).
doi:[10.1007/s11222-022-10090-6](https://doi.org/10.1007/s11222-022-10090-6).

Sarma, A. and Kay, M. (2020) ‘Prior setting in practice: Strategies and
rationales used in choosing prior distributions for Bayesian analysis’,
in *Proceedings of the 2020 CHI Conference on Human Factors in Computing
Systems*. New York, NY, USA: Association for Computing Machinery (CHI
’20), pp. 1–12.
doi:[10.1145/3313831.3376377](https://doi.org/10.1145/3313831.3376377).

Schad, D.J., Betancourt, M. and Vasishth, S. (2021) ‘Toward a principled
Bayesian workflow in cognitive science’, *Psychological Methods*, 26(1),
pp. 103–126.
doi:[10.1037/met0000275](https://doi.org/10.1037/met0000275).

Smith-Morris, C.M. (2004) ‘Reducing Diabetes in Indian Country: Lessons
from the Three Domains Influencing Pima Diabetes’, *Human Organization*,
63(1), pp. 34–46.
doi:[10.17730/humo.63.1.mfp4tupu29tcvnqm](https://doi.org/10.17730/humo.63.1.mfp4tupu29tcvnqm).

Talts, S. *et al.* (2020) ‘Validating Bayesian Inference Algorithms with
Simulation-Based Calibration’, *arXiv:1804.06788 \[stat\]* \[Preprint\].
doi:[10.48550/arXiv.1804.06788](https://doi.org/10.48550/arXiv.1804.06788).

Tokuda, T. *et al.* (2025) ‘Visualizing distributions of covariance
matrices’, *Journal of Data Science, Statistics, and Visualisation*,
5(7).
doi:[10.52933/jdssv.v5i7.132](https://doi.org/10.52933/jdssv.v5i7.132).

van Buuren, S. (2018) *Flexible Imputation of Missing Data*. 2nd edn.
Chapman & Hall/CRC (Interdisciplinary Statistics Series). Available at:
<https://stefvanbuuren.name/fimd> (Accessed: 16 February 2026).

Vats, D. and Knudson, C. (2018) ‘Revisiting the Gelman-Rubin
Diagnostic’, *arXiv:1812.09384 \[stat\]* \[Preprint\]. Available at:
<https://arxiv.org/abs/1812.09384> (Accessed: 29 January 2019).

Vehtari, A. *et al.* (2021) ‘Rank-Normalization, Folding, and
Localization: <span class="nocase">An Improved R-hat</span> for
Assessing Convergence of MCMC (with Discussion)’, *Bayesian Analysis*,
16(2), pp. 667–718.
doi:[10.1214/20-BA1221](https://doi.org/10.1214/20-BA1221).

------------------------------------------------------------------------

Last updated: 2026-11-13 19:22:18.563025
