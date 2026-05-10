---
title: "STAT 4714 — Final Exam Study Guide (Solutions + Flash Cards)"
author: "Max Miller"
date: "2026-05-10"
geometry: margin=0.75in
fontsize: 11pt
header-includes:
  - \usepackage{amsmath, amssymb}
  - \usepackage{mathtools}
  - \setlength{\parskip}{0.4em}
---

# STAT 4714 — Final Exam Study

## Flash Cards (2 index cards, front + back, 11 lines per side)

> **Note:** PMF/PDF formulas and mean/variance for **Bin, Geom, NegBin, Hypergeom, Pois, Normal, Exp, Gamma, Weibull** are on the formula sheet — cards focus on what is NOT there. The sheet also allows shorthand answers like $b(X=2;n=12,p=0.8)$.

### Card 1 — Front: Probability rules, distribution ID, key relationships

1. **Bayes:** $P(A\mid B)=\dfrac{P(B\mid A)P(A)}{P(B)}$. **Total prob:** $P(B)=\sum_i P(B\mid A_i)P(A_i)$.
2. $P(A\cup B)=P(A)+P(B)-P(A\cap B)$. Indep: $P(A\cap B)=P(A)P(B)$. Cond: $P(A\mid B)=P(A\cap B)/P(B)$.
3. **ID dists:** fixed $n$ trials count successes $\to$ **Bin**; til 1st succ $\to$ **Geom**; til $k$th succ $\to$ **NegBin**; rate over interval/area $\to$ **Pois**; sample w/o replacement $\to$ **Hypergeom**.
4. **Series rel** $=\prod R_i$ (need ALL). **Parallel rel** $=1-\prod(1-R_i)$ (need ANY). Sys fails iff every path fails.
5. **Pois↔Exp↔Gamma:** Pois$(\lambda t)$ counts events; Exp$(\beta=1/\lambda)$ = wait til NEXT; Gamma$(\alpha,\beta=1/\lambda)$ = wait til $\alpha$th. Sum of $\alpha$ iid Exp$(\beta)$ = Gamma$(\alpha,\beta)$.
6. **Memoryless** (Exp & Geom ONLY): $P(X>s+t\mid X>s)=P(X>t)$. Uniform/Normal/Gamma$(\alpha\!>\!1)$ NOT memoryless.
7. **Norm approx Bin:** need $np\geq 5$ AND $n(1-p)\geq 5$. CC: $P(X\leq a)\approx\Phi(\tfrac{a+0.5-np}{\sqrt{np(1-p)}})$; $P(X\geq a)\approx 1-\Phi(\tfrac{a-0.5-np}{\sqrt{np(1-p)}})$.
8. **Pois approx Bin:** $n$ large, $p$ small $\to$ Pois$(\lambda=np)$.
9. $Z=(X-\mu)/\sigma$. 90%: $\pm 1.645$, 95%: $\pm 1.96$, 99%: $\pm 2.576$.
10. **Chebyshev:** $P(|X-\mu|<k\sigma)\geq 1-\tfrac{1}{k^2}$ (or $P(|X-\mu|\geq k\sigma)\leq\tfrac{1}{k^2}$). Distribution-free LOWER bound. **Empirical (normal):** 68/95/99.7 within $1/2/3\sigma$.
11. **Gamma–Poisson tail (integer $\alpha$):** $P(T>t)=\sum_{k=0}^{\alpha-1}\dfrac{e^{-t/\beta}(t/\beta)^k}{k!}$.

### Card 1 — Back: CDF/quantile, joint distributions, covariance

