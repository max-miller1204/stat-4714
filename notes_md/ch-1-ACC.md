# Intro to Statistics

Code

STAT 4714

Author

Michael Schwob

# 1 Why Statistics?

------------------------------------------------------------------------

## 1.1 Generally...

- Mathematical models are **deterministic**, producing the same output given identical input. Often, mathematical models are constructed to model how systems change based on established laws and equations.
- Statistical models are **stochastic** or **probabilistic**, often accounting for uncertainty. Many statistical models are constructed with established laws/equations in mind.

------------------------------------------------------------------------

## 1.2 Why Account for Uncertainty?

Accounting for uncertainty is crucial in many cases:

- measurements are obtained with observation error
- predictions with associated uncertainty are desired
- effective risk management
- imperfect knowledge of model system

------------------------------------------------------------------------

## 1.3 For ECE...

**Signal Processing & Communications**

Many ECE tasks (e.g., filtering, modulation, noise reduction, data compression) rely on statistical concepts that we'll cover in class: probability distributions, stochastic processes, etc. Knowing how to model noise and random signals is vital for designing quality systems.

**Quality Control & Reliability**

Electrical engineers may need to quantify manufacturing variation, predict failure rates, and optimize testing procedures when designing circuits and large-scale systems.

------------------------------------------------------------------------

## 1.4 For ECE...

**Machine Learning**

Many fields (e.g., computer vision, robotics, speech recognition, IoT) are becoming increasingly dependent on statistical learning. Statistical acumen can help you apply and interpret ML algorithms responsibly.

**Experimental Design**

Like many engineering fields, ECE may require experiments, which can be optimally designed given statistical principles.

------------------------------------------------------------------------

## 1.5 For ECE...

**Control Systems**

Many modern approaches involve estimating states of systems arising from noisy data (i.e., Kalman filtering). Such approaches are rooted in statistics and require an understanding of probability and uncertainty.

**Research**

In situations where data are collected imperfectly or there is an imperfect understanding of the study system, statistical inference is required to understand uncertainty and make appropriate conclusions and predictions.

# 2 A Brief Introduction of Statistics

------------------------------------------------------------------------

## 2.1 Some Definitions

- **Descriptive statistics** are a set of single-number statistics that summarize a set of data. Such statistics provide a sense of location and variability of the data (i.e., mean, median, standard deviation, variance).

- **Inferential statistics** is the use of statistical techniques to go beyond merely reporting data to drawing conclusions (i.e., inferences) about the model system. We use fundamental laws of probability and statistics to draw such conclusions.

------------------------------------------------------------------------

## 2.2 Data as Information

Information is collected in **samples**, which are collections of observations from the **population**. The population is the collection of all individuals of a particular type. Throughout this class, populations will often signify a scientific system.

![A dumb gif to get people to pay attention.](image omitted)

------------------------------------------------------------------------

## 2.3 Sample or Population?

- You record the peak-to-peak voltage of thirteen randomly chosen cycles from a continuous sine wave with the goal of estimating the average signal amplitude.
  - Sample
- You measure the power draw of a device once every hour for a full year. In doing so, you capture every operating hour without gaps.
  - Population

------------------------------------------------------------------------

## 2.4 Sample or Population?

- A utilities company collects voltage fluctuation data from all smart meters installed in a city during a blackout event.
  - Population
- An electronics company measures the voltage output from all power supply units it produced in a single week to verify that they meet the desired specifications.
  - Population if testing weekly; sample if testing once a year.

------------------------------------------------------------------------

## 2.5 Study Types

- Electrical engineers may need to study the effect of process conditions on responses of interest (i.e., semiconductor manufacturing, sensor calibration, power electronics). In such cases, an experimental design is appropriate. An **experimental design** is one in which inputs can be modified by the study designer to see how outputs respond.

------------------------------------------------------------------------

## 2.6 Study Types

- When the factors in a study cannot be modified, an **observational study** is the next best thing. This may be appropriate in environmental impact studies or field performance monitoring.
- A **historical study** is a type of observational study in which the data concern past events instead of ongoing events. Examples include a fault analysis in power systems or manufacturing process audits.

# 3 A Brief Introduction of Probability

------------------------------------------------------------------------

## 3.1 Statistics & Probability

> "Elements of probability allow us to quantify the strength or *confidence* in our conclusions ... The discipline of probability, then, provides the transition between descriptive statistics and inferential methods."

- **Inferential statistics** allows us to draw conclusions from the sample about the population, making clear use of probability.
- **Probability** allows us to draw conclusions about characteristics of hypothetical data taken from the population, based on known features of the population.

------------------------------------------------------------------------

## 3.2 Statistics & Probability

> "Nothing can be learned about a population from a sample until the analyst learns the rudiments of uncertainty in that sample."

![A flowchart connecting probability to sample to statistical inference to population.](image omitted)

