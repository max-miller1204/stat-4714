# Mathematical Expectation

Code

STAT 4714

Author

Michael Schwob

# 1 Mean of a Random Variable

------------------------------------------------------------------------

## 1.1 Mean of $X$

We are often interested in computing the **mean of a random variable $X$**. The mean is also called the **mathematical** **expectation** or **expected value** of $X$, denoted $E(X)$ or $\mu_x$.

- *Ex*: In communications, the expected value can tell us the long-term average power that a receiver must handle; this information could inform the design of amplifiers, filters, and error-control codes.
- *Ex*: Electrical engineers often design circuits and receivers around the expected DC level (bias) of signals, not just instantaneous voltage.

## 1.2 Definition of $E(X)$

Let $X$ be a random variable with probability distribution $f(x)$. The **mean** or **expected value** of $X$ is $$\mu=E(X)=\sum_x xf(x)$$ if $X$ is discrete, or $$\mu=E(X)=\int^\infty_{-\infty}xf(x)\,dx$$ if $X$ is continuous.

## 1.3 Intuition Behind $E(X)$

Consider an experiment in which a fair coin was tossed twice. Then, $S={HH,HT,TH,TT}$. Let $X$ denote the number of heads, taking on the values $0,1,$ or $2$. Because each outcome is equally likely in $S$, then we know $P(X=0)=P(TT)=1/4$, $P(X=1)=P(TH)+P(HT)=1/2$, and $P(X=2)=P(HH)=1/4$.

We can find $E(X)$ by knowing the chance that each possible value of $X$ has of occurring: $$E(X)=(0)(1/4) + (1)(1/2) + (2)(1/4)=1.$$

## 1.4 Notes on Expectation

The route to computing $E(X)$ is different than how we computed the sample mean $\bar{X}$ in the past. The sample mean is obtained using data, whereas the expected value is calculated using the probability distribution.

Also, note that the expected value can be a number that is not a possible outcome for the experiment.

- *Ex*: Consider flipping an unfair coin with $P(H)=0.60$ and $X$ denotes the number of heads. Then, $E(X)=1.2$, which is not possible to actually observe.

## 1.5 Ex: Component Reliability

A lot containing 7 components is sampled by a quality inspector. The lot contains 4 good components and 3 defective components. A random sample of 3 components is taken by the inspector. Find the expected value of the number of good components in this sample.

- Let $X$ denote the number of good components with PDF $$f(x)=\frac{\binom{4}{x}\binom{3}{3-x}}{\binom{7}{3}},\quad x=0,1,2,3.$$

------------------------------------------------------------------------

## 1.6 Ex: Component Reliability

A lot containing 7 components is sampled by a quality inspector. The lot contains 4 good components and 3 defective components. A random sample of 3 components is taken by the inspector. Find the expected value of the number of good components in this sample.

-  Then, $$E(X)=\sum_{x=0}^3xf(x)=0f(0)+1f(1)+2f(2)+3f(3)=1.7$$

## 1.7 Ex: Component Lifetime

Let $X$ be the random variable that denotes the life in hours of a certain electronic device. The PDF is $$f(x)=\frac{20000}{x^3},\quad x>100.$$ Find the expected life of this type of device.

- Using the definition of mathematical expectation, $$\mu=E(X)=\int_{100}^\infty x \underbrace{\frac{20000}{x^3}}_{f(x)}\,dx =\int^\infty_{100}20000x^{-2}\,dx=200.$$

## 1.8 Expectation of a Function of a Random Variable

In many cases, there may be interest in the expected value of a function of a random variable, denoted $E\[g(X)\]$ where $g(X)$ is the function of the random variable $X$.

- *Ex*: Let $X$ be a random variable for the received voltage. Then, power is $g(X)=X^2$, and we'd want to find $E(X^2)$.
- *Ex*: Let $Y$ be a random variable for the instantaneous signal-to-noise ratio (SNR). We might want to know the average channel capacity (bit/s/Hz) of a noisy channel, so we compute $E\[g(Y)\]$, where $g(Y)=\log_2(1+Y)$.

## 1.9 Expectation of a Function of a Random Variable

Let $X$ be a random variable with probability distribution $f(x)$. The expected value of the random variable $g(X)$ is $$\mu_{g(X)}=E\[g(X)\]=\sum_x g(x)f(x)$$ if $X$ is discrete and, if $X$ is continuous, $$\mu_{g(X)}=E\[g(X)\]=\int^\infty_{-\infty}g(x)f(x)\,dx.$$

## 1.10 Ex: Function of a Continuous Random Variable

Let $X$ be a random variable with density function $$f(x)=x^2/3,\quad -1<x<2.$$ Find the expected value of $g(X)=4X+3.$

