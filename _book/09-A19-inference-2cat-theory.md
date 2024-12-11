## Activity 19:  Winter Sports Helmet Use and Head Injuries --- Theory-based Methods

\setstretch{1}

### Learning outcomes

* Assess the conditions to use the normal distribution model for a difference in proportions.

* Create and interpret a theory-based confidence interval for a difference in proportions.

* Calculate and interpret the standardized difference in sample proportion 

* Use the standard normal distribution to find the p-value for the test

### Terminology review
In today's activity, we will use theory-based methods to estimate the difference in two proportions. Some terms covered in this activity are:

* Standard normal distribution

* Independence and success-failure conditions

To review these concepts, see Chapter 15 in your textbook.

### Winter sports helmet use and head injury 

In this activity we will focus on theory-based methods to calculate a confidence interval.  The sampling distribution of a difference in proportions can be mathematically modeled using the normal distribution if certain conditions are met.

Conditions for the sampling distribution of $\hat{p}_1-\hat{p}_2$ to follow an approximate normal distribution:

* **Independence**: The data are independent within and between the two groups. (*Remember*: This also must be true to use simulation methods!)

* **Success-failure condition**: This condition is met if we have at least 10 successes and 10 failures in each sample. Equivalently, we check that all cells in the table have at least 10 observations.

A study was reported in "Helmet Use and Risk of Head Injuries in Alpine Skiers and Snowboarders" by Sullheim et. al., [@sulheim2017], on the use of helmets and head injuries for skiers and snowboarders involved in accidents.  The summary results from a random sample of 3562 skiers and snowboarders involved in accidents is shown in the two-way table below. 

|                | Helmet Use | No Helmet Use | Total |
|:--------------:|:----------:|:-------------:|:-----:|
| Head Injury    |     96     |      480      |  576  |
| No Head Injury |     656    |      2330     |  2986 |
| Total          |     752    |      2810     |  3562 |

* Download the R script file from D2L and upload to the RStudio server

* Highlight and run 1--13 to import the data set and create the segmented bar plot


``` r
skiers <- read.csv("https://www.math.montana.edu/courses/s216/data/HeadInjuries.csv") # Read data set in
skiers %>% # Data set piped into...
  ggplot(aes(x = Helmet, fill = Outcome)) +   # This specifies the variables
  geom_bar(stat = "count", position = "fill") +  # Tell it to make a stacked bar plot
  labs(title = "Segmented Bar Plot of Head Injuries for Skiers/Snowboarders
       Involved in Injuries between Helmet Use",  # Make sure to title your plot
       x = "Helmet Use",   # Label the x axis
       y = "") +  # Remove y axis label
  scale_fill_grey()  # Make figure black and white
```



\begin{center}\includegraphics[width=0.6\linewidth]{09-A19-inference-2cat-theory_files/figure-latex/unnamed-chunk-1-1} \end{center}

1. Verify the independence condition is met.

\vspace{0.6in}

2. Verify the success failure condition is met to use theory-based methods.

\vspace{1in}

3. Calculate the difference in sample proportion of skiers and snowboarders involved in accidents with a head injury for those who wear helmets and those who do not.  Use appropriate notation with informative subscripts.

\vspace{0.8in}

<!-- #### Confidence interval {-} -->

<!-- To find a confidence interval for the difference in proportions we will add and subtract the margin of error from the point estimate to find the two endpoints. -->

<!--  $$\hat{p}_1-\hat{p}_2\pm z^*\times SE(\hat{p}_1-\hat{p}_2), \hspace{.2cm} \text{where}$$ -->
<!--  $$SE(\hat{p}_1-\hat{p}_2) = \sqrt{\frac{\hat{p}_1 \times  (1-\hat{p}_1)}{n_1}+\frac{\hat{p}_2 \times  (1-\hat{p}_2)}{n_2}}$$ -->

<!-- In this formula, we use the sample proportions for each group to calculate the standard error for the difference in proportions since we are not assuming that the true difference is zero. -->

<!-- <!-- To calculate the standard error for a difference in proportions to create a 90\% confidence interval we substitute in the two sample proportions and the sample size for each group into the equation above. --> 

<!-- 2. Calculate the standard error for a difference in proportions to find a 90\% confidence interval. -->

<!-- \vspace{0.5in} -->

