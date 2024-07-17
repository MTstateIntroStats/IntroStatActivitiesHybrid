## Module 6 Lab:  Mixed Breed Dogs in the U.S.

\setstretch{1}

### Learning outcomes

* Determine whether simulation or theory-based methods of inference can be used.

* Analyze and interpret a study involving a single categorical variable.

### Mixed Breed Dogs in the U.S.

The American Veterinary Medical Association estimated in 2010 that approximately 49% of dog owners in the U.S. own dogs that are classified as “mixed breed.” As part of a larger 2022 international study [@banton2022] about overall dog health, survey participants were asked, among other things, to report whether their dog was purebred or a mixed breed.  Seven hundred and fifty (750) dog owners from the U.S. were recruited to complete an online survey via an email indicating they had been randomly selected by Qualtrics (an “experience management” company that specializes in surveys).  Three hundred sixty-four (364) out of 675 respondents from the U.S. reported they owned a mixed breed dog.  Is there evidence that, in the last decade, the proportion of dog owners in the U.S. that own a mixed breed dog has changed from the value reported in 2010? 

#### Activity intro {-}

1.  What is the value of the point estimate?

\vspace{0.3in}

#### Use statistical analysis methods to draw inferences from the data {-}

2.  **Write out the parameter of interest in words, in context of the study.**  

\vspace{0.5in}

3.  Write out the null and alternative hypotheses in notation.

\vspace{1mm}

| $H_0:$

\vspace{0.3in}

| $H_A:$

\vspace{0.3in}

4. **Can theory-based methods be used to analyze these data?  Explain your answer.**

\vspace{0.6in}

\newpage

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

We will use the `one_proportion_test()` function in `R` (in the `catstats` package) to simulate the null distribution of sample proportions and compute a p-value. Using the provided `R` script file, fill in the values/words for each `xx` with your answers from question 5 in the one proportion test to create a null distribution with 1000 simulations. Then highlight and run lines 1--12.


```r
one_proportion_test(probability_success = xx, # Null hypothesis value
          sample_size = xx, # Enter sample size
          number_repetitions = 1000, # Enter number of simulations
          as_extreme_as = xx, # Observed statistic
          direction = "xx", # Specify direction of alternative hypothesis
          summary_measure = "proportion") # Reporting proportion or number of successes?
```
6. Report the p-value from the study.

\vspace{0.2in}

The $z^*$ multiplier is the percentile of a standard normal distribution that corresponds to our confidence level. If our confidence level is 95\%, we find the Z values that encompass the middle 95\% of the standard normal distribution.  If 95\% of the standard normal distribution should be in the middle, that leaves 5\% in the tails, or 2.5\% in each tail.  

The `qnorm()` function in R will tell us the $z^*$ value for the desired percentile (in this case, 90\% + 5\% = 95\% percentile). 

* Enter the value of 0.95 for xx in the provided R script file. 

* Highlight and run line 17. This will give the value of the multiplier for a 90\% confidence interval.


```r
qnorm(xx. lower.tail = TRUE) # Multiplier for 90% confidence interval
```

7.  **Calculate the margin of error for a 90\% confidence interval.**

\vspace{0.5in}

\newpage

8. Calculate a 90\% confidence interval.

\vspace{0.6in}

9. What type of error may have occurred?

\vspace{0.2in}

10. Describe this error in the context of the study?

\vspace{0.6in}

#### Summarize the results of the study {-}

11. Write a paragraph summarizing the results of the study.  Be sure to describe:

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

\newpage

Paragraph (continued):

\newpage

