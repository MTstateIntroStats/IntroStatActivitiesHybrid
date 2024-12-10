# Inference for a Single Quantitative Variable

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of a single quantitative variable.  Module 6 will cover hypothesis testing using both simulation and theory-based methods.

* The **summary measure** for one quantitative variable is the **mean**

* Additionally, we can find the five number summary (min, Q1, median, Q3, max) as well as the sample standard deviation

* R code to find the summary statistics for a quantitative variable

    
    ``` r
    object %>% # Data set piped into...
        summarise(favstats(variable))
    ```

* Quartile 1, $Q_1$: value at the 25th percentile; approximately 25\% of data values are at and below the value of $Q_1$

* Quartile 2, $Q_3$: value at the 75th percentile; approximately 75\% of data values are at and below the value of $Q_3$

* Sample standard deviation, $s$: on average, each value in the data set is s units from the mean of the data set

* **Interquartile range**: $IQR = Q_3-Q_1$ 

Types of plot for one quantitative variables

* **Histogram**: sorts a quantitative variable into bins of a certain width 

* R code to create a histogram


``` r
    object %>% # Data set piped into...
        ggplot(aes(x = variable)) +   # Name variable to plot
        geom_histogram(binwidth = 10) +  # Create histogram with specified binwidth
        labs(title = "Don't forget to title the plot!", # Title for plot
            x = "x-axis label", # Label for x axis
            y = "y-axis label") # Label for y axis
```


* **Boxplot**: plots the values of the five number summary and shows any outliers in the data set

* R code to create a boxplot


``` r
    object %>% # Data set piped into...
        ggplot(aes(x = variable)) + # Name variable to plot
        geom_boxplot() + # Create boxplot 
        labs(title = "Don't forget to title the plot!", # Title for plot
            x = "x-axis label", # Label for x axis
            y = "y-axis label") # Label for y axis
```

* **Dotplot**: plots each value as a dot along the x-axis

* Four characteristics of boxplots

    - Shape  (symmetric or skewed)
    
    - Center 
    
    - Spread
    
    - Outliers?
    
### Simulation Hypothesis Testing {-}

Hypotheses for a single quantitative variable:

$$H_0: \mu = \mu_0$$
$$H_A: \mu\left\{
\begin{array}{ll}
< \\
\ne \\
< \\
\end{array}
\right\}
\mu_0 $$

* R code to use for **simulation methods** for one quantitative variable to find the p-value, one_mean_test, is shown below. Review the comments (instructions after the #) to see what each should be entered for each line of code.

    
    ``` r
    one_mean_test(object$variable,#Enter the object name and variable
              null_value = xx, #Enter the null value for the study
              summary_measure = "mean",  #Can choose between mean or median
              shift = xx, #Difference between the null value and the sample mean
              as_extreme_as = xx, #Value of the summary statistic
              direction = "xx", #Specify direction of alternative hypothesis
              number_repetitions = 10000)
    ```

### Theory-based Hypothesis Testing {-}

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

* The following R code is used to find the p-value using theory based methods for a single quantitative variables.

    * pt will give you a p-value using the t-distribution with n-1 df (enter for yy)
    
    * Enter the value of the standardized statistic for xx

    * If a greater than alternative, change lower.tail = TRUE to FALSE.
    
    * If a two-sided test, multiply by 2.
    
    
    ``` r
    pt(xx, df = yy, lower.tail=TRUE)
    ```

#### Exploratory data analysis {-}

At the end of this module, you should understand how to calculate a summary statistic and plot a single quantitative variable.  

* Notation for a sample mean: $\bar{x}$

* Notation for a population mean: $\mu$

* Types of plots for a single categorical variable:

    - Histogram
    
    - Boxplot
    
    - Dotplot

\newpage
