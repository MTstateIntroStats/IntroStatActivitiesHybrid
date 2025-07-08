# Inference for a Single Categorical Variable: Theory-based Methods

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of a single categorical variable.

### Key topics

Module 4 introduces theory-based inference methods (hypothesis testing and confidence intervals) for a single categorical variable. We also explore what "confidence level" means and which parts of a study impact the width of a confidence interval and the p-value.

* Theory-based methods should give the same results as simulation-based methods if the sample size is large enough. For a single categorical variable, the sample size is large enough if the success-failure condition is met.

* If repeated samples of the same size are taken from the population, 95\% of samples will create a 95\% confidence interval that contains the value of the parameter of interest.

### Vocabulary

* **Theory-based methods**: when specific conditions are met, the distribution of sample statistics if we were to repeatedly sample from the population can be fit with a theoretical distribution.

* **Conditions for the sampling distribution of $\hat{p}$ to follow an approximate normal distribution**:

    * **Independence**: the sample’s observations are independent, e.g., are from a simple random sample. (*Remember*: This also must be true to use simulation-based methods!)

     * **Large enough sample size**: Success-failure condition: we *expect* to see at least 10 successes and 10 failures in the sample, $n\pi\geq10$  and $n(1-\pi)\geq10$. Since $\pi$ is typically unknown, we consider this condition to be met if we observe at least 10 successes and 10 failures in our data set: $n\hat{p}\geq10$  and $n(1-\hat{p})\geq10$.

* **Standard normal distribution**: a theoretical distribution that is bell-shaped, centered on the mean of zero, and has a standard deviation of one, denoted in notation by $N(0,1)$.

* **Standard error of a statistic**: an estimated standard deviation of the statistic as it would vary across repeated samples of the same size under the same conditions.

    * The standard error tells us about how far we would expect an observed sample statistic to fall from the true parameter value for which it is estimating, on average.

* **Standardized statistic**: calculation to standardize the sample statistic in order to compare the standardized value to the theoretical distribution.

    * Calculated by subtracting the null value from the sample statistic, then dividing by the standard error:
    $$\frac{\text{statistic} - \text{null value}}{\text{standard error}}$$

    * Measures the number of standard errors the sample statistic is above (if positive) or below (if negative) the null value.

* **Standard error of the sample proportion assuming the null is true**: measures the how far each possible sample proportion is from the true proportion, on average, and is calculated using the null value:

$$SE_0(\hat{p})=\sqrt{\frac{\pi_0\times(1-\pi_0)}{n}}$$.

* **Standardized sample proportion**: standardized statistic for a single categorical variable calculated using:
$$
Z = \frac{\hat{p} - \pi_0}{SE_0(\hat{p})},
$$
    If the conditions for the sampling distribution of $\hat{p}$ to follow an approximate normal distribution are met, and if the true value of $\pi$ is equal to the null value of $\pi_0$, the standardized sample proportion, $Z$, will have an approximate _standard_ normal distribution.
    
* The theory-based **p-value** for hypothesis testing involving proportions can be found in R by using the `pnorm` function to find the probability of the observed standardized statistic or one more extreme (in the direction of $H_A$). This probability is the area under a _standard normal distribution_ at or more extreme than the observed standardized statistic.

    * Enter the value of the standardized statistic for `xx`.
    
    * If a "greater than" alternative, change `lower.tail = TRUE` to `FALSE`.
    
    * If a two-sided test, multiply by 2.
    
    
    ``` r
    pnorm(xx, lower.tail=TRUE)
    ```


* **Margin of error**: half the width of the confidence interval. For a single proportion, the margin of error is:
$$ME = z^* \times SE(\hat{p})$$
where $z^*$ is the **multiplier**, corresponding to the desired confidence level found from the standard normal distribution. For example, for a 95\% confidence level, the middle 95\% of the standard normal distribution falls between $-z^*=-1.96$ and $z^*=1.96$.
    
* **Standard error of the sample proportion for a confidence interval**  (not assuming the null is true):
$$SE(\hat{p}) = \sqrt{\frac{\hat{p}\times (1-\hat{p})}{n}}$$

* To find the endpoints of a confidence interval, add and subtract the margin of error to the sample statistic. The confidence interval for a population proportion is:

$$\hat{p} \pm ME$$

* R code to find the **multiplier** for the confidence interval using theory-based methods involving proportions.

    * `qnorm` will give you the multiplier using the standard normal distribution.
    
    * Enter the percentile for the given level of confidence (e.g., 0.975 for a 95\% confidence level). 

    
    ``` r
    qnorm(percentile, lower.tail=TRUE)
    ```

    


\newpage
