# Inference for a Single Categorical Variable: Theory-based Methods

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of a single categorical variable.

* **Theory-based methods**: when specific conditions are met, a data can be fit with a theoretical distribution

* **Conditions for the sampling distribution of $\hat{p}$ to follow an approximate normal distribution**:

    * **Independence**: The sample’s observations are independent, e.g., are from a simple random sample. (*Remember*: This also must be true to use simulation methods!)

     * **Large enough sample size: Success-failure condition**: We *expect* to see at least 10 successes and 10 failures in the sample, $n\hat{p}≥10$  and $n(1-\hat{p})≥10$.

* **Standardized statistic**: calculation to standardize the sample statistic in order to compare the standardized value to the theoretical distribution

    * Measures the number of standard errors the sample statistic is from the null value.

* **Standard normal distribution**: a theoretical distribution that is symmetric centered on the mean of zero with a standard deviation of one

    * $N(0,1)$

* **Standardized sample proportion**: standardized statistic for a single categorical variable calculated using:

$$
Z = \frac{\hat{p} - \pi_0}{SE_0(\hat{p})},
$$

* **Standard error of the sample proportion assuming the null is true**: measures the how far each possible sample proportion is from the true proportion, on average and is calculated using the null value:

$$SE_0(\hat{p})=\sqrt{\frac{\pi_0\times(1-\pi_0)}{n}}$$.

* **Margin of error**: half the width of the confidence interval

$$ME = z^* \times SE(\hat{p})$$
    
* **Standard error of the sample proportion for a confidence interval**

$$SE(\hat{p}) = \sqrt{\frac{\hat{p}\times (1-\hat{p})}{n}}$$

\newpage

* To find the confidence interval add and subtract the margin of error to the sample statistic

$$\hat{p} \pm ME$$
    
### Key topics

* Theory-based methods should give the same results as simulation based methods if the sample size is large enough (success-failure condition is met).

* If repeat samples of the same size are taken from the population, 95\% of samples will create a 95\% confidence interval that contains the parameter of interest.



\newpage