- We know that $E\[g(X)\]=\int^\infty_{-\infty}g(x)f(x)\,dx$, so we solve $$E\[g(X)\]=\int^2_{-1}(4x+3)(x^2/3)\,dx=8.$$

## 1.11 An Extension for the Joint PDF

Let $X$ and $Y$ be random variables with joint probability distribution $f(x,y)$. The expected value of the random variable $g(X,Y)$ is $$\mu_{g(X,Y)}=E\[g(X,Y)\]=\sum_x\sum_y g(x,y)f(x,y)$$ if $X$ and $Y$ are discrete and, if $X$ and $Y$ are continuous, $$\mu_{g(X,Y)}=E\[g(X,Y)\]=\int^\infty_{-\infty}\int^\infty_{-\infty}g(x,y)f(x,y)\,dx\,dy.$$

## 1.12 Ex: Function of a Joint Distribution

Find $E(Y/X)$ for the density function $$f(x,y)=\frac{x(1+3y^2)}{4}, \quad 0<x<2, \; 0 < y < 1.$$

- Apply the definition on the previous slide: $$E(Y/X)=\int^1_0\int^2_0\frac{y}{x}\cdot\frac{x(1+3y^2)}{4}\,dx\,dy=\frac58.$$

## 1.13 Breakout Groups

*See Ch4-BO1*

# 2 Variance and Covariance of Random Variables

------------------------------------------------------------------------

## 2.1 Another Important Piece of Information

Earlier, we discussed how sample means only provide a bit of information; sample variances provide additional information. The same concept is true here: knowing the variability of random variables is incredibly important.

![A comparison between two distributions. The means are the same, but their variability and shape are different.](image omitted)

## 2.2 Variance of a Random Variable

Let $X$ be a random variable with probability distribution $f(x)$ and mean $\mu$. The **variance** of $X$ is $$\sigma^2=E\[(X-\mu)^2\]=\sum_x(x-\mu)^2 f(x)$$ if $X$ is discrete, and $$\sigma^2=E\[(X-\mu)^2\]=\int_{-\infty}^\infty (x-\mu)^2 f(x)\,dx$$ if $X$ is continuous. The **standard deviation** of $X$ is $\sigma=\sqrt{\sigma^2}$.

## 2.3 An Alternative Formula

Perhaps the easiest way to compute the variance of a random variable is to use the following formula: $$\sigma^2=E(X^2)-E(X)^2=E(X^2)-\mu^2.$$

$$\begin{align*} \text{Proof: }\sigma^2 &= \sum_x(x-\mu)^2f(x)=\sum_x(x^2-2\mu x+\mu^2)f(x)\\ &= \sum_x x^2f(x)-2\mu\sum_xxf(x)+\mu^2\sum_xf(x)\\ &= E(X^2) - 2\mu(\mu)+\mu^2(1) = E(X^2)-\mu^2 \end{align*}$$

## 2.4 Ex: Defective Parts

Let $X$ denote the number of defective parts for a machine when 3 parts are sampled from a production line. The following is the probability distribution of $X$. Find $\sigma^2_X$.

![A table showing the probability mass function for the random variable X.](image omitted)

-  We'll want to use $\sigma^2=E(X^2)-E(X)^2$, so let's compute $E(X)$: $$E(X)=0(0.51)+1(0.38)+2(0.10)+3(0.01)=0.61.$$

------------------------------------------------------------------------

## 2.5 Ex: Defective Parts

![A table showing the probability mass function for the random variable X.](image omitted)

- Then, we need to compute $E(X^2)$: $$E(X^2)=0^2(0.51)+1^2(0.38)+2^2(0.10)+3^2(0.01)=0.87.$$ Therefore, the variance is $$\sigma^2=0.87-0.61^2=0.4979.$$

## 2.6 Variance of a Function of a Random Variable

Let $X$ be a random variable with probability distribution $f(x)$. The variance of the random variable $g(X)$ is $$\sigma^2_{g(X)}=E{\[g(X)-\mu_{g(X)}\]^2}=\sum_x\[g(x)-\mu_{g(X)}\]^2 f(x)$$ if $X$ is discrete and, if $X$ is continuous, $$\sigma^2_{g(X)}=E{\[g(X)-\mu_{g(X)}\]^2}=\int^\infty_{-\infty}\[g(x)-\mu_{g(X)}\]^2 f(x)\,dx.$$

## 2.7 Ex: Variance of a Function of a Random Variable

Let $X$ be a random variable that has the density function $$f(x)=x^2/3,\quad -1<x<2.$$ Find the variance of $g(X)=4X+3.$

- Note that we previously found $\mu_{4X+3}=8$, so $$E\[(4X+3-8)^2\]=E\[(4X-5)^2\] =\int^2_{-1}(4x-5)^2\frac{x^2}{3}\,dx=\frac{51}{5}.$$

## 2.8 Covariance of Random Variables

