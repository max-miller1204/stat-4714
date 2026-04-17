# Hypothesis Testing: The Foundations

STAT 4714

Michael Schwob

## Goals for Today

- Understand the **logic of hypothesis testing**
- Explicitly define the **null hypothesis (H₀) and alternative (Hₐ)**
- Discuss ECE examples where hypothesis testing matters
- Briefly see the traditional formula-based approach
- Focus on the simulation-based view of testing

## Quick Recap

- Sampling distributions describe what's **typical under repeated sampling**
- CIs and SE measure **precision**, not decisions
- Today: how to use sampling distributions to **make decisions**

# Hypothesis Testing?

## Some Definitions

- **Hypothesis test**: compare our observed statistic to what we would expect under a null hypothesis
- **Null hypothesis (H₀)**: default claim; differences are due to chance/random variation, not a real effect
- **Alternative hypothesis (Hₐ)**: competing claim; there is a real difference or effect

## Ex: Voltage Stability

A circuit board is designed for $5.0V$. We measure sample voltages and see variation: $4.2 V$, $4.1V$, $4.8V$, $5.1V$. Let $\mu$ denote the true average voltage.

**Hypotheses**

- $H_0$: $\mu = 5.0V$\
- $H_a$: $\mu \neq 5.0V$

## Ex: Packet Loss

A network router should have $\le1\%$ packet loss. We test whether observed error rate is higher. Let $p$ denote the true error rate.

**Hypotheses**

- $H_0$: $p = 0.01$\
- $H_a$: $p > 0.01$

## Ex: Material Strength

We compare two PCB designs A and B and want to know if material strength differs. Let $\mu_A$ and $\mu_B$ denote the true strength of designs A and B, respectively.

**Hypotheses**

- $H_0$: $\mu_A = \mu_B$\
- $H_a$: $\mu_A \neq \mu_B$

## Overview: Traditional Approach

- Define $H_0$ and $H_a$
- Choose a test statistic (mean, difference, proportion, etc.)
- Compute the $p$-value from a known distribution ($t$, $Z$, etc.)
- Finally, make a decision to "reject" or "fail to reject" $H_0$ based on $\alpha$

## $p$-values

The **$p$-value** is the probability of observing a statistic under the null $H_0$ as extreme or more extreme than our observed statistic.

- A small $p$-value means that our observed statistic would be rare if $H_0$ were true; it's evidence that $H_0$ is probably wrong.
  - *Note:* The $p$-value does **not** tell us the probability that $H_0$ is true.

## Visualizing $p$-values

The p-value is the shaded tail area beyond the observed sample mean under the null distribution.

## Using the $p$-value

Pick a significance level $\alpha$ based on the desired confidence (e.g., $\alpha=0.05$).

- If $p\le \alpha$, reject $H_0$; there is evidence against the null
- If $p>\alpha$, fail to reject $H_0$; the data is consistent with the null
  - *IMPORTANT*: Rejecting $H_0$ is not proving that $H_a$ is true, and failing to reject $H_0$ is not proving $H_0$ is true!
- The $p$-value is generally defined in terms of "extremeness." What is "extreme" depends on the research question...

## Test Type: Upper-tail

$H_0$: $\mu=50\quad\quad$ $H_a$: $\mu>50$

"Extremeness" concerns the right (upper-tail)

$\alpha=0.05$

Upper-tail test: observed mean in red, p-value (red area), α region (blue area).

## Test Type: Upper-tail

$H_0$: $\mu=50\quad\quad$ $H_a$: $\mu>50$

"Extremeness" concerns the right (upper-tail)

$\alpha=0.05$

Upper-tail test: observed mean (red line) is in the lower tail. The p-value (red shaded area) is large because the observation is not in the direction of Hₐ.

## Test Type: Lower-tail

$H_0$: $\mu=50\quad\quad$ $H_a$: $\mu<50$

"Extremeness" concerns the left (lower-tail)

$\alpha=0.05$

Lower-tail test: p-value (red area) and α region (blue area).

## Test Type: Two-sided

$H_0$: $\mu=50\quad\quad$ $H_a$: $\mu\ne 50$

"Extremeness" concerns the left and the right (both tails)

$\alpha=0.05$

Two-sided test: p-value in both tails (red), α region in both tails (blue).

## Sample mean ($\sigma$ known): $z$-test

If we somehow know $\sigma$ (rare in practice), the standardized mean is normally distributed.

- $H_0:\ \mu=\mu_0\quad\quad$ $H_a: \ \mu\ne\mu_0$
- Test statistic: $$z = \frac{\bar X-\mu_0}{\sigma/\sqrt{n}}$$
- $p$-value (two-sided): $p=2\,\big(1-F_Z(|z|)\big)$, where $F_Z(z)$ is the CDF of the standard normal distribution evaluated at $z$

## Sample mean ($\sigma$ unknown): $t$-test

Usually $\sigma$ is unknown, and we estimate it with $s$. Then, the standardized mean follows a **t** distribution.

- $H_0:\ \mu=\mu_0\quad\quad$ $H_a: \ \mu\ne\mu_0$
- Test statistic:\
  $$t \;=\; \frac{\bar X-\mu_0}{s/\sqrt{n}}, \quad \text{df}=n-1$$
