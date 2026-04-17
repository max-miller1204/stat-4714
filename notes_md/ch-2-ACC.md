# Probability

Code

STAT 4714

Author

Michael Schwob

# 1 But First Some Basic Definitions...

------------------------------------------------------------------------

## 1.1 Definitions

- An **observation** is any recording of information, whether numerical or categorical, arising from an experiment. An **experiment** describes any process that generates a set of data.
- The set of all possible outcomes of an experiment is called the **sample space**, denoted $S$. Each element in $S$ is called an **element** or **sample point**.

------------------------------------------------------------------------

## 1.2 Examples of Sample Spaces

- **Rolling Dice**: Experiment = tossing a die (d6). If we are interested in the number on the top face, the sample space is $S={1,2,3,4,5,6}$. If we are interested in whether the number is even or odd, the sample space is $S={\text{even, odd}}$.
- **Bit Error Testing in a Communication Channel**: Experiment = transmit a fixed data sequence over noisy wireless links. The sample space for each transmitted bit is $S={\text{error, no error}}={0,1}$.

------------------------------------------------------------------------

## 1.3 Ex: Flipping a Coin

An experimenter flips a coin. If heads, they flip it a second time. If tails, they toss a die. What are the elements of the sample space?

![A tree diagram showing the sample space for an experiment, where one flips a coin; if heads, they flip again. If tails, they roll a die.](image omitted)

------------------------------------------------------------------------

## 1.4 More Complex Sample Spaces

- **Large Cities**: For an experiment concerning the set of cities in the world with over 1 million citizens, the sample space is $$S={x\mid x \text{ is a city with a population over 1 million}}.$$
- **Points in a Circle**: If the experiment considers points on the boundary or interior of a circle with radius 2 and center at the origin, the sample space is $$S={(x,y)\mid x^2+y^2 \le 4}.$$

------------------------------------------------------------------------

## 1.5 ECE Examples

- Experiment = record output voltage from a solar panel every 10 minutes during daylight hours.
  - $S={x \mid x \in \text{ possible voltage values that can be produced}}$
- Experiment = record failure times for a continuously powered LED.
  - $S={x \mid x \ge 0}$

![Nosferatu turning off a light.](image omitted)

------------------------------------------------------------------------

## 1.6 ECE Examples

- Experiment = applying all possible 3-bit binary input codes to a digital-to-analog converter with 0.5V step size and record output voltage.
  - All possible inputs are ${000,001,010,011,100,101,110,111}$, so $S={0.0V,0.5V,1.0V,1.5V,2.0V,2.5V,3.0V,3.5V}$

![Binary code.](image omitted)

------------------------------------------------------------------------

## 1.7 More definitions

- An **event** is a subset of a sample space. The event can include the entire sample space or contain no elements at all; in the latter case, the event is called the **null set**, denoted $\phi$.
- The **complement** of an event $A$ with respect to $S$ is the set of elements in $S$ that are not in $A$, denoted $A^C$.

------------------------------------------------------------------------

## 1.8 More definitions

- The **intersection** of events $A$ and $B$, denoted $A\cap B$, is the event containing all elements that are in both $A$ and $B$.
- Events $A$ and $B$ are **mutually exclusive**, or **disjoint**, if $A\cap B=\phi$ (i.e., they have no common elements).
- The **union** of events $A$ and $B$, denoted $A\cup B$, is the event that contains all elements that belong to $A$ or $B$ or both.

------------------------------------------------------------------------

## 1.9 Examples of Complements, Intersections, and Unions

Let $S={a,b,c,d,e}$, $A={a,b,e}$ and $B={b,c,d,e}$.

- What is $A^C$, $A\cup B$, $A\cap B$, and $A^C\cap B$?
  - $A^C={c,d}$, $A\cup B=S$, $A\cap B={b,e}$, $A^C\cap B={c,d}=A^C$
- Which of the following events are null: $A\cap B$, $A\cap A^C$, $A^C\cap B^C$?
  - $A\cap A^C$ and $A^C\cap B^C$

------------------------------------------------------------------------

## 1.10 Venn Diagram I

![A prototypical Venn diagram where there are two circles overlapping each other. The overlapped are is the intersection of A and B.](image omitted)

------------------------------------------------------------------------

## 1.11 Venn Diagram II

![A Venn diagram with 3 circles. Circle B is fully in circle A, so B is a subset of A. Circle C overlaps only A, so the intersection of B and B is null.](image omitted)