<!-- <!-- $$n_1 = 752, n_2 = 2810, \hat{p}_h = \frac{96}{752} = 0.128, \hat{p}_n = \frac{480}{2810} = 0.171$$ --> 

<!-- <!--  $$SE(\hat{p}_1-\hat{p}_2) = \sqrt{\frac{0.128\times (1-0.128)}{752}+\frac{0.171\times (1-0.171)}{2810}} = 0.014$$ --> 

<!-- Recall that the $z^*$ multiplier is the percentile of a standard normal distribution that corresponds to our confidence level. If our confidence level is 90\%, we find the Z values that encompass the middle 90\% of the standard normal distribution. If 90\% of the standard normal distribution should be in the middle, that leaves 10\% in the tails, or 5\% in each tail.  The `qnorm()` function in R will tell us the $z^*$ value for the desired percentile (in this case, 90\% + 5\% = 95\% percentile).  -->

<!-- ```{r, echo=TRUE, collapse=FALSE} -->
<!-- qnorm(0.95, lower.tail = TRUE) # Multiplier for 90% confidence interval -->
<!-- ``` -->


<!-- ```{r standNormc, warning=FALSE, out.width="50%"} -->
<!-- openintro::normTail(m = 0, s = 1) -->
<!-- ``` -->

<!-- \vspace{1mm} -->


<!-- Remember that the margin of error is the value added and subtracted to the sample difference in proportions to find the endpoints for the confidence interval. -->

<!-- $$ME = z^*\times SE(\hat{p}_1 - \hat{p}_2)$$ -->

<!-- 3. Using the multiplier of $z^*$ = 1.645 and the calculated standard error, calculate the **margin of error** for a 90\% confidence interval. -->

<!-- \vspace{0.6in} -->

<!-- 4. Calculate the 90\% confidence interval for the parameter of interest.  -->

<!-- \vspace{1in} -->

<!-- 5. Interpret the confidence interval found in question 4 in context of the problem. -->

<!-- \vspace{1in} -->

#### Hypothesis test {-}

4. Write the null and alternative hypotheses in notation. 

|    $H_0$: 
\vspace{0.2in}

|    $H_A$:
\vspace{0.2in}


#### Use statistical analysis methods to draw inferences from the data {-}

To test the null hypothesis, we could use simulation-based methods as we did in the activities in Module 8. In this activity, we will focus on theory-based methods.  Like with a single proportion, the sampling distribution of a difference in sample proportions can be mathematically modeled using the normal distribution if certain conditions are met.

To calculate the standardized statistic we use: 

$$
Z = \frac{(\hat{p_1} - \hat{p_2}) - \text{null value}}{SE_0(\hat{p_1}-\hat{p}_2)},
$$

where the null standard error is calculated using the pooled proportion of successes:

$$
SE_0(\hat{p}_1-\hat{p}_2)=\sqrt{\hat{p}_{pool}\times (1-\hat{p}_{pool})\times \left(\frac{1}{n_1}+\frac{1}{n_2}\right)}.
$$
For this study we would first calculate the pooled proportion of successes.

$$\hat{p}_{pool} = \frac{\text{number of "successes"}}{\text{number of cases}} $$
\vspace{1mm}

5.  Calculate the pooled proportion of head injuries.

\vspace{1in}

6. Use the value for the pooled proportion of successes to calculate the $SE_0(\hat{p}_1 - \hat{p}_2)$ assuming the null hypothesis is true.

\vspace{1in}

7. Use the value of the null standard error to calculate the standardized statistic (standardized difference in proportion).

\vspace{1in}

\newpage

8. Mark the value of the standardized difference in proportion on the standard normal distribution shown below.  Interpret the standardized statistic in context of the problem.

\vspace{1mm}


\begin{center}\includegraphics[width=0.5\linewidth]{09-A19-inference-2cat-theory_files/figure-latex/simpleNormal-1} \end{center}

\vspace{0.6in}

We will use the `pnorm()` function in R to find the p-value. 

* Enter the value of z from question 7 for xx

* Highlight and run lines 18--20


``` r
pnorm(xx, # Enter value of standardized statistic
      m=0, s=1, # Using the standard normal mean = 0, sd = 1
      lower.tail=TRUE) # Gives a p-value less than the standardized statistic
```

9. Write a conclusion to the test.

\vspace{1in}

<!-- ### Effect of sample size  -->