- $p$-value (two-sided): $p=2\,\big(1 - F_t(|t|;\ \text{df})\big)$, where $F_T(x)$ is the CDF of the $t$ distribution with $df$ degrees of freedom evaluated at $x$

## Sample proportion: $z$-test (big $n$)

For pass/fail outcomes, the sample proportion is approximately normally distributed with large $n$.

- $H_0:\ p=p_0\quad\quad$ $H_a: \ p\ne p_0$
- Test statistic:\
  $$z \;=\; \frac{\hat p - p_0}{\sqrt{\,p_0(1-p_0)/n\,}}$$
- $p$-value (two-sided): $p=2\,\big(1-F_Z(|z|)\big)$, where $F_Z(z)$ is the CDF of the standard normal distribution evaluated at $z$

## Traditional Approach: Formulas ad Infinitum

- Many **case distinctions** (known vs unknown σ, one- vs two-sided, small $n$, normality assumptions, etc.)
- Lots of **reference distributions/multipliers** to remember
- Fortunately, we can build the **same logic** with **simulation under $H_0$**
  - This requires fewer formulas, is more intuitive, and yields the same decision

# Simulation Perspective

## The Main Idea

- Instead of memorizing formulas, **simulate under $H_0$**
  - Generate many samples (assuming $H_0$ is true) to build the null sampling distribution of the test statistic
- Compare our observed statistic to the null sampling distribution

## Comparing Approaches

1.  Define $H_0$ and $H_a$
2.  Choose a test statistic (mean, difference, proportion, etc.)
3.  Compute the $p$-value from a known distribution ($t$, $Z$, etc.). Alternatively, compute the $p$-value from the sampling distribution under $H_0$
4.  Use the $p$-value to make a decision to "reject" or "fail to reject" $H_0$ based on $\alpha$

## Ex: Circuit Board Voltage (#1)

Suppose a manufacturer claims their circuit boards run at an average of $5.0V$. We test a sample of 25 boards and observe a sample mean of $5.3V$. Assume that prior testing indicates the population standard deviation is $\sigma=1.0V$ and that voltage is normally distributed. Is there evidence that the boards are running above $5.0V$ on average?

**Our hypothesis**:

- $H_0$: $\mu=5.0V$
- $H_a$: $\mu>5.0V$

## Ex: Circuit Board Voltage (#2)

Suppose a manufacturer claims their circuit boards run at an average of $5.0V$. We test a sample of 25 boards and observe a sample mean of $5.3V$. Assume that prior testing indicates the population standard deviation is $\sigma=1.0V$ and that voltage is normally distributed. Is there evidence that the boards are running above $5.0V$?

**Test Statistic**:

- The test statistic was chosen for us: we observe the sample mean $\bar{X}=5.3V$.

## Ex: Circuit Board Voltage (#3b)

Now, we compute the $p$-value from the sampling distribution under $H_0$: $\mu=5.0V$ with $\sigma=1.0V$ and $n=25$. First, we get the sampling distribution:

Code

``` sourceCode
set.seed(123)
n <- 25
B <- 5000
mu0 <- 5.0
sigma <- 1
xbar_obs <- 5.3
alpha <- 0.05
null_means <- replicate(B, mean(rnorm(n, mean = mu0, sd = sigma)))
hist(null_means, breaks = 40, freq = TRUE,
main = "Null Distribution (μ = 5.0 V)", xlab = "Sample Mean (Volts)",
col = "grey85", border = "white")
abline(v = xbar_obs, col = 2, lwd = 2)
```

Null distribution of sample means under H₀: μ=5.0 volts.

## Ex: Circuit Board Voltage (#3b/#4)

Then, we compute the $p$-value from the sampling distribution. Recall that the $p$-value is the probability of obtaining a statistic (the sample mean) at least as extreme as what we observed **if $H_0$ were true**. So, we can simply count the proportion of simulated means greater than or equal to $\bar{X}_{obs} = 5.3$ volts:

Code

``` sourceCode
p_val <- mean(null_means >= xbar_obs)
p_val
```

    [1] 0.067

- With 95% confidence ($\alpha=0.05$), we "fail to reject" $H_0$. With 90% confidence ($\alpha=0.10$), we "reject" $H_0$.

## Ex: Circuit Board Voltage (Recap)

- We generated competing hypotheses ($H_0$ vs $H_a$) based on the research question.
- Then, we generated a sampling distribution under $H_0$.
- Next, we compared the observed sample mean with the sampling distribution assuming $H_0$ was true.
- Finally, we saw that the observed statistic $\bar{X}_{obs}$ was in the right-tail, but it wasn't extreme enough to justify rejecting $H_0$.
  - **Main point**: Simulate assuming $H_0$, then test if our observation agrees with $H_0$.

## Ex: Circuit Board Voltage (Trad. Solve)

To make the same decision using the traditional approach, we would need to compute the standardized test statistic $$z=\frac{\bar{X}-\mu_0}{\sigma/\sqrt{n}},$$ then find the associated $p$-value with its reference distribution (i.e., $Z\sim\text{N}(0,1)$). Finally, we compare the $p$-value to $\alpha$ and make our decision.

