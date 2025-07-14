# Exploring Quantitative Data: Inference for a Single Quantitative Variable - Theory-based Methods

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of a single quantitative variable.  

### Key topics

Module 7 will introduce inference using theory-based methods for a single quantitative variable. Additionally, we learn about types of errors and power in hypothesis testing.


#### Theory-based hypothesis testing {-}

* Theory-based methods should give the same results as simulation-based methods if conditions are met. For a single quantitative variable, conditions are met if either the data themselves follow a normal distribution or if the sample size is large enough. We call this the "normality condition."

* **Conditions for the sampling distribution of $\bar{x}$ to follow an approximate normal distribution**:

    * **Independence**: the sample’s observations are independent, e.g., are from a simple random sample. (*Remember*: This also must be true to use simulation methods!)

     * **Normality Condition**: either the sample observations come from a normally distributed population or we have a large enough sample size.  To check this condition, use the following rules of thumb:
     
         - $n < 30$: The distribution of the sample must be approximately normal with no outliers.
         
         - $30 \le n < 100$: We can relax the condition a little; the distribution of the sample must have no extreme outliers or skewness.
         
         - $n \ge 100$: Can assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
         
* **t-distribution**: a theoretical distribution that is bell-shaped with mean zero. Its degrees of freedom determine the variability of the distribution. For very large degrees of freedom, the $t$-distribution is close to a standard normal distribution. For a single quantitative variable, the degrees of freedom are calculated by subtracting one from the sample size: $n-1$. A $t$-distribution with $n-1$ degrees of freedom is denoted by: $t_{n-1}$.

* **Standard error of the sample mean**: measures the how far each possible sample mean is from the true mean, on average, and is calculated using the formula below:
$$SE(\bar{x})=\frac{s}{\sqrt{n}}$$
    where $s$ is the sample standard deviation. 
    
    * For inference involving means, the formula for the standard error will be the same for both hypothesis tests and confidence intervals (unlike inference involving proportions, where the standard error for a hypothesis test used the null value in the calculation).

* **Standardized sample mean**: standardized statistic for a single quantitative variable calculated using:
$$
T = \frac{\bar{x} - \mu_0}{SE(\bar{x})},
$$
    If the conditions for the sampling distribution of $\bar{x}$ to follow an approximate normal distribution are met, and if the true value of $\mu$ is equal to the null value of $\mu_0$, the standardized sample mean, $T$, will have an approximate $t$-distribution with $n-1$ degrees of freedom.

* The theory-based **p-value** for hypothesis testing involving means can be found in R by using the `pt` function to find the probability of the observed standardized statistic or one more extreme (in the direction of $H_A$). This probability is the area under a _$t$-distribution with the appropriate degrees of freedom_ at or more extreme than the observed standardized statistic.

    * `pt` will give you a p-value using the $t$-distribution with a given degrees of freedom (enter for `yy`). For a single mean, `df` = $n - 1$.
    
    * Enter the value of the standardized statistic for `xx`

    * If a "greater than" alternative, change `lower.tail = TRUE` to `FALSE`.
    
    * If a two-sided test, multiply by 2.
    
    
    ``` r
    pt(xx, df = yy, lower.tail=TRUE)
    ```

#### Theory-based confidence interval {-}

* **Margin of error**: half the width of the confidence interval. For a single mean, the margin of error is:
$$ME = t^* \times SE(\bar{x})$$
where $t^*$ is the **multiplier**, corresponding to the desired confidence level found from a $t$-distribution with $n-1$ degrees of freedom and $$SE(\bar{x}) = \frac{s}{\sqrt{n}}.$$ 

* To find the endpoints of a confidence interval, add and subtract the margin of error to the sample statistic. The confidence interval for a population mean is:
$$\bar{x} \pm ME$$

* R code to find the **multiplier** for a confidence interval using theory-based methods involving means.

    * `qt` will give you the multiplier using a $t$-distribution with a given degrees of freedom (enter for `yy`). For a single mean, `df` = $n - 1$.
    
    * Enter the percentile for the given level of confidence (e.g., 0.975 for a 95\% confidence level). 

    
    ``` r
    qt(percentile, df = yy, lower.tail=FALSE)
    ```


### Vocabulary {-}

* **Significance level ($\alpha$)**: a given cut-off value that we compare the p-value to determine a decision of a test.

* **Decisions**: 

    * If the p-value is less than the significance level, we make the decision to _reject the null hypothesis_.
    
    * If the p-value is greater than the significance level, we make the decision to _fail to reject the null hypothesis_.

* **Type 1 Error**: concluding there is evidence to reject the null hypothesis, when the null is actually true.

    * The probability of making a Type 1 error when the null is actually true is equal to the significance level, $\alpha$.

* **Type 2 Error**: concluding there is no evidence to reject the null hypothesis, when the null is actually false.

* **Power**: probability of concluding there is evidence to reject the null hypothesis, when the null is actually false.

    * When the null is actually false, the event "reject the null hypothesis" is the _complement_ of the event "fail to reject the null hypothesis." Thus, power is equal to 1 minus the probability of a Type 2 error.

\newpage
