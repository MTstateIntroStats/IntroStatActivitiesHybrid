## Out-of-Class Activity Module 13:  Does behavior impact performance?

\setstretch{1}

### Learning outcomes

* Given a research question involving one categorical explanatory variable and one quantitative response variable, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.

* Describe and perform a simulation-based hypothesis test for a difference in means.

* Interpret and evaluate a p-value for a simulation-based hypothesis test for a difference in means.

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


```r
# Read in data set
rude <- read.csv("https://math.montana.edu/courses/s216/data/rude.csv")
```

\newpage


```r
# Side-by-side box plots
rude %>%
ggplot(aes(x = condition, y = number_of_uses)) +
    geom_boxplot() + 
    labs(title = "Number of Uses for a Brick based on Behavior Condition
         for College Students in a Management Course",
         x = "Behavior") 
```



\begin{center}\includegraphics[width=0.6\linewidth]{12-OCA09-inference-1ofeach-simulation_files/figure-latex/unnamed-chunk-2-1} \end{center}


```r
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

1. The two variables assessed in this study are behavior and number of uses for a brick.  Identify the role for each variable (explanatory or response).

\vspace{.4in}

2. Which group (control or rudeness) has the highest center in the distributions of number of uses for a brick? Explain which measure of center you are using. 

\vspace{.4in}

3.  Using the side-by-side box plots, which group has the largest spread in number of uses for a brick?  How did you make that choice?

\vspace{.4in}

4.  Is this an experiment or an observational study? Justify your answer.

\vspace{1in}

5.  Is this a paired data set or two independent groups?  Explain your reasoning.

\vspace{1in}

#### Ask a research question {-}

6.  Write out the parameter of interest in context of the study.  Use proper notation and be sure to define your subscripts.  

\vspace{1in}

7.  Write out the null hypothesis in words.

\vspace{1in}

8.  Write the alternative hypothesis in notation. 

\vspace{0.5in}

#### Summarize and visualize the data {-}

9. Calculate the summary statistic of interest (difference in means). What is the appropriate notation for this statistic?

\vspace{0.5in}

#### Use statistical inferential methods to draw inferences from the data {-}

##### Hypothesis test {-}

Remember that the null distribution is created based on the assumption the null hypothesis is true.  In this study, the null hypothesis states that there is no association between the two variables.  This means that the values observed in the data set would have been the same regardless of the behavior condition.

To demonstrate this simulation, we could create cards to simulate a sample.  

10.  How many cards would we start with?

\vspace{0.3in}

11.  What would we write on each card?

\vspace{0.3in}

\newpage

12.  Next, we would mix the cards together and shuffle into two piles.  How many cards will go into each pile?  What should we label the piles?

\vspace{.8in}

13.  What value would be calculated from the cards and plotted on the null distribution?  *Hint*: What statistic are we calculating from the data?

\vspace{0.3in}

14.  Would you expect your simulated statistic to be closer to the null value of zero than the difference in means calculated from the sample?  Explain why this makes sense.

\vspace{0.8in}

We will use the `two_mean_test()` function in R (in the `catstats` package) to simulate the null distribution of differences in sample means and compute a p-value. 

15.  When using the `two_mean_test()` function, we need to enter the name of the response variable, `number_of_uses`, and the name of the explanatory variable, `condition`, for the formula.  The name of the data set as shown above is `rude`.  What values should be entered for each of the following to create 1000 simulated samples?

* First in subtraction (What is the outcome for the explanatory variable that is used as first in the order of subtraction? `"control"` or `"rudeness"`):

\vspace{.2in}
* Number of repetitions:
    
\vspace{.2in}
* As extreme as:
    
\vspace{.2in}
* Direction (`"greater"`, `"less"`, or `"two-sided"`):

\vspace{.2in}

The code below will simulate a null distribution and compute the p-value. Check that your answers from question 15 match what is entered below.


```r
set.seed(216)
two_mean_test(number_of_uses~condition, #Enter the names of the variables
              data = rude,  # Enter the name of the dataset
              first_in_subtraction = "rudeness", # First outcome in order of subtraction
              number_repetitions = 1000,  # Number of simulations
              as_extreme_as = -3.3,  # Observed statistic
              direction = "less")  # Direction of alternative: "greater", "less", or "two-sided"
```



\begin{center}\includegraphics[width=0.7\linewidth]{12-OCA09-inference-1ofeach-simulation_files/figure-latex/unnamed-chunk-4-1} \end{center}

16.  Report the p-value. Based off of this p-value, write a conclusion to the hypothesis test.

\vspace{0.8in}

##### Confidence interval {-}

We will use the `two_mean_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of differences in sample means and calculate a 95\% confidence interval. 


```r
set.seed(216)
two_mean_bootstrap_CI(number_of_uses ~ condition, #Enter the name of the variables
                      data = rude,  # Enter the name of the data set
                      first_in_subtraction = "rudeness", # First value in order of subtraction
                      number_repetitions = 1000,  # Number of simulations
                      confidence_level = 0.95)
```



\begin{center}\includegraphics[width=0.7\linewidth]{12-OCA09-inference-1ofeach-simulation_files/figure-latex/unnamed-chunk-5-1} \end{center}

17.  Report the 95\% confidence interval.

\vspace{0.3in}

18. Interpret the interval reported in question 17. 

\vspace{1in}


### Take-home messages

1.	This activity differs from the activities in Week 11 because the responses are independent, not paired.  These data are analyzed as a difference in means, not a mean difference.  

2. To create one simulated sample on the null distribution for a difference in sample means, label cards with the response variable values from the original data.  Mix cards together and shuffle into two new groups of sizes $n_1$ and $n_2$. Calculate and plot the difference in means. 

3. To create one simulated sample on the bootstrap distribution for a difference in sample means, label $n_1 + n_2$ cards with the original response values.  Keep groups separate and randomly draw with replacement $n_1$  times from group 1 and $n_2$ times from group 2.  Calculate and plot the resampled difference in means.  


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered

\newpage

