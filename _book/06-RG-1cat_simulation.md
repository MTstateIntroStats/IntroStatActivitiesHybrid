# Inference for a Single Categorical Variable: Simulation-based Methods

## Module 6 Reading Guide: Categorical Inference

### Section 5.1 (Foundations of inference: Hypothesis tests) {-}

Please note that Theory-based inference will be covered next week.

**Videos**  

* 5.1

\setstretch{1.25}

#### Vocabulary {-}

Statistical inference: 
\rgs

Hypothesis test: 

\rgi Also called a ‘significance test’.
\rgs

Simulation-based method: 
\rgs

Theory-based method: 
\rgs

Central Limit Theorem:
\rgs

Sampling distribution: 
\rgs

Standard deviation of a statistic: 
\rgs

Standard error of a statistic: 
\rgs

Null hypothesis ($H_0$): 
\rgs

Alternative hypothesis ($H_A$): 
\rgs

P-value: 
\rgs

Point estimate: 
\rgs

Test statistic: 
\rgs

Decision: 
\rgs

Significance level ($\alpha$): 
\rgs 

Statistically significant: 
\rgs

Confidence interval: 
\rgs

Margin of error: 
\rgs

#### Notes {-}

What ‘theory’ is behind the theory-based methods of analysis?
\rgs

Consider the US judicial system:

\rgi What is the null hypothesis?
\rgs

\rgi What is the alternative hypothesis?
\rgs

\rgi The jury is presented with evidence.

|          - If the evidence is strong (beyond a reasonable doubt), the jury will find the defendant: 
\rgs

|          - If the evidence is not strong (not beyond a reasonable doubt), the jury will find the defendant: 
\rgs

To create a simulation, which hypothesis (null or alternative) do we assume is true? 
\rgs

More on p-values: 

\rgi Lower the p-value: 
\rgs

\rgi Interpretations require: 
\rgs

General steps of a hypothesis test:
\rgs

Conclusions should include:
\rgs

Decision:

\rgi If p-value $\leq \alpha$, the decision is to: 

\rgi If p-value $> \alpha$, the decision is to: 

True or False: If the p-value is above 0.10, that means the null hypothesis is true.


True or False:  When conducting a simulation-based hypothesis test, the null hypothesis is assumed to be true to create the simulation.
	

#### Formulas {-}

$SD(\hat{p})$ =
\rgs

General form of a theory-based confidence interval: 
\rgs

Margin of error: 
\rgs


#### Example: Martian alphabet {-} 

1. What is the sample statistic presented in this example?  What notation would be used to represent this value?
\rgs

2. What are the two possible explanations for how these data could have occurred? 
\rgs
\rgs

3. Of the two explanations, which is the null and which is the alternative hypothesis?
\rgs


4. How could coins be used to create a simulation of what should happen if everyone in the class was just guessing?
\rgs
\rgs
\rgs

5. How can we use the simulation to determine which of the two possibilities is more believable?
\rgs
\rgs

6. What decision should be made at an $\alpha = 0.05$ significance level?  Justify your answer.
\rgs

7. Are the results in this example statistically significant?  Justify your answer.
\rgs

8. Interpret the 95% confidence interval provided in the textbook.
\rgs
\rgs

9. The formula for the interval is $34/38 \pm (2 \times 0.08) = 0.89 \pm 0.16$.  Calculating that, you should get (0.73, 1.05).  Why was the interval shown in the textbook (0.73, 1) instead of (0.73, 1.05)?
\rgs

### Section 5.3 (Inference for one proportion) {-}

\setstretch{1}

You may skip Section 5.3.4, which will be covered next week.

**Videos**  

* 5.3SimInf
* Bootstrapping

#### Reminders from previous sections {-}

$n$ = sample size

$\hat{p}$ = sample proportion

$\pi$ = population proportion

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

Hypothesis test: a process to determine how strong the evidence of an effect is.
		
\rgi Also called a ‘significance test’.

Simulation-based method: Simulate lots of samples of size $n$ under assumption of the null hypothesis, then find the proportion of the simulations that are at least as extreme as the observed sample statistic.

Null hypothesis ($H_0$): the skeptical perspective; no difference; no change; no effect; random chance; what the researcher hopes to prove is **wrong**.

