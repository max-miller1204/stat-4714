# Random Variables and Probability Distributions

Code

STAT 4714

Author

Michael Schwob

# 1 Definitions and Classifications

------------------------------------------------------------------------

## 1.1 Experiments & Random Variables

A **statistical experiment** is used to describe any process by which several chance observations are generated. It is often important to allocate a numerical description to the outcome, which we call a **random variable**. A random variable is a function that associates a real number with each element in the sample space.

![Random variables are a mapping.](image omitted)

------------------------------------------------------------------------

## 1.2 Experiments & Random Variables

- Ex: Suppose we test 3 electronic components to see if they are defective. The sample space is $$S={NNN,NND,NDN,NDD,DNN,DND,DDN,DDD}.$$ If we are interested in the number of defectives that occur, our random variable $X$ would denote the numerical values 0, 1, 2, or 3 assigned to each event. Each possible value of $X$ represents an event that is a subset of the sample space for the given experiment.

## 1.3 Random Variables and Notation

- Ex: In the previous example with defective electronic components, note that $X=2$ for the following elements: $$E={NDD,DND,DDN}.$$

- *A note on notation:* We will use the capital letter $X$ to denote a random variable and a lowercase letter $x$ to denote a corresponding value for the random variable.

- Ex: For the outcome $DDN$, we say $x=2$. However, $X=2$ suggests an event that contains several elements, one of them being $DDN$.

## 1.4 Ex: The Common Urn

Two balls are drawn in succession without replacement from an urn containing 4 red balls and 3 black balls. Let $Y$ denote the number of red balls. The possible outcomes and the values $y$ of the random variable $Y$ are

![A table containing sample data from the urn-drawing example.](image omitted)

## 1.5 Ex: Binary Outcomes

Consider the simple condition in which components are arriving from the production line and they are stipulated to be defective or non-defective. Define the random variable $X$ by $$X=\begin{cases} 1, & \text{if the component is defective},\\ 0, & \text{if the component is not defective}. \end{cases}$$

Note that the assignment of whether defectives or non-defectives get "1" is arbitrary. It would be virtually the same if $$X=\begin{cases} 0, & \text{if the component is defective},\\ 1, & \text{if the component is not defective}. \end{cases}$$

## 1.6 Discrete Sample Spaces

A sample space is **discrete** if it contains a finite number of possibilities or an unending sequence with as many elements as there are whole numbers.

- Ex: Suppose a circuit has 3 fuses, each of which are either working (W) or not working (N). The sample space is discrete with $2^3=8$ outcomes.
- Ex: We are interested in packet transmission in a network. Each transmitted packet can be classified as success (S), corrupted (C), or lost (L). For two packets that are sent, there are $3^2=9$ outcomes, so $S$ is discrete.

## 1.7 Continuous Sample Space

A sample space is **continuous** if it contains an infinite number of possibilities equal to the number of points on a line segment.

- Ex: The voltage amplitude of a received analog signal can take any value in a range between $\[-5V,+5V\]$, so $S=\[-5,5\]$ is continuous.
- Ex: The lifetime of a resistor (in hours) can be modeled as any non-negative real number. Then, $S=\[0,\infty)$. This is an unbounded continuous sample space, often modeled with an exponential or Weibull distribution.

## 1.8 Random Variables

- If a random variable has a countable set of possible outcomes, it is a **discrete random variable**. If it can take on values in a continuous scale, it is a **continuous random variable**.
- In most applications, continuous random variables represent measured data, whereas discrete random variables represent count data (or indicators).
- *Note for future you:* An easy way to determine appropriate probability distributions for your problem is to look at the support of the data.

# 2 Discrete Probability Distributions

------------------------------------------------------------------------

## 2.1 Probability Mass Functions

It is often convenient to represent all the probabilities of a random variable $X$ by a formula that is a function of the numerical values that $X$ can take on. The set of ordered pairs $(x,f(x))$ is a probability function, **probability mass function**, or probability distribution of the discrete random variable $X$ if, for each possible outcome $x$,

1.  $f(x)\ge 0$,
2.  $\sum_x f(x)=1$,

