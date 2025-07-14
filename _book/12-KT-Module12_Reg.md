# Exploratory Data Analysis and Inference for Two Quantitative Variables

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of two quantitative variables.

### Key topics

Module 13 will cover exploratory data analysis and both simulation-based and theory-based methods of inference for two quantitative variables. The **summary measure** for two quantitative variables is either the **slope** of a regression line or the **correlation** between the two variables.

* Notation for a sample regression slope: $b_1$

* Notation for a population regression slope: $\beta_1$

* Notation for a sample correlation: $r$

* Notation for a population correlation: $\rho$

Types of plots for two quantitative variables:

* Scatterplot

### Vocabulary

#### Plotting two quantitative variables {-}

* **Scatterplot**: plots $(x,y)$ pairs of observations with the explanatory variable on the $x$-axis and the response variable on the $y$-axis. R code to create a scatterplot:
    
    ``` r
    object %>% # Pipe data set into...
    ggplot(aes(x = explanatory, y = response))+  # Specify variables
      geom_point(alpha=0.5) +  # Add scatterplot of points
      labs(x = "x-axis label",  # Label x-axis
       y = "y-axis label",  # Label y-axis
       title = "Don't forget to add a title!") + 
               # Be sure to tile your plots
      geom_smooth(method = "lm", se = FALSE)  # Add regression line
    ```

    * If there is a third categorical variable, you can use color or shape to include the third variable on the scatterplot.

* Four characteristics of scatterplots:

    - Form (linear or non-linear)
    
    - Direction (positive or negative)
    
    - Strength (weak, moderate, or strong)
    
    - Outliers?

#### Sample statistics for two quantitative variables {-}

* **Least-squares regression line**: a line fit to the data which minimizes the squared vertical distances from the observed $y$-value to the line

    * **Notation for the fitted least-squares regression line**:
    $$\hat{y} = b_0 + b_1 \times x$$
    or
    $$\widehat{response} = b_0 + b_1 \times explanatory$$
    To write the equation of the regression line in context of the problem, include descriptive names of the response and explanatory variables for "$y$/response" and "$x$/explanatory" above.

    * $b_0$ is the **$y$-intercept** of the regression line: the _predicted_ value of the response variable when the explanatory variable is equal to zero.
    
    * $b_1$ is the **slope** of the regression line: the _predicted_ increase/decrease in the response variable associated with a one-unit increase in the explanatory variable.

    * The distance from an observation's $y$-value (observed response) to its fitted value, $\hat{y}$ (the value on the line) is called a **residual**:
    $$ \text{residual} = \text{observed} - \text{fitted} = y - \hat{y}$$

    * A least-squares regression line is a special case of a **linear model**.

    * R code to find the least-squares regression line (fit the linear model):
    
    ``` r
    linearmodel <- lm(response~explanatory, data=object)
    round(summary(linearmodel)$coefficients,3) # Display coefficients
    ```

* **Correlation**: measures the magnitude and direction of the linear relationship between two quantitative variables.

    * Parameter notation: $\rho$
    
    * Sample notation: $r$
    
    * R code to find the **correlation** matrix between variables:
    
    ``` r
    object %>%  # Data set pipes into
        select(c("variable1", "variable2", "variable3")) %>% 
        #Selects the variables you want to compare
        cor(use="pairwise.complete.obs") %>%  #Calculates the correlation between each pair
        round(3) #Rounds to 3 decimal places
    ```

* **Coefficient of determination**: measures the proportion of total variability in the response variable that is explained by the linear relationship with the explanatory variable. The coefficient of determination can be calculated in three ways:
$$r^2 = (r)^2 = \frac{SST - SSE}{SST} = \frac{s^2_y - s^2_{residual}}{s^2_y}$$

#### Hypotheses {-}

Hypotheses involving two quantitative variables can be expressed either in terms of the slope or the correlation. When either the slope or correlation is equal to zero, there is no linear relationship between the two quantitative variables (the null hypothesis).