Alternative hypothesis ($H_A$): the new perspective; a difference/increase/decrease; an effect; not random chance; what the researcher hopes to prove is **correct**.

P-value: probability of seeing the observed sample data, or something more extreme, assuming the null hypothesis is true.

$\implies$ Lower the p-value the stronger the evidence AGAINST the null hypothesis and FOR the alternative hypothesis.

Decision: a determination of whether to 'reject' or 'fail to reject' a null hypothesis based on a p-value and a pre-set level of significance.

Significance level ($\alpha$): a threshold used to determine if a p-value provides enough evidence to reject the null hypothesis or not.

\rgi Common levels of $\alpha$ include 0.01, 0.05, and 0.10.

Statistically significant: results are considered statistically significant if the p-value is below the significance level.

Confidence interval: a process to determine how large an effect is; a range of plausible values for the parameter; also called 'estimation'.

Margin of error: the value that is added to and subtracted from the sample statistic to create a confidence interval; half the width of a confidence interval.

#### Vocabulary {-}

Point estimate: 
\rgs

Test statistic:
\rgs

Null value:
\rgs

Null distribution:
\rgs

One-sided hypothesis test: 
\rgs

Two-sided hypothesis test: 
\rgs

Bootstrapping: 
\rgs

Bootstrapped resample: 
\rgs

Bootstrapped statistic: 
\rgs


#### Notes {-}

Which hypothesis must we assume is true in order to simulate a null distribution?
\rgs

Explain the differences between a one-sided and two-sided hypothesis test.
\vspace{1mm}

\rgi How will the research questions differ?
\rgs

\rgi How will the notation in the alternative hypothesis differ?
\rgs

\rgi How does the p-value calculation differ?
\rgs

How does the p-value in a two-sided test compare to the p-value in a one-sided test?
\rgs

Should the default in research be a one-sided or two-sided hypothesis test?  Explain why.
\rgs
\rgs

Purpose of bootstrapping: 
\rgs

How is bootstrapping used?  
\rgs

If we want to find a 90% confidence interval, what percentiles of the bootstrap distribution would we need?  
\rgs


#### Example: Organ donations {-}

1. What is the sample statistic presented in this example?  What notation would be used to represent this value?
\rgs

2. What is the parameter representing in the context of this problem?  What notation would be used to represent this parameter?
\rgs
\rgs

3. Write the null and alternative hypotheses in words, using the example in 5.3.1.
\rgs
\rgs

4. Write the null and alternative hypotheses in notation, using the example in 5.3.1.
\rgs


5. To simulate the null distribution, we would not be able to use coins.  Why not?
\rgs
\rgs


6. How could we use cards to simulate 1 sample which assumes the null hypothesis is true?  How many blue cards --- to represent what?  How many red cards --- to represent what?  How many times would we draw a card and replace it back in the deck?  What would you record once you completed the draw-with-replacement process?
\rgs
\rgs
\rgs

7. How can we calculate a p-value from the simulated null distribution for this example in 5.3.1?
\rgs
\rgs


8. What was the p-value of the test from the example in 5.3.1? 
\rgs

9. At the 5% significance level, what decision would you make based on the p-value above?
\rgs

10. What conclusion should the researcher make?
\rgs
\rgs

11. Are the results in this example statistically significant?  Justify your answer.
\rgs
\rgs

12. How does the alternative hypothesis change, both in words and in notation, when the example changes to a two-sided hypothesis test in 5.3.2?  
\rgs
\rgs

13. Explain how the p-value calculation changes between the example in 5.3.1 (one-sided hypothesis test) and the example in 5.3.2 (two-sided hypothesis test).
\rgs
\rgs

14. Why does doubling the p-value from the one-sided hypothesis test (your answer to question 8) not match the two-sided p-value calculated in Figure 5.12?
\rgs
\rgs

15. How could we use cards to simulate **one** bootstrapped resample?  How many blue cards --- to represent what?  How many red cards --- to represent what?  How many times would we draw a card and replace it back in the deck?  What would you record once you completed the draw-with-replacement process?
\rgs
\rgs
\rgs

16.	Interpret the 95\% confidence interval provided in the textbook.
\rgs
\rgs

17.	Are the results in this example statistically significant?  Justify your answer.
\rgs



\newpage
