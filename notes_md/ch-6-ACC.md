# Continuous Probability Distributions

Code

STAT 4714

Author

Michael Schwob

# 1 A Quick Warm-Up

## 1.1 Uniform Distribution

The **uniform distribution** is used when every possible outcome has the same probability of occurring (i.e, equiprobable). The density function of the continuous **uniform random variable** $X$ on the interval $\[A,B\]$ is $$u(x; A,B)=\frac{1}{B-A},\quad A\le x \le B.$$

The mean and variance of the uniform distribution are $$E(X)=\frac{A+B}{2} \quad \quad \sigma^2_X=\frac{(B-A)^2}{12}.$$

## 1.2 Uniform Distribution

To evaluate the PDF and CDF of a uniform distribution with support $\[A,B\]$, we can use $P(X=x)=$ `dunif(x,A,B)` and $P(X\le x)=$ `punif(x,A,B)`, respectively.

The uniform density function forms a rectangle with base $B-A$ and constant height $\frac{1}{B-A}$.

![The uniform distribution from A to B.](image omitted)

## 1.3 Ex: Quantization Error

In many cases, when a continuous analog signal is converted to digital, it is rounded to the nearest quantization level. If the input signal is well-behaved, the quantization error (i.e., the difference between the true signal and its quantized value) is often modeled with the uniform distribution. For example, let the quantization step size be $\delta$. Then, the error $e$ is often assumed to be $$e\sim \text{Uniform}(A=-\delta/2,B=\delta/2).$$ This is done because the input could fall anywhere between the two quantization thresholds.

# 2 Normal Distribution

## 2.1 History of the Normal Distribution

**History:** German statistician Carl Friedrich Gauss derived the normal distribution from a study of errors in repeated measurements of the same quantity. This occurred decades after the distribution was created by French mathematician Abraham de Moivre.

- **TL;DR:** Errors in scientific measurements are extremely well-approximated by the normal distribution.

## 2.2 A Tangent on Error

Distributions are often selected based on the kind of error or uncertainty expected in a system, which makes sense because statistics as a field focuses on stochasticity and error.

- The uniform distribution is used for quantization and bounded errors.
- The normal distribution is used for measurement errors.
- The exponential/Poisson distribution is used when errors come from random rare events.
- The Laplace distribution is used for heavy-tailed errors.

## 2.3 The Normal Distribution

The density of a **normal random variable** $X$ with mean $\mu$ and variance $\sigma^2$ is the **normal distribution** $$n(x;\mu,\sigma^2)=\frac{1}{\sqrt{2\pi\sigma^2}}\exp\left(-\frac{1}{2\sigma^2}(x-\mu)^2\right),\quad -\infty<x<\infty.$$

- The mean and variance of the normal distribution are $$E(X)=\mu \quad \quad \sigma^2_X=\sigma^2.$$

## 2.4 Visualizing the Normal Distribution

![A normal distribution.](image omitted)

## 2.5 Visualizing the Normal Distribution

![Two normal distributions with identical variances but different means.](image omitted)

## 2.6 Visualizing the Normal Distribution

![Two normal distributions with identical means but different variances.](image omitted)

## 2.7 Visualizing the Normal Distribution

![Two normal distributions with unique parameters.](image omitted)

## 2.8 R: The Normal Distribution

In R, we can evaluate the PDF of a normal distribution with mean $\mu$ and variance $\sigma^2$ using `dnorm(x,mu,sigma)`. Similarly, we can evaluate the CDF using `pnorm(x,mu,sigma)`. Note that we use standard deviation (*not variance*) in the R code.

![Totally normal.](image omitted)

## 2.9 The Quantile Function

- What if we want to solve for $k$ such that $P(X<k)=c$, where $c$ is known? Then, we can use the **quantile function** `qnorm(c,mu,sigma)`.
- The quantile function solves for $k$ such that the probability of $X$ being below $k$ is $c$. For example, if $c=0.5$, then the probability that $X$ is below $k$ is 0.5. In this particular case, we call $k$ the **median**.

## 2.10 Ex: Quantile Functions