------------------------------------------------------------------------

## 3.3 Probability at Play

A study conducted at Virginia Tech focused on the development of a relationship between the roots of trees and fungal activity. Two samples of 10 northern red oak seedlings were planted in a greenhouse, one sample containing seedlings treated with nitrogen and the other sample being untreated. All seedlings contained the fungus *Pisolithus tinctorus*. The aim of the experiment is to determine if nitrogen treatment influences the growth of roots and stems. The researchers used probability to quantify the uncertainty that nitrogen treatment generally leads to an increase in stem weight.

# 4 Sampling Procedures

------------------------------------------------------------------------

## 4.1 Sampling Methods

- **Simple random sampling** is an approach in which all members in a population have an equal probability of being sampled.
- A **biased sample** is one in which certain members of the population have higher probabilities of being sampled.

![A gif with a certain type of demographic.](image omitted)

------------------------------------------------------------------------

## 4.2 Sampling Methods

- **Strata** are groups of members in a population that have similar characteristics. **Stratified random sampling** involves random selection of samples within each stratum.

![War-mongering penguins.](image omitted)

------------------------------------------------------------------------

## 4.3 Simple or Stratified?

- An engineer is testing the output voltage of power supply units from a line of 5,000 units. They assign each unit a number from 1 to 5,000 and use a random number generator to pick 50 units.
  - Simple random sampling
- The engineer knows the units were built on three assembly lines. Past data shows small differences in output between the three lines. Now, they randomly sample 20 units from Line A, 13 from Line B, and 37 from Line C.
  - Stratified random sampling

# 5 Measures of Location

------------------------------------------------------------------------

## 5.1 Sample Mean & Median

- Let $x_1,\dots,x_n$ denote the $n$ observations in a sample. The **sample mean** $\bar{x}$ is $$\bar{x}=\sum^n_{i=1}\frac{x_i}{n}.$$
- Let $x_1,\dots,x_n$ denote the $n$ observations in a sample *arranged in increasing order*. The **sample median** $\tilde{x}$ is $$\tilde{x}=\begin{cases} x_{(n+1)/2}, & \text{if $n$ is odd}\\ \frac12(x_{n/2}+x_{n/2+1}), & \text{if $n$ is even} \end{cases}$$

------------------------------------------------------------------------

## 5.2 Which is More Appropriate?

![A data table comparing seedlings growth.](image omitted)

*Would you draw the same conclusions using sample mean and median? Which measure of location suggests a larger discrepancy between the stem weights in the two groups?*

# 6 Measures of Variability

------------------------------------------------------------------------

## 6.1 More Information

> "The success of a particular statistical method may depend on the magnitude of the variability among the observations in the sample. Measures of location in a sample do not provide a proper summary of the nature of a data set."

Before, we concluded that the inclusion of nitrogen generally increased the stem weight. However, more can be learned from that data set...

------------------------------------------------------------------------

## 6.2 More Information

We also see that nitrogen treatment increases the variability of stem weight!

![A data table comparing seedlings growth.](image omitted)

------------------------------------------------------------------------

## 6.3 Measures of Sample Variability

The **sample variance** $s^2$ is given by $$s^2=\frac{1}{n-1}\sum^n_{i=1}(x_i-\bar{x})^2,$$ and the **sample standard deviation** is $s=\sqrt{s^2}$. Here, the quantity $(n-1)$ is called the **degrees of freedom**, representing the number of independent pieces of information available for computing variability.

------------------------------------------------------------------------

## 6.4 Standard Deviation vs Variance

- Both quantities measure variability in the sample, but the sample standard deviation measures variability in linear units, whereas sample variance is measured in square units.
- Sample variance plays an important role in estimating *population variance*.
- Sample standard deviation plays an important role (along with sample mean) in estimating the *population mean*.
- Sample variance is used more in inferential theory, whereas standard deviation is used much more in application.

# 7 A Perspective on Statistical Modeling

------------------------------------------------------------------------

## 7.1 The Statistical Model

> "Often the end result of a statistical analysis is the estimation of parameters of a postulated model."

- The postulated model is often the foundation of assumptions that are made by the analyst. For example, assumptions may be made on the distribution of the data, support of parameters of interest, and much more.

- The type of model used to describe data often depends on the goals of the modeler. The structure of the model should generally take advantage of non-statistical domain knowledge.

------------------------------------------------------------------------

## 7.2 Understanding Assumptions

- The postulated model represents the fundamental assumptions upon which the resulting statistical inference is made. Knowing what assumptions basic modeling approaches make is vital to providing robust inference and making informed conclusions.

- This is the core of this class. Everyone can fit a linear regression, but not everyone can understand what assumptions are being made when fitting the model. To properly understand "basic" statistical models, we need to build a solid foundation for probability and statistics.
