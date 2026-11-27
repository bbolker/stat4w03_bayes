> **Note:** this file is generated from [`README.rmd`](README.rmd) by `make README.md`. Edit the `.rmd`, not this `.md`.

The main text for the course is Hoff (2010) ([McMaster-accessible link](https://link.springer.com/book/10.1007/978-0-387-92407-6)) ([author’s page](https://pdhoff.github.io/book/), with errata/code/data; [CrossValidated question about solutions manual](https://stats.stackexchange.com/q/44016/2126)

## Schedule

- worked through Hoff (approx 2 chapters/week), followed by
- probabilistic programming languages
- Hamiltonian Monte Carlo
- priors
- MCMC diagnostics (especially simulation-based calibration); parameterizations and priors for covariance matrices
- models for spatial and temporal data

## Miscellaneous refs/links

- Priors: Crome, Thomas and Moore (1996), Carpenter (2017), Gelman (2006), Sarma and Kay (2020), Banner, Irvine and Rodhouse (2020), Lemoine (2019), Kallioinen *et al.* (2022)
- Pima Indians: Radin (2017), Smith-Morris (2004)
- missing data: van Buuren (2018), Harrell Jr. (2015)
- high dimensions/concentration of measure?

## Priors and parameterizations for covariance/correlation matrices

- Pinheiro and Bates (1996): unconstrained parameterizations of covariance matrices (Cholesky, log-Cholesky, matrix logarithm, …)
- Lewandowski, Kurowicka and Joe (2009): the origin of the LKJ distribution on correlation matrices
- Chung *et al.* (2013): weakly regularizing (boundary-avoiding) gamma priors on random-effect standard deviations
- rstanarm, [“Priors on covariance matrices”](https://mc-stan.org/rstanarm/articles/glmer.html#priors-on-covariance-matrices) (the `decov()` prior: covariance matrix decomposed into scale, simplex and LKJ correlation matrix)
- glmmTMB vignettes on [covariance structures](https://glmmtmb.github.io/glmmTMB/articles/covstruct.html) and [priors](https://glmmtmb.github.io/glmmTMB/articles/priors.html)
- Tokuda *et al.* (2025): visualizing distributions of covariance matrices (Wishart, inverse-Wishart, LKJ, …); `VisCov` package

## MCMC diagnostics

We assume the basics (trace plots, R-hat, effective sample size). References in each subsection are ordered roughly from least to most technical.

### Divergences

- Stan, [“How to diagnose and resolve convergence problems: divergent transitions”](https://mc-stan.org/learn-stan/diagnostics-warnings.html#divergent-transitions-after-warmup) (what the warning means and what to try)
- bayesplot vignette, [“Visual MCMC diagnostics”](https://mc-stan.org/bayesplot/articles/visual-mcmc-diagnostics.html#divergent-transitions) (plotting where divergences occur)
- Betancourt (2017b) (the best single reference: the eight-schools funnel, why divergences signal biased inference, and how non-centred parameterization fixes it)
- Betancourt (2017a), section 6.2 (divergences in the theory of HMC; see also [Hamiltonian Monte Carlo](#hamiltonian-monte-carlo) below)

### Other diagnostics (e.g. R-hat)

- Vehtari *et al.* (2021): rank-normalized, folded R-hat, bulk and tail ESS, rank plots (the version now used by Stan and the `posterior` package); the [online appendix](https://avehtari.github.io/rhat_ess/rhat_ess.html) has code and examples
- Vats and Knudson (2018): R-hat in terms of effective sample size, with a principled cutoff
- Margossian *et al.* (2025): nested R-hat, for running many short chains (`posterior::rhat_nested()`)
- Lambert and Vehtari (2022): R\*, a convergence diagnostic based on machine-learning classifiers
- Säilynoja, Bürkner and Vehtari (2022): ECDF plots with simultaneous confidence bands, for rank plots and SBC (below)

### Simulation-based calibration (SBC)

- Stan User’s Guide, [“Simulation-Based Calibration Checking”](https://mc-stan.org/docs/stan-users-guide/simulation-based-calibration.html) (begins with “Bayes is calibrated by construction”)
- Nicenboim, Schad and Vasishth (2025), [section 10.2, “Validation of a computed posterior distribution”](https://bruno.nicenboim.me/bayescogsci/ch-custom.html#sec-validSBC) (includes an example where SBC finds a problem)
- The `SBC` R package (Modrák, Moon, Kim, Säilynoja): vignettes [“Getting started”](https://hyunjimoon.github.io/SBC/articles/SBC.html), [“Small model workflow”](https://hyunjimoon.github.io/SBC/articles/small_model_workflow.html), [“Limits of SBC”](https://hyunjimoon.github.io/SBC/articles/limits_of_SBC.html). Not on CRAN; install with `remotes::install_github("hyunjimoon/SBC")` or from [R-multiverse](https://r-multiverse.r-universe.dev/SBC).
- Schad, Betancourt and Vasishth (2021) (SBC as one step in a Bayesian workflow)
- Cook, Gelman and Rubin (2006) (the original idea)
- Talts *et al.* (2020) (the standard reference)
- Modrák *et al.* (2025) (the choice of test quantities, e.g. the joint likelihood, determines which problems SBC can detect)
- Säilynoja *et al.* (2026) (posterior SBC: checking calibration conditional on the observed data)

## Hamiltonian Monte Carlo

Roughly from least to most technical:

- Richard McElreath, [“Markov Chains: Why Walk When You Can Flow?”](https://elevanth.org/blog/2017/11/28/build-a-better-markov-chain/) (blog post with animations comparing Metropolis, Gibbs and HMC)
- Chi Feng, [interactive MCMC gallery](https://chi-feng.github.io/mcmc-demo/) (watch different samplers explore difficult target distributions in the browser)
- Alex Rogozhnikov, [“Hamiltonian Monte Carlo explained”](https://arogozhnikov.github.io/2016/12/19/markov_chain_monte_carlo.html) (interactive, light on maths)
- Betancourt (2017a) (conceptual rather than rigorous; sections 1–4 are the core)
- Michael Betancourt, [“Markov Chain Monte Carlo”](https://betanalpha.github.io/assets/case_studies/markov_chain_monte_carlo.html) (case study on MCMC in general and its diagnostics)
- Neal (2011) (the standard technical reference; [arXiv preprint](https://arxiv.org/abs/1206.1901))

## Covariance/correlation parameterizations and priors

- Pinheiro and Bates (1996) (unconstrained parameterizations of covariance matrices, e.g. Cholesky and log-Cholesky)
- Lewandowski, Kurowicka and Joe (2009) (the paper behind the LKJ distribution on correlation matrices)
- Kristensen, McGillycuddy and Williams (2026) (covariance structures available in `glmmTMB` and how they are parameterized)
- Gabry and Goodrich (2026) (the `rstanarm` vignette on mixed models; its “Priors on covariance matrices” section explains the decomposition of covariance matrices used by `rstanarm`’s `decov()` prior)
- Tokuda *et al.* (2025) (visualizing distributions of covariance matrices)

## Simulation-based calibration

Roughly from friendliest to most technical:

- Modrák *et al.* (2026): the `SBC` R package; start with the “Getting Started with SBC” vignette, which includes a deliberately broken model
- Stan Development Team (2026) (short chapter with a worked Stan example)
- Schad, Betancourt and Vasishth (2021) (SBC as one step in a Bayesian workflow, aimed at applied readers)
- Cook, Gelman and Rubin (2006) (the posterior-quantile predecessor of SBC; the core logic is easy to follow here)
- Gelman *et al.* (2020) (brief conceptual discussion of SBC in the context of the overall workflow)
- Modrák *et al.* (2025) (re-explains SBC clearly; argues for checking derived quantities such as the log-likelihood, not just parameters)
- Talts *et al.* (2020) (the original rank-based SBC paper)

## Miscellaneous (for 2 December)

- Bayes in regulated industries: Greenland and Oke (2026), Lee *et al.* (2026)
- more on priors
  - horseshoe priors: Carvalho, Polson and Scott (2009), Bhadra *et al.* (2019), Piironen and Vehtari (2017b), Piironen and Vehtari (2017a)
  - penalized complexity priors: Gelman, Simpson and Betancourt (2017), Simpson *et al.* (2017)
  - Harrell “skeptical” priors: <https://discourse.datamethods.org/t/what-are-credible-priors-and-what-are-skeptical-priors/580>
  - default `rstanarm` priors: [basic](https://cran.r-universe.dev/articles/rstanarm/priors.html), [covariance matrices](https://mc-stan.org/rstanarm/articles/glmer.html)
- A paper I’m working on: <https://github.com/bbolker/corHMM_RTMB_paper/blob/main/outputs/manuscript.pdf>
- measures of goodness-of-fit (WAIC, LOOIC, etc.): Gelman, Hwang and Vehtari (2014), Hooten and Hobbs (2015), Vehtari (no date)
- log-Gaussian Cox processes (standard model for spatial point processes)
- INLA (Integrated nested Laplace approximation), SPDE approaches
- variational inference: Blei, Kucukelbir and McAuliffe (2017)

## References

<div id="refs" class="references csl-bib-body">

<div id="ref-bannerUse2020" class="csl-entry">

Banner, K.M., Irvine, K.M. and Rodhouse, T.J. (2020) ‘The use of Bayesian priors in Ecology: The good, the bad and the not great’, *Methods in Ecology and Evolution*, 11(8), pp. 882–889. doi:[10.1111/2041-210X.13407](https://doi.org/10.1111/2041-210X.13407).

</div>

<div id="ref-betancourtConceptual2017" class="csl-entry">

Betancourt, M. (2017a) ‘A conceptual introduction to Hamiltonian Monte Carlo’. arXiv. doi:[10.48550/arXiv.1701.02434](https://doi.org/10.48550/arXiv.1701.02434).

</div>

<div id="ref-betancourtDiagnosing2017" class="csl-entry">

Betancourt, M. (2017b) ‘Diagnosing biased inference with divergences’. Stan case study. Available at: <https://mc-stan.org/learn-stan/case-studies/divergences_and_bias.html> (Accessed: 27 October 2026).

</div>

<div id="ref-bhadraLassoMeetsHorseshoe2019a" class="csl-entry">

Bhadra, A. *et al.* (2019) ‘Lasso Meets Horseshoe : A Survey’. arXiv. doi:[10.48550/arXiv.1706.10179](https://doi.org/10.48550/arXiv.1706.10179).

</div>

<div id="ref-bleiVariationalInferenceReview2017" class="csl-entry">

Blei, D.M., Kucukelbir, A. and McAuliffe, J.D. (2017) ‘Variational Inference: A Review for Statisticians’, *Journal of the American Statistical Association*, 112(518), pp. 859–877. doi:[10.1080/01621459.2017.1285773](https://doi.org/10.1080/01621459.2017.1285773).

</div>

<div id="ref-carpenterComputational2017" class="csl-entry">

Carpenter, B. (2017) ‘Computational and statistical issues with uniform interval priors’, *Statistical Modeling, Causal Inference, and Social Science*. Available at: <http://andrewgelman.com/2017/11/28/computational-statistical-issues-uniform-interval-priors/> (Accessed: 15 May 2018).

</div>

<div id="ref-carvalhoHandlingSparsityHorseshoe2009" class="csl-entry">

Carvalho, C.M., Polson, N.G. and Scott, J.G. (2009) ‘Handling Sparsity via the Horseshoe’, in *Proceedings of the Twelth International Conference on Artificial Intelligence and Statistics*. PMLR, pp. 73–80.

</div>

<div id="ref-chungNondegenerate2013a" class="csl-entry">

Chung, Y. *et al.* (2013) ‘A Nondegenerate Penalized Likelihood Estimator for Variance Parameters in Multilevel Models’, *Psychometrika*, 78(4), pp. 685–709. doi:[10.1007/s11336-013-9328-2](https://doi.org/10.1007/s11336-013-9328-2).

</div>

<div id="ref-cookValidation2006" class="csl-entry">

Cook, S.R., Gelman, A. and Rubin, D.B. (2006) ‘Validation of software for Bayesian models using posterior quantiles’, *Journal of Computational and Graphical Statistics*, 15(3), pp. 675–692. doi:[10.1198/106186006X136976](https://doi.org/10.1198/106186006X136976).

</div>

<div id="ref-cromeNovel1996" class="csl-entry">

Crome, F.H.J., Thomas, M.R. and Moore, L.A. (1996) ‘A Novel Bayesian Approach to Assessing Impacts of Rain Forest Logging’, *Ecological Applications*, 6, pp. 1104–1123.

</div>

<div id="ref-gabryEstimating2026" class="csl-entry">

Gabry, J. and Goodrich, B. (2026) ‘Estimating generalized (non-)linear models with group-specific terms with <span class="nocase">rstanarm</span>’. <https://mc-stan.org/rstanarm/articles/glmer.html>.

</div>

<div id="ref-gelmanPrior2006" class="csl-entry">

Gelman, A. (2006) ‘Prior distributions for variance parameters in hierarchical models (comment on article by Browne and Draper)’, *Bayesian Analysis*, 1(3), pp. 515–534. doi:[10.1214/06-BA117A](https://doi.org/10.1214/06-BA117A).

</div>

<div id="ref-gelmanBayesian2020" class="csl-entry">

Gelman, A. *et al.* (2020) ‘Bayesian Workflow’, *arXiv:2011.01808 \[stat\]* \[Preprint\]. Available at: <http://arxiv.org/abs/2011.01808> (Accessed: 4 November 2020).

</div>

<div id="ref-gelmanUnderstandingPredictiveInformation2014" class="csl-entry">

Gelman, A., Hwang, J. and Vehtari, A. (2014) ‘Understanding predictive information criteria for Bayesian models’, *Statistics and Computing*, 24(6), pp. 997–1016. doi:[10.1007/s11222-013-9416-2](https://doi.org/10.1007/s11222-013-9416-2).

</div>

<div id="ref-gelmanPriorCanOften2017a" class="csl-entry">

Gelman, A., Simpson, D. and Betancourt, M. (2017) ‘The Prior Can Often Only Be Understood in the Context of the Likelihood’, *Entropy*, 19(10), p. 555. doi:[10.3390/e19100555](https://doi.org/10.3390/e19100555).

</div>

<div id="ref-greenlandDangers2026a" class="csl-entry">

Greenland, S. and Oke, J. (2026) ‘Dangers of Bayesian analyses and how to address them’. arXiv. doi:[10.48550/arXiv.2609.14082](https://doi.org/10.48550/arXiv.2609.14082).

</div>

<div id="ref-harrell2015" class="csl-entry">

Harrell Jr., F.E. (2015) *Regression Modeling Strategies: With Applications to Linear Models, Logistic and Ordinal Regression, and Survival Analysis*. 2nd edn. Springer.

</div>

<div id="ref-hoffFirst2010" class="csl-entry">

Hoff, P.D. (2010) *A first course in Bayesian statistical methods*. Springer.

</div>

<div id="ref-hootenGuideBayesianModel2015" class="csl-entry">

Hooten, M.B. and Hobbs, N.T. (2015) ‘A guide to Bayesian model selection for ecologists’, *Ecological Monographs*, 85(1), pp. 3–28. doi:[10.1890/14-0661.1](https://doi.org/10.1890/14-0661.1).

</div>

<div id="ref-kallioinenDetecting2022" class="csl-entry">

Kallioinen, N. *et al.* (2022) ‘Detecting and diagnosing prior and likelihood sensitivity with power-scaling’. arXiv. doi:[10.48550/arXiv.2107.14054](https://doi.org/10.48550/arXiv.2107.14054).

</div>

<div id="ref-kristensenCovariance2026" class="csl-entry">

Kristensen, K., McGillycuddy, M. and Williams, C. (2026) ‘Covariance structures with <span class="nocase">glmmTMB</span>’. <https://cran.r-project.org/web/packages/glmmTMB/vignettes/covstruct.html>.

</div>

<div id="ref-lambertRobust2022" class="csl-entry">

Lambert, B. and Vehtari, A. (2022) ‘R${_\ast}$: A Robust MCMC Convergence Diagnostic with Uncertainty Using Decision Tree Classifiers’, *Bayesian Analysis*, 17(2), pp. 353–379. doi:[10.1214/20-BA1252](https://doi.org/10.1214/20-BA1252).

</div>

<div id="ref-leeEmbracingBayesianMethods2026" class="csl-entry">

Lee, J.J. *et al.* (2026) ‘Embracing Bayesian Methods in Clinical Trials: FDA’s Long-Awaited Draft Guidance’, *JAMA*, 335(19), pp. 1664–1666. doi:[10.1001/jama.2026.4179](https://doi.org/10.1001/jama.2026.4179).

</div>

<div id="ref-lemoineMoving2019" class="csl-entry">

Lemoine, N.P. (2019) ‘Moving beyond noninformative priors: Why and how to choose weakly informative priors in Bayesian analyses’, *Oikos*, 128(7), pp. 912–928. doi:[10.1111/oik.05985](https://doi.org/10.1111/oik.05985).

</div>

<div id="ref-lewandowskiGenerating2009a" class="csl-entry">

Lewandowski, D., Kurowicka, D. and Joe, H. (2009) ‘Generating random correlation matrices based on vines and extended onion method’, *Journal of Multivariate Analysis*, 100(9), pp. 1989–2001. doi:[10.1016/j.jmva.2009.04.008](https://doi.org/10.1016/j.jmva.2009.04.008).

</div>

<div id="ref-margossianNested2025" class="csl-entry">

Margossian, C.C. *et al.* (2025) ‘Nested $\hat{R}$: Assessing the convergence of Markov chain Monte Carlo when running many short chains’, *Bayesian Analysis*, 20(4), pp. 1587–1614. doi:[10.1214/24-BA1453](https://doi.org/10.1214/24-BA1453).

</div>

<div id="ref-modrakSimulationBased2025" class="csl-entry">

Modrák, M. *et al.* (2025) ‘Simulation-based calibration checking for Bayesian computation: The choice of test quantities shapes sensitivity’, *Bayesian Analysis*, 20(2), pp. 461–488. doi:[10.1214/23-BA1404](https://doi.org/10.1214/23-BA1404).

</div>

<div id="ref-modrakSBC2026" class="csl-entry">

Modrák, M. *et al.* (2026) ‘SBC: Simulation based calibration for Bayesian models’. <https://hyunjimoon.github.io/SBC/>.

</div>

<div id="ref-nealMCMC2011" class="csl-entry">

Neal, R.M. (2011) ‘MCMC using Hamiltonian dynamics’, in Brooks, S. et al. (eds) *Handbook of Markov chain Monte Carlo*. Boca Raton, FL: Chapman and Hall/CRC, pp. 113–162. doi:[10.1201/b10905-6](https://doi.org/10.1201/b10905-6).

</div>

<div id="ref-nicenboimIntroduction2023" class="csl-entry">

Nicenboim, B., Schad, D.J. and Vasishth, S. (2025) *Introduction to Bayesian data analysis for cognitive science*. Boca Raton, FL: Chapman and Hall/CRC (Chapman & Hall/CRC statistics in the social and behavioral sciences). doi:[10.1201/9780429342646](https://doi.org/10.1201/9780429342646).

</div>

<div id="ref-piironenHyperpriorChoiceGlobal2017" class="csl-entry">

Piironen, J. and Vehtari, A. (2017a) ‘On the Hyperprior Choice for the Global Shrinkage Parameter in the Horseshoe Prior’, in *Proceedings of the 20th International Conference on Artificial Intelligence and Statistics*. PMLR, pp. 905–913.

</div>

<div id="ref-piironenSparsityInformationRegularization2017" class="csl-entry">

Piironen, J. and Vehtari, A. (2017b) ‘Sparsity information and regularization in the horseshoe and other shrinkage priors’, *Electronic Journal of Statistics*, 11(2), pp. 5018–5051. doi:[10.1214/17-EJS1337SI](https://doi.org/10.1214/17-EJS1337SI).

</div>

<div id="ref-pinheiroUnconstrainedParametrizationsVariancecovariance1996a" class="csl-entry">

Pinheiro, J.C. and Bates, D.M. (1996) ‘Unconstrained parametrizations for variance-covariance matrices’, *Statistics and Computing*, 6(3), pp. 289–296. doi:[10.1007/BF00140873](https://doi.org/10.1007/BF00140873).

</div>

<div id="ref-radinDigitalNativesHow2017" class="csl-entry">

Radin, J. (2017) ‘“Digital Natives”: How Medical and Indigenous Histories Matter for Big Data’, *Osiris*, 32(1), pp. 43–64. doi:[10.1086/693853](https://doi.org/10.1086/693853).

</div>

<div id="ref-sailynojaPosterior2026" class="csl-entry">

Säilynoja, T. *et al.* (2026) ‘Posterior SBC: Simulation-based calibration checking conditional on data’, *Statistics and Computing*, 36(2). doi:[10.1007/s11222-026-10825-9](https://doi.org/10.1007/s11222-026-10825-9).

</div>

<div id="ref-sailynojaGraphical2022" class="csl-entry">

Säilynoja, T., Bürkner, P.-C. and Vehtari, A. (2022) ‘Graphical test for discrete uniformity and its applications in goodness-of-fit evaluation and multiple sample comparison’, *Statistics and Computing*, 32(2). doi:[10.1007/s11222-022-10090-6](https://doi.org/10.1007/s11222-022-10090-6).

</div>

<div id="ref-sarmaPrior2020" class="csl-entry">

Sarma, A. and Kay, M. (2020) ‘Prior setting in practice: Strategies and rationales used in choosing prior distributions for Bayesian analysis’, in *Proceedings of the 2020 CHI Conference on Human Factors in Computing Systems*. New York, NY, USA: Association for Computing Machinery (CHI ’20), pp. 1–12. doi:[10.1145/3313831.3376377](https://doi.org/10.1145/3313831.3376377).

</div>

<div id="ref-schadPrincipled2021" class="csl-entry">

Schad, D.J., Betancourt, M. and Vasishth, S. (2021) ‘Toward a principled Bayesian workflow in cognitive science’, *Psychological Methods*, 26(1), pp. 103–126. doi:[10.1037/met0000275](https://doi.org/10.1037/met0000275).

</div>

<div id="ref-simpsonPenalisingModelComponent2017b" class="csl-entry">

Simpson, D. *et al.* (2017) ‘Penalising Model Component Complexity: A Principled, Practical Approach to Constructing Priors’, *Statistical Science*, 32(1), pp. 1–28. doi:[10.1214/16-STS576](https://doi.org/10.1214/16-STS576).

</div>

<div id="ref-smith-morrisReducingDiabetesIndian2004" class="csl-entry">

Smith-Morris, C.M. (2004) ‘Reducing Diabetes in Indian Country: Lessons from the Three Domains Influencing Pima Diabetes’, *Human Organization*, 63(1), pp. 34–46. doi:[10.17730/humo.63.1.mfp4tupu29tcvnqm](https://doi.org/10.17730/humo.63.1.mfp4tupu29tcvnqm).

</div>

<div id="ref-stanSBC2026" class="csl-entry">

Stan Development Team (2026) ‘Simulation-based calibration checking’. Stan User’s Guide, version 2.40, <https://mc-stan.org/docs/stan-users-guide/simulation-based-calibration.html>.

</div>

<div id="ref-taltsValidating2020" class="csl-entry">

Talts, S. *et al.* (2020) ‘Validating Bayesian Inference Algorithms with Simulation-Based Calibration’, *arXiv:1804.06788 \[stat\]* \[Preprint\]. doi:[10.48550/arXiv.1804.06788](https://doi.org/10.48550/arXiv.1804.06788).

</div>

<div id="ref-tokudaVisualizingDistributionsCovariance2025" class="csl-entry">

Tokuda, T. *et al.* (2025) ‘Visualizing distributions of covariance matrices’, *Journal of Data Science, Statistics, and Visualisation*, 5(7). doi:[10.52933/jdssv.v5i7.132](https://doi.org/10.52933/jdssv.v5i7.132).

</div>

<div id="ref-vanbuuren2018" class="csl-entry">

van Buuren, S. (2018) *Flexible Imputation of Missing Data*. 2nd edn. Chapman & Hall/CRC (Interdisciplinary Statistics Series). Available at: <https://stefvanbuuren.name/fimd> (Accessed: 16 February 2026).

</div>

<div id="ref-vatsRevisiting2018" class="csl-entry">

Vats, D. and Knudson, C. (2018) ‘Revisiting the Gelman-Rubin Diagnostic’, *arXiv:1812.09384 \[stat\]* \[Preprint\]. Available at: <https://arxiv.org/abs/1812.09384> (Accessed: 29 January 2019).

</div>

<div id="ref-vehtariRankNormalization2021a" class="csl-entry">

Vehtari, A. *et al.* (2021) ‘Rank-Normalization, Folding, and Localization: <span class="nocase">An Improved R-hat</span> for Assessing Convergence of MCMC (with Discussion)’, *Bayesian Analysis*, 16(2), pp. 667–718. doi:[10.1214/20-BA1221](https://doi.org/10.1214/20-BA1221).

</div>

<div id="ref-vehtariCrossvalidationFAQ" class="csl-entry">

Vehtari, A. (no date) ‘Cross-validation FAQ’. Available at: <https://avehtari.github.io/modelselection/CV-FAQ.html> (Accessed: 27 November 2026).

</div>

</div>

------------------------------------------------------------------------

Last updated: 2026-11-27 08:34:05.701437