Given a normal distribution with $\mu=40$ and $\sigma=6$, find the value of $x$ that has

1.  45% of the area to the left\
2.  14% of the area to the right

- We need $P(X\le x)=0.45$, and we can use the quantile function to solve for $x$: `qnorm(0.45,40,6)`$=39.246$.
- We need $P(X \ge x)=0.14$. Using complements we know that $P(X\le x)=1-0.14=0.86$, so `qnorm(0.86,40,6)`$=46.482$.

## 2.11 Ex: Storage Battery

A certain type of storage battery lasts (on average) 3.0 years with a standard deviation of 0.5 years. Assuming that battery life is normally distributed, find the probability that a given battery will last less than 2.3 years.

- We want to find $P(X\le2.3)$. We can integrate this directly using the normal distribution or we could use code: `pnorm(2.3,3.0,0.5)`$=0.0808$.

## 2.12 Ex: Light Bulbs

An electrical firm manufactures light bulbs that have a life that is normally-distributed with a mean of 800 hours and a standard deviation of 40 hours. Find the probability that a bulb burns between 778 and 834 hours.

- We want to solve for $P(778\le X\le834)=P(X\le 834)-P(X\le778)$, which we can do using code:\
  `pnorm(834,800,40)-pnorm(778,800,40)`$=0.5111$.

## 2.13 Ex: Exam Grades

The average grade for an exam is 74, and the standard deviation is 7. If 12% of the class is given $A$s, what is the lowest possible $A$ and the highest possible $B$? Assume the grades follow a normal distribution.

- To find the lowest $A$, we need the quantile that leaves 12% of probability to the right of $A$: $P(X\ge a)=0.12$.

- Using complements: $P(X\le a)=1-0.12=0.88$, so $a=$`qnorm(0.88,74,7)`$=82.22$.

- So, the lowest possible $A$ is 82.22% and the highest possible $B$ is 82.21%.

## 2.14 Some Theoretical Comments

The normal distribution is widely used as a **limiting distribution**, which essentially means that it can be used to approximate other distributions. For example, under certain conditions, the normal distribution provides a good approximation to the binomial and hypergeometric distributions.

- Later in this course, we will see that the normal distribution is often used as a **sampling distribution** because distributions of sample averages become bell-shaped as the sample size increases.

## 2.15 Standard Normal Distribution

- The **standard normal distribution** is a normal distribution with mean $\mu=0$ and variance $\sigma^2=1$.

