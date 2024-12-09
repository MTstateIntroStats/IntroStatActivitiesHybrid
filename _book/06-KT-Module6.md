# Inference for a Single Quantitative Variable

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of a single quantitative variable.

* The **summary measure** for one quantitative variable is the **mean**

* R code to use for simulation methods for one quantitative variable to find the p-value, one_mean_test, is shown below.  


``` r
one_mean_test(variable,#Enter the name of the variable
  summary_measure = "mean",  #Can choose between mean or median
  shift = xx, #Difference between the null value and the sample mean
  as_extreme_as = xx, #Value of the summary statistic
  direction = "xx", #Specify direction of alternative hypothesis
  number_repetitions = 100,
  add_normal = FALSE)
```

* **Theory-based methods**: when specific conditions are met, a data can be fit with a theoretical distribution

* **Conditions for the sampling distribution of $\bar{x}$ to follow an approximate normal distribution**:

    * **Independence**: The sample’s observations are independent, e.g., are from a simple random sample. (*Remember*: This also must be true to use simulation methods!)

     * **Large enough sample size: Normality Condition**: The sample observations come from a normally distributed population.  To check use the the following rules of thumb:
     
         - $n < 30$: The distribution of the sample must be approximately normal with no outliers
         
         - $30 \ge n < 100$: We can relax the condition a little; the distribution of the sample must have no extreme outliers or skewness
         
         - $n > 100$: Can assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribuion of individual observationals is not
         
* **t-distribution**: a theoretical distribution that is symmetric with a given degrees of freedom ($n-1$)

    * $t_{n-1}$

* **Standardized sample mean**: standardized statistic for a single quantitative variable calculated using:

$$
T = \frac{\bar{x} - \mu_0}{SE(\bar{x})},
$$

* **Standard error of the sample mean assuming the null is true**: measures the how far each possible sample mean is from the true mean, on average and is calculated using the formula below:

$$SE(\bar{x})=\frac{s}{\sqrt{n}}$$



#### Exploratory data analysis {-}

At the end of this module, you should understand how to calculate a summary statistic and plot a single quantitative variable.  

* Notation for a sample mean: $\bar{x}$

* Notation for a population mean: $\mu$

* Types of plots for a single categorical variable:

    - Histogram
    
    - Boxplot
    
    - Dotplot

\newpage