## Ex: Packet Latency (#1)

Packet latencies are often right-skewed due to queueing and modeled with the log-normal distribution. A specification requires that the 95th percentile of latency must be less than 15ms. Suppose we observe 27 packet transmissions, and the 95th percentile of latency was 15.3ms. Assume that log-standard deviation is $\sigma=0.6$ and log-mean is $\mu=1.7211$. We want to know if the 95th percentile of latency is less than 15ms.

**Our hypothesis**:

- $H_0$: $q_{0.95}=15$ms
- $H_a$: $q_{0.95}<15$ms

## Ex: Packet Latency (#2)

Packet latencies are often right-skewed due to queueing and modeled with the log-normal distribution. A specification requires that the 95th percentile of latency must be less than 15ms. Suppose we observe 27 packet transmissions, and the 95th percentile of latency was 15.3ms. Assume that log-standard deviation is $\sigma=0.6$ and log-mean is $\mu=1.7211$. We want to know if the 95th percentile of latency is less than 15ms.

**Test statistic**:

- The test statistic was chosen for us: we observe the 95th percentile of latency as $q_{0.95}^*=15.3$ms.

## Ex: Packet Latency (#3b)

Now, we get the sampling distribution under $H_0$: $q_{0.95}=15$ms with $\mu=1.7211$, $\sigma=0.6$, and $n=27$:

Code

``` sourceCode
set.seed(123)
n <- 27
B <- 5000
percentile_obs <- 15.3
null_percentiles <- replicate(B, quantile(rlnorm(n, meanlog = 1.7211, sdlog = 0.6), probs = 0.95))
hist(null_percentiles, breaks = 40, freq = TRUE, main = "Null Distribution (15ms)", xlab = "95th Percentile (ms)", col = "grey85", border = "white")
abline(v = percentile_obs, col = 2, lwd = 2)
```

Null distribution of 95th percentile under $H_0$: $q_{0.95}=15$ms.

## Ex: Packet Latency (#3b/#4)

Now, compute the $p$-value from the sampling distribution:

Code

``` sourceCode
mean(null_percentiles <= percentile_obs) # less than because it's a lower-tailed test
```

    [1] 0.7082

Our $p$-value is pretty large! Clearly, our observed value of $15.3$ does not indicate that the 95th percentile is less than $15$ms. Therefore, we "fail to reject" $H_0$.

- This does not indicate $H_0$ is true. It just means that $H_a$ is less likely to be true than $H_0$.

## Ex: Packet Latency (Trad. Solve)

- If $X \sim \text{Lognormal}(\mu,\sigma^2)$, then $\log X \sim N(\mu,\sigma^2)$.
- The population 95th percentile is\
  $$q_{0.95} = \exp\!\left(\mu + \sigma z_{0.95}\right),$$ where $z_{0.95}$ is the 95th standard normal quantile.
- Under $H_0$, we fix $q_{0.95}=15$ ms and assume sample size $n=27$.
- **Key idea:** we want to know the distribution of the *sample 95th percentile* when drawing size $n=27$ from this log-normal.

## Ex: Packet Latency (Trad. Solve)

- For large $n$, the sample quantile $\hat q_p$ is approximately normal:\
  $$\hat q_p \approx \text{N}\!\Big(q_p,\;\frac{p(1-p)}{n f(q_p)^2}\Big),$$ where $f(q_p)$ is the PDF at the true quantile.
- Plugging in $p=0.95$, $n=27$, and $f(q_{0.95})$ from the log-normal PDF gives an **approximate standard error**.

## Ex: Packet Latency (Trad. Solve)

- Test statistic ($Z$-score):\
  $$Z \;=\; \frac{\hat q_{0.95}-q_{0.95}}{\mathrm{SE}(\hat q_{0.95})}.$$
- For a **left-tailed test** $H_a: q_{0.95}<15$ms:\
  $$p\text{-value} \;=\; P(Z \le z_{\text{obs}}).$$

## Ex: Packet Latency (Recap)

- The traditional approach requires memorizing/deriving four formulas. The simulation approach does not require any special formulas; you just need to simulate and compute the statistic correctly (1 line of code!).
- The simulation approach is more visual (at least to me).
- How we solved this packet latency provide is *very* similar to how we solved the circuit board voltage problem.
- Sampling distributions allow us to translate a hypothesis about the population into a testable question about the sample. Making decisions once we have the appropriate sampling distribution is simple.

# Wrapping Up

## Summary

- Hypothesis testing compares observed statistics to a **null distribution**
- Null hypothesis = default position; alternative = competing claim
- Traditional approach uses formulas; simulation offers intuition and flexibility
- Next: we'll extend hypothesis testing to **two-sample and proportion problems**

## Breakout Work

1.  Why do we need a **null distribution** at all?\
2.  What does it mean if our observed statistic is *not* in the tails?\
3.  Why might a simulation-based test be preferable to memorizing formulas?\
4.  Give one ECE example where a hypothesis test would guide a decision.

![](image omitted)

STAT 4714 • Virginia Tech
