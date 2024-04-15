# Inference for Two Quantitative Variables

## Lecture Notes Module 14: Inference for Two Quantitative Variables

\setstretch{1}

### Summary measures and plots for two quantitative variables. {-}

Scatterplot:
	
* Form: linear or non-linear?

* Direction: positive or negative?

* Strength: how clear is the pattern between the two variables?

* Outliers: points that are far from the pattern or bulk of the data

    * Influential points: outliers that are extreme in the x-\ variable.

\setstretch{1.5}

The summary measures for two quantitative variables are:

* ____________________________, interpreted as the on average change in the response variable for a one unit increase in the explanatory variable.

\vspace{1mm}

* ____________________________, which measures the strength and direction of the linear relationship between two quantitative variables.

\vspace{1mm}

* ____________________________, interpreted as the percent of variability in the response variable that is explained by the relationship with the explanatory variable.

\vspace{1mm}

\setstretch{1}

* Least-squares regression line: $\hat{y}=b_0+b_1\times x$ (put y and x in the context of the problem)

\setstretch{1.5}

Notation:

* Population slope: 

* Population correlation:

* Sample slope:

* Sample correlation:

\setstretch{1}

Example for class discussion:  Oceanic temperature is important for sea life.  The California Cooperative Oceanic Fisheries Investigations has measured several variables on the Pacific Ocean for more than 70 years hoping to better understand weather patterns and impacts on ocean life. [@ocean]  For this example, we will look at the most recent 100 measurements of salt water salinity (measured in PSUs or practical salinity units) and the temperature of the ocean measured in degrees Celsius. Is there evidence that water temperature in the Pacific Ocean tends to decrease with higher levels of salinity?




```r
water %>% # Pipe data set into...
ggplot(aes(x = Salnty, y = T_degC))+  # Specify variables
  geom_point(alpha=0.5) +  # Add scatterplot of points
  labs(x = "salinity (PSUs)",  # Label x-axis
       y = "temperature (C)",  # Label y-axis
       title = "Scatterplot of Pacific Ocean Salinity vs Temperature") + 
               # Be sure to title your plots
  geom_smooth(method = "lm", se = FALSE)  # Add regression line
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-LN013-regression_files/figure-latex/unnamed-chunk-2-1} \end{center}

Describe the four characteristics of the scatterplot:

\vspace{1in}

Linear model output:


```r
lm.water <- lm(T_degC~Salnty, data=water) # lm(response~explanatory)
round(summary(lm.water)$coefficients, 3)
#>             Estimate Std. Error t value Pr(>|t|)
#> (Intercept)  197.156     21.478    9.18        0
#> Salnty        -5.514      0.636   -8.67        0
```

Correlation:


```r
cor(T_degC~Salnty, data=water)
#> [1] -0.6588365
```
Write the least squares equation of the line in context of the problem:

\vspace{0.5in}

Interpret the value of slope in the context of the problem:

\vspace{0.5in}

Report and describe the correlation value:

\vspace{0.5in}

Calculate and interpret the coefficient of determination:

\vspace{0.8in}

### Hypothesis Testing {-}

Conditions:

* Independence: the response for one observational unit will not influence another observational unit

* Linear relationship:

\vspace{0.3in}

Null hypothesis assumes “no effect”, “no difference”, “nothing interesting happening”, etc.

\rgi Always of form:  “parameter” = null value

$H_0:$

\vspace{0.5in}

$H_A:$

\vspace{0.5in}

* Research question determines the alternative hypothesis.

Write the null and alternative for the ocean study:

In words: 

$H_0:$

\vspace{0.5in}

$H_A:$

\vspace{0.5in}

In notation:

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}

#### Simulation-based method {-}

* Simulate many samples assuming $H_0: \beta_1 = 0$ or $H_0: \rho =0$

    * Write the response variable values on cards

    * Hold the explanatory variable values constant
    
    * Shuffle a new response variable to an explanatory variable
    
    * Plot the shuffled data points to find the least squares line of regression

    * Calculate and plot the simulated slope or correlation from each simulation

    * Repeat 1000 times (simulations) to create the null distribution

    * Find the proportion of simulations at least as extreme as $b_1$ or $r$
    
To test slope:    

```r
set.seed(216)
regression_test(T_degC ~ Salnty, # response ~ explanatory
               data = water, # Name of data set
               direction = "less", # Sign in alternative ("greater", "less", "two-sided")
               summary_measure = "slope", # "slope" or "correlation"
               as_extreme_as = -5.514, # Observed slope or correlation
               number_repetitions = 1000) # Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-LN013-regression_files/figure-latex/unnamed-chunk-5-1} \end{center}
