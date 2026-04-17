# Alphabet Soup: CLT, SE, and CI

STAT 4714

Michael Schwob

## Quick Recap

- **Repeated sampling** can be used to make inference.
- **Sampling distributions** describe how a statistic varies over hypothetical repetitions.
- Sampling distributions get **narrower** as $n$ increases (smaller SE), as we saw in various simulations.

## Goals for Today

- Build intuition for the **Central Limit Theorem (CLT)**.
- Understand **why CLT matters** for inference.
- Define and use **Standard Error (SE)** for common estimators.
- Connect SE to **margin of error** and **confidence intervals**.

## Why Learn the CLT?

- **Goal:** Make inference using sampling distributions.
- **Problem:** Exact sampling distributions are often **messy or unknown** (skewed data, odd estimators, etc.).
- **Solution (CLT):** For many settings with finite variance & independence, **averages ≈ Normal** as $n$ grows.
  - With the normal distribution as the reference distribution, we unlock a lot of things for free: convenient formulas for standard error, confidence intervals, and various tests.

# Central Limit Theorem (CLT)

## Standardized Sample Means

We might **standardize** the sample mean $\bar{X}$ to compare it to a *universal* reference distribution (i.e., Normal or $t$-distribution), which lets us make scale-free inference.

- The **standardized sample mean** is $$Z \;=\; \frac{\bar X - \mu}{\sigma/\sqrt{n}}.$$

## CLT: The Idea

For many populations with finite variance, the distribution of the **standardized sample mean** becomes approximately **Normal(0,1)** as sample size $n$ grows.

- Requires independence (or weak dependence) and finite variance.
- We can use **Normal-based inference** without knowing the population distribution.
- Works even if the **data** are not normal.
  - Let's see some examples...

## Simulation: Uniform(0,1)

Histograms of standardized means from Uniform(0,1), which approach N(0,1) as n increases.

## Simulation: Exponential(1)

Histograms of standardized means from Exponential(1). Slower convergence.

## When CLT Fails

If variance is **infinite** (e.g., Cauchy), the CLT does **not** apply.

- The mean can be extremely unstable.
- No amount of sample size guarantees normality.

Histograms of sample means from Cauchy(0,1). No convergence to Normal.

## CLT Takeaways

- Great for **sample means** when variance is finite and independence is reasonable.
- CLT logic assumes **independent** observations from the same process; dependence (time/space/clusters) can break the approach.
- **Heavy tails** result in slow convergence because outliers can dominate.
- Approximating with a standard normal distribution unlocks many convenient formulas. Let's see one now!

# Standard Error (SE)

## What is SE?

**Standard Error (SE)** is the standard deviation of a statistic's sampling distribution. For some cases, we know the exact formula:

- For a sample mean: $SE(\bar{X}) = \sigma/\sqrt{n}$.
  - Note that this is the denominator of the CLT transformation!
- For a sample proportion: $SE(\hat{p}) = \sqrt{\hat{p}(1-\hat{p})/n}$.

## What is SE?

- In many cases, we may not know the exact formula (or may not want to work with it).
- For any statistic, we can estimate variability/SE via **resampling**.
  - A popular approach is *bootstrapping*, which we will cover in a future lecture.
- We can compare the true (theoretical) SE with its empirical estimate, where the estimate is obtained by `sqrt(var(sample_means))`...

## Simulation: SE of the Mean

Empirical vs theoretical SE for Normal(50,10).

## Simulation: SE of the Proportion

Empirical vs theoretical SE for Binomial(n=1,p=0.5).

## Difference of Means

**Motivation:** Engineers often compare two designs/components and might be interested in the statistic: $\bar{X}_1 - \bar{X}_2$, which is a **difference of means**.

- The SE of $\bar{X}_1 - \bar{X}_2$ tells us how much *sampling variation* to expect in the difference.
- For independent designs with unequal, unknown variances, the (Welch) SE is $$\sqrt{s_1^2/n_1 + s_2^2/n_2},$$ where $s_1^2$ and $s_2^2$ are the sample variances of the designs.

## Wait, There's More!

- Assuming independent samples, we typically use a Welch $t$ test. If measurements are paired, we analyze the differences with $SE(\bar{D})=s_D/\sqrt{n}$, where $$s_D^2=\frac{1}{n-1}\sum^n_{i=1}(D_i-\bar{D})^2,\quad D_i=X_{1i}-X_{2i}.$$
- If $\sigma^2_1=\sigma^2_2$ is justified, we can use a pooled SE: $SE(\bar{X}_1-\bar{X}_2)=s_p\sqrt{1/n_1+1/n_2}$, where $$s_p^2=\frac{(n_1-1)s_1^2+(n_2-1)s_2^2}{n_1+n_2-2}.$$
- 

## Difference of Means

How can such a simple extension be so complicated? Do we need to memorize all these formulas?

- Not really -- we can always simulate to approximate the sampling distribution. We just need to ensure that our simulation mirrors the study design!
- If we adequately approximate the sampling distribution, then we can adequately estimate SE.
- Constructing the sampling distribution for $\bar{X}_1-\bar{X}_2$ is as simple as repeatedly sampling both designs, computing their sample means and subtracting. It's no more complicated than what we've been doing...

## Simulation: SE of Difference of Means

Empirical vs theoretical SE of the mean difference with unequal variances.

## Formulas vs Simulation

