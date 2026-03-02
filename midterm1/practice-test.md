# STAT 4714 - Practice Midterm 1

**Chapters 2-4**

---

## Problem 1

**(Counting & Probability)**

A cybersecurity team has 8 servers to monitor. They must assign 3 analysts to cover distinct subsets of servers. Analyst 1 monitors 3 servers, Analyst 2 monitors 3 servers, and Analyst 3 monitors the remaining 2.

1. (3pts) How many ways can the servers be divided among the three analysts?
2. (3pts) If each server independently has a 0.05 probability of being compromised, what is the probability that at least one of Analyst 1's 3 servers is compromised?

---

## Problem 2

**(Additive Rules & Complements)**

Let *A* be the event that a sensor detects motion and *B* be the event that the sensor triggers a false alarm (detecting motion when there is none). Suppose P(A) = 0.35 and P(B) = 0.10. Note that events *A* and *B* are mutually exclusive by definition of *B*.

1. (3pts) What is the probability that the sensor does not detect motion?
2. (3pts) What is the probability that the sensor either detects motion or triggers a false alarm?
3. (3pts) What is the probability that the sensor neither detects motion nor triggers a false alarm?

---

## Problem 3

**(Conditional Probability & Bayes' Rule)**

A factory receives electronic components from three suppliers. Supplier *S*_1 provides 50% of the components, *S*_2 provides 30%, and *S*_3 provides 20%. The defect rates for the suppliers are 0.02, 0.05, and 0.08, respectively.

1. (3pts) What is the probability that a randomly selected component is defective?
2. (4pts) Given that a component is found to be defective, what is the probability it came from Supplier *S*_2?

---

## Problem 4

**(Independence & System Reliability)**

A circuit system has two parallel paths. The top path contains components A and B in series (with probabilities 0.85 and 0.90, respectively). The bottom path contains a single component C with probability 0.80. All components operate independently. The system works if at least one path works.

1. (4pts) Find the probability that the system works.

---

## Problem 5

**(Conditional Probability with Multiple Events)**

Water quality is monitored in a river system. Define the events:
- *A*: the water is contaminated
- *B*: a chemical test detects contamination
- *C*: a swimming advisory is issued

Assume P(A) = 0.25, P(B | A) = 0.85, P(B | A^C) = 0.10, P(C | A ∩ B) = 0.95, P(C | A^C ∩ B) = 0.30, P(C | A ∩ B^C) = 0.40, and P(C | A^C ∩ B^C) = 0.05.

1. (3pts) Find P(A ∩ B ∩ C).
2. (3pts) Find P(C).
3. (4pts) Given that a swimming advisory is issued and the chemical test did **not** detect contamination, find the probability that the water is actually contaminated.

---

## Problem 6

**(Discrete Random Variable & CDF)**

Let *X* denote the number of power outages per month in a small town. The cumulative distribution function is:

| x     | F(x)  |
|-------|-------|
| x < 0 | 0     |
| 0 ≤ x < 1 | 0.20 |
| 1 ≤ x < 2 | 0.50 |
| 2 ≤ x < 3 | 0.80 |
| 3 ≤ x < 4 | 0.95 |
| x ≥ 4     | 1.00 |

1. (3pts) Find P(X = 2).
2. (3pts) Find P(X > 1).
3. (3pts) Find P(1 ≤ X ≤ 3).
4. (4pts) Find P(X ≤ 3 | X ≥ 1).

---

## Problem 7

**(Continuous PDF)**

The measurement error *X* of a precision instrument has density function

> f(x) = k(4 - x^2),&emsp; -2 < x < 2.

1. (3pts) Find the value of *k* that makes f(x) a valid density function.
2. (3pts) Find P(X < 1).
3. (4pts) Find the CDF F(x) for -2 < x < 2.

---

## Problem 8

**(Continuous PDF & Conditional Probability)**

The density function of a random variable *X* is

> f(x) = 3x^2,&emsp; 0 < x < 1.

1. (3pts) Find P(X < 0.5).
2. (4pts) Find P(X > 0.8 | X > 0.5).

---

## Problem 9

**(CDF to PDF & Probabilities)**

The lifetime (in hundreds of hours) of a component has cumulative distribution function

> F(x) = 1 - e^(-x/50),&emsp; x > 0.

1. (3pts) Find the probability density function f(x).
2. (3pts) Find the probability that the lifetime exceeds 75 hundred hours.
3. (3pts) Interpret F(100) in plain English.

---

## Problem 10

**(Joint Density - Continuous)**

The joint density of two random variables *X* and *Y* is

> f(x, y) = 8xy,&emsp; 0 < x < y < 1.

1. (3pts) Find the marginal density of *X*.
2. (3pts) Find the marginal density of *Y*.
3. (3pts) Are *X* and *Y* independent? Justify.
4. (3pts) Find the conditional density f(x | y).
5. (4pts) Find P(X < 1/4 | Y = 1/2).

---

## Problem 11

**(Joint PMF - Discrete)**

Let *X* and *Y* be discrete random variables with the following joint probability distribution:

|  f(x,y) |  x = 1  |  x = 3  |  x = 5  |
|----------|---------|---------|---------|
| y = 2    |  0.05   |  0.15   |  0.10   |
| y = 4    |  0.10   |  0.25   |  0.15   |
| y = 6    |  0.05   |  0.10   |  0.05   |

1. (3pts) Find the marginal distributions of *X* and *Y*.
2. (3pts) Find P(X ≤ 3, Y ≥ 4).

---

## Problem 12

**(Expected Value - Discrete)**

A student plays a game where they draw one card from a standard 52-card deck. They win $10 if they draw an ace, $5 if they draw a face card (J, Q, K), and lose $2 for any other card. Let *X* be the student's net winnings.

1. (3pts) Find E(X).
2. (3pts) Find E(3X + 5).

---

## Problem 13

**(Expected Value & Variance - Continuous)**

The density function of *X* is

> f(x) = 6x(1 - x),&emsp; 0 < x < 1.

1. (3pts) Find E(X).
2. (4pts) Find Var(X).

---

## Problem 14

**(Covariance & Correlation)**

The joint density function of *X* and *Y* is

> f(x, y) = 12xy(1 - y),&emsp; 0 < x < 1, 0 < y < 1.

1. (3pts) Determine whether *X* and *Y* are independent.
2. (3pts) Find E(X) and E(Y).
3. (4pts) Find the covariance sigma_XY.

---

## Problem 15

**(Linear Combinations)**

Let *X* and *Y* be independent random variables with E(X) = 4, E(Y) = 6, Var(X) = 3, and Var(Y) = 5.

1. (3pts) Find E(2X - 3Y + 7).
2. (3pts) Find Var(2X - 3Y + 7).
3. (3pts) If *X* and *Y* were **not** independent and Cov(X, Y) = -2, find Var(2X - 3Y + 7).

---

## Problem 16

**(Chebyshev's Theorem)**

The weight of packages shipped by a company is a random variable *X* with mean 15 pounds and standard deviation 3 pounds. The distribution of *X* is unknown.

1. (3pts) Use Chebyshev's theorem to provide a lower bound on P(9 < X < 21).
2. (4pts) Compare the Chebyshev bound to the exact probability if *X* actually has density f(x) = (1/6)(1 - |x - 15|/6) for 9 < x < 21 (a triangular distribution on (9, 21) with mean 15). *[Hint: you do not need to compute the exact integral; just state whether the Chebyshev bound is tight or conservative and why.]*

---

## Problem 17

**(Joint Distribution - Expected Value)**

Suppose *X* and *Y* have joint density

> f(x, y) = 3x,&emsp; 0 < y < x < 1.

1. (3pts) Find E(X).
2. (3pts) Find E(Y).
3. (4pts) Find E(XY).

---

*Good luck!*
