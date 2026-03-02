# STAT 4714 — Chapters 1–5 Overview

---

## Chapter 1: Introductory Statistics Fundamentals

### 1. Why Statistics?
- Deterministic vs. stochastic models
- Observation error and uncertainty in predictions
- Risk management and imperfect knowledge

### 2. A Brief Introduction of Statistics
- **Descriptive statistics** — single-number summaries (mean, median, std dev, variance)
- **Inferential statistics** — drawing conclusions about model systems from data
- Sample vs. population distinctions
- Study types (experimental vs. observational)

### 3. A Brief Introduction of Probability
- Statistics & probability relationship
- Probability at play in real contexts

### 4. Sampling Procedures
- Simple random sampling
- Stratified sampling
- When to use which method

### 5. Measures of Location
- Sample mean & median
- Choosing the appropriate measure

### 6. Measures of Variability
- Sample variance and standard deviation
- Standard deviation vs. variance — when each is used

### 7. A Perspective on Statistical Modeling
- The statistical model structure
- Understanding model assumptions

---

## Chapter 2: Probability Theory and Counting Methods

### 1. Basic Definitions
- **Sample space** — set of all possible outcomes
- **Events** — subsets of the sample space
- Complements, intersections, unions
- Venn diagrams

### 2. Counting Sample Points
- **Multiplication rule** — counting sequential choices
- **Permutations** — ordered arrangements: `nPr = n! / (n-r)!`
- **Distinct permutations** — accounting for repeated elements
- **Combinations** — unordered selections: `nCr = n! / (r!(n-r)!)`
- Counting in partitions

### 3. Probability of an Event
- Definition of probability
- Assigning weights to outcomes
- Subjective probability

### 4. Additive Rules
- `P(A ∪ B) = P(A) + P(B) - P(A ∩ B)`
- Corollaries for mutually exclusive events
- Complement rule: `P(A') = 1 - P(A)`

### 5. Conditional Probability, Independence, and the Product Rule
- **Conditional probability**: `P(A|B) = P(A ∩ B) / P(B)`
- **Independence**: `P(A|B) = P(A)` ↔ events don't affect each other
- **Product rule**: `P(A ∩ B) = P(A|B) · P(B)`
- Independent product rule: `P(A ∩ B) = P(A) · P(B)`
- Intersections of many events

### 6. Bayes' Rule
- **Law of Total Probability**: `P(A) = Σ P(A|Bᵢ)P(Bᵢ)`
- **Bayes' Rule**: `P(Bᵢ|A) = P(A|Bᵢ)P(Bᵢ) / Σ P(A|Bⱼ)P(Bⱼ)`
- Posterior probability interpretation

---

## Chapter 3: Random Variables and Probability Distributions

### 1. Definitions and Classifications
- **Random variable** — numerical outcome of an experiment
- **Discrete** — countable outcomes (integers, counts)
- **Continuous** — uncountable outcomes (measurements, time)

### 2. Discrete Probability Distributions
- **PMF** (Probability Mass Function) — `f(x) = P(X = x)`
  - `f(x) ≥ 0`, `Σ f(x) = 1`
- **CDF** (Cumulative Distribution Function) — `F(x) = P(X ≤ x)`
- PMF vs. CDF — when to use each

### 3. Continuous Probability Distributions
- **PDF** (Probability Density Function) — `P(a ≤ X ≤ b) = ∫ f(x) dx`
  - `f(x) ≥ 0`, `∫ f(x) dx = 1` over all x
- **CDF**: `F(x) = ∫₋∞ˣ f(t) dt`
- Probabilities are areas under the curve (single point has probability 0)

### 4. Joint Probability Distributions
- **Joint PMF/PDF** — probability over two (or more) variables simultaneously
- **Marginal distributions** — obtained by summing/integrating out the other variable
  - Discrete: `f_X(x) = Σ_y f(x,y)`
  - Continuous: `f_X(x) = ∫ f(x,y) dy`
- **Conditional distribution**: `f(y|x) = f(x,y) / f_X(x)`
- **Statistical independence**: `f(x,y) = f_X(x) · f_Y(y)`
- Extends to more than two variables

---

## Chapter 4: Expected Values, Variance, and Covariance

### 1. Mean (Expected Value) of a Random Variable
- **E(X)** — long-run average
  - Discrete: `E(X) = Σ x·f(x)`
  - Continuous: `E(X) = ∫ x·f(x) dx`
- **E(g(X))** — expectation of a function of X
- Extension to joint distributions: `E(g(X,Y)) = ∫∫ g(x,y)·f(x,y) dx dy`

