## Module 11 Lab:  Swearing

\setstretch{1}


### Learning outcomes

* Identify whether a study is a paired design or independent groups

* Given a research question involving paired data, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.

* Describe and perform a simulation-based hypothesis test for a mean difference.

* Interpret and evaluate a p-value for a hypothesis test for a mean difference.

* Use bootstrapping methods to find a confidence interval for a mean difference.

* Interpret a confidence interval for a mean difference.

### Swearing

Profanity (language considered obscene or taboo) and society's attitude about its acceptableness is a highly debated topic, but does swearing serve a physiological purpose or function? Previous research has shown that swearing produces increased heart rates and higher levels of skin conductivity. It is theorized that since swearing provokes intense emotional responses, it acts as a distracter, allowing a person to withstand higher levels of pain. To explore the relationship between swearing and increased pain tolerance, researchers from Keele University (Staffordshire, UK) recruited 83 native English-speaking participants [@stephens2020]. Each volunteer performed two trials holding a hand in an ice-water bath, once while repeating the “f-word” every three seconds, and once while repeating a neutral word (“table”). The order of the word to repeat was randomly assigned. Researchers recorded the length of time, in seconds, from the moment the participant indicated they were in pain until they removed their hand from the ice water for each trial. They hope to find evidence that pain tolerance is greater (longer times) when a person swears compared to when they say a neutral word, on average. Use Swear – Neutral as the order of subtraction.

1. What is the explanatory variable for this study?  What is the response?

\vspace{0.5in}

2. What does $\mu_d$ represent in the context of this study?

\vspace{0.8in}

3.  Write out the null hypothesis in proper notation for this study.  

\vspace{0.4in}

4.  What sign ($<$, $>$, or $\neq$) would you use in the alternative hypothesis for this study?  Explain your choice.

\vspace{0.5in}

* Upload and open the R script file for Module 11 lab. 

* Upload and import the csv file, `pain_tolerance`. 

* Enter the name of the data set for datasetname.csv in the R script file in line 8. 

* Highlight and run lines 1--9 to load the data and create a paired plot of the data. 

``` r
swearing <- read.csv("datasetname.csv")
paired_observed_plot(swearing)
```

5. Based on the plots, does there appear to be some evidence in favor of the alternative hypothesis?  How do you know?
\vspace{0.4in}

* Enter the outcome for group 1 (`Swear`) for `measurement_1` and the outcome for group 2 (`Neutral`) for `measurement_2` in line 16.  

* Highlight and run lines 14--25 to get the summary statistics and boxplot of the differences.


``` r
swearing_diff <- swearing %>% 
  mutate(differences = measurement_1 - measurement_2)
swearing_diff %>% 
    summarise(favstats(differences))

swearing_diff %>% 
    ggplot(aes(x = differences)) +
    geom_boxplot()+
    labs(title="Boxplot of the Difference in Time Participants Held Their Hand 
         in Ice Water while Swearing or while Saying a Neutral Word (Swearing - Neutral)")
```

6.  What is the value of $\bar{x}_d$?  What is the sample size?
\vspace{0.25in}

7. **How far, on average, is each difference in time the participant holds their hand in ice water from the mean of the differences in time?  What is the appropriate notation for this value?**

\vspace{0.4in}

### Use statistical inferential methods to draw inferences from the data {-}


8.  Using the provided graphs and summary statistics, determine if both theory-based methods and simulation methods could be used to analyze the data.  Explain your reasoning.

\vspace{1in}

### Hypothesis test {-}

Remember that the null distribution is created based on the assumption the null hypothesis is true.  In this study, the null hypothesis states that swearing does not affect pain tolerance, or that the length of time a subject kept their hand in the water would be the same whether the patient was swearing or not.

We will use the `paired_test()` function in R (in the `catstats` package) to simulate the null distribution of sample mean differences and compute a p-value. 

\newpage

9.  When using the `paired_test()` function, we need to enter the name of the data set, either the order of subtraction (if the data set has both measurements) or the name of the differences (if the data set contains them).  We will also need to provide R with the observed mean difference, the direction of the alternative hypothesis, and the shift required in order to force the null hypothesis to be true.  The name of the data set as shown above is `swearing_diff` and the column of differences is called `differences`.  What values should be entered for each of the following to create 10000 simulated samples?

\vspace{1mm}
* shift:

\vspace{.1in}
* As extreme as:
    
\vspace{.1in}
* Direction (`"greater"`, `"less"`, or `"two-sided"`):

\vspace{.1in}
* Number of repetitions:
    
\vspace{.1in}

10.  Simulate a null distribution and compute the p-value. Using the R script file for this lab, enter your answers for question 9 in place of the `xx`'s to produce the null distribution with 10000 simulations.  Highlight and run lines 30--36.  


``` r
paired_test(data = swearing$differences,   # Vector of differences 
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

13. Using bootstrapping and the provided R script file, find a 98\% confidence interval. Fill in the missing values/numbers in the `paired_bootstrap_CI()` function to create the 98\% confidence interval.  Highlight and run lines 41--44. **Upload a copy of the bootstrap distribution created to Gradescope for your group.** 

``` r
paired_bootstrap_CI(data = swearing_diff$differences, # Enter vector of differences
                    number_repetitions = 10000, # Number of bootstrap samples for CI
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
