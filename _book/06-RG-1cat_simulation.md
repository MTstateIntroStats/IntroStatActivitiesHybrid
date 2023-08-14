# Inference for a Single Categorical Variable: Simulation-based Methods

## Week 6 Reading Guide: Categorical Inference

### Textbook Chapter 9: Hypothesis testing with randomization {-}

<!-- **Videos**   -->

<!-- * Chapter9 -->

\setstretch{1.25}

#### Reminders from previous sections {-}

$n$ = sample size

$\hat{p}$ = sample proportion

$\pi$ = population proportion

#### Vocabulary {-}

Statistical inference: 
\rgs

Hypothesis test: 

\rgi Also called a ‘significance test’.
\rgs

Simulation-based method: 
\rgs

Theory-based method:

\rgi This will be discussed in detail next week.
\rgs

Observed statistic:
\rgs

Null statistics:
\rgs

Point estimate: 
\rgs

Null hypothesis ($H_0$): 
\rgs

Alternative hypothesis ($H_A$): 
\rgs

Test statistic: 
\rgs

P-value: 
\rgs

Statistically significant: 
\rgs

Significance level ($\alpha$): 
\rgs 

Sampling variability (found in the chapter 9 review):
\rgs

#### Notes {-}


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

Lower p-values indicate (stronger or weaker?) evidence (for or against?) the null hypothesis. 
\rgs

General steps of a hypothesis test:
\rgs


#### Example from section 9.1: Martian alphabet {-} 

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


#### Example from section 9.2: Sex discrimination {-} 

1. Identify the explanatory and response variables in this study.
\rgs

2. Is this a randomized experiment or an observation study? Justify your answer.
\rgs

3. What is the sample statistic presented in this example?  
\rgs

4. What are the null and alternative hypotheses?
\rgs
\rgs

5. Based on the simulation pictured in Figure 9.6, which hypothesis seems more believable?  Justify your answer, being sure to reference (and explain the meaning of) the p-value.
\rgs
\rgs

### Chapter 10: Confidence intervals with bootstrapping {-}

<!-- \setstretch{1} -->

<!-- **Videos**   -->

<!-- * Bootstrapping -->
<!-- * Chapter10 -->

#### Reminders from previous sections {-}

Parameter: a value summarizing a variable(s) for a population.

Statistic: a value summarizing a variable(s) for a sample.  Also called a **point estimate**.

#### Vocabulary {-}

Confidence interval:
\rgs

Bootstrapping:
\rgs

Bootstrapped resample: 
\rgs

Bootstrapped statistic: 
\rgs

Bootstrap percentile confidence interval:
\rgs


#### Notes {-}

What is the purpose of bootstrapping: 
\rgs

How is bootstrapping used?  
\rgs

If we want to find a 90% confidence interval, what percentiles of the bootstrap distribution would we need?  
\rgs


#### Example: Medical consultant {-}

1. What is the sample statistic presented in this example?  What notation would be used to represent this value?
\rgs

2. What is the parameter representing in the context of this problem?  What notation would be used to represent this parameter?
\rgs
\rgs

3. How could we use cards to simulate **one** bootstrapped resample?  How many blue cards --- to represent what?  How many red cards --- to represent what?  How many times would we draw a card and replace it back in the deck?  What would you record once you completed the draw-with-replacement process?
\rgs
\rgs
\rgs

4.	Provide and interpret the 95\% confidence interval provided in the textbook.
\rgs
\rgs


### Section 14.1: Simulation-based test for $H_0:\pi = \pi_0$ {-}

<!-- \setstretch{1} -->

<!-- **Videos**   -->

<!-- * 14.1 -->

#### Reminders from previous sections {-}

$n$ = sample size

$\hat{p}$ = sample proportion

$\pi$ = population proportion

General steps of a hypothesis test:

1. Frame the research question in terms of hypotheses.

2. Collect and summarize data using a test statistic.
	
3. Assume the null hypothesis is true, and simulate or mathematically model a null distribution for the test statistic.

4. Compare the observed test (standardized) statistic to the null distribution to calculate a p-value.

5. Make a conclusion based on the p-value and write the conclusion in context.

Parameter: a value summarizing a variable(s) for a population.

Statistic: a value summarizing a variable(s) for a sample.

Sampling distribution: plot of statistics from 1000s of samples of the same size taken from the same population.

Hypothesis test: a process to determine how strong the evidence of an effect is.
		
\rgi Also called a ‘significance test’.

Simulation-based method: Simulate lots of samples of size $n$ under assumption of the null hypothesis, then find the proportion of the simulations that are at least as extreme as the observed sample statistic.

Null hypothesis ($H_0$): the skeptical perspective; no difference; no change; no effect; random chance; what the researcher hopes to prove is **wrong**.

Alternative hypothesis ($H_A$): the new perspective; a difference/increase/decrease; an effect; not random chance; what the researcher hopes to prove is **correct**.

P-value: probability of seeing the observed sample data, or something more extreme, assuming the null hypothesis is true.

$\implies$ Lower the p-value the stronger the evidence AGAINST the null hypothesis and FOR the alternative hypothesis.

Significance level ($\alpha$): a threshold used to determine if a p-value provides enough evidence to reject the null hypothesis or not.

\rgi Common levels of $\alpha$ include 0.01, 0.05, and 0.10.

Statistically significant: results are considered statistically significant if the p-value is below the significance level.

#### Vocabulary {-}

Null value:
\rgs

Null distribution:
\rgs

#### Notes {-}

Which hypothesis must we assume is true in order to simulate a null distribution?
\rgs

How is a p-value calculated in a simulation-based hypothesis test?
\rgs
\rgs

How is a null distribution created in a simulation-based hypothesis test for a single proportion?
\rgs
\rgs

True or false:  The sign in the alternative hypothesis is based off of the researcher's question.

#### Example: Medical consultant {-}

As a reminder from section 10.1, $\hat{p} = 0.048$.

1. Write the null and alternative hypotheses in words.
\rgs
\rgs

2. Write the null and alternative hypotheses in notation.
\rgs


3. To simulate the null distribution, we would not be able to use coins.  Why not?
\rgs
\rgs


4. How could we use cards to simulate 1 sample which assumes the null hypothesis is true?  How many blue cards --- to represent what?  How many red cards --- to represent what?  How many times would we draw a card and replace it back in the deck?  What would you record once you completed the draw-with-replacement process?
\rgs
\rgs
\rgs

5. How can we calculate a p-value from the simulated null distribution for this example in figure 14.1?
\rgs
\rgs

6. What was the p-value of the test? 
\rgs

7. What conclusion should the researcher make?
\rgs
\rgs

8. Are the results in this example statistically significant?  Justify your answer.
\rgs
\rgs

9. To what population can we generalize the results of this study? Justify your answer.
\rgs

### Section 14.2: Bootstrap confidence interval for $\pi$ {-}

<!-- \setstretch{1} -->

<!-- **Videos**   -->

<!-- * 14.2 -->

#### Reminders from previous sections {-}

Confidence interval: a process to determine how large an effect is; a range of plausible values for the parameter. Also called ‘estimation’.

Bootstrapping: the process of drawing with replacement $n$ times from the original sample.

Bootstrapped resample: a random sample of size $n$ from the original sample, selected with replacement.

Bootstrapped statistic: the statistic recorded from the bootstrapped resample.

Bootstrap percentile confidence interval: An X% confidence interval made by finding the bounds of the middle X% of bootstrap statistics.

#### Notes {-}

Explain how to use a confidence interval to test a null hypothesis.
\rgs
\rgs

#### Example: Medical consultant {-}

1. What is the 95% confidence interval for the parameter of interest, based on the bootstrap distribution shown in figure 10.6?
\rgs

2. What the 95% confidence interval indicate the consults has a lower rate of complications than the national average (10%)?  Justify your answer.
\rgs


\newpage