where $f(x)=P(X=x)$.

## 2.2 Ex: Bit Errors in Transmission

A transmitter sends $n=8$ bits across a noisy channel. Each bit has an independent probability of being flipped, resulting in an error: $p=0.01$. Let $X$ denote the number of bit errors in 8 transmissions. The probability mass function (pmf) of $X$ is $$f(x)=P(X=x)=\binom{8}{x}(0.01)^x(0.99)^{8-x}$$ for $x=0,1,\dots,8$. This pmf is known as the **binomial distribution**, providing the exact probability of observing exactly $x$ bit errors.

## 2.3 Ex: Packet Arrivals

Packets arrive at a router with rate $\lambda=3$ packets per millisecond. Let $Y$ denote the number of packet arrivals in one millisecond. The pmf of $Y$ is $$f(y)=\frac{e^{-\lambda}\lambda^y}{y!}$$ for $y=0,1,2,\dots$. This pmf is known as the **Poisson distribution** and is often used when dealing with *rates* or *per-area* problems.

## 2.4 Cumulative Probabilities

In many problems, we may be interested in computing the probability that the observed value of $X$ will be less than or equal to some real number (i.e., the cumulative probability). In such cases, we would use the **cumulative distribution function** $F(x)$.

For a discrete random variable $X$ with pmf $f(x)$, the cumulative distribution function (cdf) is $$F(x)=P(X\le x)=\sum_{t \le x} f(t)$$ for $-\infty < x < \infty$.

## 2.5 Ex: Bit Errors and Packets

- *Bit Errors:* The CDF for $X$, where $x=0,1,2,\dots,8$, is $$F_X(x)=P(X\le x)=\sum^x_{i=0}P(X=i)=\sum^x_{i=0}\binom{8}{i}(0.01)^i(0.99)^{8-i}$$

- *Packet Arrivals:* The CDF for $Y$ is $$F_Y(y)=P(Y\le y)=\sum^y_{i=0}P(Y=i)=\sum^y_{i=0}\frac{e^{-\lambda}\lambda^i}{i!}$$ for $y=0,1,2,\dots$.

## 2.6 PMF vs CDF

![An example of a discrete probability mass function.](image omitted)

## 2.7 PMF vs CDF

![The corresponding discrete cumulative distribution function.](image omitted)

## 2.8 Breakout Groups

*See Ch3-BO1*

# 3 Continuous Probability Distributions

------------------------------------------------------------------------

## 3.1 Probability Density Functions

The continuous analog to the probability mass function is the **probability density function**. The change in name emphasizes the concept that the probability of a continuous random variable taking any exact value is 0. There is no mass at any one particular value; rather, we concern ourselves with computing probabilities for various intervals of continuous random variables, such as $P(a<X<b)$ or $P(Y \ge c)$.

Note that when $X$ is continuous, $$P(X \le b)=P(X<b)+P(X=b)=P(X<b),$$ so we can include or exclude endpoints however we wish.

## 3.2 Probability Density Functions

The function $f(x)$ is a **probability density function** (pdf) for the continuous random variable $X$, defined over the set of real numbers, if

1.  $f(x) \ge 0$ for all $x\in\mathbb{R}$,
2.  $\int^\infty_{-\infty} f(x)\,dx=1$,
3.  $P(a<X<b)=\int^b_a f(x)\,dx$.

## 3.3 Probabilities of Continuous Intervals

![A visual depiction of the probability of a continuous random variable between two constants.](image omitted)

## 3.4 Ex: Noisy Communication Channel

Thermal/electronic noise in resistors or communication channels is often modeled as Gaussian (normal). Let $X$ denote the noise in a communication channel. The pdf of $X$ is $$f_X(x)=\frac{1}{\sqrt{2\pi\sigma^2}}\exp\left(-\frac{1}{2\sigma^2}(x-\mu)^2\right)$$ for $-\infty < x < \infty$. In ECE, this is known as the **additive white Gaussian noise (AWGN) model**, which is used frequently in digital communications analysis.

## 3.5 Ex: Lifetime of a Capacitor

