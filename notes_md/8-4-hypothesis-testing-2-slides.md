# Hypothesis Testing (Pt. II)

STAT 4714

Michael Schwob

## Goals for Today

- **Review** the hypothesis testing framework
- Build intuition for **Type I/II errors** and **power**
- Use **simulation-based** tests for **two-sample means**
- Understand the relationship between power and $n$

## Review: Hypothesis Testing

1.  **State** $H_0$ and $H_a$ in context\
2.  **Choose** a test statistic (e.g., mean, difference, proportion, quantile, etc.)\
3.  **Build** the **null distribution** of that statistic assuming $H_0$
4.  **Compute** the **$p$-value**\
5.  **Decide** using $\alpha$ (reject or fail to reject) and **interpret in context**

## Will we always decide correctly?

- Every test involves uncertainty; no (reasonable) statistical test gives a guarantee.
- Even if we do things perfectly, we can still *reject a true null* or *fail to reject a false null*.
  - It's important to understand these errors to control risks...

# Decision Errors

## Type I and Type II Errors

- **Type I (false alarm):** Reject $H_0$ when it's true.
  - Denoted as $\alpha$
- **Type II (miss):** Fail to reject $H_0$ when $H_a$ is true.
  - Denoted as $\beta$
- **Power**: Probability we detect a real effect when it exists.
  - Denoted as $1-\beta$

## Error Table

## Type I & II: PCB Manufacturing

A production line fabricates printed circuit boards designed for $5.0V\pm$ tolerance.

**Hypotheses:**

- **$H_0$:** mean voltage $\mu = 5.0V$
- **$H_a$:** mean voltage $\mu\ne 5.0V$

**Power:**

- High power means correctly detecting faulty production without excessive downtime.

## Type I & II: PCB Manufacturing

A production line fabricates printed circuit boards designed for $5.0V\pm$ tolerance.

**Errors:**

- **Type I:** Reject $H_0$ when it's true → shut down good production
  - *Cost:* lost production time, unnecessary redesign, etc.\
- **Type II:** Fail to reject $H_0$ when $H_a$ is true → continue faulty production
  - *Risk:* producing bad products, customer complaints, etc.

## Type I & II: Router Firmware

A new firmware should keep packet loss $\le 1\%$.

**Hypotheses:**

- **$H_0$:** True packet loss rate $=1\%$
- **$H_a$:** Packet loss $>1\%$

**Power:**

- High power means catching underperforming firmware before release.

## Type I & II: Router Firmware

A new firmware should keep packet loss $\le 1\%$.

**Errors:**

- **Type I:** Reject $H_0$ when it's true → scrap a reliable firmware build
  - *Cost:* slower rollout, lost opportunity, etc.
- **Type II:** Fail to reject $H_0$ when $H_a$ is true → release firmware with real packet loss $>1\%$
  - *Risk:* degraded network performance, customer complaints, etc.

## Visualizing Decision Errors

$H_0$: $\mu=50\quad \quad$ $H_a$: $\mu=52$

An upper-tailed test. The blue region ($\alpha$) is the area under the $H_0$ curve to the right of the critical value (vertical dashed line). The red region ($\beta$) is the area under the $H_a$ curve to left of the cutoff. Power is the rest of the area under the $H_a$ curve to the right of the critical value.

## Interpreting the Graphic

- **Blue ($\alpha$):** Chance of a **false alarm** --- rejecting a stable $\mu=50V$ production line; depends on $H_0$
- **Red ($\beta$):** Chance of a **miss** --- keeping the line running even though it's shifted to $\mu=52 V$; depends on $H_a$
- **Power $=1-\beta$:** The probability we *catch* the shift correctly; depends on $H_a$
- **Importantly**, the critical value slices both curves. Because the curves overlap, mistakes are inevitable. By choosing $\alpha$ and planning $n$, we can control the balance between false alarms and misses...

## How $\alpha$ Affects Decision Errors

- Smaller $\alpha$ → harder to reject $H_0$ → fewer false alarms (↓ Type I) but potentially more misses (↑ Type II)\
- Larger $\alpha$ → easier to reject $H_0$ → more false alarms (↑ Type I) but less misses (↓ Type II).

Lowering $\alpha$ moves the critical value right (harder to reject).

## How $\alpha$ Affects Decision Errors

Upper-tailed mean tests across four $\alpha$ levels. Blue = Type I error ($\alpha$) under $H_0$; Red = Type II error ($\beta$) under $H_a$.

## Confidence & Errors

- Recall that our **confidence level** is $1-\alpha$.
- Probability of rejecting a true $H_0$ (Type 1 Error rate) $=\alpha$.
- For a fixed sample size $n$, **lowering** $\alpha$ (increasing confidence) **raises** $\beta$ (more misses) and **reduces power** $(1-\beta)$.
- Conversely, **raising** $\alpha$ (decreasing confidence) **lowers** $\beta$ and **increases power**, but yields more false alarms.
- To improve both (↓$\alpha$ and ↓$\beta$), increase $n$!