1. Continuous: $f\geq 0$, $\int f=1$. $F(x)=\int_{-\infty}^x f$. $P(a<X<b)=F(b)-F(a)$. $f=F'$.
2. **CDF** $\Phi(z)$: value $\to$ prob. **Quantile** $\Phi^{-1}(p)$: prob $\to$ value. Inverses. CI uses $\Phi^{-1}(\alpha/2),\Phi^{-1}(1-\alpha/2)$.
3. Joint cont: $P((X,Y)\in A)=\iint_A f$. **Marginal** $f_X(x)=\int f(x,y)\,dy$, $f_Y(y)=\int f(x,y)\,dx$.
4. **Conditional** $f(y\mid x)=f(x,y)/f_X(x)$. Then $P(a<Y<b\mid X=x)=\int_a^b f(y\mid x)\,dy$.
5. **Independence** $\Leftrightarrow f(x,y)=f_X(x)f_Y(y)$ for ALL $(x,y)$ AND support is rectangular (e.g., $0<x<y<1$ is NOT rect).
6. $E[g(X,Y)]=\iint g(x,y)f(x,y)$. $E[XY]=\iint xy\,f$.
7. **Cov:** $\sigma_{XY}=E[XY]-\mu_X\mu_Y$. Indep $\Rightarrow$ $\sigma_{XY}=0$; Cov $=0$ $\not\Rightarrow$ indep (could be nonlinear).
8. **Correlation:** $\rho_{XY}=\sigma_{XY}/(\sigma_X\sigma_Y)$, $\rho\in[-1,1]$. Scale-free.
9. $\mathrm{Var}(aX+bY+c)=a^2\sigma_X^2+b^2\sigma_Y^2+2ab\,\sigma_{XY}$. Indep: drop the cross term.
10. CDF $\to$ PDF: differentiate. PDF $\to$ prob: integrate over interval. PDF $\to$ CDF: integrate from $-\infty$.
11. Survival: $P(T>t)=1-F(t)$. For Exp$(\beta)$: $P(T>t)=e^{-t/\beta}$.

### Card 2 — Front: Sampling, CI, hypothesis testing, bootstrap

1. $\mathrm{SE}(\bar X)=\sigma/\sqrt n$ (use $s/\sqrt n$ if $\sigma$ unknown). **CLT:** $\bar X\stackrel{\text{approx}}{\sim} N(\mu,\sigma^2/n)$ for large $n$, ANY pop.
2. CI $=$ estimate $\pm$ crit $\cdot$ SE. Unknown $\sigma$, normal pop: $\bar X\pm t_{\alpha/2,\,n-1}\cdot s/\sqrt n$.
3. **SE** = SD of estimator (precision, scale). **CI** = plausible param range; can be asymmetric (esp. bootstrap).
4. **p-value** $=P(\text{stat as/more extreme}\mid H_0)$. Upper $H_a$: right tail. Lower: left. Two-sided: $2\cdot$tail or $P(|T|\geq|t_{\text{obs}}|)$.
5. **Type I** = reject true $H_0$ (rate $\alpha$). **Type II** = retain false $H_0$ (rate $\beta$). **Power** $=1-\beta$.
6. **$\uparrow n$:** $\beta\downarrow$, power $\uparrow$ (no Type-I cost). **$\uparrow\alpha$:** power $\uparrow$ but more false alarms. Larger effect $\to$ power $\uparrow$.
7. **Decision:** $p<\alpha$ reject $H_0$; else fail to reject. Confidence $=1-\alpha$ (90% CI $\leftrightarrow \alpha=0.10$).
8. **Bootstrap (CI for any $\hat\theta$):** (1) resample $n$ WITH replacement; (2) compute $\hat\theta^*$; (3) repeat $B\geq 1000$; (4) percentile CI $=[\hat\theta^*_{\alpha/2},\hat\theta^*_{1-\alpha/2}]$; SE $=\mathrm{sd}(\hat\theta^*)$.
9. **Parametric sim test:** (1) sim $B$ samples from $H_0$ model; (2) compute stat each; (3) $p\approx$ frac as/more extreme than obs. Sim under $H_0$ for null reference dist.
10. **Bootstrap test:** re-center sample so $H_0$ holds, then bootstrap stats and compute $p$.
11. Sim **pros:** no parametric assumption, weird stats OK. **Cons:** random/compute cost; need credible null (misspecified $\to$ bad $p$).

### Card 2 — Back: Simple Linear Regression (Ch 11)

