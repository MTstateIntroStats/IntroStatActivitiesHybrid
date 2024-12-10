# Inference for a Two Categorical Variable: Theory-based Methods

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of a two categorical variables.

### Key topics

Module 9 introduces theory-based hypothesis testing methods and both simulation-based and theory-based confidence intervals for two categorical variables.

Conditions for the sampling distribution of $\hat{p}_1-\hat{p}_2$ to follow an approximate normal distribution:

* **Independence**: The data are independent within and between the two groups. (*Remember*: This also must be true to use simulation methods!)

* **Success-failure condition**: This condition is met if we have at least 10 successes and 10 failures in each sample. Equivalently, we check that all cells in the table have at least 10 observations.

* Calculation of standard error assuming the null is true:

$$SE(\hat{p}_1 - \hat{p}_2) = \sqrt{\hat{p}_{pooled} \times (1-\hat{p}_{pooled}) \times (\frac{1}{n_1}+\frac{1}{n_2})}$$

* Calculation of the standardized difference in sample proportion:

$$t = \frac{\hat{p}_1-\hat{p}_2-0}{SE(\hat{p}_1 - \hat{p}_2)}$$

* Measures the number of standard errors the sample difference in proportions is above or below the null value of zero
    
* Calculation of the difference in sample proportion not assuming the null is true


 $$SE(\hat{p}_1-\hat{p}_2) = \sqrt{\frac{\hat{p}_1 \times  (1-\hat{p}_1)}{n_1}+\frac{\hat{p}_2 \times  (1-\hat{p}_2)}{n_2}}$$
* Calculation of the confidence interval for a difference in sample proportions

$$\hat{p}_1-\hat{p}_2\pm z^*\times SE(\hat{p}_1-\hat{p}_2)$$
\newpage
