# Inference for a Quantitative Response with Paired Samples

## Week 12 Reading Guide: Inference for a Single Mean or Paired Mean Difference 

### Textbook Chapter 17: Inference for a single mean {-}

<!-- **Videos**   -->

<!-- * 17.1 -->
<!-- * 17.2 -->
<!-- * 17.3Tests -->
<!-- * 17.4Intervals -->

\setstretch{1.25}

#### Reminders from previous sections {-}

$n$ = sample size

$\overline{x}$ = sample mean

$s$ = sample standard deviation

$\mu$ = population mean

$\sigma$ = population standard deviation

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

Bootstrap $X$% confidence interval: ($(\frac{(1-X)}{2})^{th}$ percentile, $(X+(\frac{(1-X)}{2})^{th}$ percentile) of a bootstrap distribution.

Central Limit Theorem: For large sample sizes, the sampling distribution of a sample mean (or proportion) will be approximately normal (bell-shaped and symmetric).


#### Vocabulary {-}

Shifted bootstrap test:
\rgs

$t$-distribution: 
\rgs 

* The variability in the $t$-distribution depends on the sample size (used to calculate degrees of freedom --- df for short).

* The larger df, the closer the $t$ distribution is to the standard normal distribution.

Degrees of freedom (df): 
\rgs 

T-score: 
\rgs 

#### Notes {-}

To create a shifted bootstrap distribution test, 

\rgi How many cards will you need and how will the cards be labeled?
\rgs 

\rgi Why are the data values shifted prior to being written on the cards?
\rgs

\rgi What do you do with the cards after labeling them?
\rgs 

\rgi After resampling, what value will be plotted on the bootstrap distribution?
\rgs 

True or false: Bootstrapping can only be used if the sample size is small.
\rgs 

Why do we use a $t$-distribution rather than the normal distribution when analyzing quantitative data?
\rgs 

How do we calculate degrees of freedom for the $t$-distribution?
\rgs 

Conditions to use the CLT for means:

\rgi Independence: 
\rgs 

\rgi \rgi Checked by: 
\rgs 

\rgi Normality: 
\rgs 
	
\rgi \rgi Checked by:
\rgs 

#### Formulas{-}

$SE(\overline{x})=$
\rgs 

$T=$
\rgs 

Confidence interval for a single mean: 
\rgs 

#### Notation {-}

$\mu_0$ represents 
\rgs 


#### Example from section 17.1: Edinburgh rentals {-}

1. What are the observational units?
\rgs 

2. What are the sample statistics presented in this example?  What notation would be used to represent each value?
\rgs 

3. What is the parameter representing in the context of this problem?  What notation would be used to represent this parameter?
\rgs 
\rgs 

4. How could we use cards to simulate **one** bootstrap resample *which does not assume the null hypothesis is true*?  How many cards?  What is written on the cards?  What would we do with the cards?  What would you record once you have a simulated sample?
\rgs 
\rgs 
\rgs 

5. After 1000 resamples are generated, where is the resulting bootstrap distribution centered?  Why does that make sense?
\rgs 
\rgs 

6. Based on Figure 17.3, give the confidence interval for the true mean for each of the following confidence levels.

\rgi 90\% confidence interval = 
\rgs 

\rgi 95\% confidence interval = 
\rgs 

\rgi 99\% confidence interval = 
\rgs 

7. Interpret your 99\% confidence interval in the context of the problem.
\rgs 
\rgs 


#### Example from section 17.2: Sleep times of MSU students {-}

1.	What is the research question?
\rgs

2.	What are the observational units?
\rgs

3.	Can the results of this study be generalized to a larger population? Why or why not?
\rgs

4.	What are the sample statistics presented in this example?  What notation would be used to represent each value?
\rgs

5.	What is the parameter representing in the context of this problem?  What notation would be used to represent this parameter?
\rgs
\rgs

6.	Write the null and the alternative hypotheses in words.
\rgs
\rgs

7.	Write the null and  the alternative hypotheses in notation.
\rgs

8. How could we use cards to simulate **one** shifted bootstrap resample *which assumes the null hypothesis is true*?  How many cards?  What is written on the cards (be sure to include the amount and direction of the shift)?  What would we do with the cards?  What would you record once you have a simulated sample?
\rgs 
\rgs 
\rgs 

9.	What was the p-value of the test? 
\rgs

10.	Interpret the p-value in the context of the problem.
\rgs
\rgs

11.	At the 5% significance level, what decision would you make?  What type of error might that be?
\rgs

12.	What conclusion should the researcher make?
\rgs
\rgs

13.	Are the results in this example statistically significant?  Justify your answer.
\rgs

#### Example from section 17.3: Mercury content of dolphin muscle {-}

1. What is the research question?
\rgs 

2. What are the observational units?
\rgs 

3. Can the results of this study be generalized to a larger population? Why or why not?
\rgs 

4. What are the sample statistics presented in this example?  What notation would be used to represent each value?
\rgs 

5. What is the parameter representing in the context of this problem?  What notation would be used to represent this parameter?
\rgs 
\rgs 

6. Are the independence and normality conditions satisfied?
\rgs 
\rgs 

7. Calculate the standard error of the sample mean.
\rgs 
\rgs

8. What distribution should be referenced to find the multiplier for a 95\% confidence interval?
\rgs 

9. Using $t^\star=2.10$, calculate a 95\% confidence interval for $\mu$.
\rgs 
\rgs


10. Interpret the interval calculated in the context of the problem.
\rgs 
\rgs 

#### Example from section 17.3: Cherry Blossom Race {-}

1.	What is the research question?
\rgs

2.	What are the observational units?
\rgs

3.	Can the results of this study be generalized to a larger population? Why or why not?
\rgs

4.	What are the sample statistics presented in this example?  What notation would be used to represent each value?
\rgs

5.	What is the parameter representing in the context of this problem?  What notation would be used to represent this parameter?
\rgs
\rgs

6.	Are the independence and normality conditions satisfied?
\rgs
\rgs

7.	Write the null and the alternative hypotheses in words.
\rgs
\rgs

8.	Write the null and  the alternative hypotheses in notation.
\rgs

9.	Calculate the standard error of the sample mean.
\rgs
\rgs

10.	Calculate the T-score (the standardized statistic for the sample mean).
\rgs
\rgs

11.	What distribution should the T-score be compared to in order to calculate a p-value?
\rgs

12.	What was the p-value of the test? 
\rgs

13.	Interpret the p-value in the context of the problem.
\rgs
\rgs

14.	At the 5% significance level, what decision would you make?  What type of error might that be?
\rgs

15.	What conclusion should the researcher make?
\rgs
\rgs

16.	Are the results in this example statistically significant?  Justify your answer.
\rgs


### Textbook Chapter 18: Inference for paired mean difference  {-}

<!-- \setstretch{1} -->

<!-- **Videos**   -->

<!-- * Paired_Data -->
<!-- * 18.1and18.2 -->
<!-- * 18.3 -->

\setstretch{1.25}

#### Vocabulary {-}

Paired data: 
\rgs

\rgi Paired with repeated measures: 
\rgs

\rgi Paired with matching: 
\rgs

#### Notes {-}

For each of the following scenarios, determine if the two sets of observations are paired or independent.

1.	To test whether the IQ is related to genetics, researchers measured the IQ of two biological parents and the IQ of their first-born child.  The average parent IQ was compared to the IQ of the first born child.
\rgs

2.	Hoping to see how exercise is related to heart rates, researchers asked a group of 30 volunteers to do either bicycle kicks or jumping jacks for 30 seconds.  Each volunteer’s heart rate was measured at the end of 30 seconds, then the volunteer sat for a 5 minute rest period.  At the end of the rest period, the volunteer performed the other activity and their heart rate was measured again.  Which activity was done first was randomly assigned.
\rgs

3.	Researchers hoping to look into the effectiveness of blended learning gathered two random samples of 50 8th graders (one at Belgrade Middle School which had 5 full-day instruction at the time of the study, the other from Chief Joseph Middle School which utilized a 2-day on, 3-day off blended learning structure).  All 8th graders were given the same lessons and same homework, then asked to take the same end-of-unit test.
\rgs

Conditions to use the CLT for paired mean difference:

\rgi Independence: 
\rgs

\rgi \rgi Checked by: 
\rgs 

\rgi Normality: 
\rgs

\rgi \rgi Checked by:
\rgs

#### Formulas{-}

$SE(\overline{x_d})=$
\rgs

$T=$
\rgs

Confidence interval for a paired mean difference: 
\rgs

#### Notation {-}

$\overline{x_d}=$
\rgs

$s_d=$ 
\rgs

$\mu_d=$ 
\rgs

$\sigma_d=$ 
\rgs

#### Example from section 18.1: Tires {-}

1.	What are the observational units?
\rgs

2.	Why should we treat these data as paired rather than two independent samples?
\rgs

3.	What are the sample statistics presented in this example?  What notation would be used to represent each value?
\rgs


4.	What is the parameter representing in the context of this problem?  What notation would be used to represent this parameter?
\rgs
\rgs

5.	Write the null and alternative hypotheses in appropriate notation.
\rgs


6.	How could we use cards to simulate **one** shifted bootstrap resample *which assumes the null hypothesis is true*?  How many cards?  What is written on the cards?  What would we do with the cards?  What would you record once you have a simulated sample?
\rgs
\rgs
\rgs

7.	After 1000 resamples are generated, where is the resulting null distribution centered?  Why does that make sense?
\rgs


8.	What was the p-value of the test?  Interpret this p-value in the context of the problem.
\rgs
\rgs

9.	Write a conclusion in the context of the problem.
\rgs


#### Example from sections 18.2 and 18.3: UCLA textbook prices {-}

1. What is the research question?
\rgs

2. What are the observational units?
\rgs

3. Why should we treat these data as paired rather than two independent samples?
\rgs

4. What are the sample statistics presented in this example?  What notation would be used to represent each value?
\rgs

5. What is the parameter representing in the context of this problem?  What notation would be used to represent this parameter?
\rgs
\rgs

6. How could we use cards to simulate **one** bootstrap resample *which does not assume the null hypothesis is true*?  How many cards?  What is written on the cards?  What would we do with the cards?  What would you record once you have a simulated sample?
\rgs
\rgs
\rgs

7. After 1000 resamples are generated, where is the resulting bootstrap distribution centered?  Why does that make sense?
\rgs
\rgs

8. Give the 95\% confidence interval for $\mu_d$.
\rgs

9. Interpret your 95\% confidence interval in the context of the problem.
\rgs
\rgs

10. Are the independence and normality conditions satisfied?
\rgs
\rgs

11. Write the null and the alternative hypotheses in words.
\rgs
\rgs

12. Calculate the standard error of the sample mean difference.
\rgs
\rgs

13. Calculate the T-score (the standardized statistic for the sample mean difference).
\rgs
\rgs

14. What distribution should the T-score be compared to in order to calculate a p-value?
\rgs

15. What was the p-value of the test? 
\rgs
	
16. At the 5\% significance level, what decision would you make?  What type of error might that be?
\rgs

17. What conclusion should the researcher make?
\rgs
\rgs

18. Are the results in this example statistically significant?  Justify your answer.
\rgs

19. Using $t^\star=2.00$, calculate a 95\% confidence interval for $\mu_d$.
\rgs
\rgs
	
20. Interpret the interval calculated in the context of the problem.
\rgs
\rgs

\newpage
