# Discrete Probability Distributions

Code

STAT 4714

Author

Michael Schwob

# 1 Motivation

## 1.1 Known Probability Distributions

> "One only needs a handful of important probability distributions to describe many of the discrete random variables encountered in practice."

- Binomial & Multinomial Distribution
- Hypergeometric Distribution
- Negative Binomial & Geometric Distribution
- Poisson Distribution

# 2 Binomial & Multinomial Distribution

## 2.1 Bernoulli Process

A **Bernoulli process** is an experiment in which each trial has two possible outcomes. Each trial in this process is called a **Bernoulli trial**.

- *Ex:* Defective and non-defective component production (1=defective, 0=non-defective)
- *Ex:* Bit error events (1=received bit is correct, 0=received bit is flipped)
- *Ex:* Pulse detection in radar systems (1=radar detection, 0=no detection)

## 2.2 Bernoulli Process (properties)

A **Bernoulli Process** must have the following properties:

1.  The experiment consists of repeated trials.
2.  Each trial results in a binary outcome.
3.  The probability of a "success", denoted $p$, remains constant from trial to trial.
4.  The repeated trials are independent.

![Flipping a coin.](image omitted)

## 2.3 Binomial Distribution

If $X$ denotes the number of successes in $n$ Bernoulli trials, then $X$ is a **binomial random variable** with the **binomial distribution** $$b(x;n,p)=\binom{n}{x}p^x(1-p)^{n-x},\quad x=0,1,2,\dots,n,$$ where $p$ is the **constant** probability of success for each trial. We define $P(X=x)=b(x;n,p)$ as short-hand, which explicitly notes that the distribution for $X$ is *fully defined* by two parameters: $n$ (the number of Bernoulli trials) and $p$ (the probability of success for each trial).

## 2.4 Ex: Defective Probabilities

The probability that a certain kind of component will survive a shock test is $3/4$. Find the probability that exactly $2$ of the next $4$ components tested survive.

- The trials (component production) appear independent and with constant probability. We're also interested in the number of successes from $n=4$ trials, suggesting a binomial random variable with $p=3/4$. We plug the numbers into our equation to obtain the answer: $$P(X=2)=b(2;n=4,p=3/4)=\frac{27}{128}.$$

## 2.5 Ex: Disease Recovery

The probability that a patient recovers from a rare blood disease is 0.4. If 15 people are known to have contracted this disease, what is the probability that (a) exactly 5 survive, (b) at least 10 survive, and (c) from 3 to 8 survive?

- Let $X$ denote the number of people who survive.

a.  $P(X=5)=b(5;n=15,p=0.4)=\cdots=0.1859$

b.  $P(X \ge 10)=\sum_{x=10}^{15}b(x; n=15,p=0.4)=\cdots =0.0338$

c.  $P(3\le X \le 8)=\sum_{x=3}^8b(x;n=15,p=0.4)=\cdots=0.8779$

## 2.6 R: Binomial Distribution

Evaluating known probability distributions by hand is not the most time-efficient. Fortunately, we have access to computers!

In R, evaluating $b(x;n,p)$ can be done with `dbinom(x,n,p)`.

Evaluating the CDF of a binomial distribution can be done with `pbinom(x,n,p)`.