- Let $X$ and $Y$ be random variables with joint probability distribution $f(x,y)$. An important piece of information can be obtained by taking the expected value of the function $g(X,Y)=(X-\mu_x)(Y-\mu_Y)$, called the **covariance**.

- The covariance between two random variables measures the nature of the association between the two. Importantly, the *sign* of the covariance indicates whether the two random variables are positively or negatively related.

## 2.9 Covariance of Random Variables

Let $X$ and $Y$ be random variables with joint probability distribution $f(x,y)$. The **covariance** of $X$ and $Y$ is $$\sigma_{XY}=E\[(X-\mu_X)(Y-\mu_Y)\]=\sum_x\sum_y(x-\mu_X)(y-\mu_Y)f(x,y)$$ if $X$ and $Y$ are discrete, and $$\sigma_{XY}=\int^\infty_{-\infty}\int^\infty_{-\infty}(x-\mu_X)(y-\mu_Y)f(x,y)\,dx\,dy$$ if $X$ and $Y$ are continuous.

## 2.10 An Alternative (Easier) Formula

The covariance of two random variables $X$ and $Y$ with means $\mu_X$ and $\mu_Y$, respectively, is given by $$\sigma_{XY}=E(XY)-\mu_X\mu_Y.$$

- *A couple notes on covariance & dependence:* When $X$ and $Y$ are statistically independent, then the covariance is 0. The converse is not generally true. The covariance describes the linear relationship between $X$ and $Y$. If their covariance is 0, they could still have a nonlinear relationship and hence are still dependent.

## 2.11 Ex: Marathon Runners

The fraction $X$ of male runners and $Y$ of female runners who compete in marathon races are described by the joint density function $$f(x,y)=8xy,\quad 0\le y\le x \le 1.$$ Find the covariance of $X$ and $Y$.

- Roadmap: To compute $\sigma_{XY}=E(XY)-E(X)E(Y)$, we find $E(X)$ and $E(Y)$ by computing the marginal distributions $g(x)$ and $h(y)$, then solving for $E(X)$ and $(Y)$. Next, we compute $E(XY)$ and, finally, $\sigma_{XY}=\frac{4}{225}.$

## 2.12 Correlation Coefficient

- The **covariance** provides some information regarding the relationship between $X$ and $Y$; importantly, the sign tells us whether the relationship is positive or negative. However, $\sigma_{XY}$ does not tell us how strong the relationship is because $\sigma_{XY}$ is not *scale-free* (i.e., the magnitude depends on the units measured for $X$ and $Y$).

- Instead, we use the **correlation coefficient** to quantify the strength of the relationship between $X$ and $Y$. This correlation coefficient is essentially a scale-free version of the covariance.

## 2.13 Correlation Coefficient (definition)

Let $X$ and $Y$ be random variables with covariance $\sigma_{XY}$ and standard deviations $\sigma_X$ and $\sigma_Y$, respectively. The correlation coefficient of $X$ and $Y$ is $$\rho_{XY}=\frac{\sigma_{XY}}{\sigma_X\sigma_Y}.$$

Note that $\rho_{XY}$ is free of the units of $X$ and $Y$, and it satisfies the inequality $-1\le\rho_{XY}\le 1.$

## 2.14 Ex: Marathon Runners' $\rho_{XY}$

Find the correlation coefficient of $X$ and $Y$ when $$f(x,y)=8xy,\quad 0\le y\le x \le 1.$$

- To compute the standard deviations $\sigma_X$ and $\sigma_Y$, we need $$E(X^2)=\int^1_0 x^2g(x)\,dx=2/3 \quad \text{and} \quad E(Y^2)=1/3.$$ Then, we compute $\sigma^2_X=2/75$ and $\sigma^2_Y=11/225$ to get $$\rho_{XY}=(4/225)/\sqrt{(2/75)(11/225)}=4/\sqrt{66}.$$

## 2.15 Breakout Groups

*See Ch4-BO2*

# 3 Means and Variances of Linear Combinations of Random Variables

------------------------------------------------------------------------

## 3.1 Univariate Results

**Expectation of $aX+b$**\
If $a$ and $b$ are constants, then $$E(aX+b)=aE(X)+b.$$

**Expectation of Sums of Functions of a Random Variable**\
The expected value of the sum or difference of two or more functions of a random variable $X$ is the sum or difference of the expected values of the functions: $$E\[g(X) \pm h(X)\]=E\[g(X)\]\pm E\[h(X)\].$$

## 3.2 Multivariate Results

**Expectation of Sums of Functions of Random Variables**\
The expected value of the sum or difference of two or more functions of random variables $X$ and $Y$ is the sum or difference of the expected values of the functions: $$E\[g(X,Y) \pm h(X,Y)\]=E\[g(X,Y)\]\pm E\[h(X,Y)\].$$