1. Model: $Y_i=\beta_0+\beta_1 x_i+\varepsilon_i$, $\varepsilon_i$ iid $N(0,\sigma^2)$. Assumes **L**inearity, **I**ndependence, const **V**ariance, **N**ormality of errors.
2. **LSE** minimize $SSE=\sum(y_i-\hat y_i)^2$: $\boxed{\,b_1=\tfrac{S_{xy}}{S_{xx}},\;b_0=\bar y-b_1\bar x\,}$ where $S_{xy}=\sum(x_i-\bar x)(y_i-\bar y)$, $S_{xx}=\sum(x_i-\bar x)^2$.
3. $SST=\sum(y_i-\bar y)^2$ total. $SSE=\sum(y_i-\hat y_i)^2$ unexplained. $SSR=SST-SSE=\sum(\hat y_i-\bar y)^2$ explained.
4. $R^2=SSR/SST=1-SSE/SST$ = frac variance explained. HIGH $R^2\neq$ correct linear model — CHECK RESIDUALS.
5. **CI for mean** $\mu_{Y\mid x_0}$: narrow, avg behavior. **PI for new $y_0$**: WIDER (adds $\varepsilon$ noise on top of fit uncertainty). PI $\supset$ CI.
6. **Bootstrap CI mean@$x_0$:** (1) fit, get $\hat y_i$ + residuals $e_i$; (2) resample residuals, build $y^*=\hat y+e^*$, refit $b_0^*,b_1^*$, compute $b_0^*+b_1^*x_0$; (3) percentile of bootstrap dist.
7. **Bootstrap PI:** $y_0^*=b_0^*+b_1^*x_0+e^*$ (add random residual for individual noise); percentile interval.
8. **Randomization** $H_0:\beta_1=0$: SHUFFLE $y$ vs $x$ (break link); refit $b_1^*$ many times; $p=$ frac $|b_1^*|\geq|b_{1,\text{obs}}|$. Nonparametric.
9. **Residuals** $e_i=y_i-\hat y_i$. Plot $e_i$ vs $\hat y_i$ (or $x_i$): want random scatter $\sim 0$, no pattern.
10. **Diagnostics:** fan/funnel $\to$ heteroscedasticity (var grows w/ $\hat y$). Curve $\to$ nonlinear. **QQ-plot** off straight line / heavy tails $\to$ non-normal $\varepsilon$.
11. **NEVER extrapolate** beyond observed $x$ range. Significant $\hat\beta_1$ + bad residuals $\Rightarrow$ SE/PI unreliable. $R^2$ doesn't validate the model form.

\newpage

# Worked Solutions (Q1–Q24)

## Question 1
Let $U$ = upper path works, $L$ = lower path works.

**(a)** By the **series rule** $R_{\text{series}}=\prod_i R_i$:
$$P(U)=(0.85)(0.90)=0.765, \qquad P(L)=(0.80)(0.80)(0.95)=0.608.$$
By the **parallel rule** $R_{\text{parallel}}=1-\prod_i(1-R_i)$:
$$P(\text{works})=1-(1-0.765)(1-0.608)=1-(0.235)(0.392)=\boxed{0.90788}.$$

**(b)** Given the system works and the upper path failed, the lower path must work:
$$P(U^c\cap\text{works})=P(U^c\cap L)=P(U^c)P(L)=(0.235)(0.608)=0.14288,$$
$$P(U^c\mid\text{works})=\dfrac{0.14288}{0.90788}=\boxed{0.15738}.$$

**(c)** The system fails iff **both** paths fail, so $\{\text{system fails}\}=U^c\cap L^c\subseteq U^c$:
$$P(U^c\mid\text{fails})=\dfrac{P(U^c\cap L^c)}{P(U^c\cap L^c)}=\boxed{1}.$$

## Question 2
Let $F$ = faulty, $L$ = labeled "faulty." Given $P(F)=0.04$, $P(L\mid F)=0.90$, $P(L\mid F^c)=0.07$.

**(a)** Law of total probability:
$$P(L)=(0.90)(0.04)+(0.07)(0.96)=0.036+0.0672=\boxed{0.1032}.$$

**(b)** Bayes' theorem:
$$P(F\mid L)=\dfrac{P(L\mid F)P(F)}{P(L)}=\dfrac{0.036}{0.1032}\approx\boxed{0.3488}.$$

## Question 3

**(a)** Antiderivative: $\int 3(1-x)^2\,dx=-(1-x)^3+C$.
$$P(X>0.6)=\Big[-(1-x)^3\Big]_{0.6}^{1}=(0.4)^3=\boxed{0.064}.$$

**(b)**
$$P(0.6<X<0.8)=\Big[-(1-x)^3\Big]_{0.6}^{0.8}=-(0.2)^3+(0.4)^3=0.056.$$
$$P(X<0.8\mid X>0.6)=\dfrac{0.056}{0.064}=\boxed{\tfrac{7}{8}=0.875}.$$

## Question 4

