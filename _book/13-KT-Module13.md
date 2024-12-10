# Inference for Two Quantitative Variables

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of a two quantitative variables.

Types of plot for two quantitative variables

* **Scatterplot**: plots (x,y) pairs of observations

* Four characteristics of scatterplots

    - Form (linear or non-linear)
    
    - Direction (positive or negative)
    
    - Strength (weak, moderate, or strong)
    
    - Outliers?

R code to create a scatterplot:


``` r
object %>% # Pipe data set into...
ggplot(aes(x = explanatory, y = response))+  # Specify variables
  geom_point(alpha=0.5) +  # Add scatterplot of points
  labs(x = "x-axis label",  # Label x-axis
       y = "y-axis lable",  # Label y-axis
       title = "Don't forget to add a title!") + 
               # Be sure to tile your plots
  geom_smooth(method = "lm", se = FALSE)  # Add regression line
```


Summary measures:

* **Slope of the regression line**: measures the magnitude and direction of the linear relationship between two quantitative variables

$$\widehat{response} = b_0 + b_1 \times explanatory$$
\vspace{1mm}

- Parameter notation for slope: $\beta_1$
    
- Sample notation for slope: $b_1$
    
* R code to create the linear model


``` r
linearmodel <- lm(response~explanatory, data=object)
round(summary(linearmodel)$coefficients,3) # Display coefficient
```

* **Correlation**: measures the strength and direction of the linear relationship between two quantitative variables

    * Parameter notation: $\rho$
    
    * Sample notation: $r$
    
* **Coefficient of determination**: measures the percent of total variability in the response variable that is explained by the relationship with the explanatory variable
    
$$r^2 = (r)^2 = \frac{SST - SSE}{SST} = \frac{s^2_y - s^2_{residual}}{s^2_y}$$

### Simulation Hypothesis Testing {-}

* Can test either slope or correlation - both test for a linear relationship between two quantitative variables

Hypotheses for slope:

$$H_0: \beta_1 = 0$$

$$H_A: \beta_1 \left\{
\begin{array}{ll}
< \\
\ne \\
< \\
\end{array}
\right\}
0$$

Hypotheses for correlation:


$$H_0: \rho = 0$$
$$H_A: \rho \left\{
\begin{array}{ll}
< \\
\ne \\
< \\
\end{array}
\right\}
0$$

* R code for simulation methods to find the p-value using the `regression_test` function in the `catstats` package.


``` r
regression_test(response~explanatory, # response ~ explanatory
               data = object, # Name of data set
               direction = "xx", # Sign in alternative ("greater", "less", "two-sided")
               summary_measure = "xx", # "slope" or "correlation"
               as_extreme_as = xx, # Observed slope or correlation
               number_repetitions = 10000) # Number of simulated samples for null distribution
```


### Conditions necessary to use theory-based methods {-}

When performing inference on a least squares line, the follow conditions are generally required:

* *Independent observations* (for both simulation-based and theory-based methods): individual data points must be independent.
    - Check this assumption by investigating the sampling method and determining if the observational units are related in any way.
    
* *Linearity* (for both simulation-based and theory-based methods): the data should follow a linear trend.
    - Check this assumption by examining the scatterplot of the two variables, and a scatterplot of the residuals (on the $y$-axis) versus the fitted values (on the $x$-axis). The pattern in the residual plot should display a horizontal line.

* *Constant variability* (for theory-based methods only): the variability of points around the least squares line remains roughly constant
    - Check this assumption by examining a scatterplot of the residuals (on the $y$-axis) versus the fitted values (on the $x$-axis). The variability in the residuals around zero should be approximately the same for all fitted values.

* *Nearly normal residuals* (for theory-based methods only: residuals must be nearly normal.
    - Check this assumption by examining a histogram of the residuals, which should appear approximately normal.

### Theory-based Methods to find the p-value {-}

* To find the value of the standardized statistic to test the slope we will use, 

$$
T = \frac{\mbox{slope estimate}-null value}{SE} = \frac{b_1-0}{SE(b_1)}.
$$
* Use the standard error estimate of the slope from the linear model output

* The p-value can be found from the linear model output or by using the pt function.

    * Enter the value of the standardized statistic for xx
    
    * Enter the df $(n-2)$ for yy


``` r
pt(xx, df = yy, lower.tail=TRUE)
```

### Simulation methods to find the confidence interval {-}

* R code to find the simulation confidence interval using the `regression_bootstrap_CI` function from the `catstats` package.


``` r
regression_bootstrap_CI(response~explanatory, # response ~ explanatory
   data = object, # Name of data set
   confidence_level = xx, # Confidence level as decimal
   summary_measure = "xx", # Slope or correlation
   number_repetitions = 10000) # Number of simulated samples for bootstrap distribution
```

### Theory-based methods to find the confidence interval {-}

* Calculation of the confidence interval for slope

$$b_1\pm t^*\times SE(b_1)$$

* R code to find the multiplier for the confidence interval using theory-based methods.

    * qt will give you the multiplier using the t-distribution with n-2 df (enter for yy)
    
    * Enter the percentile for the given confidence level


``` r
qt(percentile, df=yy, lower.tail=FALSE)
```

\newpage