**Corollary #1**\
Setting $g(X,Y)=g(X)$ and $h(X,Y)=h(Y)$, we see that $$E\[g(X) \pm h(Y)\]=E\[g(X)\]\pm E\[h(Y)\].$$

## 3.3 Multivariate Results

**Corollary #2**\
Setting $g(X,Y)=X$ and $h(X,Y)=Y$, we see that $$E\[X \pm Y\]=E\[X\]\pm E\[Y\].$$

**Independent Random Variables**\
Let $X$ and $Y$ be two independent random variables. Then, $$E(XY)=E(X)E(Y).$$

## 3.4 Ex: Microchip Chemical Ratios

Suppose we want to know if the ratio of gallium to arsenide affects the functioning of gallium-arsenide wafers, which are (were?) the main components of microchips. Let $X$ denote the ratio of gallium to arsenide and $Y$ denote the functional wafers retrieved during a 1-hour period with joint PDF $$f(x,y)=x(1+3y^2)/4,\quad 0<x<2, \; 0<y<1.$$ Determine if $X$ and $Y$ are independent.

- We do the math and see that $E(XY)=\frac{5}{6}$, $E(X)=\frac{4}{3}$, and $E(Y)=\frac{5}{8}$. Thus, $E(XY)=E(X)E(Y)$, so yes!

## 3.5 Variance of a Linear Combination of Random Variables

If $X$ and $Y$ are random variables with joint probability distribution $f(x,y)$ and $a$, $b$, and $c$ are constants, then $$\sigma^2_{aX+bY+c}=a^2\sigma^2_X+b^2\sigma^2_Y+2ab\sigma_{XY}.$$

- Note that the variance is unchanged if a constant is added to or subtracted from a random variable. The addition or subtraction of a constant simply shifts the values of $X$ to the right or left; it doesn't change their variability.

## 3.6 Variance under Independence

For $n$ independent random variables $X_1,\dots,X_n$, we have $$\sigma^2_{a_1X_1+\dots+a_nX_n}=a_1^2\sigma^2_{X_1}+\dots+ a_n^2\sigma^2_{X_n}.$$

*Ex:* Let $X$ and $Y$ denote the amounts of two different types of impurities in a batch of a certain chemical product. Suppose that $X$ and $Y$ are independent random variables with variances $\sigma^2_X=2$ and $\sigma^2_Y=3$. Find the variance of the random variable $Z=3X-2Y+5.$

-  $\sigma^2_Z = \sigma^2_{3X-2Y+5} = \sigma^2_{3X-2Y}= 9\sigma^2_X+4\sigma^2_Y= 9(2)+4(3)=30.$

# 4 Chebyshev's Theorem

------------------------------------------------------------------------

## 4.1 Relating an Interval to $\sigma$

Russian mathematician P. L. Chebyshev (1821--1894) found that the fraction of the area between any two values that are symmetrically centered on the mean is related to the standard deviation. As a result, he established the following theorem:

- The probability that any random variable $X$ will assume a value within $k$ standard deviations of the mean is at least $1-1/k^2$: $$P(\mu-k\sigma<X<\mu+k\sigma)\ge 1-\frac{1}{k^2}.$$

## 4.2 Ex: Chebyshev's Theorem

A random variable $X$ has mean $\mu=8$, variance $\sigma^2=9$, and an unknown probability distribution. Find the lower-bound for $P(-4<X<20)$.

- Note that $$P(-4 <X<20)=P(8 - 4(3)<X<8+4(3))\ge 15/16.$$

![Could be higher than the floor.](image omitted)

## 4.3 Ex: Chebyshev's Theorem

A random variable $X$ has mean $\mu=8$, variance $\sigma^2=9$, and an unknown probability distribution. Find the upper-bound for $P(|X-8| \ge 6)$.

- Note that $$P(|X-8|\ge 6)=1-P(|X-8|<6)=1-P(-6<X-8<6).$$ Rearranging, we see that $$P(|X-8|\ge 6)=1-P\[8-2(3)<X<8+2(3)\] \le \frac14.$$

## 4.4 Notes on Chebyshev's Theorem

- This theorem provides a conservative estimate of the probability that a random variable assumes a value within $k$ standard deviations of its mean for any real number $k$.
- This theorem holds for any distribution of observations; we say that it's *distribution-free*. For this to occur, it must be a *weak* result. Additionally, the only value provided is a lower bound.
- Only when the probability distribution is known can we determine exact probabilities. Otherwise, Chebyshev's Theorem gives us a decent guess.

## 4.5 An Alternative: The Empirical Rule (68-95-99.7 Rule)

![A visual depiction of Chebyshev\'s Theorem, also known as the empirical rule.](image omitted)

- Only works for distributions that are bell-shaped
- Provides tighter percentages than Chebyshev's Theorem

## 4.6 Breakout Groups

*See Ch4-BO3*
