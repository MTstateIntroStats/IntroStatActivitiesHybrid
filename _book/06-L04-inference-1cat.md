## Module 6 Lab:  Mixed Breed Dogs in the U.S.

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

### Mixed Breed Dogs in the U.S.

The American Veterinary Medical Association estimated in 2010 that approximately 49% of dog owners in the U.S. own dogs that are classified as “mixed breed.” As part of a larger 2022 international study [@banton2022] about overall dog health, survey participants were asked, among other things, to report whether their dog was purebred or a mixed breed.  Seven hundred and fifty (750) dog owners from the U.S. were recruited to complete an online survey via an email indicating they had been randomly selected by Qualtrics (an “experience management” company that specializes in surveys).  Three hundred sixty-four (364) out of 675 respondents from the U.S. reported they owned a mixed breed dog.  Is there evidence that, in the last decade, the proportion of dog owners in the U.S. that own a mixed breed dog has changed from the value reported in 2010? 

#### Activity intro {-}

1.  What is the value of the point estimate?

\vspace{0.3in}

#### Use statistical analysis methods to draw inferences from the data {-}

2.  Write out the parameter of interest in words, in context of the study.  

\vspace{0.5in}

3.  Write out the null and alternative hypotheses in notation.

| $H_0:$

| $H_A:$

4. Can theory-based methods be used to analyze these data?  Explain your answer.

\vspace{0.6in}

To use the computer simulation, we will need to enter the 

* assumed "probability of success" ($\pi_0$), 
* "sample size" (the number of observational units or cases in the sample),
* "number of repetitions" (the number of samples to be generated), 
* "as extreme as" (the observed statistic), and 
* the "direction" (matches the direction of the alternative hypothesis).


5.  What values should be entered for each of the following into the one proportion test to create 1000 simulations?

\vspace{1mm}
* Probability of success:

\vspace{.2in}
* Sample size:
    
\vspace{.2in}
* Number of repetitions:
    
\vspace{.2in}
* As extreme as:
    
\vspace{.2in}
* Direction (`"greater"`, `"less"`, or `"two-sided"`):

We will use the `one_proportion_test()` function in `R` (in the `catstats` package) to simulate the null distribution of sample proportions and compute a p-value. Using the provided `R` script file, fill in the values/words for each `xx` with your answers from question 4 in the one proportion test to create a null distribution with 1000 simulations. Then highlight and run lines 1--16.


```r
one_proportion_test(probability_success = 0.49, # Null hypothesis value
          sample_size = 675, # Enter sample size
          number_repetitions = 1000, # Enter number of simulations
          as_extreme_as = (364/675), # Observed statistic
          direction = "two-sided", # Specify direction of alternative hypothesis
          summary_measure = "proportion") # Reporting proportion or number of successes?
```
5. Report the p-value from the study.

\vspace{0.2in}

The $z^*$ multiplier is the percentile of a standard normal distribution that corresponds to our confidence level. If our confidence level is 95\%, we find the Z values that encompass the middle 95\% of the standard normal distribution.  If 95\% of the standard normal distribution should be in the middle, that leaves 5\% in the tails, or 2.5\% in each tail.  

The `qnorm()` function in R will tell us the $z^*$ value for the desired percentile (in this case, 90\% + 5\% = 95\% percentile). 

* Enter the value of 0.95 for xx in the provided R script file. 

* Highlight and run line 4. This will give the value of the multiplier for a 95\% confidence interval.


```r
qnorm(xx. lower.tail = TRUE) # Multiplier for 95% confidence interval
```

6.  Calculate the margin of error for a 90\% confidence interval.  

\vspace{0.5in}

7. Calculate a 90\% confidence interval.

\vspace{0.6in}

8. What type of error may have occured?

\vspace{0.2in}

9. Describe this error in the context of the study?

\vspace{0.6in}

#### Summarize the results of the study {-}

10. Write a paragraph summarizing the results of the study.  Be sure to describe:

* Summary statistic and interpretation

    * Summary measure (in context)
    
    * Value of the statistic 
    
    * Order of subtraction when comparing two groups

* P-value and interpretation

    * Statement about probability or proportion of samples
    
    * Statistic (summary measure and value)
    
    * Direction of the alternative 
    
    * Null hypothesis (in context) 

* Confidence interval and interpretation

    * How confident you are (e.g., 90%, 95%, 98%, 99%)
    
    * Parameter of interest
    
    * Calculated interval
    
    * Order of subtraction when comparing two groups

* Conclusion (written to answer the research question)

    * Amount of evidence
    
    * Parameter of interest 
    
    * Direction of the alternative hypothesis

* Scope of inference

    * To what group of observational units do the results apply (target population or observational units similar to the sample)?
	
    * What type of inference is appropriate (causal or non-causal)?

**Upload a copy of your group's paragraph to Gradescope.** 

Paragraph (continued):

\newpage

### Take-home messages

1.	The goal in a hypothesis test is to assess the strength of evidence for an effect, while the goal in creating a confidence interval is to determine how large the effect is.  A **confidence interval** is a range of *plausible* values for the parameter of interest.  

2. A confidence interval is built around the point estimate or observed calculated statistic from the sample.  This means that the sample statistic is always the center of the confidence interval. A confidence interval includes a measure of sample to sample variability represented by the **margin of error**.   

3. In simulation-based methods (bootstrapping), a simulated distribution of possible sample statistics is created showing the possible sample-to-sample variability.  Then we find the middle $X$ percent of the distribution around the sample statistic using the percentile method to give the range of values for the confidence interval.  This shows us that we are $X$% confident that the parameter is within this range, where $X$ represents the level of confidence.

4.  When the null value is within the confidence interval, it is a plausible value for the parameter of interest; thus, we would find a larger p-value for a hypothesis test of that null value.  Conversely, if the null value is NOT within the confidence interval, we would find a small p-value for the hypothesis test and strong evidence against this null hypothesis. 

5. To create one simulated sample on the bootstrap distribution for a sample proportion, label $n$ cards with the original responses.  Draw with replacement $n$ times.  Calculate and plot the resampled proportion of successes.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage

