## Activity 24:  Does behavior impact performance?

\setstretch{1}

### Learning outcomes

* Create a side-by-side boxplot of one categorical explanatory variable and one quantitative response variable

<!-- * Given a research question involving one categorical explanatory variable and one quantitative response variable, construct the null and alternative hypotheses -->
<!--   in words and using appropriate statistical symbols. -->

<!-- * Describe and perform a simulation-based hypothesis test for a difference in means. -->

<!-- * Interpret and evaluate a p-value for a simulation-based hypothesis test for a difference in means. -->

* Use bootstrapping to find a confidence interval for a difference in means.

* Interpret a confidence interval for a difference in means.

* Use a confidence interval to determine the conclusion of a hypothesis test.

### Terminology review

In today's activity, we will use simulation-based methods to analyze the association between one categorical explanatory variable and one quantitative response variable, where the groups formed by the categorical variable are independent. Some terms covered in this activity are:

* Independent groups

* Difference in means

To review these concepts, see Chapter 19 in the textbook.

### Behavior and Performance

A study in the Academy of Management Journal [@porath2017] investigated how rude behaviors influence a victim’s task performance. Randomly selected college students enrolled in a management course were randomly assigned to one of two experimental conditions: rudeness condition (45 students) and control group (53 students). Each student was asked to write down as many uses for a brick as possible in five minutes; this value (total number of uses) was used as a performance measure for each student, where higher values indicate better performance. During this time another individual showed up late for class. For those students in the rudeness condition, the facilitator displayed rudeness by berating the students in general for being irresponsible and unprofessional (due to the late-arriving person). No comments were made about the late-arriving person for students in the control group. Is there evidence that the average performance score for students in the rudeness condition is lower than for students in the control group? Use the order of subtraction of rudeness – control.


``` r
# Read in data set
rude <- read.csv("https://math.montana.edu/courses/s216/data/rude.csv")
```

\newpage


``` r
# Side-by-side box plots
rude %>%
ggplot(aes(x = condition, y = number_of_uses)) +
    geom_boxplot() + 
    labs(title = "Number of Uses for a Brick based on Behavior Condition
         for College Students in a Management Course",
         x = "Behavior") 
```



\begin{center}\includegraphics[width=0.6\linewidth]{12-A24-inference-1ofeach-simulation_files/figure-latex/unnamed-chunk-2-1} \end{center}


``` r
# Summary statistics
rude %>% 
     reframe(favstats(number_of_uses ~ condition))
```

```
#>   condition min Q1 median Q3 max      mean       sd  n missing
#> 1   control   0  6     12 17  30 11.811321 7.382559 53       0
#> 2  rudeness   0  6      9 11  18  8.511111 3.992164 45       0
```


#### Quantitative variables review  {-}

1. Compare the distributions of the number of bricks between the two treatment conditions.

    - What is the shape of each group?
    
\vspace{0.3in}

    - Which group has the higher center?
    
\vspace{0.3in}

    - What group has the larger spread?
\vspace{0.3in}

    - Does either distribution have outliers?

\vspace{.3in}

2.  Is this an experiment or an observational study? Justify your answer.

\vspace{1in}

3. Explain why this is two independent samples and not paired data.
\vspace{1in}

<!-- #### Ask a research question {-} -->

<!-- In this study we are assessing the difference in true mean number of uses for a brick given by college students enrolled in a management course assigned to a rudeness condition and for those assigned to a control group. -->

<!-- 4. What assumption are we making about the difference in true mean? -->

<!-- \vspace{0.8in} -->

<!-- 5.  Write the alternative hypothesis in notation.  -->

<!-- \vspace{0.5in} -->

#### Numerically Summarize the data {-}

4. Calculate the summary statistic of interest (difference in means). What is the appropriate notation for this statistic?

\vspace{0.5in}

| Interpret this calculated value.

\vspace{0.6in}

5. Write out the parameter of interest for this study in context of the study.

    * To write in context:

        - Population word (true, long-run, population)

        - Summary measure (depends on the type of data)

        - Context

            - Observational units

            - Variable(s)
\vspace{1in}

<!-- In this study we are assessing the difference in true mean number of uses for a brick given by college students enrolled in a management course assigned to a rudeness condition and for those assigned to a control group. -->

#### Use statistical inferential methods to draw inferences from the data {-}

<!-- ##### Hypothesis test {-} -->

<!-- Remember that the null distribution is created based on the assumption the null hypothesis is true.  In this study, the null hypothesis states that there is no association between the two variables.  This means that the values observed in the data set would have been the same regardless of the behavior condition. -->

<!-- To demonstrate this simulation, we could create cards to simulate a sample.   -->

<!-- * Write the number of uses for a brick given by each student on one card. -->

<!-- * Mix together and shuffle into two piles, one with 45 cards to represent the rudeness condition and one with 53 cards to represent the control group. -->

<!-- * Calculate the difference in mean number of uses for a brick (rudeness - control) -->

<!-- We will use the `two_mean_test()` function in R (in the `catstats` package) to simulate the null distribution of differences in sample means and compute a p-value.  -->

<!-- ```{r, echo = TRUE, eval = TRUE} -->
<!-- set.seed(216) -->
<!-- two_mean_test(number_of_uses~condition, #Enter the names of the variables -->
<!--               data = rude,  # Enter the name of the dataset -->
<!--               first_in_subtraction = "rudeness", # First outcome in order of subtraction -->
<!--               number_repetitions = 1000,  # Number of simulations -->
<!--               as_extreme_as = -3.3,  # Observed statistic -->
<!--               direction = "less")  # Direction of alternative: "greater", "less", or "two-sided" -->
<!-- ``` -->

<!-- 7.  Report the p-value. Based off of this p-value, write a conclusion to the hypothesis test. -->

<!-- \vspace{0.8in} -->

##### Confidence interval {-}

We will use the `two_proportion_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of differences in sample proportions and calculate a confidence interval. We will need to enter the response variable name and the explanatory variable name for the formula, the data set name (identified above as `rude`), the outcome for the explanatory variable that is first in subtraction, number of repetitions, the outcome for the response variable that is a success (the count for the numerator when calculating a sample proportion), and the confidence level as a decimal.

The response variable name is `number_of_uses` and the explanatory variable name is `condition`.

6. What values should be entered for each of the following into the simulation to create a 99\% confidence interval?
\vspace{.5mm}

* First in subtraction (What is the outcome for the explanatory variable that is used as first in the order of subtraction? `"rudeness"` or `"control"`):

\vspace{.15in}

* Number of repetitions:

\vspace{.15in}
* Confidence level (entered as a decimal):

\vspace{.15in}

Using the R script file for this activity, enter your answers for question 6 in place of the `xx`'s to produce the bootstrap distribution with 1000 simulations; highlight and run lines 16--21.


``` r
two_mean_bootstrap_CI(response ~ explanatory, #Enter the name of the variables
                      data = rude,  # Enter the name of the data set
                      first_in_subtraction = "xx", # First value in order of subtraction
                      number_repetitions = 1000,  # Number of simulations
                      confidence_level = xx)
```

7.  Where is the bootstrap distribution centered?  Explain why.

\vspace{0.8in}

8. Report the bootstrap 99\% confidence interval. 

\vspace{0.4in}

9. What percentile of the bootstrap distribution does the upper value of the confidence interval represent?

\vspace{0.3in}

10. Interpret the 99\% confidence interval. 

\vspace{1in}

### Take-home messages

1.	This activity differs from the activities in Module 11 because the responses are independent, not paired.  These data are analyzed as a difference in means, not a mean difference.  

2. To create one simulated sample on the null distribution for a difference in sample means, label cards with the response variable values from the original data.  Mix cards together and shuffle into two new groups of sizes $n_1$ and $n_2$. Calculate and plot the difference in means.

3. To create one simulated sample on the bootstrap distribution for a difference in sample means, label $n_1 + n_2$ cards with the original response values.  Keep groups separate and randomly draw with replacement $n_1$  times from group 1 and $n_2$ times from group 2.  Calculate and plot the resampled difference in means.  


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered

\newpage
