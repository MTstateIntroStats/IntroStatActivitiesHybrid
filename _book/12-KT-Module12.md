# Inference for a Quantitative Response with Independent Samples

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of a categorical explanatory variable and a quantitative response variable for independent samples.  Module 12 will cover both simulation and theory-based methods of inference.

Types of plot for independent variables

* **Side-by-side boxplots**: plots a boxplot of the five number summary for each categorical level

* R code to create side-by-side boxplots:


``` r
object %>%  # Data set piped into...
  ggplot(aes(y = response, x = explanatory))+  # Identify variables
  geom_boxplot()+  # Tell it to make a box plot
  labs(title = "Don't forget to include a title",  # Title: should include the type of plot,
       # observational units, variables
       x = "x-axis label",    # x-axis label
       y = "y-axis label")  # y-axis label
```

* **Stacked histogram**: plots one histogram for each level of the categorical variable

* **Stacked dotplots**: plots one dotplot for each level of the categorical variable

* Four characteristics to compare boxplots

    - Shape  (symmetric or skewed)
    
    - Center 
    
    - Spread
    
    - Outliers?

Summary measure

* **Difference in mean**: measures the difference in mean values between the two categorical groups

- Parameter notation for difference in means: $\mu_1 - \mu_2$, where 1 represents the 1st group of the explanatory variable and 2 represents the 2nd group
    
- Sample notation for difference in means: $\bar{x}_1 - \bar{x}_2$

\vspace{1mm}

* R code to find the summary statistics 

    * Note: review the interpretations of the other summary measures from Module 6


``` r
object %>%
  reframe(favstats(response~explantory))
```

### Hypothesis Testing {-}

Hypotheses:

$$H_0: \mu_1 - \mu_2 = 0 ~ \text{or}~ H_0: \mu_1 = \mu_2 $$
$$H_A: \mu_1 - \mu_2 \left\{
\begin{array}{ll}
< \\
\ne \\
< \\
\end{array}
\right\}
0 
~ \text{or} ~ H_A:
\mu_1 \left\{
\begin{array}{ll}
< \\
\ne \\
< \\
\end{array}
\right\}
\mu_2 $$

### Simulation Hypothesis Testing {-}

* R code for simulation methods to find the p-value using the `two_mean_test` function in the `catstats` package.


``` r
two_mean_test(response~explanatory, #Enter the names of the variables 
               data = object,  # Enter the name of the dataset
              first_in_subtraction = "xx", # First outcome in order of subtraction 
               number_repetitions = 10000,  # Number of simulations 
               as_extreme_as = -xx,  # Observed statistic 
               direction = "xx")  # Direction of alternative: "greater", "less", or "two-sided"
```


### Simulation Confidence Interval {-}

* R code to find the simulation confidence interval using the `twomean_bootstrap_CI` function from the `catstats` package.


``` r
two_mean_bootstrap_CI(response ~ explanatory, #Enter the name of the variables
                      data = object,  # Enter the name of the data set
                      first_in_subtraction = "xx", # First value in order of subtraction
                      number_repetitions = 10000,  # Number of simulations
                      confidence_level = xx)
```

* Review how to interpret the confidence interval for two groups from Module 8

### Theory-based methods {-}

* **Conditions for the sampling distribution of $\bar{x}_1 - \bar{x}_2$ to follow an approximate normal distribution**:

    * **Independence**: The sample’s observations are independent, e.g., are from a simple random sample and there is independence between groups. (*Remember*: This also must be true to use simulation methods!)

     * **Normality Condition**: Either the sample observations come from a normally distributed population or we have a large enough sample size.  When we have two samples, we need to check this condition for each group! To check this condition, use the following rules of thumb (for both $n_1$ and $n_2$):
     
         - $n < 30$: The distribution of the sample must be approximately normal with no outliers.
         
         - $30 \le n < 100$: We can relax the condition a little; the distribution of the sample must have no extreme outliers or skewness.
         
         - $n \ge 100$: Can assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
         
* **t-distribution**: a theoretical distribution that is symmetric with a given degrees of freedom smallest sample size minus 1 ($n-1$)

$$t_{n-1}$$

* Calculation of standard error:

$$SE(\bar{x}_1 - \bar{x}_2) = \sqrt{\frac{{s_1}^2}{n_1}+\frac{{s_2}^2}{n_2}}$$

* Calculation of the standardized difference in sample mean:

$$t = \frac{\bar{x}_1-\bar{x}_2-0}{SE(\bar{x}_1 - \bar{x}_2)}$$

* The p-value can be found by using the pt function.

    * Enter the value of the standardized statistic for xx
    
    * Enter the df smallest $(n-1)$ for yy
    
    * If a greater than alternative, change lower.tail = TRUE to FALSE.
    
    * If a two-sided test, multiply by 2.


``` r
pt(xx, df = yy, lower.tail=TRUE)
```

### Theory-based methods to find the confidence interval {-}

* Calculation of the confidence interval for a difference in sample means

$$\bar{x}_1-\bar{x}_2\pm t^*\times SE(\bar{x}_1-\bar{x}_2)$$

* R code to find the multiplier for the confidence interval using theory-based methods.

    * qt will give you the multiplier using the t-distribution with smallest $n-1$ df (enter for yy)
    
    * Enter the percentile for the given confidence level


``` r
qt(percentile, df=yy, lower.tail=FALSE)
```


\newpage