------------------------------------------------------------------------

## 1.12 Breakout Groups

*See Ch2-BO1*

# 2 Counting Sample Points

------------------------------------------------------------------------

## 2.1 Why Count?

> "In many cases, we shall be able to solve a probability problem by counting the number of points in the sample space without actually listing each element."

![Some compliments for you.](image omitted)

------------------------------------------------------------------------

## 2.2 Multiplication Rule

- **Multiplication Rule (Rule 2.1)**: "If an operation can be performed in $n_1$ ways, and if for each of these ways a second operation can be performed in $n_2$ ways, then the two operations can be performed together in $n_1n_2$ ways.''
  - If you have to make a sequence of $k$ choices, and the $i$th choice can be made in $n_i$ ways for $i=1,\dots,k$, then the total number of possible outcomes is $$n_1n_2\dots n_k.$$

------------------------------------------------------------------------

## 2.3 Multiplication Rule Examples

- Suppose you are designing a small printed circuit board (PCB). You can choose one of 4 possible resistor values, 3 possible capacitor values, and 2 possible op-amp models. How many different designs can you make?
  - $4\times3\times2=24$
- If a class of 100 electrical engineering students needs to elect a president and a treasurer for a professional org, how many different ways can these two be elected?
  - $100 \times 99=9900$

------------------------------------------------------------------------

## 2.4 Permutations

- A **permutation** is an arrangement of all or part of a set of objects. For any non-negative integer $n$, the number of permutations of $n$ elements is $n!$.
  - The number of permutations of the four letters $a$, $b$, $c$, and $d$ is $4!=24$. What if we only pick two letters, though?
    - $n_1n_2=4\times 3=12$ permutations

------------------------------------------------------------------------

## 2.5 ${}_nP_r$

If there are $n$ distinct objects taken $r$ at a time, there are $$n(n-1)(n-2)\cdots (n-r+1)$$ ways to arrange the $r$ objects. This is often compactly denoted $${}_nP_r=\frac{n!}{(n-r)!},$$ representing the number of permutations of $n$ distinct objects taken $r$ at a time.

------------------------------------------------------------------------

## 2.6 Ex: More Elections!

Now in our class of 100 students, how many different choices of president and treasurer can be made if

- student $A$ will serve only if they're president?
  - (i) student $A$ is elected president, so there are $99$ ways to elect the treasurer
  - (ii) student $A$ isn't elected at all, so there are ${}_{99}P_2=9702$; in total, $99+9702=9801$ ways

------------------------------------------------------------------------

## 2.7 Ex: More Elections!

Now in our class of 100 students, how many different choices of president and treasurer can be made if

- students $B$ and $C$ will only serve if they are elected together?
  - (i) if they both serve, there are 2 ways
  - (ii) if neither serve, there are ${}_{98}P_2=9506$; in total, $2+9506=9508$ ways

------------------------------------------------------------------------

## 2.8 Ex: More Elections!

Now in our class of 100 students, how many different choices of president and treasurer can be made if

- students $D$ and $E$ will not serve together?
  - there are only 2 ways in which they serve together, so ${}_{100}P_2 -2=9898$ ways

![Sometimes you have enemies.](image omitted)

------------------------------------------------------------------------

## 2.9 Distinct Permutations

The number of distinct permutations of $n$ things of which $n_1$ are of one kind, $n_2$ of a second kind, ..., $n_k$ of a $k$th kind is $$\frac{n!}{n_1!n_2!\cdots n_k!}.$$ Often, probabilists are concerned with the number of ways of partitioning a set of $n$ objects into $r$ subsets, called **cells**. A valid partition is one in which the intersection of every possible pair of subsets is $\phi$ and if the union of all subsets gives the original set.

------------------------------------------------------------------------

## 2.10 Ex: Vowels

How many ways can the set ${a,e,i,o,u}$ be partitioned into two cells of sizes 4 and 1, respectively?

- ${(a,e,i,o),(u)},{(a,i,o,u),(e)},{(e,i,o,u),(a)},$ ${(a,e,o,u),(i)},{(a,e,i,u),(o)}$; 5 ways
- Alternatively, $\binom{5}{4,1}=\frac{5!}{4!1!}=5$ ways

------------------------------------------------------------------------

## 2.11 Counting in Partitions

The number of ways of partitioning a set of $n$ objects into $r$ cells with $n_1$ elements in the first cell, $n_2$ elements in the second, and so forth, is $$\binom{n}{n_1,n_2,\dots,n_r}=\frac{n!}{n_1!n_2!\dots n_r!}, \text{ where } \sum^r_{i=1}n_i=n.$$