- The standard normal distribution is fundamental for hypothesis testing, $p$-values, and confidence intervals (we'll get there soon). It also serves as the building block for other distributions that we'll soon learn.

## 2.16 Ex: Standard Normal

In digital communication systems, the additive white Gaussian noise (AWGN) model is often used. This model uses the standard normal distribution to express detection error probabilities (i.e., the probability of the communication system making the wrong decision when trying to interpret a noisy signal).

![Digital communication.](image omitted)

## 2.17 Ex: Standard Normal Quantiles

Given a standard normal distribution, find the value of $k$ when

1.  $P(Z>k)=0.3015$\
2.  $P(k<Z<-0.18)=0.4197$

- Note that $P(Z>k)=0.3015$ implies that $P(Z \le k)=0.6985$. From here, we can use the quantile function to solve for $k$: `qnorm(0.6985,0,1)`$=0.5201$.

-  $P(k\le Z\le -0.18)=P(Z\le -0.18)-P(Z\le k)=0.4197$, which gives $P(Z\le k)=0.0089$: `qnorm(0.0089,0,1)`$=-2.3698$.

## 2.18 Standard Normal Transformation

A **standard normal random variable** $Z$ can be obtained from a normal random variable $X$ with the following transformation: $$Z=\frac{X-\mu}{\sigma},$$ where $X$ has mean $\mu$ and variance $\sigma^2$.

Whenever $X$ assumes a value $x$, the corresponding value of $Z$ is $z=(x-\mu)/\sigma$. If $X$ falls between $x_1$ and $x_2$, then $Z$ will fall between $z_1=(x_1-\mu)/\sigma$ and $z_2=(x_2-\mu)/\sigma$, meaning $$P(x_1<X<x_2)=P(z_1<Z<z_2).$$

## 2.19 Visualizing the Standard Normal Transformation

![A normal distribution with its corresponding standard normal transformation.](image omitted)

## 2.20 Ex: Standard Normal Transformation

Let $X$ be a normal random variable with mean $\mu=50$ and variance $\sigma^2=100$. Find $P(45<X<62)$ using the normal distribution and the standard normal transformation.

- Using the direct normal route, we see that $$\begin{align*} P(45<X<62) &= P(X\le 62)-P(X\le 45)\\ &= \texttt{pnorm(62,50,10)}-\texttt{pnorm(45,50,10)}\\ &= 0.5764 \end{align*}$$

## 2.21 Ex: Standard Normal Transformation

Let $X$ be a normal random variable with mean $\mu=50$ and variance $\sigma^2=100$. Find $P(45<X<62)$ using the normal distribution and the standard normal transformation.

- Using the standard normal route, we see that $$\begin{align*} P(45<X<62) &= P((45-50)/10<Z<(62-50)/10) \\ &= P(Z\le 1.2)-P(Z\le -0.5)\\ &= \texttt{pnorm(1.2,0,1)}-\texttt{pnorm(-0.5,0,1)}\\ &= 0.5764 \end{align*}$$

## 2.22 Breakout Groups

*See Ch6-BO1*

## 2.23 Normal Approximation to the Binomial

The normal distribution is often a good approximation to discrete distributions that take on a symmetric bell shape. Some discrete distributions converge to the normal distribution as their parameters approach certain limits. One example is the binomial distribution, which is well-approximated by the normal distribution...

## 2.24 Normal Approximation to the Binomial

Let $X$ be a binomial random variable with $n$ trials and $p$ probability of success. As $n\to\infty$, $$Z=\frac{X-np}{\sqrt{np(1-p)}}$$ is a standard normal random variable.

- *Rule of thumb:* The normal approximation for the binomial distribution will be good if $np$ and $n(1-p)$ are greater than or equal to 5.

## 2.25 Continuity Correction

Suppose we want to find $P(X=4)$, where $X$ is a binomial random variable with parameters $n$ and $p$. If we were to solve for this using the normal approximation, we would need to construct a small interval around 4 to account for the fact that a discrete distribution is being approximated by a continuous distribution. Generally, we add and subtract $0.5$ (a continuity correction) from the value of interest: $$P(X=4)\approx P\left(\frac{3.5-np}{\sqrt{np(1-p)}}<Z<\frac{4.5-np}{\sqrt{np(1-p)}}\right).$$

## 2.26 Continuity Correction

Suppose we want to find $P(X=4)$, where $X$ is a binomial random variable with parameters $n$ and $p$. If we were to solve for this using the normal approximation, we would need to construct a small interval around 4 to account for the fact that a discrete distribution is being approximated by a continuous distribution.

We do a similar continuity correction with intervals:

- $P(X\le4)\approx P\left(Z\le \frac{4.5-np}{\sqrt{np(1-p)}}\right)$
- $P(3\le X\le 5)\approx P\left(\frac{2.5-np}{\sqrt{np(1-p)}}<Z<\frac{5.5-np}{\sqrt{np(1-p)}}\right)$

## 2.27 Ex: Rare Blood Disease

The probability that a patient recovers from a rare blood disease is 0.4. If 100 people are known to have contracted this disease, what is the probability that fewer than 30 survive?

- Let $X$ denote the number of patients who survive. Solving for this with the binomial distribution, we get $P(X< 30)=P(X\le 29)=\texttt{pbinom(29,100,0.4)}=0.0148$.

## 2.28 Ex: Rare Blood Disease

The probability that a patient recovers from a rare blood disease is 0.4. If 100 people are known to have contracted this disease, what is the probability that fewer than 30 survive?

- With the normal approximation, we get $$\begin{align*} P\left(Z \le \frac{29.5-100(0.4)}{\sqrt{100(0.4)(0.6)}}\right) &=P(Z\le -2.1433)\\ &=\texttt{pnorm(-2.1433,0,1)}=0.0160. \end{align*}$$

## 2.29 Ex: Multiple Choice Quiz

A multiple choice quiz has 80 questions, each with 4 possible answers of which only 1 is correct. What is the probability that sheer guesswork yields from 25 to 30 correct answers?

- Binomial Approach: $$\begin{align*} P(25\le X \le 30) &=\texttt{pbinom(30,80,0.25)}\\ &\quad -\texttt{pbinom(24,80,0.25)}\\ &=0.1193 \end{align*}$$

## 2.30 Ex: Multiple Choice Quiz

A multiple choice quiz has 80 questions, each with 4 possible answers of which only 1 is correct. What is the probability that sheer guesswork yields from 25 to 30 correct answers?

- Normal Approximation: $$\begin{align*} &P\left(\frac{24.5-80(0.25)}{\sqrt{80(0.25)(0.75)}}\le Z \le \frac{30.5-80(0.25)}{\sqrt{80(0.25)(0.75)}}\right)\\ &\quad =P(1.16<Z<2.71)=0.1196 \end{align*}$$

## 2.31 Breakout Groups

*See Ch6-BO2*

# 3 Gamma and Exponential Distributions

## 3.1 Motivation

Both the exponential and the gamma distribution play an important role in queuing theory and reliability problems. For example, time between arrivals at service facilities and time to failure of components are often modeled by the exponential and gamma distributions.

![The time for failure is gone.](image omitted)

## 3.2 Gamma Function

The gamma distribution relies on the **gamma function** $$\Gamma(\alpha)=\int^\infty_0x^{\alpha-1}e^{-x}dx,\quad \alpha>0.$$

This function has the following properties:

1.  $\Gamma(\alpha)=(\alpha-1)\Gamma(\alpha-1)$\
2.  $\Gamma(n)=(n-1)!$ for a positive integer $n$\
3.  $\Gamma(1)=1$\
4.  $\Gamma(1/2)=\sqrt{\pi}$

## 3.3 Gamma Distribution

A **gamma random variable** $X$ follows the **gamma distribution** $$g(x;\alpha,\beta)=\frac{1}{\beta^\alpha\Gamma(\alpha)}x^{\alpha-1}e^{-x/\beta},\quad x>0,$$ where $\alpha>0$ is the *shape parameter* and $\beta>0$ is the *scale parameter*.

The mean and variance of the gamma distribution are $$E(X)=\alpha\beta\quad \quad \sigma^2_X=\alpha\beta^2.$$

## 3.4 Visualizing the Gamma Distribution

![Several gamma distributions with different parameter values.](image omitted)

## 3.5 R: The Gamma Distribution

We can evaluate the PDF and CDF of the gamma distribution in R using $P(X=x)=$`dgamma(x,alpha,1/beta)` and $P(X\le x)=$`pgamma(x,alpha,1/beta)`.

![Let\'s be careful out there.](image omitted)

## 3.6 Ex: Drugged Rats

A dose-response investigation on rats is used to determine the effect of the dose of a toxicant on their survival time. For a certain dose of the toxicant, a study determines that the survival time (in weeks) has a gamma distribution with $\alpha=5$ and $\beta=10$. What is the probability that a rat survives no longer than 60 weeks?

-  Let $X$ be a gamma random variable. We are asked to solve for $P(X\le 60)$, which we can do using R: $$P(X\le60)=\texttt{pgamma(60,5,1/10)}=0.7150.$$

## 3.7 Ex: Customer Complaints

The length of time in months between customer complaints about a certain product is a gamma distribution with $\alpha=2$ and $\beta=4$. Changes were made to tighten quality control requirements. Now, 20 months have passed without complaints. Were the improvements effective?

- Let $X$ be the time until the first complaint. We essentially want to know how rare a 20-month gap is, so compute $$P(X\ge 20)=\texttt{1-pgamma(20,2,1/4)}=0.0404.$$

## 3.8 Ex: Customer Complaints

The length of time in months between customer complaints about a certain product is a gamma distribution with $\alpha=2$ and $\beta=4$. Changes were made to tighten quality control requirements. Now, 20 months have passed without complaints. Were the improvements effective?

- So, prior to the quality control improvements, the chance of having a gap of at least 20 months was just 4%. Therefore, it's likely that the improvements were effective.

## 3.9 Exponential Distribution

The **exponential distribution** is a special case of the gamma distribution, where $\alpha=1$. The **exponential random variable** $X$ has distribution $$e(x;\beta)=\frac{1}{\beta}e^{-x/\beta},\quad x>0,$$ where $\beta>0$ is the *scale parameter*.

The mean and variance of the exponential distribution are $$E(X)=\beta\quad \quad \sigma^2_X=\beta^2.$$

## 3.10 R: The Exponential Distribution

In R, we can evaluate the PDF and CDF of the exponential distribution with $P(X=x)=$`dexp(x,1/beta)` and $P(X\le x)=$`pexp(x,1/beta)`.

Of course, these are equivalent to `dgamma(x,1,1/beta)` and `pgamma(x,1,1/beta)`, respectively.

![Be careful.](image omitted)

## 3.11 Poisson to Exponential

Recall that the Poisson distribution is used to model the number of "events" during a particular period of time (or span of space). However, in many applications, interest may focus on the time between events. For example, perhaps there is interest in the time between photon arrivals at a detector (not the number of photon arrivals).

- Let an event (i.e., photon arrival) be a Poisson event. We know that $\lambda$ denotes the mean number of events per unit "time." We are now focused on the random variable described by the time required for the first Poisson event to occur.

## 3.12 Poisson to Exponential

Because $\lambda$ is the mean number of events per unit time, $\lambda t$ denotes the number of events allowed during a time span of $t$ units. The probability that no events occur in such a time span is $$p(0;\lambda t)=\frac{e^{-\lambda t}(\lambda t)^0}{0!}=e^{-\lambda t}.$$

## 3.13 Poisson to Exponential

Let $T$ be the time to first Poisson event. The probability $P(T>t)$ is the same as the probability that no Poisson event will occur in $t$, which we just saw was $\exp(-\lambda t)$. Using complements, the CDF of $T$ is $$P(T\le t)=1-\exp(-\lambda t).$$

## 3.14 Poisson to Exponential

If the CDF of $T$ is $$P(T\le t)=1-\exp(-\lambda t),$$ then the PDF is $$f(t)=\lambda e^{-\lambda t},$$ which is the density function of the exponential distribution with $\lambda=1/\beta$.

## 3.15 Poisson to Exponential

In summary, the time until a Poisson event can be modeled with an exponential distribution! In particular, $T$ is the length of time until we see a Poisson event.

![Kazoo kid wow.](image omitted)

## 3.16 Memoryless Property

The exponential distribution is *memory-less*, meaning that the length of time until seeing an event does not depend on the amount of time since the last event. For example, if $T$ is an exponential random variable describing how long until a bus arrives, then we're assuming that the amount of time we have already waited does not affect how long we still need to wait for the bus.

The memoryless property is also evident from its relationship with the Poisson distribution. Poisson events occur randomly, without regard to how long it's been since the last event occurred. Thus, the exponential distribution is *memory-less*.

## 3.17 Memoryless Property

It might not always make sense to assume a memory-less process. For example, if the failure of a component is a result of gradual or slow wear, then the exponential distribution is inappropriate. Better choices would be the gamma or Weibull distribution.

![But wait, it gets worse.](image omitted)

## 3.18 Ex: Telephone Calls

Suppose that telephone calls arriving at a particular switchboard follow a Poisson process with an average of 5 calls coming per minute. What is the probability that up to a minute will elapse by the time one call has come in to the switchboard?

- Let $T$ denote the time in minutes until the first call comes in to the switchboard. Then, we want $P(T\le 1)$. Because we are modeling the length of time until a Poisson event, we use an exponential distribution: $$P(T\le 1)=\texttt{pexp(1,5)}=0.9933.$$

## 3.19 Poisson to Gamma

- Because the exponential distribution is a special case of the gamma distribution, there also exists a link between the Poisson distribution and the gamma distribution.

- Whereas the exponential distribution represented the length of time until one Poisson event, the gamma distribution represents the length of time until $\alpha$ Poisson events. (Recall: exponential is gamma with $\alpha=1$.)

## 3.20 Ex: Telephone Calls

Suppose that telephone calls arriving at a particular switchboard follow a Poisson process with an average of 5 calls coming per minute. What is the probability that up to a minute will elapse by the time two calls have come in to the switchboard?

- Let $T$ denote the time in minutes until two calls come in to the switchboard. Then, we want $P(T\le 1)$. Because we are modeling the length of time until multiple Poisson events, we use a gamma distribution: $$P(T\le 1)=\texttt{pgamma(1,2,5)}=0.9596.$$

# 4 Log-Normal Distribution

## 4.1 Log-normal Distribution

If a natural log-transformation of data yields an approximately normal distribution, then the **log-normal distribution** is appropriate. A **log-normal** random variable $X$ has density $$ln(x;\mu,\sigma)=\frac{1}{\sqrt{2\pi\sigma^2x^2}}\exp\left(-\frac{1}{2\sigma^2}(\log(x)-\mu)^2\right),\quad x\ge 0,$$ where $\mu$ and $\sigma^2$ are the mean and variance of the normal random variable $Y=\log(X)$. The mean and variance of the log-normal distribution are $$E(X)=\exp(\mu+\sigma^2/2)\quad\quad \sigma^2_X=\exp(2\mu+\sigma^2)(e^{\sigma^2}-1).$$

## 4.2 R: The Log-normal Distribution

We can evaluate the PDF and CDF of the log-normal distribution in R using $P(X=x)=$`dlnorm(x,mu,sigma)` and $P(X\le x)=$`plnorm(x,mu,sigma)`, respectively.

![Do it - Ben Stiller.](image omitted)

## 4.3 Ex: Chemical Pollutants

Suppose that the concentration of a chemical pollutant (in parts per million) has a lognormal distribution with parameters $\mu=3.2$ and $\sigma=1$. What is the probability that the concentration exceeds 8 parts per million?

- If $X$ denotes the parts per million, then we want $P(X>8)$: $$P(X>8)=1-P(X\le 8)=\texttt{1-plnorm(8,3.2,1)}=0.8688.$$

# 5 Weibull Distribution

## 5.1 Weibull Distribution

In reliability/failure analysis and signal modeling, the **Weibull distribution** is very common. A **Weibull random variable** $X$ has density function $$w(x;\alpha,\beta)=\alpha\beta x^{\beta-1}e^{-\alpha x^\beta},\quad x>0,$$ with shape parameter $\alpha>0$ and rate parameter $\beta>0$.

The mean and variance of the Weibull distribution are $$E(X)=\alpha^{-1/\beta}\Gamma\left(1+\frac1\beta\right) \; \sigma^2_X=\alpha^{-2/\beta}\left{\Gamma\left(1+\frac2\beta\right)-\left\[\Gamma\left(1+\frac1\beta\right)\right\]^2\right}.$$

## 5.2 R: The Weibull Distribution

We can evaluate the PDF and CDF of the Weibull distribution in R using $P(X=x)=$`dweibull(x,beta,alpha^(-1/beta))` and $P(X\le x)=$`pweibull(x,beta,alpha^(-1/beta))`, respectively.

![Stay safe.](image omitted)

## 5.3 Weibull Distribution: Motivation

- Like the gamma and exponential distributions, the Weibull is frequently used in reliability and life-testing problems (e.g., time to failure or lifespan).

- This distribution has great flexibility and does not require the memory-less property of the exponential distribution. Therefore, it's most applicable when components experience wear.

## 5.4 Weibull Distribution: Properties

The shape of the Weibull distribution changes significantly depending on the value of $\beta$. If $\beta=1$, we get the exponential distribution. If $\beta>1$, the Weibull distribution becomes more bell-shaped, while still displaying some skewness.

![Three Weibull distributions with different values for beta.](image omitted)

## 5.5 Ex: Item Failure

The length of life (in hours) of an item in a machine shop has a Weibull distribution with $\alpha=0.01$ and $\beta=2$. What is the probability that it fails before eight hours of usage?

- If $X$ denotes the lifetime in hours, then $$P(X<8)=\texttt{pweibull(8,2,0.01^(-1/2))}=0.4727.$$

## 5.6 The Failure Rate of the Weibull

In many reliability studies, there is interest in the **failure rate** (or, *hazard rate*) of a component to get a sense of wear or deterioration. The failure rate at time $t$ for the Weibull distribution is $$Z(t)=\frac{f(t)}{1-F(t)}=\alpha\beta t^{\beta-1},\quad t>0.$$ Here, $Z(t)$ describes whether the risk of failure goes down, stays constant, or increases as time goes on.

## 5.7 The Failure Rate of the Weibull

The failure rate at time $t$ for the Weibull distribution is $$Z(t)=\frac{f(t)}{1-F(t)}=\alpha\beta t^{\beta-1},\quad t>0.$$

- If $\beta=1$ (i.e., exponential distribution), then $Z(t)=\alpha$; the failure rate is constant (memoryless).
- If $\beta>1$, $Z(t)$ is an increasing function of $t$; the component wears over time.
- If $\beta<1$, $Z(t)$ is a decreasing function of $t$; the component strengthens/hardens over time.

## 5.8 Ex: Cable Insulation

A high-voltage cable's insulation lifetime in hours, denoted $T$, follows a Weibull distribution with $\alpha=10^{-8}$ and $\beta=2$. Compute the failure rate of the cable at 1000 hours.

- We want $Z(1000)$: $$Z(1000)=(10^{-8})(2)(1000)^{2-1}=2\times10^{-5}.$$ Therefore, the instantaneous failure rate at 1000 hours is $2\times10^{-5}$ per hour. In other words, given that the item has survived up to 1000 hours, there is a 0.002% chance it fails in the next hour.

# 6 Other Common Distributions

## 6.1 Chi-squared Distribution

Another special case of the gamma distribution is the **chi-squared distribution**, where $\alpha=v/2$, $\beta=2$, and $v$ is a positive integer called *the degrees of freedom*. The **chi-squared random variable** $X$ has distribution $$c(x; v)=\frac{1}{2^{v/2}\Gamma(v/2)}x^{v/2-1}e^{-x/2},\quad x>0.$$

The chi-squared distribution is fundamental to statistical theory, such as hypothesis testing, estimation, sampling distributions, analysis of variance, and nonparametric statistics.

## 6.2 Beta Distribution

An extension to the uniform distribution is the **beta distribution**. A **beta random variable** $X$ has distribution $$f(x;\alpha,\beta)=\frac{\Gamma(\alpha+\beta)}{\Gamma(\alpha)\Gamma(\beta)}x^{\alpha-1}(1-x)^{\beta-1},\quad 0<x<1,$$ with shape parameters $\alpha,\beta>0$.

- Note that the uniform distribution on $\[0,1\]$ is the beta distribution with $\alpha=\beta=1$.

- The beta distribution is commonly used to model probabilities and proportions.

## 6.3 Ex: Packet Transmission

Suppose there is interest in modeling the probability that a packet is successfully transmitted over a wireless channel. Suppose that the expected probability of transmission is 0.6 and the variance of transmission probability is 0.02. What is the probability that the transmission probability exceeds 0.5?

- Because we model the transmission probability $X$, we use a beta distribution. Our goal is to compute $P(X\ge0.5)$. We need the model parameters $\alpha$ and $\beta$, but we know $E(X)$ and $\sigma^2_X$.

## 6.4 Ex: Packet Transmission

Suppose there is interest in modeling the probability that a packet is successfully transmitted over a wireless channel. Suppose that the expected probability of transmission is 0.6 and the variance of transmission probability is 0.02. What is the probability that the transmission probability exceeds 0.5?

-  We have two equations and two unknowns, so we can solve for the model parameters directly to get $\alpha=6.6$ and $\beta=4.4$. This is called **moment matching**. Finally, we can solve $$1-P(X\le 0.5)=\texttt{1-pbeta(0.5,6.6,4.4)}=0.7555.$$

## 6.5 Breakout Groups

*See Ch6-BO2*