To test correlation:

```r
set.seed(216)
regression_test(T_degC~Salnty, # response ~ explanatory
               data = water, # Name of data set
               direction = "less", # Sign in alternative ("greater", "less", "two-sided")
               summary_measure = "correlation", # "slope" or "correlation"
               as_extreme_as = -0.659, # Observed slope or correlation
               number_repetitions = 1000) # Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-LN013-regression_files/figure-latex/unnamed-chunk-6-1} \end{center}

Explain why the null distribution is centered at the value of zero:

\vspace{0.5in}

Interpretation of the p-value:

* Statement about probability or proportion of samples

* Statistic (summary measure and value)
    
* Direction of the alternative 
    
* Null hypothesis (in context) 

\vspace{0.8in}

Conclusion: 

* Amount of evidence
    
* Parameter of interest 
    
* Direction of the alternative hypothesis

\vspace{0.6in}

\newpage

#### Theory-based method{-}

Conditions:

\setstretch{1.5}

* Linearity (for both simulation-based and theory-based methods): the data should follow a linear trend.

    * Check this assumption by examining the ____________________________ of the two variables, and ____________________________________________. The pattern in the residual plot should display a horizontal line.
    
* Independence (for both simulation-based and theory-based methods)

    * One______________________________for an observational unit has no impact on  ________________________________.

* Constant variability (for theory-based methods only): the variability of points around the least squares line remains roughly constant

    * Check this assumption by examining the ________________________________. The variability in the residuals around zero should be approximately the same for all fitted values.

* Nearly normal residuals (for theory-based methods only): residuals must be nearly normal

    * Check this assumption by examining a _________________________________, which should appear approximately normal
    
\setstretch{1}
    
Example:  

It is a generally accepted fact that the more carats a diamond has, the more expensive that diamond will be. The question is, how much more expensive? Data on thousands of diamonds were collected for this data set. We will only look at one type of cut (“Ideal”) and diamonds less than 1 carat. Does the association between carat size and price have a linear relationship for these types of diamonds? What can we state about the association between carat size and price? 



Scatterplot:

```r
Diamonds %>% # Pipe data set into...
    ggplot(aes(x = carat, y = price))+  # Specify variables
    geom_point(alpha=0.5) +  # Add scatterplot of points
    labs(x = "carat",  # Label x-axis
       y = "price ($)",  # Label y-axis
       title = "Scatterplot of Diamonds Carats vs Price") + 
               # Be sure to title your plots
    geom_smooth(method = "lm", se = FALSE)  # Add regression line
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-LN013-regression_files/figure-latex/unnamed-chunk-8-1} \end{center}

Diagnostic plots:

\begin{center}\includegraphics[width=0.7\linewidth]{13-LN013-regression_files/figure-latex/unnamed-chunk-9-1} \end{center}

    
Check the conditions for the ocean data:

Scatterplot:

