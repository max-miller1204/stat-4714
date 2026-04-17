# Sampling Distributions

STAT 4714

Michael Schwob

## A Modern Perspective

- **Repeated sampling** is the foundation of inference
- Three levels: **Population → Sample → Sampling Distribution**
- Sampling and simulation can be used to motivate Ch 8-10 (i.e., hypothesis testing, confidence intervals, etc.)

## Ex: Why not trust a single sample?

An engineer measures the voltage of a new circuit board three times:

- 5.12 V, 4.95 V, 5.08 V

Which is the "true" voltage? What happens if we **repeat the sampling process** many times?

## The Three Levels of Variation

1.  **Population** --- full set of individuals/measurements with natural variability among units in population
2.  **Sample** --- what we actually measure (e.g., *n* = 3) with variation due to randomness
3.  **Sampling distribution** --- how a statistic (i.e., sample mean) varies across many hypothetical samples; quantifies randomness by showing how our statistic(s) fluctuates around the true population parameter

## Ex: Height in Our Classroom

Consider the average height in our classroom of $n=100$ students. Suppose that the true average height in this room is 5'6". While there is a truth, there is variability among everyone in this room (variability in population). Now, I ask 5 students to give me their height and compute the sample mean (randomness in sample). Is this sample average a good idea?

- Now, consider that I sample 5 students over and over, computing the sample mean each time. If I do this 15 times, I have 15 sample means. So, our **sampling distribution** is the distribution of sample means.

## Visualizing the Sampling Distribution

## TL;DR

- **Population**: broad variability of individual measurements\
- **Sample**: one draw; could be atypical\
- **Sampling distribution of the mean**: captures the uncertainty of the **estimator** and should better reflect the truth than a single sample mean

# Simulation #1 --- Building a Population

## Sim #1: Normal Population

Code

``` sourceCode
pop <- rnorm(100000, mean = 50, sd = 10)
hist(pop, breaks = 60, main = "Population: Normal(50, 10)", xlab = "Value")
abline(v = 50, lwd = 2)
```

Synthetic population: Normal(μ=50, σ=10).

## From One Sample to Many

- A **sample** of size *n* gives **one** sample mean $\bar{X}$\
- If we repeat the sampling, we can get a **distribution** of $\bar{X}$ (the **sampling distribution**)

## Sim #1a: Sampling Distribution for $\bar{X}$

Code

``` sourceCode
n <- 25
n_sims <- 5000
means_n25 <- replicate(n_sims, mean(sample(pop, n)))
hist(means_n25, breaks = 40, col = "grey", main = "Sampling Distribution of Mean (n=25)", xlab = "Sample Mean")
abline(v = 50, col = 2, lwd = 2)
```

Sampling distribution of the mean for n=25.

## Building Intuition

If we increase sample size to **n = 100**, what changes?

- a.  Sampling distribution gets **narrower**\
- b.  Sampling distribution gets **wider**\
- c.  **No change**\
- d.  Center **shifts** away from the true mean

## Simulation #1b: Small vs Large *n*

n=5 vs n=100: sampling distributions.

**Conclusion:** Larger *n* → **smaller standard error** → **narrower** sampling distribution.

## Standard Error

- **Standard error (SE)** is the standard deviation of a sampling distribution. It tells us how much a statistic (e.g., sample mean) varies if we repeatedly take random samples from the same population.
- Population standard deviation: $\sigma$\
- The standard error for the sample mean is $$\text{SE}(\bar{X}) = \sigma/\sqrt{n}$$
- Side quest: if $\sigma$ is unknown, we can estimate $\text{SE}(\bar{X})$ (i.e., **t tests**)

## Why Sampling Distributions?

- They let us quantify uncertainty and know how trustworthy our statistic is.
- They connect samples to populations and allow us to generalize back to the population.
- They enable and **motivate** inference, such as confidence intervals, $t$-tests, and $F$-tests.
- **They are the bridge between sample data and population conclusions.**

# Beyond Normal Populations

## Non-Normal Populations Happen