The time-to-failure of a capacitor, transistor, or resistor under constant stress is often modeled with the **exponential distribution**. Let $T$ denote the time-to-failure of a capacitor. The pdf of $T$ is $$f_T(t)=\lambda e^{-\lambda t}$$ for $t\ge 0$. In ECE, the exponential distribution is often used in reliability analysis and queueing systems.

## 3.6 Cumulative Probabilities

The cumulative distribution function $F(x)$ of a continuous random variable $X$ with density function $f(x)$ is $$F(x)=P(X\le x)=\int_{-\infty}^x f(t)\,dt$$ for $-\infty<x<\infty$.

As a consequence of this definition, note that $$P(a<X<b)=F(b)-F(a) \quad \text{and} \quad f(x)=\frac{dF(x)}{dx}.$$

## 3.7 A CDF Visual

![A continuous cumulative distribution function.](image omitted)

## 3.8 Ex: Noisy Communication & Time-to-Failure

- *Noisy communication channel:* The CDF of $X$ is $$F_X(x)=P(X\le x)=\frac{1}{2}\left\[1+\text{erf}\left(\frac{x-\mu}{\sigma\sqrt{2}}\right)\right\]$$ for $-\infty<x<\infty$, where erf$(\cdot)$ is the error function.

- *Lifetime of a capacitor:* The CDF of $T$ for $t\ge 0$ is $$F_T(t)=P(T\le t)=1-e^{-\lambda t}.$$

## 3.9 Breakout Groups

*See Ch3-BO2*

# 4 Joint Probability Distributions

------------------------------------------------------------------------

## 4.1 Simultaneous Outcomes

In many real-world problems, we are interested in studying simultaneous outcomes of several random variables.

- Ex: In digital communications, the received signal is often modeled as two orthogonal components: $(I,Q)$, where $I$ is the in-phase component and $Q$ is the quadrature component.
- Ex: Suppose we measure the random voltage $V$ across a resistor and the current $I$ through it under noisy conditions.
- Ex: For a router, we may track the inter-arrival time between packets and the service time required by the router.

## 4.2 Joint Probability Distribution

The function $f(x,y)$ is a **joint probability distribution** or **joint probability mass function** of the discrete random variables $X$ and $Y$ if

1.  $f(x,y)\ge 0$ for all $(x,y)$,
2.  $\sum_x\sum_y f(x,y)=1$,
3.  $P(X=x,Y=y)=f(x,y)$.

Note that for any region $A$ in the $xy$ plane, $$P\[(X,Y)\in A\]=\sum\sum_A f(x,y).$$

## 4.3 Ex: Ballpoint Pens

Two ballpoint pens are selected at random from a box that contains 3 blue pens, 2 red pens, and 3 green pens. If $X$ is the number of blue pens selected and $Y$ is the number of red pens selected, find the joint probability function $f(x,y)$.

- Let's start with $f(0,1)$. There are $\binom{8}{2}=28$ ways to select 2 pens. The number of ways to select 0 blue pens and 1 red pen is $\binom{2}{1}\binom{3}{1}=6$ ways. So, $f(0,1)=6/28.$ We can repeat this for each possible set of inputs...

## 4.4 Ex: Ballpoint Pens (table)

![A table containing the marginal and joint probabilities of the ballpoint pen example.](image omitted)

## 4.5 Ex: Ballpoint Pens (region probability)

Two ballpoint pens are selected at random from a box that contains 3 blue pens, 2 red pens, and 3 green pens. If $X$ is the number of blue pens selected and $Y$ is the number of red pens selected, find $P\[(X,Y)\in A\]$, where $A$ is the region ${(x,y)\mid x+y \le 1}$.

- Just add the appropriate joint outcomes: $$\begin{align} P\[(X,Y)\in A\]&=P(X+Y \le 1)\\ &=f(0,0)+f(0,1)+f(1,0)=9/14. \end{align}$$

------------------------------------------------------------------------

## 4.6 Joint Density Function

*Formally:* The function $f(x,y)$ is a **joint density function** of the continuous random variables $X$ and $Y$ if

