# Bootstrapping & Permutation Tests

STAT 4714

Michael Schwob

## Goals for Today

- Motivate **why parametric simulation tests can be unrealistic** in practice
- Learn **bootstrap tests/intervals** (simulating sampling variability from data)
- Learn **permutation tests** for two-sample problems (simulating under $H_0$ by shuffling labels)

## Limitations of Parametric Simulation

Strict parametric assumptions are frequently unjustified:

- We might not know all parameters under the "null" model
- Non-normal mechanisms (thresholds, censoring, mixing, etc.)
- Distribution shape can differ by design or sample

## Solution: Resampling

The main idea is to **resample the sample** that we have as opposed to sampling from the population. Parametric simulation requires complete knowledge about the "null" model. Resampling just requires a sample! We'll learn these two resampling methods today:

- **Bootstrap:** Use the data as a stand-in for the population → resample with replacement to approximate our sampling distributions.
- **Permutation test:** If $H_0$ says "$A$ and $B$ are the same," then labels are *arbitrary* → shuffle labels to simulate the null.

# One-Sample: Bootstrap

## Why Bootstrap?

- **Parametric tests** assume a specific distribution (e.g., normal) and often require parameters like $\sigma$ to be known.\
- **Bootstrap** is **data-driven**:
  - Treat the observed sample as the population.\
  - Resample *with replacement* from the observed sample.\
  - Recompute the test statistic many times.\
- The variability across resamples gives us an *approximated* sampling distribution without strong assumptions.

## Bootstrap vs. Parametric

- **Parametric:** simulate under $H_0$ using a model (e.g., $X \sim N(\mu,\sigma^2)$).
  - Requires trusting distributional assumptions.\
  - Works cleanly for means if normality holds.\
- **Bootstrap:** simulate by resampling the *observed data*.
  - No need for distributional assumptions.\
- **Big idea:** if your sample is representative, bootstrapping "lets the data speak."

## How Do We Bootstrap?

**Goal:** Approximate the sampling distribution of a statistic without assuming a parametric model.

1.  **Resample with replacement** from the observed sample using the same sample size $n$.
    - If comparing groups, resample *within each group*.\
2.  **Compute** the test statistic for each resample.\
3.  **Repeat** thousands of times to build the bootstrap distribution.\
4.  Use the bootstrap distribution to form CIs.

## Bootstrap Schematic

How we obtain a bootstrap distribution.

## Resampling with Replacement

Visualizing the resampling with replacement process.

## The Bootstrap Distribution

Bootstrap: resample with replacement from observed data to build a distribution of statistics.

## Sampling vs. Bootstrap Distributions

- **Sampling distribution**
  - The *true* distribution of a statistic if we could repeatedly sample from the population.\
  - Usually **unobservable** in practice.
- **Bootstrap distribution**
  - An **approximation** to the sampling distribution, built by resampling (with replacement) from the observed data.\
  - Treats the sample as a "stand-in" for the population.

## Ex: Median Packet Latency

**Goal**: Obtain the 95% bootstrap CI for median packet latency without assuming a distribution or model parameters.

Code

``` sourceCode
set.seed(702)
n <- 40; B <- 5000
lat <- rlnorm(n, meanlog = 2.5, sdlog = 0.5) # our observed sample
boot_med <- replicate(B, median(sample(lat, size = n, replace = TRUE))) # bootstrapped sampling distribution
ci <- quantile(boot_med, c(.025, .975)) # assumes alpha=0.05
h <- hist(boot_med, breaks = 40, col = "grey85", border = "white",
          main = "Bootstrap Median (95% Percentile CI)",
          xlab = "Bootstrap medians")
abline(v = ci, lwd = 2, lty = 2, col = "blue")
text(x = mean(ci), y = max(h$counts)*0.9,
     labels = paste0("CI: [", round(ci[1],2), ", ", round(ci[2],2), "]"), cex=1.1)
```

Bootstrap distribution of the sample median with 95% bootstrap CI.

## Bootstrap CI for Hypothesis Tests

Because we construct the bootstrap distribution from the sample (not $H_0$), we cannot use the bootstrap distribution to answer HT questions like we did with the sampling distribution (i.e., $p$-values). Instead, we use the bootstrap CI (BCI) to answer one-sample questions.

**Ex**:

- Want to test $H_0$: median $= 15$ms vs $H_a$: median $\ne 15$ms
- Build the 95% BCI for the median. If $15$ is outside the BCI, we reject $H_0$. Otherwise, we fail to reject $H_0$.

## The Quality of Bootstrap Approximation

- The bootstrap works because resampling the observed sample approximates the population. But how good is our approximation?
- With large $n$, the observed sample looks more like the population, so bootstrap resamples are a better approximation of simulating from the population. Thus, the bootstrap distribution is a better approximation of the sampling distribution.\
- With small $n$, bootstrap distributions can be noisy...

## The Bootstrap Approximation

