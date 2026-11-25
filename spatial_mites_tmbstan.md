# Why `tmbstan` is slow for the mite Gaussian process model

Notes on the `tmbstan()` call after the first section of `spatial_mites.R` (24 Nov 2026). The diagnostic runs were one-off scripts and are not in the repository.

## Summary

Each NUTS iteration needs many leapfrog steps, each step factorizes a dense 70 × 70 covariance matrix, and some randomly started chains get stuck.

## Causes

1. **Cost per gradient: about 0.4 ms** (on `pop-os`, single-threaded BLAS). With `laplace = FALSE` (the default) all 74 parameters are sampled. This is modest by itself.

2. **Number of gradients.** With raw `X`, chains that did not get stuck used about 100 to 220 leapfrog steps per post-warmup iteration, and typically more during warmup. The default is 4 chains × 2000 iterations, run one after another unless `cores`/`mc.cores` is set, so a rough extrapolation is 5 to 15 minutes if nothing goes wrong. Contributing factors:
   - `X` (`SubsDens`) is neither centred nor scaled (range 21 to 81), so `mu` and `alpha` are confounded and on different scales. The largest eigenvalue of the joint negative log-likelihood's Hessian at the MLE/conditional mode is about 10^6.
   - The squared-exponential covariance is nearly singular (table below). With the upper bound of 5 on `logPhi`, the sampler can reach regions where the objective is `NaN` (checked at `logPhi = 3`).

3. **Random starts combined with the ±5 bounds.** With raw `X`, 2 of 3 chains got stuck: tiny step size and every post-warmup iteration at the treedepth limit (1023 gradients, about 0.4 s per iteration).
   - Likely mechanism (inferred, not tested directly): Stan draws starting values from (-2, 2) on the unconstrained scale, which maps to about (-3.8, 3.8) with these bounds. Then `alpha*X` can be about ±300, so the Poisson mean is enormous or essentially zero.
   - The same model started at the MLE had no stuck chains (0 of 3).
   - Stuck chains also gave wrong answers: `logPhi` about -1.8 and -4.0, versus about -0.2 elsewhere, with `n_eff` about 3 to 5.

Condition number of the correlation matrix:

| `logPhi` | condition number | Cholesky succeeds? |
|---|---|---|
| -1 | 5.5e1 | yes |
| -0.15 (MLE) | 3.8e4 | yes |
| 0 | 2.1e5 | yes |
| 0.5 | 1.4e9 | yes |
| 1 | 1.1e14 | yes |
| 2 and above | about 1e19 | no |

## Comparison of settings

One chain of 1000 iterations for each of 3 seeds. All 24 chains ran at the same time, so compare times only with each other.

| `X` | bounds | start | time (s) | stuck or failed |
|---|---|---|---|---|
| raw | ±5 | random | 100–260 | 2 of 3 |
| raw | ±5 | MLE | 95–118 | 0 of 3 |
| raw | none | random | 75–140 | 0 of 3 |
| raw | none | MLE | 108–116 | 0 of 3 |
| scaled | ±5 | random | 43–70 | 0 of 3 |
| scaled | ±5 | MLE | 61–73 | 0 of 3 |
| scaled | none | random | 73–105 | 0 of 3 |
| scaled | none | MLE | about 1 | 3 of 3 (all divergent) |

The reason for the failures in the last row is unknown.

## Suggestions

- Centre and scale `X`. The gain was clear with the ±5 bounds, but small without bounds.
- Run chains in parallel, e.g. `cores = 4`.
- Set priors on `logPhi` and `logSigma` inside `f` (not tested). The bounds currently act as flat priors, and also truncate every `omega` at ±5.
- Add a small nugget to `S`, e.g. `diag(1e-6, nrow(D))` (tried only together with scaled `X`, so its separate effect is unknown).

## Caveats

- Mixing was still poor without stuck chains: the minimum `n_eff` for the four top-level parameters was about 8 to 75 from 500 draws, and some chains had divergences (up to 22). Real use needs longer runs.
- One non-centred version (scaled `X`, nugget, ±5 bounds, 300 iterations) was slower, with 68% of post-warmup iterations at the treedepth limit.
- The GMRF version of the model was not sampled.