**(a)** Marginals:
$$f_X(x)=\int_0^\infty 4e^{-2x-2y}\,dy=2e^{-2x},\quad f_Y(y)=2e^{-2y}.$$
Conditional at $y=1$: $f(x\mid y=1)=2e^{-2x}$.
$$P(1<X<2\mid Y=1)=\int_1^2 2e^{-2x}\,dx=e^{-2}-e^{-4}\approx\boxed{0.1170}.$$

**(b)** Since $f_X(x)f_Y(y)=4e^{-2x-2y}=f(x,y)$ for all $x,y>0$, $\boxed{X\text{ and }Y\text{ are independent.}}$

**(c)** Independence implies $E[XY]=E[X]E[Y]=\mu_X\mu_Y$, hence $\boxed{\sigma_{XY}=0}$.

## Question 5

**(a)** $f(t)=F'(t)=\dfrac{1}{40}e^{-t/40}$, $t>0$. This is $\mathrm{Exp}(\beta=40)$.

**(b)** $P(T>90)=1-F(90)=e^{-90/40}=e^{-2.25}\approx\boxed{0.1054}$.

**(c)** $F(90)\approx 0.8946$ means about $89.5\%$ of capacitors fail by time $t=90$. Equivalently, the probability that a capacitor's lifetime ends at or before $90$ time units is $\approx 0.8946$.

## Question 6
**Joint density:** $f(x,y)=6x$ on $0<x<y<1$.

**Marginals:**
$$f_X(x)=\int_x^1 6x\,dy=6x(1-x),\quad f_Y(y)=\int_0^y 6x\,dx=3y^2.$$

**Means:** $\mu_X=\int_0^1 x\cdot 6x(1-x)\,dx=\tfrac{1}{2}$, $\mu_Y=\int_0^1 y\cdot 3y^2\,dy=\tfrac{3}{4}$.

**Second moments:** $E[X^2]=\tfrac{3}{10}$, $E[Y^2]=\tfrac{3}{5}$.

**Variances:** $\sigma_X^2=\tfrac{3}{10}-\tfrac{1}{4}=\tfrac{1}{20}$, $\sigma_Y^2=\tfrac{3}{5}-\tfrac{9}{16}=\tfrac{3}{80}$.

**Cross moment:**
$$E[XY]=\int_0^1\int_x^1 xy\cdot 6x\,dy\,dx=\int_0^1 6x^2\cdot\tfrac{1-x^2}{2}\,dx=\tfrac{2}{5}.$$

**Covariance:** $\sigma_{XY}=\tfrac{2}{5}-\tfrac{1}{2}\cdot\tfrac{3}{4}=\tfrac{1}{40}$.

**Correlation:** $\sigma_X\sigma_Y=\sqrt{\tfrac{1}{20}\cdot\tfrac{3}{80}}=\tfrac{\sqrt{3}}{40}$, so
$$\boxed{\rho_{XY}=\dfrac{1/40}{\sqrt{3}/40}=\dfrac{1}{\sqrt{3}}=\dfrac{\sqrt{3}}{3}\approx 0.5774}.$$

## Question 7
$\mu=1000$, $\sigma=80$. Half-width $180$, so $k=180/80=2.25$.

Apply Chebyshev:
$$P(820<T<1180)\geq 1-\dfrac{1}{(2.25)^2}=1-\dfrac{1}{5.0625}\approx\boxed{0.8025}.$$

**Comment:** This is a distribution-free lower bound. If $T$ were known to be normal, the actual probability would be $\approx 0.976$. Chebyshev is conservative — useful when only $\mu$ and $\sigma$ are known.

## Question 8

**(a)** $X\sim\mathrm{Bin}(4,0.9)$.
$$P(X=0)=(0.1)^4=0.0001,\quad P(X=1)=4(0.9)(0.1)^3=0.0036.$$
$$P(X\geq 2)=1-0.0001-0.0036=\boxed{0.9963}.$$

**(b)** Since $0.9963\geq 0.99$, the 4-sensor system **already meets** the reliability target.

For comparison, majority-rule with $n=3$ (need $X\geq 2$):
$$P=\binom{3}{2}(0.9)^2(0.1)+(0.9)^3=0.243+0.729=0.972<0.99.$$
For $n=5$ (need $X\geq 3$):
$$P=\binom{5}{3}(0.9)^3(0.1)^2+\binom{5}{4}(0.9)^4(0.1)+(0.9)^5=0.99144\geq 0.99.$$

**(c)** Positive correlation makes sensor failures **cluster** — when one fails, others are more likely to fail simultaneously. This violates the independence assumption, increases the variance of $X$, and pushes more probability mass into the lower tail (more multi-sensor failures). System reliability **decreases** below $0.9963$.

