## Activity 15:  The Good Samaritan 

\setstretch{1}

### Learning outcomes

* Given a research question involving two categorical variables, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.
  
* Investigate the process of creating a null distribution for two categorical variables

* Find and evaluate a p-value from the null distribution

<!-- * Investigate the process of creating a bootstrap distribution for two categorical variables -->

<!-- * Find and evaluate the confidence interval from the bootstrap distribution -->

### Terminology review
In today's activity, we will use simulation-based methods to analyze two categorical variables. Some terms covered in this activity are:

* Conditional proportion

* Null hypothesis

* Alternative hypothesis

To review these concepts, see Chapter 15 in your textbook.


### The Good Samaritan

Researchers at the Princeton University wanted to investigate influences on behavior [@darley1973].  The researchers randomly selected 67 students from the Princeton Theological Seminary to participate in a study.  Only 47 students chose to participate in the study, and the data below includes 40 of those students (7 students were removed from the study for various reasons).  As all participants were theology majors planning a career as a preacher, the expectation was that all would have a similar disposition when it comes to helping behavior.  Each student was then shown a 5-minute presentation on the Good Samaritan, a parable in the Bible which emphasizes the importance of helping others.  After the presentation, the students were told they needed to give a talk on the Good Samaritan parable at a building across campus.  Half the students were told they were late for the presentation; the other half told they could take their time getting across campus (the condition was randomly assigned).  On the way between buildings, an actor pretending to be a homeless person in distress asked the student for help.  The researchers recorded whether the student helped the actor or not.  The results of the study are shown in the table below.  Do these data provide evidence that those in a hurry will be less likely to help people in need in this situation?  Use the order of subtraction hurry – no hurry.

* Observational units:

* Explanatory variable:

    * Group 1:

* Response variable:

    * Success:
    
\newpage

\begin{center}
\begin{tabular}{|c|c|c|c|}\hline
& Hurry Condition & No Hurry Condition & Total \\ \hline
Helped Actor & 2 & 11 & 13 \\ \hline
Did Not Help Actor & 18 & 9 & 27 \\ \hline
Total & 20 & 20 & 40 \\ \hline
\end{tabular}
\end{center}

These counts can be found in R by using the `count()` function:

* Download the R script file from D2L and upload to the RStudio server.

* Highlight and run lines 1--7 to get the counts for each group.


``` r
# Read data set in
good <- read.csv("https://math.montana.edu/courses/s216/data/goodsam.csv") 
good %>% group_by(Condition) %>% count(Behavior)
```

```
#> # A tibble: 4 x 3
#> # Groups:   Condition [2]
#>   Condition Behavior     n
#>   <chr>     <chr>    <int>
#> 1 Hurry     Help         2
#> 2 Hurry     No help     18
#> 3 No hurry  Help        11
#> 4 No hurry  No help      9
```

#### Ask a research question {-}

The research question as stated above is: Do these data provide evidence that those in a hurry will be less likely to help people in need in this situation? In order to set up our hypotheses, we need to express this research question in terms of parameters. 

Remember, we define the parameter for a single categorical variable as the true proportion of observational units that are labeled as a "success" in the response variable.  

For this study we are identifying two parameters and looking at the difference between these two parameters.  

* $\pi_\text{hurry}$ = long-run proportion of Princeton Theological Seminary students assigned to hurry that helped the actor

* $\pi_\text{no hurry}$ = long-run proportion of Princeton Theological Seminary students assigned not to hurry that helped the actor

**Parameter of interest in context of the study:**

\vspace{1in}

When comparing two groups, we assume the two parameters are equal in the null hypothesis---there is no association between the variables.

**Null Hypothesis (in words):**

\vspace{1in}

**Null Hypothesis (in notation):**

\vspace{0.3in}

**Alternative Hypothesis (in words):**

\vspace{1in}

**Alternative Hypothesis (in notation):**

\vspace{0.3in}

#### Summarize and visualize the data {-}

To create the segmented bar plot:

* Enter the name of the explanatory variable for explanatory

* Enter the name of the response variable for response

* Highlight and run lines 13--20


``` r
good %>%
  ggplot(aes(x = explanatory, fill = response))+ #Enter the variables to plot
  geom_bar(stat = "count", position = "fill") +
  labs(title = "Segmented Bar Plot of Princeton Seminary Students that Help the actor \nbetween those that were in a Hurry and those that were Not in a Hurry",  #Title your plot
       y = "Relative Frequency", #y-axis label
       x = "Condition") + #x-axis label
  scale_fill_grey()
```

1. Based on the segmented bar plot, is there an association between whether a Seminary student helps the actor and condition assigned?  

\vspace{0.4in}

2. Using the two-way table given in the introduction, calculate the conditional proportion of students in the hurry condition who helped the actor.  Use appropriate notation.

\vspace{.3in}

3. Using the two-way table given in the introduction, calculate the conditional proportion of students in the no hurry condition who helped the actor. Use appropriate notation.

\vspace{.3in}

4.  Calculate the summary statistic (difference in sample proportion) for this study.  Use Hurry - No hurry as the order of subtraction.  Use appropriate notation. 

\vspace{0.5in}

**Interpretation of the summary statistic:**

The proportion of Princeton Theological Seminary students that helped the actor is 0.45 less for those assigned to hurry compared to those assigned not to hurry.