1.  $f(x,y)\ge 0$ for all $(x,y)$,
2.  $\int^\infty_{-\infty}\int^\infty_{-\infty} f(x,y)\,dx\,dy=1$,
3.  $P\[(X,Y)\in A\]=\int\int_A f(x,y)\,dx\,dy$ for any region $A$ in the $xy$ plane.

------------------------------------------------------------------------

## 4.7 Joint Density Function

*Geometrically:* When $X$ and $Y$ are continuous random variables, their joint density function $f(x,y)$ is a surface lying above the $xy$ plane, and $P\[(X,Y)\in A\]$, where $A$ is any region in the $xy$ plane, is equal to the volume of the right cylinder bounded by the base $A$ and the surface.

![Visual learner.](image omitted)

## 4.8 Geometric Intuition

![A depiction of joint probability using a right cylinder over an x-y plane.](image omitted)

## 4.9 Geometric Intuition

![A depiction of joint probability using a different base A that is less regular over an x-y plane.](image omitted)

## 4.10 Ex: Voltage Across Two Loads

Suppose two resistive loads are connected in parallel across a noisy power supply. Let $X$ and $Y$ denote the normalized voltages (in per-unit, so between 0 and 1) at two loads connected to the same source. The joint PDF might be $$f_{X,Y}(x,y)=c(x+y)$$ for $0\le x,y \le 1$, where $c$ is the **normalizing constant**.

Note that this example could model two bus voltages in a noisy power system (normalized 0--1), where higher voltages tend to co-occur because of a shared source of fluctuation.

## 4.11 Marginal Distributions

Given joint distributions, we may be interested in knowing the **marginal distribution** of each variable, which allow you to characterize individual random variables. The **marginal distribution** of $X$ alone and of $Y$ alone are $$g(x)=\sum_y f(x,y) \quad \text{and} \quad h(y)=\sum_x f(x,y)$$ for the discrete case and, for the continuous case, $$g(x)=\int^\infty_{-\infty} f(x,y)\,dy \quad \text{and} \quad h(y)=\int^\infty_{-\infty} f(x,y)\,dx.$$

## 4.12 Ex: Ballpoint Pens (Again)

What are the marginal distributions of $X$ and $Y$?

![A table containing the marginal and joint probabilities of the ballpoint pen example.](image omitted)

- The marginals can be obtained by computing column and row totals given a table like this one. For $X$, $g(0)=f(0,0)+f(0,1)+f(0,2)=5/14$, $g(1)=f(1,0)+f(1,1)+f(1,2)=15/28$, and $g(2)=f(2,0)+f(2,1)+f(2,2)=3/28$.

## 4.13 Ex: Joint Voltage (Again)

The joint distribution is $$f_{X,Y}(x,y)=x+y,\quad 0 \le x, y \le 1,$$ so the marginal distributions for normalized voltages are $$f_X(x)=\int^1_0 f_{X,Y}(x,y)\,dy=x+\frac12, \; 0 \le x \le 1,$$ $$f_Y(y)=\int^1_0 f_{X,Y}(x,y)\,dx=y+\frac12, \; 0 \le y \le 1.$$

## 4.14 Revisiting Conditional Probability

Recall the definition of conditional probability: $$P(B\mid A)=\frac{P(A\cap B)}{P(A)}$$ provided $P(A)>0$. Let $A$ and $B$ be events defined by $X=x$ and $Y=y$ for *discrete* random variables $X$ and $Y$. Then, $$P(Y=y\mid X=x)=\frac{P(X=x,Y=y)}{P(X=x)}=\frac{f_{X,Y}(x,y)}{g_X(x)}$$ provided $g_X(x)>0$.

## 4.15 Conditional Distribution

The **conditional distribution** of $Y$ given that $X=x$ is $$f(y\mid x)=\frac{f_{X,Y}(x,y)}{g_X(x)}$$ provided $g_X(x)>0$. We can switch the places of $X$ and $Y$.