* **Hypotheses in notation for slope**:

$$H_0: \beta_1 = 0$$

$$H_A: \beta_1 \left\{
\begin{array}{ll}
< \\
\ne \\
< \\
\end{array}
\right\}
0$$

* **Hypotheses in notation for correlation**:


$$H_0: \rho = 0$$
$$H_A: \rho \left\{
\begin{array}{ll}
< \\
\ne \\
< \\
\end{array}
\right\}
0$$

#### Simulation-based inference for two quantitative variables {-}

* **Conditions necessary to use simulation-based methods for inference for two quantitative variables**:

    * **Independence**: observational units (the $(x, y)$ pairs) must be independent of one another.
    
    * **Linearity**: the form of the relationship (if any) between the two variables must be linear.


* **Simulation-based methods to create the null distribution**: R code for simulation methods to find the p-value using the `regression_test` function in the `catstats` package.

    
    ``` r
    regression_test(response~explanatory, # response ~ explanatory
               data = object, # Name of data set
               direction = "xx", # Sign in alternative ("greater", "less", "two-sided")
               summary_measure = "xx", # "slope" or "correlation"
               as_extreme_as = xx, # Observed slope or correlation
               number_repetitions = 10000) # Number of simulated samples for null distribution
    ```

* **Simulation-based methods to create the bootstrap distribution**: R code to find the simulation-based confidence interval using the `regression_bootstrap_CI` function from the `catstats` package.

    
    ``` r
    regression_bootstrap_CI(response~explanatory, # response ~ explanatory
       data = object, # Name of data set
       confidence_level = xx, # Confidence level as decimal
       summary_measure = "xx", # Slope or correlation
       number_repetitions = 10000) # Number of simulated samples for bootstrap distribution
    ```

#### Theory-based methods for two quantitative variables {-}

* **Conditions necessary to use theory-based methods for inference for two quantitative variables**:

    * **Independence** (for both simulation-based and theory-based methods): observational units (the $(x, y)$ pairs) must be independent of one another.

        * Check this assumption by investigating the sampling method and determining if the observational units are related in any way.
    
    * **Linearity** (for both simulation-based and theory-based methods): the form of the relationship (if any) between the two variables must be linear.

        * Check this assumption by examining the scatterplot of the two variables, and a scatterplot of the residuals (on the $y$-axis) versus the fitted values (on the $x$-axis). The pattern in the residuals vs. fitted plot should display a horizontal line.

    * **Constant variability** (for theory-based methods only): the variability of points around the least squares line remains roughly constant

        * Check this assumption by examining a scatterplot of the residuals (on the $y$-axis) versus the fitted values (on the $x$-axis). The variability in the residuals around zero should be approximately the same for all fitted values.

    * **Nearly normal residuals** (for theory-based methods only): residuals must be nearly normal.

        * Check this assumption by examining a histogram of the residuals, which should appear approximately normal.


* **Standard error of the slope of the least-squares regression line** ($SE(b_1)$): obtain the value of the standard error of the slope from the linear model (`lm`) R output.

* **Standardized slope**:
$$
T = \frac{\mbox{slope estimate}-null value}{SE} = \frac{b_1-0}{SE(b_1)}.
$$

    * The p-value can be found from the linear model (`lm`) R output or by using the `pt` function in R to find the area under a $t$-distribution with $n-2$ degrees of freedom where $T$ is as or more extreme as the value observed (in the direction of $H_A$).
 
* **Margin of error**: half the width of the confidence interval. For a regression slope, the margin of error is:
$$ME = t^* \times SE(b_1)$$
where $t^*$ is the **multiplier**, corresponding to the desired confidence level found from a $t$-distribution with $n-2$ degrees of freedom. 

    * Use the `qt` function in R to find the $t^*$ multiplier with $n-2$ degrees of freedom.

    * To find the endpoints of a confidence interval, add and subtract the margin of error to the sample statistic. The confidence interval for a population slope is:
    $$b_1 \pm ME$$


\newpage