Bootstrap (grey bars + dark-gray density) vs. true sampling (black) of the sample median for increasing $n$. Blue line = population median.

## What About Skewness?

Fixed n, decreasing skewness. Grey = bootstrap; black = true sampling distribution; blue = population median. As skewness increases, the bootstrap can deviate more from the true sampling distribution.

# Two-Sample: Bootstrap & Permutation Tests

## Why Go Beyond One Sample?

- So far, we've tested whether one group's statistic matches a hypothesized value.\
- In practice, engineers often compare two different designs:
  - PCB current draw: *Design A vs Design B*\
  - Router firmware: *Old version vs New version*
- One-sample tests answer: *"Is this group consistent with a target?"*\
- Two-sample tests answer: *"Are these groups truly different?"*

## Interpreting Two Samples

With two samples, $H_0: \mu_A = \mu_B$ involves a *relationship*.

- If we resample each group "as is," we keep the observed difference.
- Group $A$'s bootstrap samples are centered about group $A$'s observed mean. Likewise for group $B$.
- When we compute the difference between bootstrapped group means, it will be centered around the observed difference -- not the null hypothesis of 0!
- There are two ways we can assess the validity of $H_0$...

## Visualizing Two-Samples

Left: resample 'as is' → centered at observed Δ (red). Right: permutation/null-imposed → centered at 0 (blue). Use the left to answer: `Is 0 a plausible parameter value given my observed sample?` Use the right to answer: `Is my observed difference plausible under the null hypothesis?`

## Randomization vs. Bootstrap

- **Option 1 - Bootstrap**: resample *within* groups to estimate variability of a statistic (e.g., CI for mean or median).\
- **Option 2 - Randomization / Permutation**: shuffle or rearrange data to enforce a **null hypothesis** (e.g., no difference between groups).\
- Both rely on **resampling observed data**, but:
  - Bootstrap → precision/intervals
  - Randomization → formal hypothesis testing

## Ex: Current Draws (Option 1)

**Goal**: compare design $A$ vs $B$ on idle current (mA): $\Delta=\mu_A - \mu X_B$ (two-sided).

Code

``` sourceCode
set.seed(702)
nA <- 24; nB <- 22
A  <- rlnorm(nA, meanlog = log(10),   sdlog = 0.08)
B  <- rlnorm(nB, meanlog = log(10.3), sdlog = 0.08)
d_obs <- mean(A) - mean(B)
Bboot <- 6000
boot_d <- replicate(Bboot, {
  Astar <- sample(A, nA, replace = TRUE)
  Bstar <- sample(B, nB, replace = TRUE)
  mean(Astar) - mean(Bstar)
})
alpha <- 0.05
ci <- quantile(boot_d, c(alpha/2, 1 - alpha/2))
inside <- (0 >= ci[1] && 0 <= ci[2])  # is 0 inside the CI?
h <- hist(boot_d, breaks = 40, col = "grey85", border = "white",
          main = expression("Bootstrap CI for " ~ Delta ~ " (A - B)"),
          xlab = expression(Delta == bar(X)[A] - bar(X)[B]),
          freq = TRUE)
abline(v = d_obs, col = 2, lwd = 2)                 # observed Δ
abline(v = ci,    col = "blue", lwd = 2, lty = 2)   # CI bounds
abline(v = 0,     col = "black", lwd = 2, lty = 3)  # null value
text(x = mean(ci), y = max(h$counts)*0.92,
     labels = paste0("95% CI: [", signif(ci[1], 3), ", ", signif(ci[2], 3), "]"),
     col = "blue", cex = 1.05)
text(x = d_obs, y = max(h$counts)*0.82,
     labels = paste0("Δ_obs = ", signif(d_obs, 3)),
     col = "red", pos = 4)
```

Bootstrap distribution of $\Delta$ with 95% percentile BCI. Decision: reject $H_0$ if 0 is outside the BCI.

## Permutation Test Framework

1.  **State** hypotheses in context
2.  **Choose** a test statistic
3.  **Impose $H_0$** by randomly shuffling labels (A vs B)\
4.  **Resample** many times to form the **null distribution**
5.  **Compute** and **compare** the $p$-value to $\alpha$

## Shuffling Labels?

- Under $H_0$: the two groups come from the **same population**
  - Which observation is "A" or "B" is just a **label**\
- **Shuffling labels**:
  - Mix all observations together\
  - Randomly reassign them into new "A" and "B" groups of the same sizes\
- If $H_0$ is true, the distribution of differences after shuffling should look like what we'd expect by chance

## Toy Example: Shuffling Labels

Suppose we measure idle currents (mA):

- Group A: $\[9, 10, 11\]$\
- Group B: $\[12, 13, 14\]$

Observed difference:\
$$\Delta_{\text{obs}} = \bar X_A - \bar X_B = 10 - 13 = -3$$

## Toy Example: Shuffling Labels

Code

