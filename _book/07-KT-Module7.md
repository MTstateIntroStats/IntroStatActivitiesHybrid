# Confidence Intervals for a Single Quantitative Variable

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of a single quantitative variable.  

### Key topics

Module 7 will cover creating confidence intervals using both simulation-based and theory-based methods. Additionally, we learn about types of errors and power in hypothesis testing.

#### Simulation-based Confidence Interval {-}

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
        
#### Theory-based Confidence Interval {-}

* Calculation of the confidence interval for a sample mean:

$$\bar{x}\pm t^*\times SE(\bar{x})$$

* R code to find the multiplier for the confidence interval using theory-based methods.

   - `qt` will give you the multiplier using the t-distribution with $n-1$ df (enter for `yy`)
    
   - Enter the percentile for the given confidence level

    
    ``` r
    qt(percentile, df=yy, lower.tail=FALSE)
    ```

\newpage

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
