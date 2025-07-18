## Module 3 and 4 Lab:  Mixed Breed Dogs in the U.S.

\setstretch{1}

### Learning outcomes

* Determine whether simulation or theory-based methods of inference can be used.

* Analyze and interpret a study involving a single categorical variable.

### Mixed Breed Dogs in the U.S.

The American Veterinary Medical Association estimated in 2010 that approximately 49% of dog owners in the U.S. own dogs that are classified as “mixed breed.” As part of a larger 2022 international study [@banton2022] about overall dog health, survey participants were asked, among other things, to report whether their dog was purebred or a mixed breed.  Seven hundred and fifty (750) dog owners from the U.S. were recruited to complete an online survey via an email indicating they had been randomly selected by Qualtrics (an “experience management” company that specializes in surveys).  Three hundred sixty-four (364) out of 675 respondents from the U.S. reported they owned a mixed breed dog.  Is there evidence that, in the last decade, the proportion of dog owners in the U.S. that own a mixed breed dog has changed from the value reported in 2010? 

* Observational units:

* Variable:

* Type of variable:

* Success:

#### Activity intro {-}

* Download the R script file and the data file (US_dogs.csv) from Canvas

* Upload both files to Canvas and open the R script file

* Enter the name of the dataset for datasetname.csv.

* Highlight and run lines 1 - 6 

1.  What is the value of the point estimate?

\vspace{0.3in}

2. Create a plot of the data using the R code. Make sure to include an appropriate title with type of plot, observational units, and variable.  


``` r
dogs %>% # Data set piped into...
    ggplot(aes(x = variable)) +   # This specifies the variable
    geom_bar(aes(y = after_stat(prop), group = 1)) +  # Tell it to make a bar plot with proportions
    labs(title = "Don't forget to title your plot",  
       # Give your plot a title
       x = "Breed of Dog",   # Label the x axis
       y = "Relative Frequency")  # Label the y axis
```

#### Use statistical analysis methods to draw inferences from the data {-}

3.  Write out the parameter of interest in words, in context of the study.

\vspace{0.5in}

\newpage

4.  Write out the null and alternative hypotheses in notation.

\vspace{1mm}

| $H_0:$

\vspace{0.3in}

| $H_A:$

\vspace{0.3in}

5. Will theory-based methods give the same results as simulation based methods?  Explain your answer.

\vspace{1in}

#### Null Distribution {-}

To use the computer simulation, we will need to enter the 

* assumed "probability of success" ($\pi_0$), 

* "sample size" (the number of observational units or cases in the sample),

* "number of repetitions" (the number of samples to be generated), 

* "as extreme as" (the observed statistic), and 

* the "direction" (matches the direction of the alternative hypothesis).

We will use the `one_proportion_test()` function in `R` (in the `catstats` package) to simulate the null distribution of sample proportions and compute a p-value. 

* Using the provided `R` script file, fill in the values/words for each `xx` in the one proportion test to create a null distribution with 10000 simulations. 

* Then highlight and run lines 21--26.


``` r
one_proportion_test(probability_success = xx, # Null hypothesis value
          sample_size = xx, # Enter sample size
          number_repetitions = 10000, # Enter number of simulations
          as_extreme_as = xx, # Observed statistic
          direction = "xx", # Specify direction of alternative hypothesis
          summary_measure = "proportion") # Reporting proportion or number of successes?
```
6. Report the p-value from the study.

\vspace{0.2in}

#### Bootstrap distribution {-}

We will use the `one_proportion_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample proportions and calculate a confidence interval. Using the provided R script file, fill in the values/words for each `xx` in the one proportion bootstrap confidence interval (CI) code to create a bootstrap distribution with 10000 simulations. Then highlight and run lines 31--34 to create a 90\% confidence interval.


``` r
one_proportion_bootstrap_CI(sample_size = xx, # Sample size
                    number_successes = xx, # Observed number of successes
                    number_repetitions = 10000, # Number of bootstrap samples to use
                    confidence_level = xx) # Confidence level as a decimal
```

7. Report the 90\% confidence interval.

\vspace{0.2in}

<!-- The $z^*$ multiplier is the percentile of a standard normal distribution that corresponds to our confidence level.  -->

<!-- * Enter the value of the appropriate percentile in the provided R script file to find the multiplier for a 90\% confidence interval.  -->

<!-- * Highlight and run line 31 -->

<!-- ```{r, echo=TRUE, eval=FALSE} -->
<!-- qnorm(percentile, lower.tail = TRUE) # Multiplier for 90% confidence interval -->
<!-- ``` -->

<!-- 7.  **Calculate the margin of error for a 90\% confidence interval.** -->

<!-- \vspace{0.6in} -->

<!-- 8. Calculate a 90\% confidence interval. -->

<!-- \vspace{0.6in} -->

<!-- \newpage -->

#### Summarize the results of the study {-}

8. Write a paragraph summarizing the results of the study.  Be sure to describe:

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

