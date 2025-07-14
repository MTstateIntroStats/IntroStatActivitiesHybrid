# Exploring Quantitative Data: Exploratory Data Analysis and Inference for a Single Quantitative Variable - Simulation-based Methods

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of a single quantitative variable.  

### Key topics

Module 6 will introduce exploratory data analysis and inference using simulation-based methods for a single quantitative variable.
The **summary measure** for one quantitative variable is the **mean**.
Additionally, we can find the five number summary (min, Q1, median, Q3, max) as well as the sample standard deviation.

* Notation for a sample mean: $\bar{x}$

* Notation for a sample standard deviation: $s$

* Notation for a population mean: $\mu$

* Notation for a population standard deviation: $\sigma$

* Types of plots for a single categorical variable:

    - Histogram
    
    - Boxplot
    
    - Dotplot

### Vocabulary

#### Sample statistics for a single quantitative variable {-}

* **Mean**, $\bar{x}$: the average
$$ 
\bar{x} = \frac{x_1 + x_2 + \cdots + x_n}{n},
$$
where $x_1, x_2, \ldots, x_n$ are the data values and $n$ is the sample size.


* **Median**: value at the 50th percentile; approximately 50\% of data values are at or below the value of the median.

\vspace{1mm}

* **Quartile 1** (lower quartile), $Q_1$: value at the 25th percentile; approximately 25\% of data values are at or below the value of $Q_1$.

\vspace{1mm}

* **Quartile 3** (upper quartile), $Q_3$: value at the 75th percentile; approximately 75\% of data values are at or below the value of $Q_3$.

\newpage

* **Sample standard deviation**, $s$: on average, each value in the data set is $s$ units from the mean of the data set ($\bar{x}$). We will always calculate $s$ using R, but it is calculated using the following formula:
$$
s = \sqrt{\frac{(x_1-\bar{x})^2 + (x_2-\bar{x})^2 + \cdots + (x_n-\bar{x})^2}{n-1}},
$$
where $x_1, x_2, \ldots, x_n$ are the data values, $\bar{x}$ is the sample mean, and $n$ is the sample size.

* **Interquartile range**: the range of the data between the two quartiles: $IQR = Q_3-Q_1$.

* R code to find the summary statistics for a quantitative variable:

    
    ``` r
    object %>% # Data set piped into...
        summarise(favstats(variable))
    ```

#### Plotting one quantitative variable {-}

* **Histogram**: sorts a quantitative variable into bins of a certain width. R code to create a histogram:

    
    ``` r
    object %>% # Data set piped into...
        ggplot(aes(x = variable)) +   # Name variable to plot
        geom_histogram(binwidth = 10) +  # Create histogram with specified binwidth
        labs(title = "Don't forget to title the plot!", # Title for plot
            x = "x-axis label", # Label for x axis
            y = "y-axis label") # Label for y axis
    ```


* **Boxplot**: plots the values of the five-number summary and shows any outliers in the data set. R code to create a boxplot:

    
    ``` r
    object %>% # Data set piped into...
        ggplot(aes(x = variable)) + # Name variable to plot
        geom_boxplot() + # Create boxplot 
        labs(title = "Don't forget to title the plot!", # Title for plot
            x = "x-axis label", # Label for x axis
            y = "y-axis label") # Label for y axis
    ```

* **Dotplot**: plots each value as a dot along the $x$-axis. R code to create a dotplot:

    
    ``` r
    object %>% # Data set piped into...
        ggplot(aes(x = variable)) + # Name variable to plot
        geom_dotplot() + # Create dotplot 
        labs(title = "Don't forget to title the plot!", # Title for plot
            x = "x-axis label", # Label for x axis
            y = "y-axis label") # Label for y axis
    ```
    
* Four characteristics of a distribution of a single quantitative variable:

    - Shape  (symmetric, skewed left, or skewed right)
    
    - Center 
    
    - Spread
    
    - Outliers?

\newpage

#### Hypothesis testing for a single mean {-}

* **Hypotheses in notation for a single mean**: In the hypotheses below, $\mu_0$ is the **null value**.

$$H_0: \mu = \mu_0$$
$$H_A: \mu\left\{
\begin{array}{ll}
< \\
\ne \\
< \\
\end{array}
\right\}
\mu_0 $$


#### Simulation-based hypothesis testing {-}

* **Conditions necessary to use simulation-based methods for inference  for a single quantitative variable**:

    * **Independence**: observational units must be independent of one another.

* **Simulation-based methods to create the null distribution**: R code to use for simulation-based methods for one quantitative variable to find the p-value, `one_mean_test` (from the `catstats` package), is shown below. Review the comments (instructions after the #) to see what each should be entered for each line of code.

    
    ``` r
    one_mean_test(object$variable,#Enter the object name and variable
              null_value = xx, #Enter the null value for the study
              summary_measure = "mean",  #Can choose between mean or median
              shift = xx, #Difference between the null value and the sample mean
              as_extreme_as = xx, #Value of the summary statistic
              direction = "xx", #Specify direction of alternative hypothesis
              number_repetitions = 10000)
    ```

#### Simulation-based confidence interval {-}

* R code to find the simulation-based confidence interval using the `onemean_CI` function from the `catstats` package.


    
    ``` r
    one_mean_CI(object$variable, #Enter the name of the variable
            summary_measure = "mean", #choose the mean or median
            number_repetitions = 10000,  # Number of simulations
            confidence_level = xx)
    ```


* Interpretation of the confidence interval is very similar as for a single proportion only the context and summary measure has changed.

    * To write in context include:

        - How confident you are (e.g., 90%, 95%, 98%, 99%)
    
        - Parameter of interest
    
        - Calculated interval
        
\newpage