- **Simulation wins** when formulas are messy, assumptions are dubious, or designs are complex (unequal variances, non-Normal, small samples, skew/heavy tails, odd estimators).
- **Formulas win** for **speed, planning, and transparency** (power/size calculations, analytic checks, closed-form insight).
- **Key idea:** simulate the **study mechanism** (how data are generated/collected), then compute your statistic each time. The histogram is your sampling distribution, which easily unlocks concepts like SE.

## Formulas vs Simulation

Both **simulation** and **formulas** require the **correct design/model**.

- **Simulation:** *Pros:* flexible, few formulas; *Cons:* needs enough replication, careful resampling scheme.
- **Analytic:** *Pros:* fast, transparent; *Cons:* wrong if model/design is misspecified.

# Confidence Intervals

## Motivating CIs

- A point estimate (e.g., sample mean) is just one number; however, every sample gives a slightly different estimate.
- Just like we need mean and variance to adequately describe a population distribution, we should also report uncertainty in our estimate.
- The SE tells us the average variation of the estimate. The **confidence interval (CI)** translates that uncertainty into a range of plausible values for the true parameter, tied to a chosen confidence level. They help us understand where the true value might be and how uncertain we are.

## Putting the Confidence in CI

- The width of CIs are determined by our desired level of confidence. We typically report $(1-\alpha)$ confidence intervals, where $\alpha$ is the **significance level** we want (e.g., 95% confidence with $\alpha=1-0.95=0.05$). Thus, the CI is a function of $\alpha$.
- Higher confidence leads to wider intervals because we need more coverage.

## CIs from Sampling Distributions

We can obtain the $(1-\alpha)$ CI from a sampling distribution using quantiles: $$\widehat{\text{CI}} = \[\,q_{\alpha/2},\, q_{1-\alpha/2}\,\],$$ where $q_c$ is the $c$th quantile of the sampling distribution.

Code

``` sourceCode
set.seed(123)
pop <- rnorm(100000, mean = 12, sd = 5)
n <- 30
B <- 5000
sample_means <- replicate(B, mean(sample(pop, n)))
ci <- quantile(sample_means, c(0.025, 0.975)) # alpha=0.05
ci
```

        2.5%    97.5% 
    10.24639 13.81338 

## Interpreting CIs

- CIs are notoriously tricky to interpret. A 95% CI of $\[10,14\]$ means that 95% of the CIs we'd construct would contain the true parameter. It does **not** mean that there is a 95% probability that the true value is in $\[10,14\]$!
  - *Fun fact*: This is a common example of how *Bayesian* statistics is more intuitive than frequentist statistics (which is what we're learning)!
- Importantly, the truth is fixed, and the intervals change from sample to sample.

## A Related Concept: MOE

- The **confidence interval** for a statistic $T$ with a symmetric sampling distribution is $$CI=\[T-MOE,T+MOE\],$$ where the **margin of error (MOE)** is a scaled version of SE.
- If we simulate the **sampling distribution**, then $$\widehat{\text{CI}} = \[\,q_{\alpha/2},\, q_{1-\alpha/2}\,\],\quad \underbrace{\widehat{\text{MOE}} = \tfrac{1}{2}\big(q_{1-\alpha/2}-q_{\alpha/2}\big)}_{\text{requires symmetry}}.$$

## Estimating MOE with Simulation

MOE is the half-width between central quantiles of the sampling distribution.

## Asymmetric Sampling Distribution?

- Then, we cannot use the confidence interval approach to compute MOE.
- Honestly, most people just report confidence intervals, which can always be obtained as $$\widehat{\text{CI}} = \[\,q_{\alpha/2},\, q_{1-\alpha/2}\,\].$$
- Under symmetric sampling distributions, MOE is a convenient metric that reports the CI as a single quantity... but it's outdated.

## Recipe: Sampling → CI → MOE

1.  Simulate the statistic $T$ (e.g., sample mean) many times under the correct model.\
2.  Compute the quantiles of the sampling distribution.
3.  Compute $MOE=\tfrac12(q_{1-\alpha/2}-q_{\alpha/2})$.

Code

``` sourceCode
set.seed(1)
pop <- rnorm(100000, mean = 50, sd = 10)
n <- 30; B <- 5000; alpha <- 0.05
sample_means <- replicate(B, mean(sample(pop, n)))
SE_hat <- sd(sample_means)
qs <- quantile(sample_means, c(alpha/2, 1 - alpha/2))
MOE_hat <- 0.5 * diff(qs)
list(SE = SE_hat, CI = as.numeric(qs), MOE = MOE_hat)
```

    $SE
    [1] 1.84161

    $CI
    [1] 46.41452 53.60933

    $MOE
       97.5% 
    3.597405 

# Wrapping Up

## Pitfalls

- If there is hidden **dependence** in the data, then SE is underestimated.\
- **Heavy tails/outliers** result in slow CLT convergence.
- For skewed data, consider **sample median** over sample mean.

## Summary

- CLT explains why normal-based inference works for many "average-like" statistics.\
- SE is the variability of an estimator; can be estimated via simulation.\
- CIs are an efficient way to summarize uncertainty associated with estimates at specified confidence levels.
  - For symmetric sampling distributions, we saw the connection between SE/MOE and CIs.

## Breakout Work

1.  You measure latency on two groups of 20 devices each. The difference in means are right-skewed with a few outliers. How might you estimate SE via simulation?
2.  If we want narrower confidence intervals, what can we change about our **study design**?\
3.  Why are **confidence intervals** important for engineers designing experiments or quality checks?\
4.  When would you **avoid CLT**?

![](image omitted)

STAT 4714 • Virginia Tech