```r
water %>% # Pipe data set into...
ggplot(aes(x = Salnty, y = T_degC))+  # Specify variables
  geom_point(alpha=0.5) +  # Add scatterplot of points
  labs(x = "salinity (PSUs)",  # Label x-axis
       y = "temperature (C)",  # Label y-axis
       title = "Scatterplot of Pacific Ocean Salinity vs Temperature") + 
               # Be sure to title your plots
  geom_smooth(method = "lm", se = FALSE)  # Add regression line
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-LN013-regression_files/figure-latex/unnamed-chunk-10-1} \end{center}

Diagnostic plots:

\begin{center}\includegraphics[width=0.7\linewidth]{13-LN013-regression_files/figure-latex/unnamed-chunk-11-1} \end{center}

Like with paired data the $t$-distribution can be used to model slope and correlation. 

\setstretch{1.5}

* For two quantitative variables we use the ______-distribution
with _____________________ degrees of freedom to approximate the sampling distribution.

\setstretch{1}

Theory-based test:

* Calculate the standardized statistic

* Find the area under the $t$-distribution with $n - 2$ df at least as extreme as the standardized statistic

Equation for the standardized slope:

\vspace{0.8in}

Calculate the standardized slope for the ocean data


```r
lm.water <- lm(T_degC~Salnty, data=water) # lm(response~explanatory)
summary(lm.water)$coefficients
#>               Estimate Std. Error   t value     Pr(>|t|)
#> (Intercept) 197.156160 21.4778118  9.179527 7.304666e-15
#> Salnty       -5.513691  0.6359673 -8.669770 9.257446e-14
```

\vspace{1in}


\begin{center}\includegraphics[width=0.7\linewidth]{13-LN013-regression_files/figure-latex/pvalueoce-1} \end{center}

Interpret the standardized statistic:

\vspace{0.8in}

To find the theory-based p-value:


```r
lm.water <- lm(T_degC~Salnty, data=water) # lm(response~explanatory)
summary(lm.water)$coefficients
#>               Estimate Std. Error   t value     Pr(>|t|)
#> (Intercept) 197.156160 21.4778118  9.179527 7.304666e-15
#> Salnty       -5.513691  0.6359673 -8.669770 9.257446e-14
```

or


```r
pt(-8.670, df = 98, lower.tail=TRUE)
#> [1] 4.623445e-14
```

\newpage

### Confidence interval {-}

To estimate the true slope (or true correlation) we will create a confidence interval.

#### Simulation-based method{-}

* Write the explanatory and response value pairs on cards

* Sample pairs with replacement $n$ times

* Plot the resampled data points to find the least squares line of regression
    
* Calculate and plot the simulated slope (or correlation) from each simulation

* Repeat 1000 times (simulations) to create the bootstrap distribution

* Find the cut-offs for the middle X\% (confidence level) in a bootstrap distribution.

Returning to the ocean example, we will estimate the true slope between salinity and temperature of the Pacific Ocean.


```r
set.seed(216)
regression_bootstrap_CI(T_degC~Salnty, # response ~ explanatory
   data = water, # Name of data set
   confidence_level = 0.95, # Confidence level as decimal
   summary_measure = "slope", # Slope or correlation
   number_repetitions = 1000) # Number of simulated samples for bootstrap distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-LN013-regression_files/figure-latex/unnamed-chunk-15-1} \end{center}

Confidence interval interpretation:

* How confident you are (e.g., 90\%, 95\%, 98\%, 99\%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}

\newpage 

Now we will estimate the true correlation between salinity and temperature of the Pacific Ocean.


```r
set.seed(216)
regression_bootstrap_CI(T_degC~Salnty, # response ~ explanatory
   data = water, # Name of data set
   confidence_level = 0.95, # Confidence level as decimal
   summary_measure = "correlation", # Slope or correlation
   number_repetitions = 1000) # Number of simulated samples for bootstrap distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-LN013-regression_files/figure-latex/unnamed-chunk-16-1} \end{center}

Confidence interval interpretation:

* How confident you are (e.g., 90\%, 95\%, 98\%, 99\%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}

\newpage

#### Theory-based method {-}

* Calculate the interval centered at the sample statistic

\rgi $\text{statistic} \pm \text{margin of error}$

\vspace{0.6in}



```r
lm.water <- lm(T_degC~Salnty, data=water) # lm(response~explanatory)
round(summary(lm.water)$coefficients, 3)
#>             Estimate Std. Error t value Pr(>|t|)
#> (Intercept)  197.156     21.478    9.18        0
#> Salnty        -5.514      0.636   -8.67        0
```

Using the ocean data, calculate a 95\% confidence interval for the true slope.

* Need the $t^*$ multiplier for a 95\% confidence interval from a t-distribution with _________ df.


```r
qt(0.975, df=98, lower.tail = TRUE)
#> [1] 1.984467
```

\vspace{1in}

\newpage