### 2. Variance and Covariance
- **Variance**: `σ² = E[(X - μ)²] = E(X²) - μ²`
- **Variance of a function**: `Var(g(X))`
- **Covariance**: `σ_XY = E[(X - μ_X)(Y - μ_Y)] = E(XY) - μ_X·μ_Y`
  - Positive → X and Y increase together
  - Negative → X increases as Y decreases
  - Zero → uncorrelated (not necessarily independent)
- **Correlation coefficient**: `ρ_XY = σ_XY / (σ_X · σ_Y)`, range `[-1, 1]`

### 3. Linear Combinations of Random Variables
- **Univariate**: `E(aX + b) = aE(X) + b`, `Var(aX + b) = a²Var(X)`
- **Multivariate**: `E(Σ aᵢXᵢ) = Σ aᵢE(Xᵢ)`
- **Variance of linear combination**:
  - General: `Var(Σ aᵢXᵢ) = Σ aᵢ²Var(Xᵢ) + 2Σ aᵢaⱼCov(Xᵢ,Xⱼ)`
  - Under independence: `Var(Σ aᵢXᵢ) = Σ aᵢ²Var(Xᵢ)`

### 4. Chebyshev's Theorem
- **Chebyshev**: `P(|X - μ| < kσ) ≥ 1 - 1/k²` for any distribution
- Works for any distribution — no normality assumption needed
- **Empirical Rule** (normal distributions only): 68% / 95% / 99.7% within 1/2/3σ

---

## Chapter 5: Specific Probability Distributions

### 1. Binomial Distribution
- **Setup (Bernoulli process)**: n independent trials, each success with prob p
- **PMF**: `b(x; n, p) = C(n,x) · pˣ · (1-p)^(n-x)`
- **Mean**: `μ = np`
- **Variance**: `σ² = np(1-p)`

### 2. Multinomial Distribution
- Extension of binomial to k > 2 outcome categories
- **Mean**: `μᵢ = npᵢ`, **Variance**: `σᵢ² = npᵢ(1-pᵢ)`

### 3. Hypergeometric Distribution
- **Key difference from binomial**: sampling *without* replacement from finite population
- Setup: N items total, K successes in population, draw n
- **PMF**: `h(x; N, n, K) = C(K,x)·C(N-K, n-x) / C(N,n)`
- **Mean**: `μ = nK/N`
- **Variance**: `σ² = n·(K/N)·(1 - K/N)·(N-n)/(N-1)` ← finite population correction
- When N is large relative to n, hypergeometric ≈ binomial

### 4. Negative Binomial Distribution
- **Setup**: count trials until r-th success (p fixed)
- **PMF**: `b*(x; r, p) = C(x-1, r-1) · pʳ · (1-p)^(x-r)`
- **Mean**: `μ = r/p`, **Variance**: `σ² = r(1-p)/p²`

### 5. Geometric Distribution
- Special case of negative binomial with r = 1 (waiting for 1st success)
- **Memoryless property** — past failures don't affect future probability
- **Mean**: `μ = 1/p`, **Variance**: `σ² = (1-p)/p²`

### 6. Poisson Distribution
- **Setup**: count events in a fixed interval, rate λ (events per unit)
- **Poisson process**: events occur independently at constant average rate
- **PMF**: `p(x; λ) = e^(-λ)·λˣ / x!`
- **Mean**: `μ = λ`, **Variance**: `σ² = λ` (mean = variance — key property)
- **Binomial approximation**: use Poisson when n large, p small, λ = np
- **Normal approximation**: use normal when λ is large

---

## Quick Reference: Which Distribution to Use?

| Scenario | Distribution |
|---|---|
| n independent trials, count successes | Binomial |
| n independent trials, k outcome types | Multinomial |
| Sampling without replacement from finite pop | Hypergeometric |
| Count trials until r-th success | Negative Binomial |
| Count trials until 1st success | Geometric |
| Count rare events in fixed interval/area/time | Poisson |

---

## Key Formulas Cheat Sheet

| Concept | Formula |
|---|---|
| Combinations | `C(n,r) = n! / (r!(n-r)!)` |
| Permutations | `P(n,r) = n! / (n-r)!` |
| Conditional probability | `P(A\|B) = P(A∩B) / P(B)` |
| Law of total probability | `P(A) = Σ P(A\|Bᵢ)P(Bᵢ)` |
| Bayes' rule | `P(B\|A) = P(A\|B)P(B) / P(A)` |
| Expected value (discrete) | `E(X) = Σ x·f(x)` |
| Variance shortcut | `Var(X) = E(X²) - [E(X)]²` |
| Covariance shortcut | `Cov(X,Y) = E(XY) - μ_X·μ_Y` |
| Correlation | `ρ = Cov(X,Y) / (σ_X·σ_Y)` |
| Chebyshev's theorem | `P(\|X-μ\| < kσ) ≥ 1 - 1/k²` |