- Ex: In how many ways can 9 EE students be assigned to a group of 4, a group of 3, and a group of 2?
  - $\binom{9}{4,3,2}=\frac{9!}{4!3!2!}=1260$ ways

------------------------------------------------------------------------

## 2.12 Combinations

In many problems, there may be interest in the number of ways of selecting $r$ objects from $n$ without regard to order, called combinations. The number of **combinations** of $n$ distinct objects taken $r$ at a time is $$\binom{n}{r,n-r}=\binom{n}{r}=\frac{n!}{r!(n-r)!}.$$

Note that a combination is actually a partition with two cells: objects that are selected and objects that aren't.

------------------------------------------------------------------------

## 2.13 Ex: Signal Filter Combination

- A lab has 10 types of signal filters, and an engineer needs to select 3 filters to test together in a circuit. Assume order doesn't matter. How many combinations can they make?
  - $\binom{10}{3}=120$ combinations
- Now, suppose that 3 of the 10 filters are bandpass filters and the engineer must choose at least one bandpass filter.
  - There are $\binom{7}{3}=35$ ways to choose no bandpass filters, so there are $120-35=85$ ways to choose at least one bandpass filter.

------------------------------------------------------------------------

## 2.14 Breakout Groups

*See Ch2-BO2*

# 3 Probability of an Event

------------------------------------------------------------------------

## 3.1 Definition of Probability

The **probability** of an event $A$ is the sum of the weights of all sample points in $A$. Therefore, $$0 \le P(A) \le 1,\quad P(\phi)=0,\quad P(S)=1.$$ If $A_1,A_2,A_3,\dots$ is a sequence of mutually exclusive events, then $$P(A_1 \cup A_2 \cup A_3 \cup \cdots)=P(A_1)+P(A_2)+P(A_3)+\cdots.$$

------------------------------------------------------------------------

## 3.2 Ex: Balanced Coin

A balanced coin is tossed twice. What is the probability that at least 1 head occurs?

- $S={HH,HT,TH,TT}$ with equiprobable elements, so $P(A)=3/4$.

![Sometimes you have enemies.](image omitted)

------------------------------------------------------------------------

## 3.3 Ex: Loaded Die

Suppose a die is loaded such that an even number is twice as likely to occur as an odd number. If $E$ is the event that a number less than 4 occurs on a single toss, find $P(E)$.

- $S={1,2,3,4,5,6}$. Let $w$ be the probability for the odd numbers and $2w$ be the probability for the even numbers. Because the probabilities must sum to 1, we have $9w=1$ or $w=1/9$. Therefore, odd and even numbers have probability $1/9$ and $2/9$, respectively: $$P(E)=\frac19+\frac29+\frac19=\frac49.$$

------------------------------------------------------------------------

## 3.4 Assigning Weights

- If the outcomes of an experiment are not equiprobable (equally likely to occur), the weights of the outcomes must be assigned on the basis of *experimental evidence* or *prior knowledge*. Experimental evidence can be gathered by running the experiment, then computing the **relative frequencies** of the outcomes. When possible, this is often more optimal than using prior knowledge.
- The use of prior knowledge introduces **subjectivity** to probability, which is less ideal but sometimes the only option.

------------------------------------------------------------------------

## 3.5 Example of Subjectivity

Consider modeling bit error in a channel under additive white Gaussian noise, which can be computed from the Q-function and the known signal-to-noise ratio without collecting bit error data. The channel model and its parameters are known from physics. Thus, probabilities can be derived analytically.

- This is an example of where prior knowledge could have important scientific backing.

# 4 Additive Rules

------------------------------------------------------------------------

## 4.1 Additive Rule

> "Often it is easier to calculate the probability of some event from known probabilities of other events."

One of the more fundamental laws that can simplify the computation of probabilities is the **additive rule**: $$P(A\cup B)=P(A)+P(B)-P(A\cap B)$$

![A prototypical Venn diagram where there are two circles overlapping each other. The overlapped are is the intersection of A and B.](image omitted)

------------------------------------------------------------------------

## 4.2 Some Corollaries