``` sourceCode
set.seed(1)
A <- c(9, 10, 11); B <- c(12, 13, 14)
d_obs <- mean(A) - mean(B) # observed difference
pool <- c(A, B) # contains all observed values
idx <- sample(length(pool), length(A))
Astar <- pool[idx]
Bstar <- pool[-idx]
d_star <- mean(Astar) - mean(Bstar) # compute permuted statistic
barplot(rbind(c(mean(A), mean(B)), c(mean(Astar), mean(Bstar))),
        beside = TRUE, names.arg = c("Group A", "Group B"),
        col = c("grey60","skyblue"),
        legend.text = c("Original Means","Shuffled Means"),
        main = "Permutation Example (One Shuffle)")
abline(h=0, lty=2)
```

Toy permutation test: original groups vs one shuffle. Shuffling mixes values, then reassigns them to A and B.

## Toy Example: More Permutations

Toy permutation test with four independent shuffles. Each panel: original vs shuffled group means; dashed line at 0; permuted statistic shown in the title.

## Ex: Current Draws (Option 2)

**Goal**: compare design $A$ vs $B$ on idle current (mA): $\Delta=\bar X_A - \bar X_B$ (two-sided).

Code

``` sourceCode
set.seed(702)
nA <- 24; nB <- 22
A  <- rlnorm(nA, meanlog = log(10),   sdlog = 0.08)
B  <- rlnorm(nB, meanlog = log(10.3), sdlog = 0.08)
d_obs <- mean(A) - mean(B)
pool  <- c(A, B)
N     <- length(pool)
Bperm <- 6000
perm_d <- numeric(Bperm)
for (b in 1:Bperm) {
  idx <- sample(N, nA)
  Astar <- pool[idx]
  Bstar <- pool[-idx]
  perm_d[b] <- mean(Astar) - mean(Bstar)
}
pval <- mean(abs(perm_d) >= abs(d_obs))
h <- hist(perm_d, breaks = 40, col = "grey85", border = "white",
          main = "Permutation Null for \u0394 (A vs B)",
          xlab = expression(Delta == bar(X)[A] - bar(X)[B]))
abline(v = d_obs, col = 2, lwd = 2)
text(x = d_obs, y = max(h$counts)*0.9,
     labels = paste0("p = ", signif(pval, 3)),
     pos = 4, col = 2)
```

Permutation null for $\Delta$ with observed $\Delta$ and two-sided $p$-value. Decision: Reject $H_0$ if $p<\alpha$

## Why Decisions Can Differ

- **Bootstrap CI**: anchored on the observed data; asks *"is 0 plausible for $\Delta$?"*\
- **Permutation Test**: anchored on the null; asks *"is $\Delta_{obs}$ plausible if $\Delta=0$?"*\
- In large, well-behaved samples, they often agree.\
- In small/skewed samples, they may give **different decisions**. When in doubt, trust the permutation test more because it is anchored on the null (i.e., more principled).

## Ex: Permutation for Difference in Proportions

Code

``` sourceCode
set.seed(702)
nA <- 260; nB <- 280
A_loss <- rbinom(nA, 1, 0.012) # Simulated outcomes: 1=loss, 0=success
B_loss <- rbinom(nB, 1, 0.022) # Simulated outcomes: 1=loss, 0=success
pA <- mean(A_loss); pB <- mean(B_loss)
d_obs <- pA - pB
pool <- c(A_loss, B_loss)
Bperm <- 6000
perm_d <- replicate(Bperm, {
  idx <- sample(nA + nB, nA)
  Astar <- pool[idx]
  Bstar <- pool[-idx]
  mean(Astar) - mean(Bstar)
})
pval <- mean(abs(perm_d) >= abs(d_obs))
h <- hist(perm_d, breaks=40, col="grey85", border="white",
          main="Permutation Null: pA - pB",
          xlab=expression(hat(p)[A] - hat(p)[B]))
abline(v = d_obs, col = 2, lwd = 2)
text(x = d_obs, y = max(h$counts)*0.9,
     labels = paste0("p = ", signif(pval,3)), pos = 4, col = 2)
```

Permutation null for difference in proportions with observed statistic and p-value.

## Ex: BCI for Difference in Proportions

Bootstrap CI for difference in proportions (A − B).

# Wrapping Up

## Summary

- Parametric tests are great **when valid** --- but often **unrealistic** in practice.\
- **Permutation** (test $H_0$) and **bootstrap** (estimate variability/CI) keep our hypothesis-testing framework intact **without heavy formulas**.\
- Same steps, simpler code, stronger intuition.

## Breakout Work

1.  Why do we shuffle labels in the permutation test? What does this tell us about the logic of $H_0$?
2.  Why might the BCI and permutation test approach give different conclusions with the same data?
3.  If you doubled the sample size of two different designs, what happens to the permutation $p$-value and the BCI width? Why?

![](image omitted)

STAT 4714 • Virginia Tech
