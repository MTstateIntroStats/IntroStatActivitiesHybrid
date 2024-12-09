## Video Notes: Inference for One Categorical Variable using Theory-based Methods

Read Chapters 11 and 13 and Sections 14.3 and 14.4 in the course textbook.  Use the following videos to complete the video notes for Module 4.

### Course Videos

* Chapter11

* 14.3TheoryTests

* 14.3TheoryIntervals

<!-- * Chapter12 -->

\setstretch{1}

### Theory-based methods {-}

#### Central limit theorem - Video Chapter11 {-}

The Central Limit Theorem tells us that the ______________ distribution of a sample proportion (and sample mean and sample differences) will be approximately ______________ if the sample size is ______________ ________________.

The ______________ of the distribution of sample proportions (sampling distribution) from thousands of samples will be bell-shaped/symmetric (Normal), if the sample size is large enough and the observations are ________________.

* $\hat{p} \sim N (\pi, \sqrt{\frac{\pi \times (1-\pi)}{n}})$

Conditions of the CLT:

* Independence (*also must be met to use simulation methods*): the response for one observational unit will not influence another observational unit

\vspace{1mm}

* Large enough sample size:

\vspace{0.3in}

Normal distribution:

* Bell-shaped and ______________

* Standard normal distribution:  $N(0,1)$


\begin{center}\includegraphics[width=0.45\linewidth]{06-VN06-1cat_theory_files/figure-latex/simpleNormalc-1} \end{center}

\newpage

Standardized statistic: Z - score

\vspace{1mm}

* $Z = \frac{\mbox{statistic} - \mbox{null value}}{\mbox{standard error of the statistic}}$

\vspace{0.5in}

* Measures the ___________ of standard _____________ the statistic is from the null value

Example(s):  Heights of Caucasian American adult males are roughly Normally distributed with a mean of 1.72 m and a standard deviation of 0.28 m. Find and interpret the z-score for a man who is 5’4” (1.626 m) tall. Round your answer to three decimal places.

\vspace{0.6in}

Heights of Caucasian American adult females are roughly Normally distributed with a mean of 1.59 meters and a standard deviation of 0.22 meters.  Which is more unusual: a 5’4” (1.626 m) tall male or a 5’9” (1.753 m) tall female?

\vspace{0.6in}

In a Normal curve, the area under the curve is equal to 1, representing a probability.  Therefore the shaded area represents the probability of a man being under 1.626 meters tall.


``` r
library(openintro)
normTail(m = 1.72, s = 0.28, L = 1.626)
pnorm(mean = 1.72, sd = 0.28, q = 1.626)
#> [1] 0.3685432
```



\begin{center}\includegraphics[width=0.6\linewidth]{06-VN06-1cat_theory_files/figure-latex/unnamed-chunk-1-1} \end{center}

\vspace{1mm}

We can also reverse that order.  Given a percentage, we can find the associated percentile, or quantile.  Here we display calculating the value that cuts off the lower 0.75 proportion of male adult Caucasian heights using the qnorm() function.


``` r
qnorm(mean = 1.72, sd = 0.28, p = 0.75)
#> [1] 1.908857
normTail(m = 1.72, s = 0.28, L = 1.909)
```



\begin{center}\includegraphics[width=0.6\linewidth]{06-VN06-1cat_theory_files/figure-latex/unnamed-chunk-2-1} \end{center}

### 68-95-99.7 Rule {-}

* 68% of Normal distribution within 1 SD of the mean (mean – SD, mean + SD)

* 95% within (mean – 2SD, mean + 2SD)

* 99.7% within (mean – 3SD, mean + 3SD)


\begin{center}\includegraphics[width=0.65\linewidth]{images/Empirical_Rule_Mark_bw} \end{center}

General steps of a hypothesis test

1.	Write a research question and hypotheses.

2.	Collect data and calculate a summary statistic.

