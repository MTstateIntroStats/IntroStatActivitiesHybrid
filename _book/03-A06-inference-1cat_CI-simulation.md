## Activity 6:  Helper-Hinderer --- Simulation-based Confidence Interval

\setstretch{1}

### Learning outcomes

* Use bootstrapping to find a confidence interval for a single proportion.

* Interpret a confidence interval for a single proportion.

### Terminology review

In today's activity, we will introduce simulation-based confidence intervals for a single proportion. Some terms covered in this activity are:

* Parameter of interest

* Bootstrapping

* Confidence interval

To review these concepts, see Chapters 10 & 14 in your textbook.

### Helper-Hinderer

In the last class, we found very strong evidence that the true proportion of infants who will choose the helper character is greater than 0.5. But what *is* the true proportion of infants who will choose the helper character? We will use this same study to estimate this parameter of interest by creating a confidence interval. 

As a reminder: A study by Hamblin, Wynn, and Bloom reported in Nature [@hamblin2007] was intended to check young kids' feelings about helpful and non-helpful behavior. Non-verbal infants ages 6 to 10 months were shown short videos with different shapes either helping or hindering the climber. Researchers were hoping to assess: Are non-verbal infants more likely to choose the helper toy? In the study, of the 16 infants age 6 to 10 months, 14 chose the *helper* toy and 2 chose the *hinderer* toy.

A **point estimate** (our observed statistic) provides a single plausible value for a parameter. However, a point estimate is rarely perfect; usually there is some error in the estimate. In addition to supplying a point estimate of a parameter, a next logical step would be to provide a plausible *range* of values for the parameter. This plausible range of values for the population parameter is called an **interval estimate** or **confidence interval**. 

#### Activity intro {-}

1.  What is the value of the point estimate (sample statistic)?

\vspace{0.3in}

2.  If we took another random sample of 16 infants, would we get the exact same point estimate?  Explain why or why not.

\vspace{0.5in}

In today's activity, we will use bootstrapping to find a 95\% confidence interval for $\pi$, the parameter of interest.  


### Notes on Confidence Intervals {-}

\vspace{2in}

#### Use statistical analysis methods to draw inferences from the data {-}

3.  Write out the parameter of interest in words, in context of the study.  What does $\pi$ represent?

\vspace{0.5in}

To create the null distribution we flipped a coin 16 times to simulate infants randomly choosing the helper toy with a probability of 50\%.  

4. Why can't we use a coin to simulate the bootstrap distribution.

\vspace{0.7in}

To create the bootstrap distribution.

* First we would label the cards to represent the sample statistic: 14 helper and 2 hinderer.

* Sample with replacement 16 times

5. Using the cards provided by your instructor, create one bootstrap sample.  Report your simulated sample proportion on the whiteboard.

\vspace{0.3in}

To use the computer simulation to create a bootstrap distribution, we will need to enter the 

* "sample size" (the number of observational units or cases in the sample),
* "number of successes" (the number of cases that choose the helper character), 
* "number of repetitions" (the number of samples to be generated), and 
* the "confidence level" (which level of confidence are we using to create the confidence interval).

6.  What values should be entered for each of the following into the simulation to create the bootstrap distribution of sample proportions to find a 95\% confidence interval?
\vspace{1mm}

* Sample size (n):

\vspace{.1in}
 
* Number of successes:
    
\vspace{.1in}
* Number of repetitions (at least 10000):
    
\vspace{.1in}
* Confidence level (as a decimal):
    
\vspace{.1in}

We will use the `one_proportion_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample proportions and calculate a confidence interval. Using the provided R script file, fill in the values/words for each `xx` with your answers from question 6 in the one proportion bootstrap confidence interval (CI) code to create a bootstrap distribution with 10000 simulations. Then highlight and run lines 1--9.


``` r
one_proportion_bootstrap_CI(sample_size = 16, # Sample size
                    number_successes = 14, # Observed number of successes
                    number_repetitions = 10000, # Number of bootstrap samples to use
                    confidence_level = 0.95) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-A06-inference-1cat_CI-simulation_files/figure-latex/unnamed-chunk-1-1} \end{center}

