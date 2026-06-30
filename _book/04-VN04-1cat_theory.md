## Video Notes: Inference for One Categorical Variable using Theory-based Methods

Read Chapter 11 and Sections 14.3 and 14.4 in the course textbook.  Use the following videos to complete the video notes for Module 4.

### Course Videos

* Theory_Based_Inference

* Theoretical_Tests_One_Categorical_Variable

* Theoretical_Intervals_One_Categorical_Variable

\setstretch{1}

### Theory-based methods {-}

#### Video: Theory-Based Inference (chapter 11) {-}

\setstretch{1.4}

The Central Limit Theorem tells us that the ______________ distribution of a sample proportion (and sample mean and sample differences) will be approximately ______________ if the sample size is ______________ ________________.

The ______________ of the distribution of sample proportions (sampling distribution) from thousands of samples will be bell-shaped/symmetric (Normal), if the sample size is large enough and the observations are ________________.

* $\hat{p} \sim N (\pi, \sqrt{\frac{\pi \times (1-\pi)}{n}})$

Conditions of the CLT:

* Independence (*also must be met to use simulation methods*): the response for one observational unit will not influence another observational unit

\vspace{1mm}

* Large enough sample size:

\vspace{0.2in}

Normal distribution:

* Bell-shaped and ______________

* Standard normal distribution:  $N(0,1)$


\begin{center}\includegraphics[width=0.43\linewidth]{04-VN04-1cat_theory_files/figure-latex/simpleNormalc-1} \end{center}

Standardized statistic: Z - score

\vspace{1mm}

* $Z = \frac{\mbox{statistic} - \mbox{null value}}{\mbox{standard error of the statistic}}$

\vspace{0.5in}

* Measures the number of ________________ _______________ the statistic is above or below the null value

Examples from section 11.2: SAT scores follow a nearly normal distribution with a mean of 1500 points and a standard deviation of 300 points. Find and interpret the z-score for Nell, who scored 1800 points on their SAT. Round your answer to three decimal places.

\vspace{0.6in}

ACT scores also follow a nearly normal distribution with mean of 21 points and a standard deviation of 5 points. Find and interpret the z-score for Sian, who scored 24 points on their ACT. Round your answer to three decimal places.  Who performed better - Nell or Sian?

\vspace{0.6in}

In a Normal curve, the area under the curve is equal to 1, representing a probability.  Therefore the shaded area represents the **percentile** for Nell, or the probability of scoring less than or equal to 1800 points on the SAT.


``` r
library(openintro)
normTail(m = 1500, s = 300, L = 1800)
pnorm(mean = 1500, sd = 300, q = 1800)
#> [1] 0.8413447
```



\begin{center}\includegraphics[width=0.6\linewidth]{04-VN04-1cat_theory_files/figure-latex/unnamed-chunk-1-1} \end{center}

\vspace{1mm}

\newpage

We can also reverse that order.  Given a percentage, we can find the associated percentile, or quantile.  Here we display calculating the value that cuts off the lower 0.73 proportion of ACT scores using the qnorm() function.


``` r
qnorm(mean = 21, sd = 5, p = 0.726)
#> [1] 24.0038
normTail(m = 21, s = 5, L = 24)
```



\begin{center}\includegraphics[width=0.6\linewidth]{04-VN04-1cat_theory_files/figure-latex/unnamed-chunk-2-1} \end{center}

### 68-95-99.7 Rule {-}

* 68% of Normal distribution within 1 SD of the mean (mean – SD, mean + SD)

* 95% within (mean – 2SD, mean + 2SD)

* 99.7% within (mean – 3SD, mean + 3SD)


\begin{center}\includegraphics[width=0.65\linewidth]{images/Empirical_Rule_Mark_bw} \end{center}

\newpage

General steps of a hypothesis test

1.	Write a research question and hypotheses.

2.	Collect data and calculate a summary statistic.

3.	Model a sampling distribution which assumes the null hypothesis is true.

4.	Calculate a p-value.

5.	Draw conclusions based on a p-value.


#### Video: Theoretical Tests for One Categorical Variable (section 14.3.1 and 14.3.2) {-}

Review the payday loan borrowers example from section 14.3.2.

Identify the observational units.

\vspace{0.3in}

Identify the variable collected. 

\vspace{0.3in}

Is the variable categorical or quantitative? If categorical, define a "success"; if quantitative, state the units of measure.

\vspace{0.3in}

Define the parameter in words and write it using proper notation

\vspace{0.5in}

Write the null and alternative hypotheses in words and in proper notation:

  \rgi In words:

  \rgi \rgi $H_0:$

\vspace{0.45in}

  \rgi \rgi $H_A:$

\vspace{0.45in}

  \rgi In notation:

\vspace{1mm}

  \rgi \rgi $H_0:$

\vspace{0.2in}

  \rgi \rgi $H_A:$

\vspace{0.2in}

Calculate the value of the statistic and write it using proper notation: 

\vspace{0.2in}

Conditions for inference using theory-based methods:

- Independence:

    * The outcome of one observation does not influence the outcome of another.
    * Taking a random sample is one way to satisfy this condition.

- Large enough sample size:

\vspace{1in}

Are the conditions met to analyze the payday loan borrowers data using theory-based methods?

\vspace{1in}

To use theory-based methods to perform a hypothesis test: 

* 1st: Calculate the standardized statistic