If we want to find the probability that a random variable $X$ falls between $a$ and $b$ given $Y=y$, then $$P(a<X<b\mid Y=y)=\sum_{a<x<b} f(x\mid y) \quad \text{or} \quad \int^b_a f(x\mid y)\,dx.$$

## 4.16 Ex: Ballpoint Pens (Again$^2$)

Find the conditional distribution of $X$ given that $Y=1$.

![A table containing the marginal and joint probabilities of the ballpoint pen example.](image omitted)

- First, note that $f_Y(1)=\sum^2_{x=0}f(x,1)=3/7$. Then, $$f(x\mid y=1)=\frac{f(x,1)}{f_Y(1)}=\frac{7}{3}f(x,1), \quad x=0,1,2.$$

## 4.17 Ex: Ballpoint Pens (Again$^2$)

Now, find $P(X=0\mid Y=1).$

![A table containing the marginal and joint probabilities of the ballpoint pen example.](image omitted)

- To find $P(X=0\mid Y=1)$, we use the conditional distribution: $$f(x=0\mid y=1)=\frac{7}{3}f(0,1)=\frac73\cdot\frac{3}{14}=\frac12.$$

## 4.18 Ex: Joint Voltage (Again$^2$)

The joint and marginal distributions are $$f_{X,Y}(x,y)=x+y,\quad 0 \le x, y \le 1,$$ $$f_X(x)=x+\frac12, \; 0 \le x \le 1, \quad f_Y(y)=y+\frac12, \; 0 \le y \le 1.$$ What is the distribution of $X$ given that $Y=\frac13$?

- The conditional probability distribution is $$f(x\mid y=1/3)=\frac{x+1/3}{5/6}=\frac65(x+1/3), \quad 0 \le x \le 1.$$

## 4.19 Statistical Independence

- Before, we used conditional probabilities to determine if random variables were independent. Now, we make use of the joint distribution to do such a thing.

- Let $X$ and $Y$ be two random variables (discrete or continuous) with joint probability distribution $f(x,y)$ and marginal distributions $g(x)$ and $h(y)$, respectively. Then, $X$ and $Y$ are **statistically independent** if and only if $$f(x,y)=g(x)h(y)$$ for all $(x,y)$ within their range.

## 4.20 Ex: Ballpoint Pens (Again$^3$)

Are $X$ and $Y$ independent?

![A table containing the marginal and joint probabilities of the ballpoint pen example.](image omitted)

- We can always check specific probabilities, because $f(x,y)=g(x)h(y)$ must be true for all $(x,y)$. Let's try the point $(0,1)$. We see that $f(0,1)=\frac3{14}$, $g(0)=\frac{5}{14}$, and $h(1)=\frac37$. Because $f(0,1)\ne g(0)h(1)$, then $X$ and $Y$ are not statistically independent.

## 4.21 Ex: Joint Voltage (Again$^3$)

Recall that the joint distribution is $$f_{X,Y}(x,y)=x+y,\quad 0 \le x, y \le 1,$$ and the marginal distributions for normalized voltages are $f_X(x)=x+\frac12, \; 0 \le x \le 1$ and $f_Y(y)=y+\frac12, \; 0 \le y \le 1.$ Are $X$ and $Y$ independent?

- No. Note that $g(x)h(y)=(x+\frac12)(y+\frac12)\ne f(x,y)$. Intuitively, we wouldn't expect them to be independent because the two loads are connected to the same source!

## 4.22 Extending to More Variables

- Let $f_{X_1,X_2,\dots,X_n}(x_1,x_2,\dots,x_n)$ be a joint distribution of the $n$ discrete random variables ${X_i}_{i=1}^n$. The marginal distribution of $X_j$ is $$g_{X_j}(x_j)=\sum_{i \ne j}\sum_{x_i} f_{X_1,X_2,\dots,X_n}(x_1,x_2,\dots,x_n).$$

- The random variables are *mutually* statistically independent if $$f_{X_1,X_2,\dots,X_n}(x_1,x_2,\dots,x_n)=f_{X_1}(x_1)\cdot\dots\cdot f_{X_n}(x_n).$$

## 4.23 Breakout Groups

*See Ch3-BO3*