### Notes on the bootstrap distribution {-}

\vspace{1.5in}

**95\% Confidence Interval:**

**Interpretation of the 95\% confidence interval in context.**

\vspace{.6in}

#### Communicate the results and answer the research question {-}

7.  Is the value 0.5 (the null value) in the 95\% confidence interval?

\vspace{.2in}

|    Explain how this indicates that the p-value provides strong evidence against the null.

\vspace{0.5in}

#### Effect of confidence level {-}

8.  Suppose instead of finding a 95\% confidence interval, we found a 90\% confidence interval.  Would you expect the 90\% confidence interval to be narrower or wider?  Explain your answer.

\vspace{0.4in}

9.  The following R code produced the bootstrap distribution with 10000 simulations that follows.  Circle the value that changed in the code. 


``` r
one_proportion_bootstrap_CI(sample_size = 16, # Sample size
                    number_successes = 14, # Observed number of successes
                    number_repetitions = 10000, # Number of bootstrap samples to use
                    confidence_level = 0.90) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-A06-inference-1cat_CI-simulation_files/figure-latex/unnamed-chunk-2-1} \end{center}


10.  Report both the 95\% confidence interval and the 90\% confidence interval (question 10).  Is the 90\% confidence interval narrower or wider than the 95\% confidence interval?

\vspace{0.5in}
\newpage

#### Concluding paragraph {-}

In many of our studies we will write a paragraph summarizing the results of the study. 

\setstretch{1.75}

Researchers were interested if infants observe social cues and would be more likely to choose the helper toy.  In a sample of 16 infants, 14 chose the helper toy.  A simulation null distribution with 10000 simulations was created in RStudio.  The p-value was found by calculating the proportion of simulations in the null distribution at the sample statistic of 0.875 and greater.  This resulted in a p-value of 0.0024.  We would observe a sample proportion of 0.875 or greater with a probability of 0.0024 IF we assume the true proportion of non-verbal infants who would choose the helper toy is 0.5. Based on this p-value, there is very strong evidence that the true proportion of infants age 6 to 10 months who will choose the helper toy is greater than 0.5.  In addition, a 95\% confidence interval was found for the parameter of interest.  We are 95\% confident that the true proportion of infants age 6 to 10 months who will choose the helper toy is between 0.75 and 1. The results of this study can be generalized to the sample of non-verbal infants as the researchers did not select a random sample.

\setstretch{1}

### Take-home messages

1.	The goal in a hypothesis test is to assess the strength of evidence for an effect, while the goal in creating a confidence interval is to determine how large the effect is.  A **confidence interval** is a range of *plausible* values for the parameter of interest.  

2. A confidence interval is built around the point estimate or observed calculated statistic from the sample.  This means that the sample statistic is always the center of the confidence interval. A confidence interval includes a measure of sample to sample variability represented by the **margin of error**.   

3. In simulation-based methods (bootstrapping), a simulated distribution of possible sample statistics is created showing the possible sample-to-sample variability.  Then we find the middle $X$ percent of the distribution around the sample statistic using the percentile method to give the range of values for the confidence interval.  This shows us that we are $X$% confident that the parameter is within this range, where $X$ represents the level of confidence.

4.  When the null value is within the confidence interval, it is a plausible value for the parameter of interest; thus, we would find a larger p-value for a hypothesis test of that null value.  Conversely, if the null value is NOT within the confidence interval, we would find a small p-value for the hypothesis test and strong evidence against this null hypothesis. 

5. To create one simulated sample on the bootstrap distribution for a sample proportion, label $n$ cards with the original responses.  Draw with replacement $n$ times.  Calculate and plot the resampled proportion of successes.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage

