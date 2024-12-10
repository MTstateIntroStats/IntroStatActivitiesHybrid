# Inference for Inference for a Paired Mean Difference 

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of paired data.  Module 11 will cover inference using both simulation and theory-based methods.

* The **summary measure** for paired data is the **mean difference**

* Paired differences are treated as a single mean.  Review the summary of Module 6 for interpretations of other summary measures from quantitative data and for the type of plots used.

* R code to find the summary statistics for a paired differences



### Simulation Hypothesis Testing {-}

Hypotheses:

$$H_0: \mu_d = 0$$
$$H_A: \mu_d\left\{
\begin{array}{ll}
< \\
\ne \\
< \\
\end{array}
\right\}
0 $$

* R code to use for **simulation methods** for one paired data to find the p-value, `paired_test`, is shown below. Review the comments (instructions after the #) to see what each should be entered for each line of code.


``` r
paired_test(data = object$differences,   # Vector of differences 
                                         # or data set with column for each group
            shift = xx,   # Shift needed for bootstrap hypothesis test
            as_extreme_as = xx,  # Observed statistic
            direction = "xx",  # Direction of alternative
            number_repetitions = 10000,  # Number of simulated samples for null distribution
            which_first = 1)  # Not needed when using calculated differences
```

### Simulation Confidence Interval {-}

* R code to find the simulation confidence interval using the `paired_bootstrap_CI` function from the `catstats` package.


``` r
paired_bootstrap_CI(data = object$differences, # Enter vector of differences
                    number_repetitions = 10000, # Number of bootstrap samples for CI
                    confidence_level = xx,  # Confidence level in decimal form
                    which_first = 1)  # Not needed when entering vector of differences
```

* The interpretation of the confidence interval is very similar for that of a single mean. Just make sure to add the order of subtraction for the differences.


### Theory-based Methods {-}

* **Conditions for the sampling distribution of $\bar{x}_d$ to follow an approximate normal distribution**:

    * **Independence**: The sample’s observations are independent, e.g., are from a simple random sample. (*Remember*: This also must be true to use simulation methods!)

     * **Large enough sample size: Normality Condition**: The sample observations come from a normally distributed population.  To check use the the following rules of thumb:
     
         - $n < 30$: The distribution of the sample must be approximately normal with no outliers
         
         - $30 \ge n < 100$: We can relax the condition a little; the distribution of the sample must have no extreme outliers or skewness
         
         - $n > 100$: Can assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribuion of individual observationals is not
         
* **t-distribution**: a theoretical distribution that is symmetric with a given degrees of freedom ($n-1$)

    * $t_{n-1}$

* Calculation of standard error:

$$SE(\bar{x}_d) = \frac{s_d}{\sqrt{n}}$$

* Calculation of the standardized sample mean difference:

$$t = \frac{\bar{x}_d-0}{SE(\bar{x}d)}$$

* The following R code is used to find the p-value using theory based methods for a paired data.

    * pt will give you a p-value using the t-distribution with n-1 df (enter for yy)
    
    * Enter the value of the standardized statistic for xx

    * If a greater than alternative, change lower.tail = TRUE to FALSE.
    
    * If a two-sided test, multiply by 2.
    

``` r
pt(xx, df = yy, lower.tail=TRUE)
```

* Calculation of the confidence interval for a difference in sample means

$$\bar{x}_d\pm t^*\times SE(\bar{x}_d)$$

* R code to find the multiplier for the confidence interval using theory-based methods.

   - qt will give you the multiplier using the t-distribution with smallest $n-1$ df (enter for yy)
    
   - Enter the percentile for the given confidence level


``` r
qt(percentile, df=yy, lower.tail=FALSE)
```

\newpage