<!-- How would an increase in sample size impact the width of the confidence interval.  Suppose in another sample of skiers and snowboards involved in accidents we saw these results: -->

<!-- |                | Helmet Use | No Helmet Use | Total | -->
<!-- |:--------------:|:----------:|:-------------:|:-----:| -->
<!-- | Head Injury    |     135    |      674      |  809  | -->
<!-- | No Head Injury |     921    |      3270     |  4191 | -->
<!-- | Total          |     1056   |      3944     |  5000 | -->

<!-- Note that the sample proportions for each group are the same as the smaller sample size. -->

<!-- $$\hat{p}_h = \frac{135}{1056}=0.128, \hspace{2mm} \hat{p}_n = \frac{674}{3944}=0.171$$ -->

<!--  $$SE(\hat{p}_1-\hat{p}_2) = \sqrt{\frac{0.128\times (1-0.128)}{1056}+\frac{0.171\times (1-0.171)}{3944}} = 0.012$$ -->
<!-- Margin of Error for 90\% confidence interval: -->

<!-- $$ME = 1.645 \times 0.012 = 0.020$$ -->
<!-- \newpage -->

<!-- 90\% Confidence Interval: -->

<!-- $$(0.128 - 0.171) \pm 0.02$$ -->
<!-- $$(-0.063, -0.023)$$ -->
<!-- 9. How did an increase in sample size impact the width of the confidence interal? -->

<!-- \vspace{0.4in} -->

### How would an increase in sample size impact the p-value of the test? {-}

|                | Helmet Use | No Helmet Use | Total |
|:--------------:|:----------:|:-------------:|:-----:|
| Head Injury    |     135    |      674      |  809  |
| No Head Injury |     921    |      3270     |  4191 |
| Total          |     1056   |      3944     |  5000 |

Note that the sample proportions for each group are the same as the smaller sample size.

$$\hat{p}_h = \frac{135}{1056}=0.128, \hspace{2mm} \hat{p}_n = \frac{674}{3944}=0.171$$

First calculate the pooled proportion of successes.

$$\hat{p}_{pool} = \frac{\text{number of "successes"}}{\text{number of cases}} = \frac{809}{5000} = 0.162$$

We use the value for the pooled proportion of successes to calculate the $SE_0(\hat{p}_1 - \hat{p}_2)$.


$$
SE_0(\hat{p}_1-\hat{p}_2)=\sqrt{0.162 \times (1-0.162)\times \left(\frac{1}{1056}+\frac{1}{3944}\right)} = 0.013
$$
Standardized Statistic Calculation:

$$Z = \frac{0.128 - 0.171 - 0}{0.013} = -3.308$$

Use Rstudio to find the p-value for this new sample.  


``` r
pnorm(-3.308, # Enter value of standardized statistic
      m=0, s=1, # Using the standard normal mean = 0, sd = 1
      lower.tail=TRUE) # Gives a p-value greater than the standardized statistic
```

```
#> [1] 0.000469824
```

10.  How does the increase in sample size affect the p-value?

\vspace{0.4in}


<!-- 10. Calculate the standard error for the difference in sample proportions for this new sample to find a 90\% confidence interval. -->
<!-- \vspace{0.8in} -->


<!-- 11. Calculate the margin of error for a 90\% confidence interval using a multiplier of $z^*$ = 1.645 for this new sample.  Is the margin of error larger or smaller than the margin of error for the original study? -->
<!-- \vspace{.8in} -->

<!-- 12.  Calculate the 90\% confidence interval for this new study using the margin of error from question 10.   -->
<!-- \vspace{.8in} -->

<!-- 13.  Is the confidence interval calculated in question 12 with the larger sample size wider or narrower than the confidence interval in question 6? Why? -->
\vspace{.8in}

### Take-home messages

1. Simulation-based methods and theory-based methods should give similar results for a study *if the validity conditions are met*.  For both methods, observational units need to be independent. To use theory-based methods, additionally, the success-failure condition must be met. Check the validity conditions for each type of test to determine if theory-based methods can be used.

2. When calculating the standard error for the difference in sample proportions when doing a hypothesis test, we use the pooled proportion of successes, the best estimate for calculating the variability *under the assumption the null hypothesis is true*.   

3.  Increasing sample size will result in less sample-to-sample variability in statistics, which will result in a smaller standard error, and a larger standardized statistic.  

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
