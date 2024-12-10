## Module 6 and 7 Lab:  Arsenic

\setstretch{1}


### Learning outcomes


### Arsenic

Scientists have devised a new way to measure a person’s level of arsenic poisoning by examining toenail clippings.  Scientists measured the arsenic levels (in parts per million or ppm) in toenail clippings from 19 randomly selected individuals with private wells in New Hampshire (data in the table below).  An arsenic level greater than 0.150 ppm is considered hazardous.   Is there evidence the ground water in New Hampshire has hazardous levels of arsenic concentration (as seen in the arsenic levels of New Hampshire residents)?  How high is the arsenic concentration for New Hampshire residents with a private well?

1. What does $\mu$ represent in the context of this study?

\vspace{0.8in}

2.  Notice that there are two research questions for this study.  Identify which research question is best answered by finding a confidence interval and which is best answered by completing a hypothesis test?

\vspace{0.5in}

3.  Write out the null hypothesis in proper notation for this study.  

\vspace{0.4in}

4.  What sign ($<$, $>$, or $\neq$) would you use in the alternative hypothesis for this study?  Explain your choice.

\vspace{0.5in}

* Upload and open the R script file for Week 12 lab. 

* Upload and import the csv file, `arsenic`. 

* Enter the name of the data set (see the environment tab) for datasetname in the R script file in line 8. 

* Highlight and run lines 1--9 to load the data and create a paired plot of the data. 

``` r
swearing <- datasetname
```

5. Based on the plots, does there appear to be some evidence in favor of the alternative hypothesis?  How do you know?
\vspace{0.4in}


6.  What is the value of $\bar{x}$?  What is the sample size?
\vspace{0.25in}

7. **How far, on average, is each arsenic level from the mean arsenic level?  What is the appropriate notation for this value?**

\vspace{0.4in}

### Use statistical inferential methods to draw inferences from the data {-}


8.  Using the provided graphs and summary statistics, determine if both theory-based methods and simulation methods could be used to analyze the data.  Explain your reasoning.

\vspace{1in}

### Hypothesis test {-}

Remember that the null distribution is created based on the assumption the null hypothesis is true.  In this study, the null hypothesis states that swearing does not affect pain tolerance, or that the length of time a subject kept their hand in the water would be the same whether the patient was swearing or not.

We will use the `one_mean_test()` function in R (in the `catstats` package) to simulate the null distribution of sample mean differences and compute a p-value. 

\newpage

10.  Simulate a null distribution and compute the p-value. Using the R script file for this lab, enter your answers for question 9 in place of the `xx`'s to produce the null distribution with 1000 simulations.  Highlight and run lines 23--29.  


``` r
one_mean_test(object$variable,   # Vector of differences 
                                 # or data set with column for each group
        shift = xx,   # Shift needed for bootstrap hypothesis test
        as_extreme_as = xx,  # Observed statistic
        direction = "xx",  # Direction of alternative
        number_repetitions = xx,  # Number of simulated samples for null distribution
        which_first = 1)  # Not needed when using calculated differences
```
|        Sketch the null distribution created using the `paired_test` code.

\vspace{1.5in}

### Communicate the results and answer the research question {-}

11.  **Report the p-value. Based off of this p-value and a 1% significance level, what decision would you make about the null hypothesis?  What potential error might you be making based on that decision?**

\vspace{0.5in}

12. Do you expect the 98\% confidence interval to contain the null value of zero?  Explain.

\vspace{0.8in}

### Confidence interval {-}

We will use the `paired_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample mean differences and calculate a confidence interval. 

13. Using bootstrapping and the provided R script file, find a 98\% confidence interval. Fill in the missing values/numbers in the `paired_bootstrap_CI()` function to create the 98\% confidence interval.  Highlight and run lines 34--37. **Upload a copy of the bootstrap distribution created to Gradescope for your group.** 

``` r
paired_bootstrap_CI(data = swearing_diff$differences, # Enter vector of differences
                    number_repetitions = 1000, # Number of bootstrap samples for CI
                    confidence_level = xx,  # Confidence level in decimal form
                    which_first = 1)  # Not needed when entering vector of differences
```
Report the 98\% confidence interval in interval notation.

\vspace{0.3in}

14. Interpret the *confidence level* of the interval found in question 12. 

\vspace{0.8in}

15.  Write a paragraph summarizing the results of the study.  **Upload a copy of your group's paragraph to Gradescope.** Be sure to describe:

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

\newpage

* Scope of inference

    * To what group of observational units do the results apply (target population or observational units similar to the sample)?
	
    * What type of inference is appropriate (causal or non-causal)?

\newpage
