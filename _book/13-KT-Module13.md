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


Summary measures

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

### Theory-based Methods to find the p-value {-}

* To find the value of the standardized statistic to test the slope we will use, 

$$
T = \frac{\mbox{slope estimate}-null value}{SE} = \frac{b_1-0}{SE(b_1)}.
$$
* Use the standard error estimate from the linear model output

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

* R code to find the multiplier for the confidence interval using theory-based methods.

    * pt will give you a p-value using the t-distribution with n-2 df (enter for yy)
    
    * Enter the value of the standardized statistic for xx

    * If a greater than alternative, change lower.tail = TRUE to FALSE.
    
    * If a two-sided test, multiply by 2.


``` r
pt(xx, df=yy, lower.tail=FALSE)
```

\newpage