## Why Power Increases with $n$

- Bigger $n$ → **less noise/more precision** → easier to spot true effects
- As $n$ grows, the alternative distribution **separates** from the null, so **$\beta$ decreases** and **power $=1-\beta$ increases**.
  - Let's see an example...

## Sim: Why Power Increases with $n$

- Fix $\mu_0=50$, $\mu_A=52$, $\sigma=10$, $\alpha=0.05$.
- For each $n$, compute the $\alpha$ region under $H_0$. Then, **simulate under $H_a$** and record the rejection rate (power).

Simulated power increases with sample size (for a right-tailed mean test).

## Sim: Why Power Increases with $n$

Smaller $n$ (left) has wider curves and, thus, more overlap (higher $\beta$). Larger $n$ (right) has tighter curves and, thus, less overlap (lower $\beta$). Blue = $\alpha$ under $H_0$; Red = $\beta$ under $H_a$.

# Two-Sample Hypotheses

## Ex: Mean Current Draws

You measure idle current (mA) on **Design A** vs **Design B** and care about the difference in means $\Delta=\mu_A-\mu_B$. Suppose we know from prior testing that $\sigma_A=\sigma_B=0.7$ and the currents are normally distribution. With samples of size $n_A=32$ and $n_B=41$, we see that $\bar{X}_A=3.2$ and $\bar{X}_B=2.9$.

**Hypotheses**:

- $H_0:\Delta=0$ (no difference)\
- $H_a:\Delta\neq 0$

## Ex: Mean Current Draws

- If we **reject $H_0$**, there is evidence that mean current draw differs (i.e., there is a *better* design).\
- If we **fail to reject**, the data are consistent with no difference; consider **increasing $n$** to improve power if detecting small differences is important.\
- **Type I error**: Switching designs when there's truly **no** benefit (e.g., manufacturing/engineering cost).\
- **Type II error**: Keeping inferior design when a better one exists (e.g., battery life impact).

## Ex: Mean Current Draws

Code

``` sourceCode
set.seed(702)
B <- 5000; n_A <- 32; n_B <- 41; obs_A <- 3.2; obs_B <- 2.9; sd_A <- 0.7; sd_B <- 0.7
d_obs <- obs_A - obs_B
mu_hat<- mean(c(3.2, 2.9)) # some common mean under H0
null_d <- numeric(B)
for (b in 1:B) {
  Astar <- rnorm(n_A, mu_hat, sd_A)
  Bstar <- rnorm(n_B, mu_hat, sd_B)
  null_d[b] <- mean(Astar) - mean(Bstar)
}
p_val <- mean(abs(null_d) >= abs(d_obs))
h <- hist(null_d, breaks = 40, col = "grey85", border = "white",
     main = "Parametric Null Sampling Distribution", xlab = expression(Delta == bar(X)[A] - bar(X)[B]))
abline(v = d_obs, col = 2, lwd = 2)
text(x = d_obs, y = max(h$counts)*0.9, labels = paste0("p = ", signif(p_val, 3)), col = "red", pos = 4, cex = 1.2)
```

Parametric null sampling distribution for $\Delta$ with group-specific SDs. Red = observed $\Delta$.

## When Parametric Simulation Works...

- In this example, we assumed normal distributions with known $\sigma$, which let's us simulate directly from the null models.
  - We call this the **parametric** route!
- But in practice, we may not know the right distribution -- or $\sigma$ may not be known across groups.
- Additionally, computing $\alpha$ and power for two-sample tests is difficult using this parametric route.

## ... And When It Doesn't

- We can still test hypotheses by simulating under $H_0$, but without assuming a specific model!\
- The trick: we use the **observed data itself** as the basis for resampling -- not some hypothesized distribution (i.e., $H_0$)
  - *Permutation tests*: shuffle group labels to erase differences.\
  - *Bootstrap tests*: recenter or resample so $H_0$ holds.\
  - These approaches let us build a null distribution even when parametric assumptions break.

# Wrap-Up & Breakout

## Summary

- Same hypothesis testing **framework** across problems\
- **Decision errors** are unavoidable; manage $\alpha$ and design for **power**.\
- **Simulation under $H_0$** provides a flexible, intuitive path for two-sample tests -- no extra formulas are required.
  - However, our parametric sampling approach requires knowledge about the hypothesized distributions **and** computing $\alpha$ and power for two-sample tests is tricky.
    - Next, we will learn easier ways to work with two-sample tests!

## Breakout Work

1.  For the current draw example, write $H_0$, $H_a$, the test statistic, and which tail(s) you'd use.\
2.  For the router firmware example, define Type I and Type II errors and the potential costs in your own words.\
3.  Explain the logic in the two-sample simulation code. Report the $p$-value and interpret in your own words.\
4.  If you doubled sample size, explain how and *why* power changes without doing any math.

![](image omitted)

STAT 4714 • Virginia Tech