## Question 9
**(a)** **Binomial$(n,p)$:** fixed number $n$ of independent Bernoulli trials with constant $p$, counting successes.

**(b)** **Geometric$(p)$**, with $p=P(\text{tail})$: independent Bernoulli trials repeated until the first success; $X$ = trial number of that first success.

**(c)** **Poisson$(\lambda)$**, with $\lambda$ = expected packets per 30 s: counts of memoryless, independent arrivals in a fixed interval.

**(d)** **Negative Binomial$(k=3,p)$**, with $p=P(\text{failure on a single test})$: trials repeated until a fixed number $k=3$ of "successes" (failures) occurs; $X$ = total trials needed.

## Question 10
$X\sim\mathrm{Bin}(35,0.08)$, $Y\sim\mathrm{NegBin}(k=4,p=0.08)$.

**(a)** $\binom{35}{4}=52{,}360$, $(0.08)^4=4.096\times 10^{-5}$, $(0.92)^{31}\approx 0.07720$.
$$P(X=4)=52{,}360\cdot(4.096\times 10^{-5})\cdot 0.07720\approx\boxed{0.1656}.$$

**(b)** $\binom{34}{3}=5{,}984$.
$$P(Y=35)=5{,}984\cdot(0.08)^4\cdot(0.92)^{31}\approx\boxed{0.01893}.$$
(Equivalently: $P(Y=35)=\tfrac{4}{35}P(X=4)$.)

**(c)** In (a), $X$ is **binomial**: $n=35$ trials is **fixed**, count failures (random). In (b), $Y$ is **negative binomial**: $k=4$ failures is **fixed**, count trials needed (random). Critically, (b) requires the 4th failure to land *exactly* on trial 35.

## Question 11

**(a)** $X\sim\mathrm{Bin}(300,0.03)$. $\mu=9$, $\sigma^2=8.73$, $\sigma\approx 2.955$.

Continuity correction: $P(X\leq 12)\approx P(X\leq 12.5)$.
$$P(X\leq 12)\approx\Phi\!\left(\dfrac{12.5-9}{2.955}\right)=\Phi(1.184)\approx\boxed{0.882}.$$

**(b)** Conditions: $np\geq 5$ and $n(1-p)\geq 5$. Verify: $np=9\geq 5$ ✓, $n(1-p)=291\geq 5$ ✓. Both conditions met. (Since $p$ is small, a Poisson approximation with $\lambda=9$ would also work.)

## Question 12

**(a)** A Poisson process at rate $\lambda$ produces $N(t)\sim\mathrm{Poisson}(\lambda t)$ events in interval of length $t$. Waiting time $T$ until next event satisfies $P(T>t)=P(N(t)=0)=e^{-\lambda t}$, so $T\sim\mathrm{Exp}(\beta=1/\lambda)$. Counts and inter-arrival times are two views of the same process.

**(b)** Wait time until the $\alpha$th event = sum of $\alpha$ iid $\mathrm{Exp}(1/\lambda)$ inter-arrivals = $\mathrm{Gamma}(\alpha,\beta=1/\lambda)$. Shape $\alpha$ = how many events we are waiting for; $\alpha=1$ recovers the exponential.

**(c)** Call center receiving calls at $\lambda=5$/min: number of calls in 10 min $\sim\mathrm{Poisson}(50)$; time to first call $\sim\mathrm{Exp}(\beta=1/5)$; time to second call $\sim\mathrm{Gamma}(\alpha=2,\beta=1/5)$.

## Question 13

**(a)** Since $X\sim\mathrm{Uniform}[0,10]$, $P(X>a)=(10-a)/10$:
$$P(X>9\mid X>7)=\dfrac{P(X>9)}{P(X>7)}=\dfrac{1/10}{3/10}=\boxed{\tfrac{1}{3}}.$$

**(b)** Unconditionally $P(X>9)=0.1\neq 1/3$. Conditioning on $\{X>7\}$ restricts the sample space to $[7,10]$, so $X\mid X>7\sim\mathrm{Uniform}[7,10]$ — a smaller window where the chance of exceeding 9 is larger. The uniform is **not memoryless**: $P(X>s+t\mid X>s)\neq P(X>t)$. Only the exponential (among continuous distributions) has this property.