#### Hypothesis Test {-}

We will now simulate a **null distribution** of sample differences in proportions. The null distribution is created under the assumption the null hypothesis is true.

5. Using the cards provided by your instructor, simulate one sample under the assumption the null hypothesis is true.

* Start with 40 cards (13 labeled helped, 27 labeled did not help)

* Mix the cards together

* Shuffle the cards into two piles (20 in hurry, 20 in no hurry)

* Calculate the proportion of simulated students that helped in each group.

* Report the difference in proportion of simulated students that helped (hurry - no hurry)

The segmented bar plot below shows the relationship between the variables for **one simulation assuming the null hypothesis is true**.




\begin{center}\includegraphics[width=0.6\linewidth]{08-A15-inference-2cat-simulation_files/figure-latex/unnamed-chunk-4-1} \end{center}

To create the null distribution of differences in sample proportions, we will use the `two_proportion_test()` function in R (in the `catstats` package).  We will need to enter the response variable name and the explanatory variable name for the formula, the data set name (identified above as `good`), the outcome for the explanatory variable that is first in subtraction, number of repetitions, the outcome for the response variable that is a success (what the numerator counts when calculating a sample proportion), and the direction of the alternative hypothesis.

The response variable name is `Behavior` and the explanatory variable name is `Condition`.

6.  What inputs should be entered for each of the following to create the simulation?
\vspace{1mm}

* First in subtraction (What is the outcome for the explanatory variable that is used as first in the order of subtraction? `"Hurry"` or `"No hurry"`):

\vspace{.15in}
* Number of repetitions:

\vspace{.15in}
* Response value numerator (What is the outcome for the response variable that is considered a success? `"Help"` or `"No help"`):

\vspace{.15in}
* As extreme as (enter the value for the sample difference in proportions):

\vspace{.15in}
* Direction (`"greater"`, `"less"`, or `"two-sided"`):

\vspace{.15in}

Using the R script file for this activity, enter your answers for question 6 in place of the `xx`'s to produce the null distribution with 10000 simulations; highlight and run lines 24--30.


``` r
two_proportion_test(formula = Behavior~Condition, # response ~ explanatory
    data = good, # Name of data set
    first_in_subtraction = "Hurry", # Order of subtraction: enter the name of Group 1
    number_repetitions = 10000, # Always use a minimum of 10000 repetitions
    response_value_numerator = "Help", # Define which outcome is a success
    as_extreme_as = -0.45, # Calculated observed statistic (difference in sample proportions)
    direction="less") # Alternative hypothesis direction ("greater","less","two-sided")
```



\begin{center}\includegraphics[width=0.7\linewidth]{08-A15-inference-2cat-simulation_files/figure-latex/unnamed-chunk-5-1} \end{center}

#### Notes on the null distribution {-}

\vspace{1.6in}

7. Interpret the p-value in context of the study.

\vspace{1in}

\newpage

#### Confidence interval {-}

We can also estimate the parameter of interest by finding a confidence interval.

We will use the `two_proportion_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of differences in sample proportions and calculate a 90\% confidence interval. We will need to enter the response variable name and the explanatory variable name for the formula, the data set name (identified above as `good`), the outcome for the explanatory variable that is first in subtraction, number of repetitions, the outcome for the response variable that is a success (what the numerator counts when calculating a sample proportion), and the confidence level as a decimal.

8.  What inputs should be entered for each of the following to create the bootstrap simulation?
\vspace{1mm}

* First in subtraction (What is the outcome for the explanatory variable that is used as first in the order of subtraction? `"Hurry"` or `"No hurry"`):

\vspace{.15in}
* Number of repetitions:

\vspace{.15in}
* Response value numerator (What is the outcome for the response variable that is considered a success? `"Help"` or `"No help"`):

\vspace{.15in}
* confidence_level:

\vspace{.15in}

* Fill in the missing values/names in the R script file in the two_proportion_bootstrap_CI function to create a simulation 90\% confidence interval.  

* Highlight and run lines ...


``` r
two_proportion_bootstrap_CI(formula = Behavior~Condition, 
         data=good, # Name of data set
         first_in_subtraction = "Hurry", # Order of subtraction: enter the name of Group 1
         response_value_numerator = "Help", # Define which outcome is a success 
         number_repetitions = 10000, # Always use a minimum of 10000 repetitions
         confidence_level = 0.9) # Enter the level of confidence as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{08-A15-inference-2cat-simulation_files/figure-latex/unnamed-chunk-6-1} \end{center}

9.  Report the 90\% confidence interval.

\vspace{0.3in}

\newpage

10. Interpret the confidence interval in context of the problem.

\vspace{1in}

11. Write a conclusion, including the scope of inference, in context of the study.

\vspace{1in}

### Take-home messages

1.	When comparing two groups, we are looking at the difference between two parameters.  In the null hypothesis, we assume the two parameters are equal, or that there is no difference between the two proportions.  

<!-- 2.  We use the same guidelines for the strength of evidence as we did in Activity 6A.   -->

2. To create one simulated sample on the null distribution for a difference in sample proportions, label $n_1 + n_2$ cards with the response variable outcomes from the original data. Mix cards together and shuffle into two new groups of sizes $n_1$ and $n_2$, representing the explanatory variable groups. Calculate and plot the difference in proportion of successes.


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