3.	Model a sampling distribution which assumes the null hypothesis is true.

4.	Calculate a p-value.

5.	Draw conclusions based on a p-value.

\newpage

#### Example in Video 14.3TheoryTests {-}

Example:  The American Red Cross reports that 10% of US residents eligible to donate blood actually do donate.  A poll conducted on a representative of 200 Montana residents eligible to donate blood found that 33 had donated blood sometime in their life.  Do Montana residents donate at a different rate than US population?

Hypotheses:

In notation:  

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}

Parameter of interest:

\vspace{0.6in}

Conditions for inference using theory-based methods:

- Independence:

    * The outcome of one observation does not influence the outcome of another.
    * Taking a random sample is one way to satisfy this condition.

- Large enough sample size:

\vspace{1in}

Are the conditions met to analyze the blood donations data using theory-based methods?

\vspace{1in}

To use theory-based methods to perform a hypothesis test: 

* 1st: Calculate the standardized statistic

* 2nd: Find the area under the standard normal distribution at least as extreme as the standardized statistic

Equation for the standard error of the sample proportion assuming the null hypothesis is true:

\vspace{0.5in}

\setstretch{1.5}

* This value measures how far each possible sample statistic is from the null value, on average.

\setstretch{1}

Equation for the standardized sample proportion:

\vspace{0.5in}

\setstretch{1.5}

* This value measures how many standard deviations the sample proportion is above/below the null value.

\setstretch{1}

Calculate the standardized sample proportion of Montana residents that have donated blood sometime in their life.

* First calculate the standard error of the sample proportion assuming the null hypothesis is true

\vspace{0.5in}

* Then calculate the Z score.

\vspace{0.5in}


\begin{center}\includegraphics[width=0.5\linewidth]{06-VN06-1cat_theory_files/figure-latex/standNormalc-1} \end{center}

Interpret the standardized statistic

\vspace{0.5in}

To find the p-value, find the area under the standard normal distribution at the standardized statistic and more extreme.


``` r
pnorm(3.064, lower.tail = FALSE)*2
```

```
#> [1] 0.002183989
```
Interpretation of the p-value:

* Statement about probability or proportion of samples

* Statistic (summary measure and value)
    
* Direction of the alternative 
    
* Null hypothesis (in context) 

\vspace{0.6in}

Conclusion: 

* Amount of evidence
    
* Parameter of interest 
    
* Direction of the alternative hypothesis

\vspace{0.5in}

Decision at a significance level of 0.05 $(\alpha = 0.05)$:

\vspace{0.3in}

Generalization:

* Can the results of the study be generalized to the target population?

\vspace{0.4in}

### Confidence interval - 14.3TheoryIntervals {-}

* Interval of __________ values for the parameter of interest

* $CI = \text{statistic} \pm \text{margin of error}$

\vspace{0.5in}

#### Theory-based method for a single categorical variable {-}

* $CI = \hat{p} \pm (z^* \times SE(\hat{p}))$

* Multiplier ($z^*$) is the value at a certain ____________ under the standard normal distribution


\begin{center}\includegraphics[width=0.5\linewidth]{06-VN06-1cat_theory_files/figure-latex/standardNormalcur-1} \end{center}

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

Equation for the standard error of the sample proportion *NOT* assuming the null is true:

\vspace{0.5in}

\newpage

Example:  Estimate the true proportion of Montana residents that have donated blood at least once in their life.

Find a 95\% confidence interval:

\vspace{1in}

Confidence interval interpretation:

* How confident you are (e.g., 90%, 95%, 98%, 99%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}

#### Interpreting confidence level {-}

\setstretch{1.5}

What does it mean to be 95\% confident in a created confidence interval?

* Our goal is to only take one sample from the population to create a confidence interval.

* Based on the 68-95-99.7 rule, we know that approximately ______\% of sample ______________ will fall within __________ from the parameter.

