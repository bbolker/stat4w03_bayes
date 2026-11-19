---
title: "Readings: Bayesian spatial and temporal models"
bibliography: "bayes.bib"
csl: harvard-cite-them-right.csl
---

Material for introducing the basic ideas needed to fit Bayesian temporal and spatial models (Gaussian processes, Gauss-Markov random fields, log-Gaussian Cox processes, AR/ARMA/state-space models), with an applied focus (INLA, Stan, TMB/RTMB). ★ = especially accessible.

## Overviews and bridges between topics

- ★ @hefleyBasis2017: very readable; shows that GPs, splines, and random effects are all the same idea. A good first reading for the unit.
- ★ @millerUnderstanding2020: links the SPDE/GMRF approach to penalized splines/GAMs, which students may already know.
- @gelfandSpatial2016: short conceptual review.
- ★ @hodgesAdding2010: a cautionary reading on spatial confounding.
- @wikleSpatioTemporal2019: free online at <https://spacetimewithr.org>, with applied R labs.

## Gaussian processes

- ★ @gortlerVisual2019: interactive ([link](https://distill.pub/2019/visual-exploration-gaussian-processes/)); a good first exposure.
- ★ @mcelreathStatistical2020, Ch. 14: covers GPs in an applied way (Oceanic tools / island distance example); lecture videos available.
- @betancourtRobust2020: excellent on priors for length-scales and non-identifiability, but long.
- @stanUsersGuide, [GP chapter](https://mc-stan.org/docs/stan-users-guide/gaussian-processes.html): practical implementation.
- @riutort-mayolPractical2023: Hilbert-space approximate GPs; the method behind `brms::gp(..., k = )` [@burknerBrms2017].
- @rasmussenGaussian2006: the standard reference, free online at <http://gaussianprocess.org/gpml/>, but it leans toward machine learning.
- @fuglstadConstructing2019: PC priors for Matérn range and variance. Dan Simpson's [blog](https://dansblog.netlify.app/) also has accessible posts on GP priors and on sparse matrices.

## GMRFs, SPDE, and INLA

- ★ @moragaGeospatial2019 ([online](https://www.paulamoraga.com/book-geospatial/)) and @moragaSpatial2023 ([online](https://www.paulamoraga.com/book-spatial/)): very applied (R-INLA; areal, geostatistical, and some point process data).
- ★ @gomez-rubioBayesian2020: free [online](https://becarioprecario.bitbucket.io/inla-gitbook/).
- @krainskiAdvanced2018: free [online](https://becarioprecario.bitbucket.io/spde-gitbook/); the go-to for SPDE meshes.
- @lindgrenBayesian2015: R-INLA for spatial models.
- @rueBayesian2017: review of INLA [see also @rueApproximate2009].
- @lindgrenSPDE2022: ten-year retrospective on the SPDE approach.
- Areal (CAR/BYM) models: @rieblerIntuitive2016 (the BYM2 parameterization) and @morrisBayesian2019 (BYM in Stan). The companion Stan case study [@morrisSpatial2019] shows the sparse-precision trick explicitly.

## Log-Gaussian Cox processes

- @diggleSpatial2013: the best review to start with.
- @simpsonGoing2016: the theory behind the mesh-based LGCP.
- @illianToolbox2012: fitting complex point process models with INLA.
- ★ @bachlInlabru2019: the [inlabru website](https://inlabru-org.github.io/inlabru/articles/) has worked LGCP examples (e.g. gorilla nests) that would make good labs.
- @rennerPoint2015: an applied ecology framing (presence-only data).

## AR/ARMA and state-space models (Bayesian)

- ★ @auger-metheGuide2021: very applied, with TMB and Stan code.
- ★ @holmesApplied2024: free online; chapters on Bayesian DLMs and AR models in Stan.
- @stanUsersGuide, [time-series chapter](https://mc-stan.org/docs/stan-users-guide/time-series.html) (AR, MA, ARMA, GARCH, HMMs): short and concrete.
- @sorbyePenalised2017: PC priors for AR processes; useful for students coming from the time-series course.
- @petrisDynamic2009: a bridge from classical to Bayesian time series.

## TMB/RTMB and sparse precision matrices

- ★ @osgood-zimmermanStatistical2023: compares TMB (Laplace approximation) directly with INLA.
- @thorsonSpatioTemporal2024: builds AR, GMRF, and SPDE models in TMB step by step ([code](https://github.com/James-Thorson/Spatio-temporal-models-for-ecologists)).
- @andersonSdmTMB2025: a high-level interface ([site](https://pbs-assess.github.io/sdmTMB/)) using SPDE meshes, which students can use before writing their own RTMB code.
- @kristensenRTMB2023: the CRAN vignettes; `dgmrf()`, `dautoreg()`, and `dseparable()` are the building blocks for GMRF, AR, and separable space-time models. @kristensenTMB2016 is the TMB reference.
- The glmmTMB [covariance structures vignette](https://glmmtmb.github.io/glmmTMB/articles/covstruct.html) (`ar1`, `ou`, `exp`, `mat`) gives a frequentist counterpart [@brooksGlmmTMB2017].

## Suggested order

1. @hefleyBasis2017 → @gortlerVisual2019 → @mcelreathStatistical2020 Ch. 14: intuition for "correlated random effects".
2. AR(1) as a sparse-precision GMRF [@stanUsersGuide; @holmesApplied2024].
3. Areal (ICAR/BYM2) models and the SPDE [@moragaSpatial2023; @gomez-rubioBayesian2020; @millerUnderstanding2020].
4. LGCPs with inlabru: @diggleSpatial2013 for concepts, inlabru tutorials for practice.
5. The same models in RTMB, with @osgood-zimmermanStatistical2023 for the INLA vs. Laplace comparison.

## References

::: {#refs}
:::
