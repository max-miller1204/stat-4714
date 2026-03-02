# STAT 4714 - Practice Midterm 1: Answer Key

**Chapters 2-4**

---

## Solution 1

**(Counting & Probability)**

1. This is a partition of 8 items into groups of 3, 3, and 2. Use the multinomial coefficient:

   8! / (3! 3! 2!) = 40320 / (6 * 6 * 2) = **560**

2. Use the complement rule. P(at least one compromised) = 1 - P(none compromised):

   P(at least one) = 1 - (0.95)^3 = 1 - 0.857375 = **0.1426**

---

## Solution 2

**(Additive Rules & Complements)**

1. P(A^C) = 1 - P(A) = 1 - 0.35 = **0.65**

2. Since A and B are mutually exclusive, P(A ∩ B) = 0:

   P(A ∪ B) = P(A) + P(B) - P(A ∩ B) = 0.35 + 0.10 - 0 = **0.45**

3. By De Morgan's law:

   P(A^C ∩ B^C) = 1 - P(A ∪ B) = 1 - 0.45 = **0.55**

---

## Solution 3

**(Conditional Probability & Bayes' Rule)**

1. Use the law of total probability:

   P(D) = P(D|S1)P(S1) + P(D|S2)P(S2) + P(D|S3)P(S3)
        = (0.02)(0.50) + (0.05)(0.30) + (0.08)(0.20)
        = 0.010 + 0.015 + 0.016
        = **0.041**

2. Apply Bayes' rule:

   P(S2|D) = P(D|S2)P(S2) / P(D) = (0.05)(0.30) / 0.041 = 0.015 / 0.041 = **15/41 ≈ 0.3659**

---

## Solution 4

**(Independence & System Reliability)**

The top path (A and B in series) works with probability:

P(top) = P(A) * P(B) = 0.85 * 0.90 = 0.765

The bottom path works with probability P(C) = 0.80.

The system works if at least one path works (parallel), so use the complement:

P(system works) = 1 - P(both fail) = 1 - (1 - 0.765)(1 - 0.80) = 1 - (0.235)(0.20) = 1 - 0.047 = **0.953**

---

## Solution 5

**(Conditional Probability with Multiple Events)**

First compute the four intersection probabilities:
- P(A ∩ B) = P(B|A)P(A) = 0.85 * 0.25 = 0.2125
- P(A ∩ B^C) = (1 - 0.85) * 0.25 = 0.0375
- P(A^C ∩ B) = P(B|A^C)P(A^C) = 0.10 * 0.75 = 0.075
- P(A^C ∩ B^C) = 0.90 * 0.75 = 0.675

1. P(A ∩ B ∩ C) = P(C | A ∩ B) * P(A ∩ B) = 0.95 * 0.2125 = **0.2019**

2. Decompose P(C) over the four partitions of A and B:

   P(C) = P(C|A∩B)P(A∩B) + P(C|A∩B^C)P(A∩B^C) + P(C|A^C∩B)P(A^C∩B) + P(C|A^C∩B^C)P(A^C∩B^C)
        = 0.95(0.2125) + 0.40(0.0375) + 0.30(0.075) + 0.05(0.675)
        = 0.201875 + 0.015 + 0.0225 + 0.03375
        = **0.2731**

3. We need P(A | B^C ∩ C):

   P(A ∩ B^C ∩ C) = P(C | A ∩ B^C) * P(A ∩ B^C) = 0.40 * 0.0375 = 0.015
   P(A^C ∩ B^C ∩ C) = P(C | A^C ∩ B^C) * P(A^C ∩ B^C) = 0.05 * 0.675 = 0.03375
   P(B^C ∩ C) = 0.015 + 0.03375 = 0.04875

   P(A | B^C ∩ C) = 0.015 / 0.04875 = **4/13 ≈ 0.3077**

---

## Solution 6

**(Discrete Random Variable & CDF)**

1. P(X = 2) = F(2) - F(1) = 0.80 - 0.50 = **0.30**

2. P(X > 1) = 1 - P(X ≤ 1) = 1 - F(1) = 1 - 0.50 = **0.50**

3. P(1 ≤ X ≤ 3) = F(3) - F(0) = 0.95 - 0.20 = **0.75**

   (We subtract F(0) = P(X ≤ 0) because we want to exclude X = 0.)

4. P(X ≤ 3 | X ≥ 1) = P(1 ≤ X ≤ 3) / P(X ≥ 1):

   P(X ≥ 1) = 1 - F(0) = 1 - 0.20 = 0.80

   P(X ≤ 3 | X ≥ 1) = 0.75 / 0.80 = **15/16 = 0.9375**

---

## Solution 7

**(Continuous PDF)**

1. Set the integral equal to 1:

   ∫_{-2}^{2} k(4 - x^2) dx = k[4x - x^3/3]_{-2}^{2} = k[(8 - 8/3) - (-8 + 8/3)] = k(32/3) = 1

   **k = 3/32**

2. P(X < 1) = (3/32) ∫_{-2}^{1} (4 - x^2) dx = (3/32)[4x - x^3/3]_{-2}^{1}

   = (3/32)[(4 - 1/3) - (-8 + 8/3)]
   = (3/32)[11/3 + 16/3]
   = (3/32)(27/3)
   = (3/32)(9)
   = **27/32 ≈ 0.8438**

3. F(x) = ∫_{-2}^{x} (3/32)(4 - t^2) dt = (3/32)[4t - t^3/3]_{-2}^{x}

   = (3/32)[(4x - x^3/3) - (-8 + 8/3)]

   **F(x) = (12x - x^3 + 16) / 32,&emsp; -2 < x < 2**

   Verify: F(-2) = (-24 + 8 + 16)/32 = 0 ✓, F(2) = (24 - 8 + 16)/32 = 1 ✓

---

## Solution 8

**(Continuous PDF & Conditional Probability)**

1. P(X < 0.5) = ∫_0^{0.5} 3x^2 dx = [x^3]_0^{0.5} = (0.5)^3 = **0.125**

2. P(X > 0.8 | X > 0.5) = P(X > 0.8) / P(X > 0.5):

   P(X > 0.8) = 1 - (0.8)^3 = 1 - 0.512 = 0.488
   P(X > 0.5) = 1 - (0.5)^3 = 1 - 0.125 = 0.875

   P(X > 0.8 | X > 0.5) = 0.488 / 0.875 = **488/875 ≈ 0.5577**

---

## Solution 9

**(CDF to PDF & Probabilities)**

1. f(x) = F'(x) = **(1/50) e^{-x/50},&emsp; x > 0**

2. P(X > 75) = 1 - F(75) = e^{-75/50} = **e^{-3/2} ≈ 0.2231**

3. F(100) = 1 - e^{-100/50} = 1 - e^{-2} ≈ 0.8647.

   **Interpretation:** There is approximately an 86.47% probability that the component's lifetime does not exceed 100 hundred hours (i.e., 10,000 hours).

---

## Solution 10

**(Joint Density - Continuous)**

f(x,y) = 8xy, 0 < x < y < 1.

1. Integrate out y (from x to 1):

   f_X(x) = ∫_x^1 8xy dy = 8x[y^2/2]_x^1 = **4x(1 - x^2),&emsp; 0 < x < 1**

2. Integrate out x (from 0 to y):

   f_Y(y) = ∫_0^y 8xy dx = 8y[x^2/2]_0^y = **4y^3,&emsp; 0 < y < 1**

3. **Not independent.** The support region 0 < x < y < 1 is not a rectangle, so f(x,y) cannot factor into a product of marginals. We can verify: f_X(x) * f_Y(y) = 4x(1-x^2) * 4y^3 = 16xy^3(1-x^2) ≠ 8xy = f(x,y).

4. f(x|y) = f(x,y) / f_Y(y) = 8xy / (4y^3) = **2x/y^2,&emsp; 0 < x < y**

5. P(X < 1/4 | Y = 1/2):

   f(x | y = 1/2) = 2x / (1/2)^2 = 8x,&emsp; 0 < x < 1/2

   P(X < 1/4 | Y = 1/2) = ∫_0^{1/4} 8x dx = [4x^2]_0^{1/4} = 4(1/16) = **1/4 = 0.25**

---

## Solution 11

**(Joint PMF - Discrete)**

1. **Marginal of X** (sum each column):
   - f_X(1) = 0.05 + 0.10 + 0.05 = 0.20
   - f_X(3) = 0.15 + 0.25 + 0.10 = 0.50
   - f_X(5) = 0.10 + 0.15 + 0.05 = 0.30

   **Marginal of Y** (sum each row):
   - f_Y(2) = 0.05 + 0.15 + 0.10 = 0.30
   - f_Y(4) = 0.10 + 0.25 + 0.15 = 0.50
   - f_Y(6) = 0.05 + 0.10 + 0.05 = 0.20

2. P(X ≤ 3, Y ≥ 4) = f(1,4) + f(1,6) + f(3,4) + f(3,6)

   = 0.10 + 0.05 + 0.25 + 0.10 = **0.50**

---

## Solution 12

**(Expected Value - Discrete)**

- P(ace) = 4/52 = 1/13, winnings = $10
- P(face card) = 12/52 = 3/13, winnings = $5
- P(other) = 36/52 = 9/13, winnings = -$2

1. E(X) = 10(1/13) + 5(3/13) + (-2)(9/13) = (10 + 15 - 18)/13 = **7/13 ≈ $0.54**

2. E(3X + 5) = 3E(X) + 5 = 3(7/13) + 5 = 21/13 + 65/13 = **86/13 ≈ $6.62**

---

## Solution 13

**(Expected Value & Variance - Continuous)**

f(x) = 6x(1 - x), 0 < x < 1.

1. E(X) = 6 ∫_0^1 x^2(1 - x) dx = 6[x^3/3 - x^4/4]_0^1 = 6(1/3 - 1/4) = 6(1/12) = **1/2**

2. First find E(X^2):

   E(X^2) = 6 ∫_0^1 x^3(1 - x) dx = 6[x^4/4 - x^5/5]_0^1 = 6(1/4 - 1/5) = 6(1/20) = 3/10

   Var(X) = E(X^2) - [E(X)]^2 = 3/10 - (1/2)^2 = 3/10 - 1/4 = 12/40 - 10/40 = **1/20 = 0.05**

---

## Solution 14

**(Covariance & Correlation)**

f(x,y) = 12xy(1 - y), 0 < x < 1, 0 < y < 1.

1. Find the marginals:

   f_X(x) = ∫_0^1 12xy(1-y) dy = 12x[y^2/2 - y^3/3]_0^1 = 12x(1/6) = 2x, &emsp; 0 < x < 1

   f_Y(y) = ∫_0^1 12xy(1-y) dx = 12y(1-y)[x^2/2]_0^1 = 6y(1-y), &emsp; 0 < y < 1

   Check: f_X(x) * f_Y(y) = 2x * 6y(1-y) = 12xy(1-y) = f(x,y) ✓

   **X and Y are independent** (the joint density factors into the product of marginals, and the support is a rectangle).

2. E(X) = ∫_0^1 x * 2x dx = 2 ∫_0^1 x^2 dx = **2/3**

   E(Y) = ∫_0^1 y * 6y(1-y) dy = 6[y^3/3 - y^4/4]_0^1 = 6(1/3 - 1/4) = 6(1/12) = **1/2**

3. Since X and Y are independent:

   **σ_XY = Cov(X,Y) = E(XY) - E(X)E(Y) = E(X)E(Y) - E(X)E(Y) = 0**

   (Independence implies Cov = 0.)

---

## Solution 15

**(Linear Combinations)**

1. E(2X - 3Y + 7) = 2E(X) - 3E(Y) + 7 = 2(4) - 3(6) + 7 = 8 - 18 + 7 = **-3**

2. Under independence, Cov(X,Y) = 0:

   Var(2X - 3Y + 7) = (2)^2 Var(X) + (-3)^2 Var(Y) = 4(3) + 9(5) = 12 + 45 = **57**

3. With Cov(X,Y) = -2:

   Var(2X - 3Y + 7) = (2)^2 Var(X) + (-3)^2 Var(Y) + 2(2)(-3) Cov(X,Y)
                     = 4(3) + 9(5) + 2(2)(-3)(-2)
                     = 12 + 45 + 24
                     = **81**

   Note: The cross term 2(2)(-3)(-2) = +24 *increases* the variance, which makes sense: when X goes up, Y tends to go down (negative covariance), and 2X - 3Y amplifies this since both terms move in the same direction.

---

## Solution 16

**(Chebyshev's Theorem)**

1. P(9 < X < 21) = P(|X - 15| < 6). Since σ = 3, we have k = 6/3 = 2.

   By Chebyshev: P(|X - μ| < kσ) ≥ 1 - 1/k^2 = 1 - 1/4 = **0.75**

2. The triangular distribution has support exactly on (9, 21), so the **exact probability** P(9 < X < 21) = **1.0**. The Chebyshev bound of 0.75 is very **conservative** in this case. This illustrates that Chebyshev's theorem provides a *worst-case* lower bound that holds for any distribution shape; for specific distributions, the true probability is often much higher.

---

## Solution 17

**(Joint Distribution - Expected Value)**

f(x,y) = 3x, 0 < y < x < 1.

1. E(X) = ∫_0^1 ∫_0^x x * 3x dy dx = ∫_0^1 3x^2 * x dx = 3 ∫_0^1 x^3 dx = 3(1/4) = **3/4**

2. E(Y) = ∫_0^1 ∫_0^x y * 3x dy dx = ∫_0^1 3x [y^2/2]_0^x dx = ∫_0^1 (3x^3/2) dx = (3/2)(1/4) = **3/8**

3. E(XY) = ∫_0^1 ∫_0^x xy * 3x dy dx = ∫_0^1 3x^2 [y^2/2]_0^x dx = ∫_0^1 (3x^4/2) dx = (3/2)(1/5) = **3/10**