* 2nd: Find the area under the standard normal distribution at least as extreme as the standardized statistic

Equation for the standard error of the sample proportion, assuming the null hypothesis is true:

\vspace{0.5in}

\setstretch{1.5}

* This value measures how far each possible sample statistic is from the null value, on average.

* This should give a similar value to the _________________ _______________ of a simulated null distribution!

\setstretch{1}

Equation for the standardized sample proportion (standardized statistic when analyzing one categorical variable):

\vspace{0.5in}

\setstretch{1.5}

* This value measures how many ________________ _________________ the sample ________________ is above/below the ______________ _______________.

\setstretch{1}

Calculate the standard error of the sample proportion of payday loan borrowers that would support the regulation *when assuming the null hypothesis is true*:

\vspace{0.3in}

Calculate the standardized sample proportion of payday loan borrowers that would support the regulation (the Z-score):

\vspace{0.5in}

Interpret the standardized statistic

\vspace{0.5in}


Label the standardized sample proportion (standardized statistic) on the standard Normal distribution below and shade the area representing the p-value.


\begin{center}\includegraphics[width=0.5\linewidth]{04-VN04-1cat_theory_files/figure-latex/standNormalc-1} \end{center}

To find the p-value, find the area under the standard Normal distribution at the standardized statistic and more extreme (in the direction of the alternative hypothesis.


``` r
pnorm(0.59, lower.tail = FALSE)
```

```
#> [1] 0.2775953
```
Interpretation of the p-value:

* Statement about probability or proportion of samples

* Statistic (summary measure and value) and Direction of the alternative 
    
* Null hypothesis (population reference, summary measure, equal to null value)

* Context of the problem (observational units, variable(s))

\vspace{0.6in}

Conclusion:

* Amount of evidence
    
* For the alternative hypothesis (population reference, summary measure, direction, null value)

* Context (observational units, variable(s))

\vspace{0.5in}

Decision at a significance level of 0.05 $(\alpha = 0.05)$:

\vspace{0.3in}

Generalization:

* Can the results of the study be generalized to the target population?

\vspace{0.4in}

#### Video: Theoretical Confidence Intervals for One Categorical Variable (section 14.3.3) {-}

* Interval of __________ values for the parameter of interest

* $CI = \text{statistic} \pm \text{margin of error}$

\vspace{0.5in}

#### Theory-based method for a single categorical variable {-}

* $CI = \hat{p} \pm (z^* \times SE(\hat{p}))$

* Multiplier ($z^*$) is the value at a certain ____________ under the standard normal distribution


\begin{center}\includegraphics[width=0.5\linewidth]{04-VN04-1cat_theory_files/figure-latex/standardNormalcur-1} \end{center}

For a 95\% confidence interval:

``` r
qnorm(0.975, lower.tail=TRUE)
```

```
#> [1] 1.959964
```

\setstretch{1.5}

* When creating a confidence interval, we no longer assume the _____________ hypothesis is true. Use ________ to calculate the sample to sample variability, rather than $\pi_0$.

\setstretch{1}

Equation for the standard error of the sample proportion, *NOT* assuming the null is true:

\vspace{0.4in}

Example: Refer to the payday loan borrowers example from section 14.3.3. Estimate the true proportion of payday loan borrowers that would support the regulation.

Calculate the standard error of the sample proportion of payday loan borrowers that would support the regulation *when NOT assuming the null hypothesis is true*:

\vspace{0.4in}

\newpage

From the below, what multiplier ($z^\star$) should be used to create a 95% confidence interval for the parameter?  Explain why 97.5% of the distribution is shaded (why are we using the 97.5th percentile to create a 95% confidence interval?)

\vspace{0.3in}

For a 95\% confidence interval:

``` r
openintro::normTail(m = 0, s = 1, L=1.96)
qnorm(0.975, lower.tail=TRUE)
#> [1] 1.959964
```



\begin{center}\includegraphics[width=0.5\linewidth]{04-VN04-1cat_theory_files/figure-latex/unnamed-chunk-6-1} \end{center}

Calculate the margin of error for the 95% confidence interval from the payday loan borrowers data:

\vspace{0.4in}

Calculate the 95% confidence interval from the payday loan borrowers data:

\vspace{0.4in}


Confidence interval interpretation:

* How confident you are (e.g., 90%, 95%, 98%, 99%)
    
* Parameter of interest
    
* Calculated interval
    
\vspace{0.8in}

\newpage

#### Interpreting confidence level

\setstretch{1.5}

What does it mean to be 95\% confident in a created confidence interval?

* Our goal is to only take one sample from the population to create a confidence interval.

* Based on the 68-95-99.7 rule, we know that approximately ______\% of sample ______________ will fall within __________ from the parameter.

* If we create 95\% confidence intervals, ________\% of samples will create a 95\% ______________ interval that will contain the _____________ of interest.

* 95\% of samples accurately ______________ the parameter of interest

    * When we create one confidence interval, we are 95\% ________________ that we have a "good" sample that created a confidence interval that contains the ___________ of interest.
    
\setstretch{1}

### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1.  What conditions must be met to use the Normal Distribution to approximate the sampling distribution of sampling proportions?

\vspace{0.6in}

2.  Should the conclusion include a population word like *true* or *long-run*?  Explain your answer.

\vspace{0.6in}

<!-- 3. What is the difference between statistical significance and practical importance? -->

<!-- \vspace{0.6in} -->


\newpage
