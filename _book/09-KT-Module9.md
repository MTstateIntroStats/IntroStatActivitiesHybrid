# Theory-based Hypothesis Testing and Confidence Intervals for Two Categorical Variables: 

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of two categorical variables.

### Key topics

Module 9 introduces theory-based hypothesis testing methods and theory-based confidence intervals for two categorical variables.

### Vocabulary

#### Theory-based inference {-}

* **Conditions for the sampling distribution of $\hat{p}_1-\hat{p}_2$ to follow an approximate normal distribution**: The following conditions must be met in order to use theory-based methods for two categorical variables.

    * **Independence**: the sample's observations are independent both within and between the two groups. (*Remember*: This also must be true to use simulation-based methods!)

    * **Success-failure condition**: we *expect* to see at least 10 successes and 10 failures in the _each_ sample. We consider this condition to be met if we observe at least 10 successes and 10 failures in our data set in both groups: $n_1\hat{p}_1\geq10$, $n_1(1-\hat{p}_1)\geq10$, $n_2\hat{p}_2\geq10$, and $n_2(1-\hat{p}_2)\geq10$. Equivalently, we check that all four cells in the table have at least 10 observations.

* **Standard error of a difference in sample proportions assuming the null is true**:
$$SE_0(\hat{p}_1 - \hat{p}_2) = \sqrt{\hat{p}_{pooled} \times (1-\hat{p}_{pooled}) \times \left(\frac{1}{n_1}+\frac{1}{n_2}\right)}$$
where $\hat{p}_{pooled}$ is the **pooled sample proportion**: the total number of successes divided by the total sample size ($n_1+n_2$).

* **Standardized difference in sample proportion**:
$$Z = \frac{\hat{p}_1-\hat{p}_2-0}{SE_0(\hat{p}_1 - \hat{p}_2)}$$
    * Measures the number of standard errors the sample difference in proportions is above or below the null value of zero
    
    * If the conditions for the sampling distribution of $\hat{p}_1 - \hat{p}_2$ to follow an approximate normal distribution are met, and if the true difference in proportions is equal to zero, the standardized difference in sample proportions, $Z$, will have an approximate _standard_ normal distribution.
    
    * Use the `pnorm` function in R to find a theory-based p-value for a hypothesis test involving a difference in proportions by finding the area under a standard normal distribution where $Z$ is as or more extreme as the value observed (in the direction of $H_A$).
    

* **Standard error of a difference in sample proportions for a confidence interval** (not assuming the null is true):
$$SE(\hat{p}_1-\hat{p}_2) = \sqrt{\frac{\hat{p}_1 \times (1-\hat{p}_1)}{n_1}+\frac{\hat{p}_2 \times  (1-\hat{p}_2)}{n_2}}$$

    * Calculation of the confidence interval for a difference in sample proportions:
$$\hat{p}_1-\hat{p}_2\pm z^*\times SE(\hat{p}_1-\hat{p}_2)$$
    * Use the `qnorm` function in R to find the $z^*$ multiplier.
    

\newpage
