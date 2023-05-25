# Inference for Two Quantitative Variables

## Week 13 Reading Guide: Inference for Slope and Correlation

### Chapter 21 (Inference for regression and model conditions) {-}

<!-- **Videos**   -->

<!-- * 21.2 -->
<!-- * 21.3 -->
<!-- * 21.4to21.5Tests -->
<!-- * 21.4to21.5Intervals -->

\setstretch{1.25}

#### Reminders from previous sections {-}

$\beta_0$: population $y$-intercept

$\beta_1$: population slope

$\rho$: population correlation 

$b_0$: sample $y$-intercept

$b_1$: sample slope

$r$: sample correlation

Scatterplot: displays two quantitative variables; one dot = two measurements ($x$, $y$) on one observational unit.

Four characteristics of a scatterplot:
\setstretch{1}

* *Form*: pattern of the dots plotted.  Is the trend generally linear (you can fit a straight line to the data) or non-linear?  
* *Strength*: how closely do the points follow a trend?  Very closely (strong)? No pattern (weak)?  
* *Direction*: as the $x$ values increase, do the $y$-values tend to increase (positive) or decrease (negative)?  
* Unusual observations or *outliers*: points that do not fit the overall pattern of the data. 

\setstretch{1.25}

Least squares regression line: $\hat{y} = b_0+b_1 \times x$, where $b_0$ is the sample $y$-intercept (the estimate for the `(Intercept)` row in the R regression output), and $b_1$ is the sample slope (the estimate for the `x-variable_name` row in the R).

Sample slope interpretation: a 1 unit increase in the *x* variable is associated with a $|b_1|$ unit *predicted* increase/decrease in the *y*-variable.

General steps of a hypothesis test:

1. Frame the research question in terms of hypotheses.

2. Collect and summarize data using a test statistic.
	
3. Assume the null hypothesis is true, and simulate or mathematically model a null distribution for the test statistic.

4. Compare the observed test statistic to the null distribution to calculate a p-value.

5. Make a conclusion based on the p-value and write the conclusion in context.

Parameter: a value summarizing a variable(s) for a population.

Statistic: a value summarizing a variable(s) for a sample.

Sampling distribution: plot of statistics from 1000s of samples of the same size taken from the same population.

Standard deviation of a statistic: the variability of statistics from 1000s of samples; how far, on average, each statistic is from the true value of the parameter.

Standard error of a statistic: estimated standard deviation of a statistic.

Hypothesis test: a process to determine how strong the evidence of an effect is. Also called a ‘significance test’.

Simulation-based method: Simulate lots of samples of size $n$ under assumption of the null hypothesis, then find the proportion of the simulations that are at least as extreme as the observed sample statistic.

Theory-based method: Develop a mathematical model for the sampling distribution of the statistic under the null hypothesis and use the model to calculate the probability of the observed sample statistic (or one more extreme) occurring.

Null hypothesis ($H_0$): the skeptical perspective; no difference; no change; no effect; random chance; what the researcher hopes to prove is **wrong**.

Alternative hypothesis ($H_A$): the new perspective; a difference/increase/decrease; an effect; not random chance; what the researcher hopes to prove is **correct**.

Null value: the value of the parameter when we assume the null hypothesis is true (labeled as $parameter_0$).

Null distribution:  the simulated or modeled distribution of statistics (sampling distribution) we would expect to occur if the null hypothesis is true.

P-value: probability of seeing the observed sample data, or something more extreme, assuming the null hypothesis is true.

$\implies$ Lower the p-value the stronger the evidence AGAINST the null hypothesis and FOR the alternative hypothesis.

Decision: a determination of whether to reject or fail to reject a null hypothesis based on a p-value and a pre-set level of significance.

* If p-value $\leq \alpha$, then reject $H_0$.

* If p-value $> \alpha$, then fail to reject $H_0$.

Significance level ($\alpha$): a threshold used to determine if a p-value provides enough evidence to reject the null hypothesis or not.

\rgi Common levels of $\alpha$ include 0.01, 0.05, and 0.10.

Statistically significant: results are considered statistically significant if the p-value is below the significance level.

Confidence interval: a process to determine how large an effect is; a range of plausible values for the parameter. Also called ‘estimation’.

Margin of error: the value that is added to and subtracted from the sample statistic to create a confidence interval; half the width of a confidence interval.

Bootstrapping: the process of drawing with replacement $n$ times from the original sample.

Bootstrapped resample: a random sample of size $n$ from the original sample, selected with replacement.

Bootstrapped statistic: the statistic recorded from the bootstrapped resample.

Confidence level: how confident we are that the confidence interval will capture the parameter.