- If $A$ and $B$ are disjoint, then $P(A\cup B)=P(A)+P(B).$ This extends to $n$ disjoint events ${A_k}_{k=1}^n$: $$P(A_1\cup A_2 \cup \cdots \cup A_n)=P(A_1)+P(A_2)+\cdots+P(A_n).$$
- If $A_1,A_2,\dots,A_n$ is a partition of $S$, then $$P(A_1\cup A_2 \cup \cdots \cup A_n)=P(S)=1.$$

------------------------------------------------------------------------

## 4.3 A Note on Complements

> "Often it is more difficult to calculate the probability that an event occurs than it is to calculate the probability that the event does not occur."

If $A$ and $A^C$ (denoted $A\'$ in the book) are complementary events, then $P(A)+P(A^C)=1$.

# 5 Conditional Probability, Independence, and the Product Rule

------------------------------------------------------------------------

## 5.1 Conditional Probability - Intuition

The probability of an event $B$ occurring when it is known that some event $A$ has occurred is called a **conditional probability**, denoted $P(B\mid A)$.

- **Ex**: Consider rolling a loaded die with evens appearing twice as often as odds. If $B={1,4}$, then $P(B)=\frac13$. Assume that it is known that the die rolled greater than a 3. What is the probability of $B$ given this new information?
  - Reduced sample space is $S\'={4,5,6}$, where 4, 5, and 6 appear 2/5, 1/5, and 2/5 of the time, respectively. So, $P(B\mid \text{new info})=2/5$.

------------------------------------------------------------------------

## 5.2 Conditional Probability - Formally

The conditional probability $P(B\mid A)$ is defined by $$P(B\mid A)=\frac{P(A\cap B)}{P(A)}, \quad P(A)>0.$$

- **Ex**: Consider rolling a loaded die with evens appearing twice as often as odds. If $B={1,4}$, then $P(B)=\frac13$. Assume that it is known that the die rolled greater than a 3. What is the probability of $B$ given this new information?
  - Let $A={4,5,6}$. Then, $P(B\mid A)=\frac{2/9}{5/9}=2/5$.

------------------------------------------------------------------------

## 5.3 Ex: A Town with Inequity

![A table containing employment data, statified by gender.](image omitted)

- What is the probability that a male is randomly sampled from the town given that the sampled person is employed?
  - $P(M\mid E)=\frac{P(M\cap E)}{P(E)}=\frac{460/900}{600/900}=23/30$
- What is the probability that the randomly selected person is employed given that the sampled person is female?
  - $P(E\mid F)=\frac{P(E\cap F)}{P(F)}=\frac{140/900}{400/900}=7/20$

------------------------------------------------------------------------

## 5.4 Conditional Probability & Independence

Conditional probability not only allows for an alteration of the probability of an event in the light of additional information, but it also enables us to understand the concept of independence. Two events $A$ and $B$ are **independent** if and only if $P(B\mid A)=P(B)$ or $P(A\mid B)=P(A),$ assuming the existences of the conditional probabilities. Otherwise, $A$ and $B$ are **dependent**.

------------------------------------------------------------------------

## 5.5 The Product Rule

If the events $A$ and $B$ can both occur, then $$P(A \cap B)=P(A)P(B\mid A),$$ provided $P(A)>0$. Note that this just rearranges the definition of conditional probability. Additionally, because $P(A\cap B)=P(B\cap A)$, it is also true that $$P(A \cap B)=P(B)P(A\mid B),$$ provided $P(B)>0$.

------------------------------------------------------------------------

## 5.6 Ex: Fuse Boxes

Suppose there is a fuse box containing 20 fuses, 5 of which are defective. If 2 fuses are randomly selected and removed from the box in succession, what is the probability that both fuses are defective?

- Let $A\equiv$ the first fuse is defective and $B\equiv$ the second fuse is defective, so we want $P(A\cap B).$ We know that $P(A)=1/4$. If the first removed fuse was defective, there are 4 of 19 fuses remaining that are defective, so $P(B\mid A)=4/19.$ Thus, $P(A\cap B)=P(A)P(B\mid A)=1/19$.

------------------------------------------------------------------------

## 5.7 Independent Product Rule

In the fuse box example, suppose that the first fuse is replaced (could still be defective) and the fuses are randomly rearranged before selecting the second fuse. Then, the probability of a defective fuse on the second sample is also $1/4$, so the events $A$ and $B$ are independent and $P(B\mid A)=P(B)$. This leads to a special case of the product rule:

- Two events $A$ and $B$ are independent if and only if $P(A\cap B)=P(A)P(B)$.

------------------------------------------------------------------------

## 5.8 Ex: An Electrical System

![An electrical system that works when A and B are both active and either C or D is active.](image omitted)

The above system consists of 4 components that are assumed to work independently. The system works if components $A$ and $B$ work and either of the components $C$ or $D$ works. The reliability of each component is depicted in the figure.

------------------------------------------------------------------------

## 5.9 Ex: An Electrical System

![An electrical system that works when A and B are both active and either C or D is active.](image omitted)

- What is the probability that the entire system works?
  - $P(A\cap B\cap (C \cup D)) =P(A)P(B)P(C\cup D)=0.7776$

------------------------------------------------------------------------

## 5.10 Ex: An Electrical System

![An electrical system that works when A and B are both active and either C or D is active.](image omitted)

- Find $P(C^C)$ given that the entire system works.
  - $\begin{align}P(A&\cap B \cap C^C \cap D)/P(\text{system works})\\ &=P(A\cap B \cap C^C \cap D)/0.7776\\ &=(0.9*0.9*0.2*0.8)/0.7776=0.1667\end{align}$

------------------------------------------------------------------------

## 5.11 An Intersection of Many Events

If the events $A_1,A_2,\dots,A_k$ can occur, then

$$\begin{align*} P(A_1\cap A_2 \cap \cdots \cap A_k) &= P(A_1)P(A_2\mid A_1)P(A_3\mid A_1\cap A_2)\\ & \quad\cdots P(A_k\mid A_1\cap A_2 \cap \cdots \cap A_{k-1}) \end{align*}$$

------------------------------------------------------------------------

## 5.12 Breakout Groups

*See Ch2-BO3*

# 6 Bayes' Rule

------------------------------------------------------------------------

## 6.1 Ex: Returning to the Small Town

![The same data regarding employment stratified by gender.](image omitted)

Now, suppose that 36 of the employed and 12 of the unemployed are members of the local Rotary Club. We want to find the probability of the event, denoted $A$, that a randomly selected individual from the town is a member of the Rotary club. Let $E$ denote the event that the selected person is employed. Then, we can write the event as $$A=A\cap S=A\cap(E\cup E^C)=(E\cap A)\cup(E^C\cap A).$$

------------------------------------------------------------------------

## 6.2 Law of Total Probability

If the events $B_1,B_2,\dots,B_k$ constitute a partition of the sample space $S$ such that $P(B_i)\ne0$ for $i=1,\dots,k$, then for any event $A$ of $S$, $$P(A)=\sum^k_{i=1}P(B_i\cap A)=\sum^k_{i=1}P(B_i)P(A\mid B_i).$$

------------------------------------------------------------------------

## 6.3 Ex: Assembly Plant

In an assembly plant, three machines ($B_1,B_2,B_3$) make 30%, 45%, and 25% of the product, respectively. From historical data, we know that 2%, 3%, and 2% of the products made are defective, respectively. What is the probability that a randomly selected product is defective?

- Let $A$ denote a defective random sample. $\begin{align}P(A)&=P(B_1)P(A\mid B_1)+P(B_2)P(A\mid B_2)+P(B_3)P(A\mid B_3)\\&=0.0245\end{align}$
- Now, what if we want to know the inverse - the probability that the defective sampled product was made by machine $B_i$?

------------------------------------------------------------------------

## 6.4 Bayes' Rule

If the events $B_1,B_2,\dots,B_k$ partition the sample space $S$ such that $P(B_i)\ne 0$ for $i=1,\dots,k$, then for any event $A$ in $S$ such that $P(A)\ne0$, we have $$P(B_r\mid A)=\frac{P(B_r\cap A)}{\sum^k_{i=1}P(B_i\cap A)}=\frac{P(B_r)P(A\mid B_r)}{\sum^k_{i=1}P(B_i)P(A\mid B_i)}$$ for $r=1,\dots,k$.

------------------------------------------------------------------------

## 6.5 Ex: Assembly Plant (Again)

In an assembly plant, three machines ($B_1,B_2,B_3$) make 30%, 45%, and 25% of the product, respectively. From historical data, we know that 2%, 3%, and 2% of the products made are defective, respectively. What is the probability that a randomly selected defective product was made by machine $B_3$?

- Use Bayes' rule! $$P(B_3\mid A)=\frac{P(B_3)P(A\mid B_3)}{\sum_{i=1}^3P(B_i)P(A\mid B_i)}=10/49$$

------------------------------------------------------------------------

## 6.6 Breakout Groups

*See Ch2-BO4*