## Question 14
Rate $\lambda=8/20=0.4$ defects/m. For 5 m: $\lambda t=2$, so $X\sim\mathrm{Poisson}(2)$.
$$P(X<2)=P(X=0)+P(X=1)=e^{-2}+2e^{-2}=3e^{-2}\approx\boxed{0.4060}.$$

## Question 15
**Step 1:** $T\sim\mathrm{Exp}(\beta=3)$, so $p=P(T\leq 1)=1-e^{-1/3}\approx 0.2835$.

**Step 2:** $Y=$ # failures $\sim\mathrm{Bin}(120,0.2835)$. $\mu=np\approx 34.02$, $\sigma^2\approx 24.38$, $\sigma\approx 4.94$.

**Step 3:** Conditions met ($np,n(1-p)\geq 5$). Normal approximation with CC:
$$P(Y\leq 30)\approx\Phi\!\left(\dfrac{30.5-34.02}{4.94}\right)=\Phi(-0.713)\approx\boxed{0.2379}.$$

## Question 16

**(a)** $E(T)=\alpha\beta=5\cdot 10=\boxed{50\text{ weeks}}$.

**(b)** Since $\alpha=5$ is integer, use the gamma–Poisson relationship with $30/\beta=3$:
$$P(T>30)=\sum_{k=0}^{4}\dfrac{e^{-3}3^k}{k!}=e^{-3}(1+3+4.5+4.5+3.375)=e^{-3}(16.375)\approx\boxed{0.8153}.$$

## Question 17

**(a)** The **CDF** $\Phi(z)$ takes a value $z$ and outputs a probability $P(Z\leq z)$. The **quantile function** $\Phi^{-1}(p)$ takes a probability $p$ and outputs the value $z$ where $P(Z\leq z)=p$. They are inverses.

**(b)** **CDF use:** computing tail probability $P(Z\leq 1.5)=\Phi(1.5)\approx 0.9332$.
**Quantile use:** finding critical value, e.g., $\Phi^{-1}(0.95)\approx 1.645$.

**(c)** $\boxed{[\Phi^{-1}(0.025),\Phi^{-1}(0.975)]=[z_{0.025},z_{0.975}]=[-1.96,1.96]}$.

## Question 18

**(a)** $X\sim\mathrm{Poisson}(\mu=\lambda t=4\cdot 0.75=3)$ runners in 45 min.

**(b)** $T\sim\mathrm{Exp}$ with rate $\lambda=4$/hr, mean $\beta=1/\lambda=0.25$ hr (15 min).

**(c)** $P(T>0.5)=e^{-\lambda t}=e^{-4\cdot 0.5}=e^{-2}\approx\boxed{0.1353}$.

## Question 19

**(a) p-value depends on $H_a$:** The $p$-value is $P(\text{stat as/more extreme}\mid H_0)$, but "extreme" is defined by which direction $H_a$ points. For test stat $T$ with observed $t_{\text{obs}}$: **upper-tailed** ($\theta>\theta_0$) gives $p=P(T\geq t_{\text{obs}}\mid H_0)$ (right tail); **lower-tailed** gives left tail; **two-sided** counts both tails (e.g., $p=2P(T\geq|t_{\text{obs}}|\mid H_0)$). Same $t_{\text{obs}}$, different $p$.

**(b) SE vs CI:** **SE** is a scalar measure of estimator precision — useful for comparing estimators or propagating uncertainty. **CI** translates SE into a calibrated plausible range for $\theta$ at confidence $1-\alpha$, communicating asymmetry too (a percentile bootstrap CI need not be symmetric around $\hat\theta$). SE alone hides asymmetry and the confidence level; CI alone obscures the underlying scale of variability.

**(c) Bootstrap procedure:** Given data $\{x_1,\dots,x_n\}$ and $\hat\theta=T(x_1,\dots,x_n)$:
1. **Resample** with replacement to get $\{x_1^*,\dots,x_n^*\}$ of size $n$.
2. **Compute** $\hat\theta^{*(b)}=T(x_1^*,\dots,x_n^*)$.
3. **Repeat** for $b=1,\dots,B$ ($B\geq 1000$).
4. **Summarize:** histogram, $\widehat{\mathrm{SE}}=\mathrm{sd}(\hat\theta^*)$, percentile CI $[\hat\theta^*_{\alpha/2},\hat\theta^*_{1-\alpha/2}]$.