![Let\'s use computers!](image omitted)

## 2.7 Ex: Purchase Orders

A large chain retailer purchases a certain kind of electronic device from a manufacturer. The manufacturer indicates that the defective rate of the device is 3%. The inspector randomly picks 20 items from a shipment. What is the probability that there will be at least one defective item among these 20?

- Let $X$ denote the number of defective items, $n=20$ be the number of trials, and $p=0.03$ be the "success" probability. We compute $$\begin{align*} P(X\ge 1) &= 1-P(X<1)=1-P(X=0)\\ &= 1-\texttt{dbinom(0,20,0.03)}=0.4562 \end{align*}$$

## 2.8 Ex: (Advanced) Purchase Orders

Now, the retailer receives 10 shipments, and an inspector randomly tests 20 devices per shipment. What is the probability that there will be exactly 3 shipments each containing at least one defective device among the 20 that are selected and tested from the shipment?

- Let $Y$ denote the number of shipments that have at least one defective device. There are ten shipments, so $n=10$. The probability that any shipment has at least one defective device is 0.4562 (previous problem). So, $$\begin{align*} P(Y=3) &= \texttt{dbinom(3,10,0.4562)}=0.1602 \end{align*}$$

## 2.9 Binomial: Mean and Variance

Because the binomial distribution is fully specified by the two parameters $n$ and $p$, we can express the mean and variance of the distribution as a function of these parameters: $$E(X)=\mu=np \quad \text{ and } \quad \sigma^2_X=np(1-p).$$

- *Bit Error Events:* Of 13 sent bits, how many bit errors should we expect if each bit is incorrectly received with probability 0.02? What is the variance?
  - $E(X)=np=13(0.02)=0.26$ bit errors
  - $\sigma^2_X=13(0.02)(0.98)=0.2548$

## 2.10 Binomial: Mean and Variance

Because the binomial distribution is fully specified by the two parameters $n$ and $p$, we can express the mean and variance of the distribution as a function of these parameters: $$E(X)=\mu=np \quad \text{ and } \quad \sigma^2_X=np(1-p).$$

- *Pulse Detection:* Suppose a radar system sends out 200 pulses in one sweep, and assume that each pulse detects a target independently with probability 0.12. How many pulses should we expect to detect our target?
  - $E(X)=np=200(0.12)=24$ pulses

## 2.11 Multinomial Distribution

Now, suppose that each trial can result in any of $k$ possible outcomes $E_1,\dots,E_k$ with probabilities $p_1,\dots,p_k$. Then, we have a **multinomial experiment**. The probability distribution of the random variables $X_1,\dots,X_k$, which represent the number of occurrences for $E_1,\dots,E_k$ in $n$ independent trials, is $$m(x_1,\dots,x_k;n,p_1,\dots,p_k)=\binom{n}{x_1,\dots,x_k}p_1^{x_1}\cdots p_k^{x_k},$$ where $\sum^k_{i=1}x_i=n$ and $\sum^k_{i=1}p_i=1$.

## 2.12 Multinomial Distribution in R

We can evaluate the PMF of the multinomial distribution in R with `dmultinom(c(x1,...,xk), n, c(p1,...,pk))`, where `c()` forms a vector with the provided arguments.

This is an example of a distribution with an unwieldy CDF. We will not be using the multinomial CDF directly in this class. If needed outside of this class, use a `for`-loop over the interval of interest.

## 2.13 Ex: Airport Traffic

For an airport with 3 runways, the probabilities that the individual runways are accessed by a randomly arriving jet are $p_1=2/9$, $p_2=1/6$, and $p_3=11/18$. What is the probability that 6 randomly arriving jets are distributed in the following fashion: Runway 1 - 2 jets, Runway 2 - 1 jet, Runway 3 - 3 jets?

- This is a multinomial experiment. Each arriving jet has 3 outcomes (the runways). We know $n=6$ and the probabilities associated with each runway, so we use the multinomial distribution!

## 2.14 Ex: Airport Traffic

For an airport with 3 runways, the probabilities that the individual runways are accessed by a randomly arriving jet are $p_1=2/9$, $p_2=1/6$, and $p_3=11/18$. What is the probability that 6 randomly arriving jets are distributed in the following fashion: Runway 1 - 2 jets, Runway 2 - 1 jet, Runway 3 - 3 jets?

- We compute the following: $$\begin{align*} P(&X_1=2,X_2=1,X_3=3) = m\left(2,1,3; 6,\frac29,\frac16,\frac{11}{18}\right)\\ &= \texttt{dmultinom(c(2,1,3),6,c(2/9,1/6,11/18))}=0.1127 \end{align*}$$

## 2.15 Multinomial: Mean and Variance

Because the multinomial distribution is fully specified by the parameters $(n,p_1,\dots,p_k)$, we can express the mean and variance as a function of these parameters: $$E(X_i)=\mu_i=np_i \quad \text{ and } \quad \sigma^2_{X_i}=np_i(1-p_i).$$

![This should like similar to the binomial distribution; spiderman pointing.](image omitted)

## 2.16 Breakout Groups

*See Ch5-BO1*

# 3 Hypergeometric Distribution

## 3.1 Binomial v. Hypergeometric

In the Bernoulli process, trials must be independent. Therefore, the binomial distribution requires that each trial is independent of the other trials. However, what if the trials are dependent?

- *Ex:* Suppose we draw 5 cards from a deck. Because we sample without replacement, the trials are dependent. The fifth card drawn has different probabilities than the first card drawn because four cards have been removed!

When sampling is done *without replacement* or *trials are dependent*, consider the hypergeometric distribution!

## 3.2 Hypergeometric Experiment

A **hypergeometric experiment** has the following properties:

1.  A random sample of size $n$ is selected without replacement from $N$ items.
2.  Of the $N$ items, $k$ may be classified as successes and $N-k$ are classified as failures.

## 3.3 Hypergeometric Distribution

The number of successes $X$ is a **hypergeometric random variable** with a **hypergeometric distribution** $$h(x; N,n,k)=\frac{\binom{k}{x}\binom{N-k}{n-x}}{\binom{N}{n}},$$ where $\max{0,n-(N-k)}\le x \le \min{n,k}$.

- In a way, you've been using this distribution since homework 1!

## 3.4 R: Hypergeometric Distribution

To evaluate the PMF of the hypergeometric distribution $h(x;N,n,k)$, we can use `dhyper(x,k,N-k,n)`.

To evaluate the CDF of the hypergeometric distribution $h(x;N,n,k)$, we can use `phyper(x,k,N-k,n)`.

![Happy computing.](image omitted)

## 3.5 Ex: Lot Acceptance

Lots of 40 components each are deemed unacceptable if they contain 3 or more defectives. Five components are randomly selected, and the lot is rejected if a defective is found. What is the probability that exactly 1 defective is found in the sample if there are 3 defectives in the entire lot?

- Let $X$ denote the number of defectives found. We know there are $N=40$ components total, $k=3$ of which are defective. We also know we're only looking at $n=5$ components.

## 3.6 Ex: Lot Acceptance

Lots of 40 components each are deemed unacceptable if they contain 3 or more defectives. Five components are randomly selected, and the lot is rejected if a defective is found. What is the probability that exactly 1 defective is found in the sample if there are 3 defectives in the entire lot?

- Because this is a hypergeometric experiment, we can use the hypergeometric distribution: $$\begin{align*} P(X=1) &= h(1; N=40,n=5,k=3)\\ &=\texttt{dhyper(1,3,40-3,5)}=0.3011. \end{align*}$$

## 3.7 Hypergeometric: Mean and Variance

Because the hypergeometric distribution is fully specified with the parameters $(N,n,k)$, we can find the mean and variance of the distribution using these parameters: $$E(X)=\mu=\frac{nk}{N} \quad \text{ and } \quad \sigma^2_X=\frac{N-n}{N-1}\cdot\frac{nk}{N}\left(1-\frac{k}{N}\right).$$

## 3.8 The Binomial and Hypergeometric

If $n$ is small compared to $N$, then the dependence between trials is small. If we assume that $N$ is so large compared to $n$ that the trials are essentially independent, then we can use a binomial distribution to approximate a hypergeometric.

![A plot showing the binomial distribution converging to the hypergeometric distribution as the gap between N and n increases.](image omitted)

## 3.9 Multivariate Hypergeometric

Now, suppose that $N$ items can be partitioned into the $k$ cells $A_1,\dots,A_k$ with $a_1,\dots,a_k$ number of elements, respectively. The probability distribution of the random variables $X_1,\dots,X_k$ that represent the number of elements selected from the cells in a random sample of size $n$, is $$mh(x_1,\dots,x_k;N,n,a_1,\dots,a_k)=\frac{\binom{a_1}{x_1}\cdots\binom{a_k}{x_k}}{\binom{N}{n}},$$ where $\sum^k_{i=1}x_i=n$ and $\sum^k_{i=1}a_i=N.$

## 3.10 Multivariate Hypergeometric

The **multivariate hypergeometric distribution** is $$\text{mh}(x_1,\dots,x_k;N,n,a_1,\dots,a_k)=\frac{\binom{a_1}{x_1}\cdots\binom{a_k}{x_k}}{\binom{N}{n}},$$ where $\sum^k_{i=1}x_i=n$ and $\sum^k_{i=1}a_i=N.$

Using the `extraDistr` package in R, we can evaluate the multivariate hypergeometric PMF with

`dmvhyper(c(x1,...,xk), c(a1,...,ak), n)`.

## 3.11 Ex: Blood Types

A group of 10 individuals is used for a biological case study. The group contains 3 people with blood type O, 4 with blood type A, and 3 with blood type B. What is the probability that a random sample of 5 will contain 1 person with blood type O, 2 with blood type A, and 2 with blood type B?

- Note that we have a partition of the 10 individuals into 3 cells (blood types). We know the cell counts (3,4,3), and we want to know the probability of sampling (1,2,2) from the cells if we sample 5 total, so this is a multivariate hypergeometric experiment.

## 3.12 Ex: Blood Types

A group of 10 individuals is used for a biological case study. The group contains 3 people with blood type O, 4 with blood type A, and 3 with blood type B. What is the probability that a random sample of 5 will contain 1 person with blood type O, 2 with blood type A, and 2 with blood type B?

- We use the multivariate hypergeometric distribution to solve the probability: $$\begin{align*} P(X_1&=1,X_2=2,X_3=2) = \text{mh}(1,2,2;10,5,3,4,3)\\ &=\texttt{dmvhyper(c(1,2,2),c(3,4,3),5)}=0.2143 \end{align*}$$

## 3.13 Breakout Groups

*See Ch5-BO2*

# 4 Negative Binomial & Geometric Distribution

## 4.1 Negative Binomial Experiment

In the Bernoulli process, we have a *fixed number of trials*. Now, suppose that we repeat Bernoulli trials until we have a *fixed number of successes*. The trials are still treated as independent, and the probability of success is still constant across trials. This is a **negative binomial experiment**.

- *Ex:* Suppose we need 3 packets to be transmitted successfully, and we want to find the probability that this would happen within 8 packet transmissions.
- *General rule:* Any time you ask "how many trials until I have the $k$th success," you should consider the negative binomial distribution.

## 4.2 Negative Binomial Distribution

The number of trials required to produce $k$ successes, denoted $X$, is a **negative binomial random variable** with the **negative binomial distribution** $$nb(x;k,p)=\binom{x-1}{k-1}p^k(1-p)^{x-k},\quad x=k,k+1,k+2,\dots,$$ where the probability of a "success" is $p$.

In R, we evaluate the negative binomial PMF $nb(x;k,p)$ with `dnbinom(x-k,k,p)` and the CDF with `pnbinom(x-k,k,p)`.

## 4.3 Ex: NBA Championship

In an NBA championship series, the team that wins four of seven games is the winner. Suppose that team $A$ and $B$ face each other in the championship games and that team $A$ has probability 0.55 of winning *every game*. What is the probability that team $A$ will win the series in 6 games?

- There are independent trials with constant probability. Also, there is a fixed number of successes $k=4$; there is not a fixed number of trials. So, we use the negative binomial distribution: $$nb(6;4,0.55)=\texttt{dnbinom(6-4,4,0.55)}=0.1853.$$

## 4.4 Ex: NBA Championship

In an NBA championship series, the team that wins four of seven games is the winner. Suppose that team $A$ and $B$ face each other in the championship games and that team $A$ has probability 0.55 of winning *every game*. What is the probability that team $A$ will win the series?

- Team $A$ can win in 4, 5, 6, or 7 games: $$\begin{align} P(X\le 7)&=\sum^7_{i=4}nb(i;4,0.55)\\ &=\texttt{pnbinom(7-4,4,0.55)}=0.6083. \end{align}$$

## 4.5 Geometric Distribution

What if we are interested in the number of trials needed until we experience the **first** success? This is a special case of the negative binomial distribution. If $X$ denotes the number of trials needed until we see the **first** success, then we call $X$ a **geometric random variable** with probability mass function $$g(x;p)=p(1-p)^{x-1},\quad x=1,2,3,\dots,$$ where $p$ is the probability of "success" for each trial.

In R, we can evaluate the geometric PMF with `dgeom(x-1,p)` and the geometric CDF with `pgeom(x-1,p)`.

## 4.6 Ex: Emergency Calls

A 9-11 operation center is near capacity, so callers have difficulty placing their calls. We want to know the number of attempts necessary in order to make a connection. Suppose that we let $p=0.05$ be the probability of a connection during a busy time. We are interested in knowing the probability that 5 attempts are necessary for a successful call.

- Let $X$ denote the number of calls needed until we finally connect with the 9-11 operator. Then, $$P(X=5)=g(5;0.05)=\texttt{dgeom(5-1,0.05)}=0.0407.$$

## 4.7 Negative Binomial and Geometric: Mean and Variance

**Negative Binomial Distribution** $$E(X)=\mu=\frac{k}{p} \quad \text{ and } \quad \sigma^2_X=\frac{k(1-p)}{p^2}.$$

**Geometric Distribution** $$E(X)=\mu=\frac1p \quad \text{ and } \quad \sigma^2_X=\frac{1-p}{p^2}.$$

# 5 Poisson Distribution & the Poisson Process

## 5.1 Poisson Experiment

Experiments that yield the number of outcomes during a given time interval, specified region, or per-unit amount are called **Poisson experiments**.

![Space-time.](image omitted)

## 5.2 Poisson Process

The **Poisson process** has the following properties:

1.  The number of outcomes occurring during a particular interval is independent of the number of outcomes occurring in another interval. We call this a **memoryless process**.
2.  The probability that a single outcome will occur is proportional to the size of the interval and does not depend on the number of outcomes occurring outside this interval.
3.  The probability that more than one outcome will occur in a very small interval is negligible.

## 5.3 Poisson Distribution

The number of outcomes occurring during a Poisson experiment $X$ is a **Poisson random variable** with the **Poisson distribution** $$p(x; \lambda)=\frac{e^{-\lambda}\lambda^x}{x!},\quad x=0,1,2,\dots,$$ where $\lambda$ is the average number of outcomes per unit interval.

The mean and variance of the Poisson distribution are both $\lambda$!

In R, we evaluate the Poisson PMF with `dpois(x,lambda)` and the Poisson CDF with `ppois(x,lambda)`.

## 5.4 Ex: Radioactive Particles

During a laboratory experiment, the average number of radioactive particles passing through a counter in 1 millisecond is 4. What is the probability that 6 particles enter the counter in a given millisecond?

- We want to find $P(X=6)$: $$P(X=6)=p(6;4)=\texttt{dpois(6,4)}=0.1042.$$

![Radioactive](image omitted)

## 5.5 Ex: Oil Tankers

Ten is the average number of oil tankers arriving each day at a certain port. The facilities at the port can handle at most 15 tankers per day. What is the probability that on a given day tankers have to be turned away?

- We want $P(X>15)$: $$P(X>15)=1-P(X\le 15)=\texttt{1-ppois(15,10)}=0.0487.$$

![Oil tanker](image omitted)

## 5.6 Binomial Approximation

Let $X$ be a binomial random variable. If $n\to\infty$ and $p\to0$ and $np\overset{n\to\infty}{\to}\lambda$ remains constant, then the binomial distribution converges to the Poisson distribution with mean $\lambda$.

![A plot showing a binomial distribution converging to a Poisson distribution as n increases and p decreases.](image omitted)

## 5.7 Normal Approximation

Like many other distributions, the shape of the Poisson distribution becomes more symmetric (and bell-shaped) as the mean gets large.

![A plot showing the Poisson distribution becoming more bell-shaped as the mean increases.](image omitted)

## 5.8 Breakout Groups

*See Ch5-BO3*
