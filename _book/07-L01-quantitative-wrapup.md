## Module 6 and 7 Lab:  Arsenic

\setstretch{1}


### Learning outcomes

* Given a research question involving one quantitative variable, construct the null and alternative hypotheses
in words and using appropriate statistical symbols.

* Investigate the process of creating a null distribution for one quantitative variable.

* Find, evaluate, and interpret a p-value from the null distribution.

* Use simulation-based methods to find a confidence interval for a single mean.

* Interpret a confidence interval for a single mean.

* Use a confidence interval to determine the conclusion of a hypothesis test.

### Arsenic

Scientists have devised a new way to measure a person’s level of arsenic poisoning by examining toenail clippings.  Scientists measured the arsenic levels (in parts per million or ppm) in toenail clippings from 19 randomly selected individuals with private wells in New Hampshire.  An arsenic level greater than 0.150 ppm is considered hazardous.   Is there evidence the ground water in New Hampshire has hazardous levels of arsenic concentration (as seen in the arsenic levels of New Hampshire residents)?  How high is the arsenic concentration for New Hampshire residents with a private well?

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

* Enter the name of the data set (see the environment tab) for `datasetname` in the R script file in line 11. 

* Enter the name of the variable in lines 15

* Write a title for the plot between the quotations and an x-axis label

* Highlight and run lines 1--21 to load the data and create a plot of the data. 

* **Upload a screenshot of your plot to Gradescope**.


``` r
water <- read.csv("data/arsenic.csv")
water %>%
    summarise(favstats(variable))
water %>% # Data set piped into...
    ggplot(aes(x = variable)) +   # Name variable to plot
    geom_boxplot() +  # Create boxplot with specified binwidth
    labs(title = "Don't forget to title the plot!", # Title for plot
         x = "Enter an x-axis label! Don't forget the units!", # Label for x axis
         y = "") + # Remove y axis label
    theme(axis.text.y = element_blank(), 
          axis.ticks.y = element_blank()) # Removes y-axis ticks
```

5. Based on the plot, does there appear to be some support in favor of the alternative hypothesis?  How do you know?
\vspace{0.4in}

6. Interpret the value of $Q_3$ in context of the study.

\vspace{0.8in}

7.  What is the value of $\bar{x}$?  What is the sample size?
\vspace{0.25in}

8. **How far, on average, is each arsenic level from the mean arsenic level?  What is the appropriate notation for this value?**

\vspace{0.4in}

### Use statistical inferential methods to draw inferences from the data {-}


9.  Using the provided graphs and summary statistics, determine if both theory-based methods and simulation-based methods could be used to analyze the data.  Explain your reasoning.

\vspace{1in}

### Hypothesis test {-}

Remember that the null distribution is created based on the assumption the null hypothesis is true.  In this study, the null hypothesis states that the average arsenic levels are not hazardous.

We will use the `one_mean_test()` function in R (in the `catstats` package) to simulate the null distribution of sample means and compute a p-value. 

\newpage

10.  Simulate a null distribution and compute the p-value, using the R script file for this lab.  


``` r
one_mean_test(water$level_arsenic,   #Enter the name of the variable
              null_value = 0.150, #Enter the name of the null value
              summary_measure = "mean", #Choose mean or median to test
              shift = -0.122,  # Shift needed for bootstrap hypothesis test
              as_extreme_as = 0.272,  # Observed statistic
              direction = "greater",  # Direction of alternative
              number_repetitions = 10000)  # Number of simulated samples for null distribution
```
|        Sketch the null distribution created using the `one_mean_test` code.

\vspace{1.5in}

### Communicate the results and answer the research question {-}

11.  **Report the p-value. Based off of this p-value and a 1% significance level, what decision would you make about the null hypothesis?  What potential error might you be making based on that decision?**

\vspace{0.5in}

12. Do you expect the 98\% confidence interval to contain the null value of zero?  Explain.

\vspace{0.8in}

### Confidence interval {-}

We will use the `one_mean_CI()` function in R (in the `catstats` package) to simulate a bootstrap distribution of sample means and calculate a confidence interval. 

13. Using bootstrapping and the provided R script file, find a 98\% confidence interval. Fill in the missing values/numbers in the `one_mean_CI()` function to create the 98\% confidence interval.   


``` r
one_mean_CI(data = water$level_variable, # Enter vector of differences
            summary_measure = "mean",  # Not needed when entering vector of differences
            number_repetitions = 10000, # Number of bootstrap samples for CI
            confidence_level = xx)  # Confidence level in decimal form
```
Report the 98\% confidence interval in interval notation.

\vspace{0.3in}

\newpage

14. Write a paragraph summarizing the results of the study.  **Upload a copy of your group's paragraph to Gradescope.** Be sure to describe:

* Summary statistic and interpretation

    * Summary measure (in context)
    
    * Value of the statistic 
    
* P-value and interpretation

    * Statement about probability or proportion of samples
    
    * Statistic (summary measure and value)
    
    * Direction of the alternative 
    
    * Null hypothesis (in context) 

* Confidence interval and interpretation

    * How confident you are (e.g., 90%, 95%, 98%, 99%)
    
    * Parameter of interest
    
    * Calculated interval

* Conclusion (written to answer the research question)

    * Amount of evidence
    
    * Parameter of interest 
    
    * Direction of the alternative hypothesis

* Scope of inference

    * To what group of observational units do the results apply (target population or observational units similar to the sample)?
	
\newpage

Paragraph (continued):

\newpage