* If we create 95\% confidence intervals, ________\% of samples will create a 95\% ______________ interval that will contain the _____________ of interest.

* 95\% of samples accurately ______________ the parameter of interest

    * When we create one confidence interval, we are 95\% ________________ that we have a "good" sample that created a confidence interval that contains the ___________ of interest.
    
\setstretch{1}

Interpret the confidence **level** for the blood donation study.

\vspace{0.5in}

\newpage

<!-- ### Errors, power, and practical importance - Video Chapter12 {-} -->

<!-- \setstretch{1.5} -->

<!-- Type 1 Error: ___________ the null hypothesis, when the null is ____________. -->

<!-- * Only can have a Type 1 Error when we make the ____________ to ____________ the null hypothesis. -->

<!-- * The probability of a Type 1 Error is $\alpha$, the ____________ level -->

<!-- Type 2 Error: ___________ to reject the null hypothesis, when the null is __________. -->

<!-- * Only can have a Type 2 Error when we make the ____________ to ____________ to reject the null hypothesis. -->

<!-- Power: probability of ___________ the null hypothesis, when the null is _____________. -->

<!-- Increasing power: -->

<!-- * Increase _______________ _______________ -->

<!-- * Increase _______________ _______________ -->

<!-- * Use a __________ alternative vs. a ______________ alternative -->

<!-- * Increase the ___________ size, the ______________ between the believed true value and the null value -->

<!-- Confirmation bias: looking for _________ that supports our ideas -->

<!-- * Always should write $H_A$ based on the _____________ _____________ prior to _________ collection! -->

<!-- \setstretch{1} -->

<!-- Recall from the blood donation study, that we concluded there was very strong evidence that the true proportion of Montana residents who are eligible to donate blood differs from 0.10. -->

<!-- \setstretch{1.5} -->

<!-- Since, we made the decision to ____________ the null hypothesis, we have the possibility of a _____________ error. -->

<!-- \setstretch{1} -->

<!-- * What is the probability of this error? -->

<!-- \vspace{0.2in} -->

<!-- * Write the error in context of the problem. -->

<!-- \vspace{0.5in} -->

<!-- For each of the following changes to the blood donation study, determine whether the power of the test would increase or decrease. -->

<!-- \setstretch{1.5} -->
<!-- * If we decreased the sample size from 200 to 100, power would __________. -->

<!-- * If we decreased the significance level from 0.05 to 0.01, power would __________. -->

<!-- * If we changed the research question to only asking if the probability a Montana resident eligible to donate blood actually does so is greater than 0.10, power would ____________.  -->

<!--     * This is an example of ____________ ______________. -->

<!-- \setstretch{1}     -->

<!-- #### Practical importance {-} -->

<!-- * A result can be ______________ significant but not _____________ important. -->

<!-- * Statistically significant: $\text{p-value} < \alpha$ -->

<!--     * Depends on the _____________, the __________ ___________, and the selected ______________ level. -->

<!-- * Practically important: the ___________ seen in the data is -->
<!-- meaningful and has _____________  -->
<!-- applications. -->

<!--     * Depends on the __________ and subjective opinion. -->

<!-- Example: An Austrian study of heights of 507,125 military recruits reported that men born in spring were statistically significantly taller than men born in the fall (p-value < 0.0001). A confidence interval for the true difference in mean height between men born in spring and men born in fall was (0.598, 0.602) cm.  -->

<!-- Is there statistical significance? -->

<!-- \vspace{0.3in} -->

<!-- Is there practical importance?  -->

<!-- \vspace{0.3in} -->

### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1.  What conditions must be met to use the Normal Distribution to approximate the sampling distribution of sampling proportions?

\vspace{0.6in}

2.  Should the conclusion include a population word like *true* or *long-run*?  Explain your answer.

\vspace{0.6in}

<!-- 3. What is the difference between statistical significance and practical importance? -->

<!-- \vspace{0.6in} -->


\newpage
