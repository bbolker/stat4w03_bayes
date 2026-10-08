## Xu

p. 77 Q: this is indeed a _continuous mixture model_ (sometimes called a _scale mixture_). https://www.sumsar.net/blog/2013/12/t-as-a-mixture-of-normals/ 

Improper priors are fine, provided you have enough data, but e.g. they make prior predictive sampling impossible. They are "uninformative" only on the original scale.`

(derivations in 5.5)

"The model fits badly" would be based on posterior predictive simulations. "The sampler is inefficient" would be based on evaluating the chains (R-hat, autocorrelation, trace plots, etc.). I thought Hoff 

I'm not sure about "epistemological problems"; I guess Hoff means that it's impossible in general to know if there *might* be a region of higher density somewhere you can't get to ... ??

I'm not sure which point about binomial vs Poisson you're referring to

## Holjak


C5: the text has a quote on page 79, "any reasonable estimator is a Bayesian estimator or a limit of a sequence of Bayesian estimators, and that any Bayesian estimator is reasonable" could you go into a bit more detail of the background of this theory, also are there any more common Bayesian estimators you feel to be "unreasonable"?

This is pretty hairy. "Reasonable" has to do with things like the probability $f(x|\theta)$ being strictly positive and continuous ...

Robert, Christian P. 2007. The Bayesian Choice: From Decision-Theoretic Foundations to Computational Implementation. 2nd ed. Springer Texts in Statistics. Springer.

 C6: on page 96 at the beginning of section 6.5, we are given a dependent sequence of vectors, and told they are conditionally independent, and therefore that sequence is a markov chain. Could you go over how they reached that conclusion, as I haven't been able to understand it?

definition of Markov chain

## Mitchell

My question for discussion is how do we choose κ at the beginning? Since
κ determines how much weight the prior has relative to the data, is
there an ideal way to choose it, or is it mostly based on how confident
we are in our prior information? How do we know how confident we should be?

It's really a prior thing. Sometimes there are rules of thumb ...

