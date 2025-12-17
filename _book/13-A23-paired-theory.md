## Activity 23:  Color Interference

<!-- Data set source: http://users.stat.ufl.edu/~winner/datasets.html -->
<!-- Data simulated to match means and SDs in article. -->

\setstretch{1}

### Learning outcomes

* Given a research question involving paired differences, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.
  
* Describe and perform a theory-based hypothesis test for a paired mean difference.

* Interpret and evaluate a p-value for a theory-based hypothesis test for a paired mean difference.

* Use theory-based methods to find a confidence interval for a paired mean difference.

* Interpret a confidence interval for a paired mean difference.

### Terminology review

In today's activity, we will analyze paired quantitative data using theory-based methods. Some terms covered in this activity are:

* Paired data

* Mean difference

* Normality

* $t$-distribution

* Degrees of freedom

* T-score

To review these concepts, see Chapter 18 in the textbook.

### Color Interference

The abstract of the article "Studies of interference in serial verbal reactions" in the _Journal of Experimental Psychology_ [@stroop1935] reads:

> In this study pairs of conflicting stimuli, both being inherent aspects of the same symbols, were presented simultaneously (a name of one color printed in the ink of another color---a word stimulus and a color stimulus).
> The difference in time for reading the words printed in colors and the same words printed in black is the measure of interference of color stimuli upon reading words. ...
> The interference of conflicting color stimuli upon the time for reading 100 words (each word naming a color unlike the ink-color of its print) caused an increase of 2.3 seconds or 5.6% over the normal time for reading the same words printed in black.

The article reports on the results of a study in which seventy college undergraduates were given forms with 100 names of colors written in black ink, and the same 100 names of colors written in another color (i.e., the word purple written in green ink).  The total time (in seconds) for reading the 100 words printed in black, and the total time (in seconds) for reading the 100 words printed in different colors were recorded for each subject. The order in which the forms (black or color) were given was randomized to the subjects. Does printing the name of colors in a different color increase the time it takes to read the words?  Use color $-$ black as the order of subtraction.

* Observational units:

* Explanatory variable:

* Response variable:

#### Identify the scenario {-}

1. Should these observations be considered paired or independent?  Explain your answer.
\vspace{0.5in}

2.  Based on your answer to question 1, is the appropriate summary measure to be used to analyze these data the difference in mean times or the mean difference in times?
\vspace{0.25in}

#### Ask a research question {-}

Does printing the name of colors in a different color increase the time it takes to read the words?

**Parameter of interest in context of the study:**

\vspace{1in}

**Null Hypothesis (in words):**

\vspace{1in}

**Null Hypothesis (in notation):**

\vspace{0.3in}

**Alternative Hypothesis (in words):**

\vspace{1in}

**Alternative Hypothesis (in notation):**

\vspace{0.3in}

In general, the sampling distribution for a sample mean, $\bar{x}$, based on a sample of size $n$ from a population with a true mean $\mu$ and true standard deviation $\sigma$ can be modeled using a Normal distribution when certain conditions are met.  Note, that since we are treating paired data as a single mean, the conditions are the same as for a single mean.

Conditions for the sampling distribution of $\bar{x}$ to follow an approximate Normal distribution:

* **Independence**: the sample’s observations are independent, e.g., are from a simple random sample. (*Remember*: This also must be true to use simulation methods!)

* **Normality Condition**: either the sample differences come from a normally distributed population or we have a large enough sample size.  To check this condition, use the following rules of thumb:

    - $n < 30$: If the sample size $n$ is less than 30 and the distribution of the data is approximately normal with no clear outliers in the data, then we typically assume the data come from a nearly normal distribution to satisfy the condition.

    - $30 \leq n < 100$: If the sample size $n$ is between 30 and 100 and there are no particularly extreme outliers in the data, then we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
    
    - $n \geq 100$: If the sample size $n$ is at least 100 (regardless of the presence of skew or outliers), we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
 
#### Summarize and visualize the data {-}

Since the original data from the study are not available, we simulated data to match the means and standard deviations reported in the article. We will use these simulated data in the analysis below.

<!-- Means of original data: 43.30 s (color), 41.00 (black) -->
<!-- SDs of original data: 6.15 s (color) 4.84 (black) -->

The following code plots each subject's time to read the colored words (above) and time to read the black words (below) connected by a grey line, a histogram of the differences in time to read words between the two conditions, and a boxplot displaying the pairwise differences in time (color $-$ black).

* Download the R script file for this activity and upload to the R studio server.

* Follow the instructions given in the R file to create the paired plot and boxplot of the differences.


``` r
color <- read.csv("https://math.montana.edu/courses/s216/data/interference.csv")
paired_observed_plot(color)

color_diff <- color %>% 
  mutate(differences = DiffCol-Black)
color_diff %>%
  ggplot(aes(x = differences))+
  geom_boxplot()+
  labs(title="Boxplot of the Difference in Time (seconds) to 
  Read Words Between Color and Black for College 
  Undergraduates",
       x = "Differences in time (sec) to read words (Color - Black)") +
        theme(axis.text.y = element_blank(), 
          axis.ticks.y = element_blank()) # Removes y-axis ticks
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-A23-paired-theory_files/figure-latex/unnamed-chunk-1-1} \includegraphics[width=0.7\linewidth]{13-A23-paired-theory_files/figure-latex/unnamed-chunk-1-2} \end{center}

The following code gives the summary statistics for the pairwise differences.

* Enter the variable `differences` for variable 

* Highlight and run lines 23--24


``` r
color_diff %>% 
  summarise(favstats(differences))
```

```
#>      min     Q1 median     Q3   max mean       sd  n missing
#> 1 -16.42 -2.925   2.15 7.0325 17.27  2.3 7.810196 70       0
```

#### Check theoretical conditions {-}

3.  How do you know the independence condition is met for these data?
\vspace{0.6in}

4. Is the normality condition met to use the theory-based methods for analysis?  Explain your answer.
\vspace{0.8in}

#### Use statistical inferential methods to draw inferences from the data {-}


To find the standardized statistic for the paired differences we will use the following formula:

$$T = \frac{\bar{x}_d - \mu_0}{SE(\bar{x}_d)},$$
where the standard error of the sample mean difference is:

$$SE(\bar{x}_d)=\frac{s_d}{\sqrt{n}}.$$

5.  Calculate the standard error of the sample mean difference.

\vspace{0.5in}

6.  How many standard errors is the observed mean difference from the null mean difference?

\vspace{0.5in}

To find the p-value 

* Enter the value for the standardized statistic for xx in the pt function.  

* For a single sample or paired data, degrees of freedom are found by subtracting 1 from the sample size.  You should therefore use `df` = $n-1 = 70 - 1 = 69$ and `lower.tail = FALSE` to find the p-value.  

* Enter the df for yy in the pt function.

* Enter the direction (=TRUE for less, =FALSE for greater) for zz

* Highlight and run line 30


``` r
pt(xx, df=yy, lower.tail=zz)
```
7.  What does this p-value mean, in the context of the study?  Hint: it is the probability of what...assuming what?
\vspace{1in}

Next we will calculate a theory-based confidence interval.  To calculate a theory-based confidence interval for the paired mean difference, use the following formula:

$$\bar{x}_d\pm t^* \times SE(\bar{x}_d).$$

\newpage

We will need to find the $t^*$ multiplier using the function `qt()`. 

* Enter the appropriate percentile in the R code to find the multiplier for a 90\% confidence interval.

* Enter the df for yy. 

* Highlight and run line 36


``` r
qt(percentile, df = yy, lower.tail=TRUE)
```

\vspace{1mm}

8.  Calculate the margin of error for the true paired mean difference using theory-based methods.

\vspace{0.6in}

9.  Calculate the confidence interval for the true paired mean difference using theory-based methods.

\vspace{0.6in}


10.  Interpret the confidence interval in context of the study.

\vspace{1in}

11.  Write a conclusion to the test in context of the study.
\vspace{0.6in}

### Simulation Hypothesis Test {-}

Like with a single mean, for paired data we will need to *shift* each data point by the difference $\mu_0 - \bar{x}_d$.  

We will use the `paired_test()` function in R (in the `catstats` package) to simulate the shifted bootstrap (null) distribution of sample mean differences and compute a p-value. 

* Use the provided R script file and enter the values for the xx's to find the p-value.  

* Highlight and run lines 41--47.


``` r
set.seed(216)
paired_test(data = color_diff$differences,   # Vector of differences
            shift = -2.3,   # Shift needed for bootstrap hypothesis test
            as_extreme_as = 2.3,  # Observed statistic
            direction = "greater",  # Direction of alternative
            number_repetitions = 10000,  # Number of simulated samples for null distribution
            which_first = 1)  # Not needed when using calculated differences
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-A23-paired-theory_files/figure-latex/unnamed-chunk-5-1} \end{center}

### Simulation confidence interval {-}

We will use the `paired_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample mean differences and calculate a 90\% confidence interval. 

* Enter the missing value for the xx's

* Highlight and run lines 52--55.


``` r
set.seed(216)
paired_bootstrap_CI(data = color_diff$differences, # Enter vector of differences
                    number_repetitions = 10000, # Number of bootstrap samples for CI
                    confidence_level =0.9,  # Confidence level in decimal form
                    which_first = 1)  # Not needed when entering vector of differences
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-A23-paired-theory_files/figure-latex/unnamed-chunk-6-1} \end{center}

\newpage 

### Take-home messages

1.  In order to use theory-based methods for dependent groups (paired data), the independent observational units and normality conditions must be met.  

2.  A T-score is compared to a $t$-distribution with $n - 1$ df in order to calculate a one-sided p-value. To find a two-sided p-value using theory-based methods we need to multiply the one-sided p-value by 2.  

3.  A $t^*$ multiplier is found by obtaining the bounds of the middle X% (X being the desired confidence level) of a $t$-distribution with $n - 1$ df.


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered

\newpage