**(d) Type I, II, Power:** **Type I** = reject true $H_0$ (rate $\alpha$). **Type II** = retain false $H_0$ (rate $\beta$). **Power** $=1-\beta$ = chance of correctly rejecting. **Increasing $\alpha$** makes rejection easier — power $\uparrow$ but more false alarms. **Increasing $n$** tightens both null and alternative distributions, reducing overlap, so $\beta\downarrow$ and power $\uparrow$ *without* inflating $\alpha$ — the preferred lever.

## Question 20

**Approach (i): Parametric (CLT-based):**
1. Collect $n$ independent measurements $x_1,\dots,x_n$.
2. Compute $\bar X=\tfrac{1}{n}\sum x_i$ and $s^2=\tfrac{1}{n-1}\sum(x_i-\bar X)^2$.
3. Estimate $\widehat{\mathrm{SE}}(\bar X)=s/\sqrt n$.
4. By CLT, $\bar X\stackrel{\text{approx}}{\sim}\mathcal N(\mu,s^2/n)$ — use a $t_{n-1}$ reference for small $n$.
5. Form $(1-\alpha)$ CI: $\bar X\pm t_{\alpha/2,n-1}\cdot s/\sqrt n$.

**Assumptions:** iid measurements with finite variance; $n$ large for CLT (or population approximately normal so $t$-approx holds); no heavy tails / extreme outliers.

**Approach (ii): Bootstrap (resampling):**
1. Treat the observed sample as a stand-in for the population.
2. Draw $\{x_1^*,\dots,x_n^*\}$ of size $n$ from the sample **with replacement**.
3. Compute $\bar X^*=\tfrac{1}{n}\sum x_i^*$.
4. Repeat $B$ times (e.g., $B=5000$) to get $\bar X_1^*,\dots,\bar X_B^*$.
5. Histogram = bootstrap sampling distribution. $\widehat{\mathrm{SE}}=\mathrm{sd}(\bar X^*)$. Percentile CI from quantiles.

**Assumptions:** sample is representative (unbiased random sample); observations independent; $n$ large enough that the empirical distribution adequately approximates the population.

## Question 21

**(a) Parametric simulation procedure:**
1. Under $H_0$, simulate $B$ (e.g., $B=10{,}000$) samples of size $n=25$ from $N(4.8,0.6^2)$.
2. For each simulated sample $j$, compute $\bar X_j^*$.
3. Compute two-sided distance $D_j=|\bar X_j^*-4.8|$.
4. Observed distance: $D_{\text{obs}}=|5.05-4.8|=0.25$.
5. Approximate $p\approx\tfrac{1}{B}\sum\mathbf{1}\{D_j\geq 0.25\}$.

**(b) Why null model:** The $p$-value asks how unusual the observed data would be **if $H_0$ were true**. The only way to assess that is to know the sampling distribution of the test statistic under $H_0$ — simulating under $H_0$ generates that null reference distribution empirically.

**(c) Decision ($\alpha=0.10$):** $p\approx 0.062<0.10$, so $\boxed{\text{REJECT }H_0}$. Sufficient evidence at 90% confidence that $\mu\neq 4.8$ V.

**(d)** **Pro:** No closed-form parametric assumption about the test statistic — works for unusual or analytically intractable statistics. **Con:** Monte Carlo / computational cost and randomness in the $p$-value; you still need a credible null model — a misspecified null gives a misleading $p$.

## Question 22

**(a) SST/SSR/SSE/$R^2$:** $SST=\sum(y_i-\bar y)^2$ is total variability in $y$ about its mean. $SSE=\sum(y_i-\hat y_i)^2$ is unexplained (residual) variability. $SSR=SST-SSE=\sum(\hat y_i-\bar y)^2$ is variability explained by the model. $R^2=SSR/SST=1-SSE/SST$ is the proportion of total variability the model explains; $R^2=1$ is perfect fit, $R^2=0$ no better than $\bar y$.

**(b) Randomization test for $H_0:\beta_1=0$:**
*Logic:* Under $H_0$, $x$ and $y$ are unrelated, so any pairing is equally plausible. Shuffling $y$ vs $x$ destroys real linear link and builds the chance distribution of $b_1$.
*Steps:* (1) Fit SLR on original data, record $b_{1,\text{obs}}$. (2) For $b=1,\dots,B$: permute $y$ against fixed $x$, refit, store $b_1^{*(b)}$. (3) Two-sided $p=\tfrac{1}{B}\sum\mathbf{1}\{|b_1^{*(b)}|\geq|b_{1,\text{obs}}|\}$. (4) Reject if $p<\alpha$.