Bootstrap $X$% confidence interval: ($(\frac{(1-X)}{2})^{th}$ percentile, $(X+(\frac{(1-X)}{2})^{th}$ percentile) of a bootstrap distribution

$t$-distribution: A bell-shaped symmetric distribution, centered at 0, wider than the standard normal distribution.

* The variability in a $t$-distribution depends on the sample size (used to calculate degrees of freedom --- df for short).
* The $t$-distribution gets closer to the standard normal distribution as df increases.

Degrees of freedom (df): describes the variability of the $t$-distribution.

T-score: the name for a standardized statistic which is compared to a $t$-distribution.


#### Notes {-}

To create a **simulated null distribution** of sample slopes or sample correlations, 

\rgi How many cards will you need and how will the cards be labeled?
\rgs

\rgi What do you do with the cards after labeling them?
\rgs

\rgi After shuffling, what value will be plotted on the simulated null distribution?
\rgs

To create a **bootstrap distribution** of sample slopes or sample correlations, 

\rgi How many cards will you need and how will the cards be labeled?
\rgs

\rgi What do you do with the cards after labeling them?
\rgs

\rgi After shuffling, what value will be plotted on the bootstrap distribution?
\rgs


Conditions to use the CLT for testing slope (or correlation):

\rgi Linearity: 
\rgs

\rgi \rgi Checked by: 
\rgs

\rgi Independent observations: 
\rgs

\rgi \rgi Checked by: 
\rgs

\rgi Nearly normal residuals: 
\rgs

\rgi \rgi Checked by: 
\rgs

\rgi Constant or equal variance: 
\rgs

\rgi \rgi Checked by: 
\rgs

In a theory-based test of slope or correlation, how are the degrees of freedom determined?
\rgs	

Explain why testing for slope is equivalent to testing for correlation.
\rgs

Where in the R output can $SE(b_1)$ be found?
\rgs

#### Formulas {-}

$T=$
\rgs

Confidence interval: 
\rgs


#### Example from sections 21.2 and 21.3: Crop yields {-}

1.	What are the observational units?
\rgs

2.	What is the parameter representing in the context of this problem?  What notation would be used to represent this parameter?
\rgs
\rgs

3.	What is the research question?
\rgs

4.	Write the null and alternative hypotheses in appropriate notation.
\rgs

5.	How could we use cards to simulate **one** sample which assumes *the null hypothesis is true*?  How many cards?  What is written on the cards?  What would we do with the cards?  What would you record once you have a simulated sample?
\rgs
\rgs
\rgs

6.	After 1000 shuffles are generated, where is the resulting simulated distribution centered?  Why does that make sense?
\rgs
\rgs

7.	What are the sample statistics presented in this example?  What notation would be used to represent each value?
\rgs

8.	Write the least squares regression line for these data in appropriate notation.
\rgs

9.	 How was the p-value for this test found? The proportion of simulated null samples at ____ or ____.
\rgs

10.	Interpret the p-value in the context of the problem.
\rgs
\rgs

11.	What conclusion can be drawn from these data?  
\rgs

12.	How could we use cards to simulate **one** bootstrap resample *which does not assume the null hypothesis is true*?  How many cards?  What is written on the cards?  What would we do with the cards?  What would you record once you have a simulated sample?
\rgs
\rgs
\rgs

13. Interpret the 95\% confidence interval provided.
\rgs
\rgs

#### Example from section 21.4: Midterm elections and unemployment {-}

1. What is the research question?
\rgs

2. What are the observational units?
\rgs

3. What variables will be analyzed?  Give the type and role of each.
\rgs
\rgs

4. Can the results of this study be generalized to a larger population?
\rgs

5. Are causal conclusions appropriate for these data?
\rgs

6. Write the null and the alternative hypotheses in words.
\rgs
\rgs

7. Write the null and the alternative hypotheses in notation.
\rgs

8. What are the sample statistics presented in this example?  What notation would be used to represent each value?
\rgs

9.	Write the least squares regression line for these data in appropriate notation.
\rgs

10. From the R output provided in table 21.2, what is the standard error of the slope estimate?
\rgs

11. Calculate the T-score (the standardized statistic for the slope).
\rgs
\rgs

12. What distribution should the T-score be compared to in order to calculate a p-value?
\rgs

13. What was the p-value of the test? 
\rgs

14. What conclusion should the researcher make?
\rgs
\rgs

15. Calculate a 95\% confidence interval for the parameter of interest using `qt(0.975, df = 27) = 2.052` as the $t^\star$ value.
\rgs
\rgs

16. Interpret your interval in the context of the problem.
\rgs
\rgs

\newpage