- Real data often **aren't normal** (skewed, heavy-tailed).\
- What happens to the sampling distribution of the **sample mean**?\
- **Central Limit Theorem (CLT)**: for large *n*, the sample mean is **approximately normal**.
  - *Note*: Our next lecture will be dedicated to the CLT.

## Sim #2: Exponential Population

Code

``` sourceCode
pop_exp <- rexp(100000, rate = 1)
hist(pop_exp, breaks = 80, main = "Population: Exponential(λ=1)", xlab = "Value")
abline(v = mean(pop_exp), lwd = 2)
```

Population: Exponential(1) --- skewed.

## Sampling Means from a Skewed Population

Code

``` sourceCode
means_exp_5 <- replicate(4000, mean(sample(pop_exp, 5)))
means_exp_30 <- replicate(4000, mean(sample(pop_exp, 30)))
means_exp_100 <- replicate(4000, mean(sample(pop_exp, 100)))
plot(density(means_exp_5), lwd = 2, main = "Exponential Population: Means for n=5,30,100",
     xlab = "Sample Mean",ylim=c(0,4.0))
lines(density(means_exp_30), lwd = 2, col = 2)
lines(density(means_exp_100), lwd = 2, col = 4)
legend("topright", legend = c("n=5","n=30","n=100"), lwd = 2, col = c(1,2,4))
```

Means from Exponential(1): n=5 vs 30 vs 100.

# Proportions & Reliability

## Beyond Means: Proportions in Reliability

- Many ECE questions are **defect/success rates** (Bernoulli)\
- Statistic: **sample proportion** $\hat{p}$\
- The **sampling distribution** of $\hat{p}$ across repeated samples quantifies the uncertainty of the reliability

## Sim #3: Proportion Defective

Code

``` sourceCode
p_true <- 0.05
n1 <- 50
n2 <- 200
B <- 6000
phat_n50 <- replicate(B, rbinom(1, size = n1, prob = p_true) / n1)
phat_n200 <- replicate(B, rbinom(1, size = n2, prob = p_true) / n2)
plot(density(phat_n50), lwd = 2, main = "Sample Proportion: n=50 (black) vs n=200 (red)",
     xlab = "Sample Proportion")
lines(density(phat_n200), lwd = 2, col = 2)
abline(v = p_true, lwd = 2)
```

Sample proportion with p=0.05: n=50 vs n=200.

**Conclusion:** Larger *n* → smaller **SE** for $\hat{p}$ → more precise reliability estimates.

## A Modern Perspective: Moving Forward

- Instead of formulas first, **simulate** the appropriate sampling distribution under a hypothesized model\
- Extends to **bootstrap CIs**, **permutation tests**, **randomization tests**\
- Today, we build intuition. Later, we'll see classical formulas (**t**, **F**) as **special cases**.

## Common Misconceptions

- "A single sample mean is the population mean." → No, it's an estimate with uncertainty.
- "More data always removes bias." → Precision increases with *n*, bias is **systematic**.
- "Normality of data is required for inference." → If this were true, we would only be able to model a limited amount of processes!

## Practical Tips

- When unsure about assumptions, **simulate** to build intuition before applying a test.
- Always report an estimate *and* a measure of uncertainty (SE or CI).
- Keep data, code, and seeds for reproducibility.\
- Visualize the **sampling distribution** alongside numeric summaries.

# Summary

## Today's Key Ideas

- The **sampling distribution** describes how a statistic varies under repeated sampling.\
- Larger samples → **smaller SE** → more precise estimates.\
- This perspective unifies **confidence intervals** and **hypothesis tests**.
- Next: **Central Limit Theorem** & formalizing **standard error**.

## Breakout Work

1.  In your own words, what is a **sampling distribution**? Give a concrete example.\
2.  Name **two** engineering decisions where the variability of a **sample mean** is crucial.\
3.  If the population is **highly skewed**, what happens to the sampling distribution of the **mean** as *n* grows? Why?\
4.  How would you **estimate uncertainty** if you didn't trust normality assumptions?

![](image omitted)

STAT 4714 • Virginia Tech