**(c) Least squares:** Minimize $SSE=\sum(y_i-b_0-b_1x_i)^2$. Setting partials to zero gives the normal equations, which solve to:
$$b_1=\dfrac{S_{xy}}{S_{xx}}=\dfrac{\sum(x_i-\bar x)(y_i-\bar y)}{\sum(x_i-\bar x)^2},\qquad b_0=\bar y-b_1\bar x.$$

**(d) CI vs PI:** **CI for mean response** $\mu_{Y\mid x_0}$ captures uncertainty in the estimated regression *line* at $x_0$. **PI for new $y_0$** captures that line uncertainty **plus** the individual error $\varepsilon\sim N(0,\sigma^2)$. PI is **wider** — variance is roughly $\widehat{\mathrm{Var}}(\hat\mu_{x_0})+\hat\sigma^2$ vs just $\widehat{\mathrm{Var}}(\hat\mu_{x_0})$.

**(e) CI for mean response @ $x_0$ (residual bootstrap):** (1) Fit SLR, get $\hat y_i$ and residuals $e_i=y_i-\hat y_i$. (2) For $b=1,\dots,B$: resample residuals with replacement to get $e_i^*$, form $y_i^*=\hat y_i+e_i^*$, refit to get $b_0^*,b_1^*$, compute $\hat\mu_{x_0}^*=b_0^*+b_1^*x_0$. (3) 95% percentile CI = $(Q_{0.025}(\hat\mu^*),Q_{0.975}(\hat\mu^*))$. Quantities estimated: $b_0,b_1$, residuals $\{e_i\}$, and the bootstrap distribution of $\hat\mu^*_{x_0}$.

**(f) Residual analysis:**
*(i) Nonconstant variance:* Plot $e_i$ vs $\hat y_i$. Under homoscedasticity, points form a horizontal band of constant width around 0. **Fan/funnel** shape (spread grows or shrinks with $\hat y$) indicates heteroscedasticity. Fix: variance-stabilizing transform (e.g., $\log y$, $\sqrt y$).
*(ii) Normality:* Make a **Q-Q plot** of residuals vs theoretical normal quantiles; points should fall on the $45^\circ$ line. Systematic curvature, S-shapes, or heavy tails (points peeling away at the ends) signal non-normality. A residual histogram should also look symmetric and bell-shaped.

## Question 23

**(a) Flaw in Claim 1:** A high $R^2$ (0.88) only quantifies variance explained — it does NOT validate that linearity is the correct structural form. $R^2$ is blind to systematic curvature, heteroscedasticity, influential outliers, and correlated errors; a nonlinear model could fit the same data substantially better while the linear $R^2$ is still high. Residual plots are essential to diagnose model adequacy and cannot be skipped.

**(b) Flaw in Claim 2:** This is **extrapolation**. The model was fit on $x\in(20^\circ\mathrm{C},80^\circ\mathrm{C})$, so predictions at $-150^\circ$C lie far outside the training range where the linear relationship has no empirical support. The true relationship may be nonlinear or break down entirely outside the window — and mechanically, $\hat Y=1500-12(-150)=3300$ hours, which is physically suspect for a temperature regime never observed.

## Question 24

**(a) Two violations:**
1. **Constant variance (homoscedasticity):** the funnel/fan shape in residuals vs fitted is direct evidence of heteroscedasticity — $\mathrm{Var}(\varepsilon_i)$ grows with $x_i$ rather than equaling $\sigma^2$.
2. **Independence of errors:** latency recorded every minute for 48 hours is time-series data, so consecutive residuals are temporally autocorrelated rather than independent.

**(b) Compromises to PI:** The PI formula uses a single pooled $\hat\sigma^2$ and assumes independent errors, so both violations distort its width.
- *Heteroscedasticity:* $\hat\sigma^2$ averages low- and high-traffic variability — the 95% PI for the upcoming high-traffic event is **too narrow** (true variance at high $x$ is much larger). Stated 95% coverage is not achieved.
- *Autocorrelation:* positively correlated residuals make $\hat\sigma^2$ appear smaller than the true error variance, deflating SE and shrinking the PI further — overstating confidence.

Net effect: the admin's interval looks precise but systematically understates uncertainty exactly where prediction matters most.
