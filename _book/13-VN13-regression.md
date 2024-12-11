## Video Notes: Regression and Correlation

Read Chapters 6, 7, 8, 21, and 22 in the course textbook.  Use the following videos to complete the video notes for Module 13.

### Course Videos

* 6.1

* 6.2

* 6.3

* Ch 7

* 21.1

* 21.3

* 21.4TheoryTests

* 21.4TheoryIntervals


\setstretch{1}

### Summary measures and plots for two quantitative variables - Videos 6.1 - 6.3 {-}

Example: Data were collected from 1236 births between 1960 and 1967 in the San Francisco East Bay area to better understand what variables contributed to child birthweight, as children with low birthweight often suffer from an array of complications later in life [@babies]. There were some missing values in the study and with those observations removed we have a total of 1223 births.


``` r
babies<-read.csv("data/babies.csv") %>%
    drop_na(bwt) %>%
    drop_na(gestation)
glimpse(babies)
#> Rows: 1,223
#> Columns: 8
#> $ case      <int> 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, ~
#> $ bwt       <int> 120, 113, 128, 108, 136, 138, 132, 120, 143, 140, 144, 141, ~
#> $ gestation <int> 284, 282, 279, 282, 286, 244, 245, 289, 299, 351, 282, 279, ~
#> $ parity    <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
#> $ age       <int> 27, 33, 28, 23, 25, 33, 23, 25, 30, 27, 32, 23, 36, 30, 38, ~
#> $ height    <int> 62, 64, 64, 67, 62, 62, 65, 62, 66, 68, 64, 63, 61, 63, 63, ~
#> $ weight    <int> 100, 135, 115, 125, 93, 178, 140, 125, 136, 120, 124, 128, 9~
#> $ smoke     <int> 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, ~
```


Here you see a glimpse of the data.  The 1223 rows correspond to the sample size.  The case variable is labeling each pregnancy 1 through 1223.  Then 7 variables are recorded.  birthweight (bwt), length of gestation in days, parity is called an indicator variable telling us if the pregnancy was a first pregnancy (labeled as 0) or not (labeled as 1) were recorded about the child and pregnancy.  The age, height, and weight were recorded for the mother giving birth, as was smoke, another indicator variable where 0 means the mother did not smoke during pregnancy, and 1 indicates that she did smoke while pregnant.  

\setstretch{1.5}

#### Type of plot {-}

A __________________ is used to display the relationship
between two ___________________ variables.

\setstretch{1}
\newpage

Four characteristics of the scatterplot:
	
* Form: 

\vspace{0.2in}

* Direction: 

\vspace{0.2in}

* Strength: 

\vspace{0.2in}

* Outliers: 

\vspace{0.2in}

\rgi \rgi - Influential points: outliers that change the regression line; far from the line of regression

\rgi \rgi - High leverage points: outliers that are extreme in the x\- axis; far from the mean of the x-axis

The following shows a scatterplot of length of gestation as a predictor of birthweight.


``` r
babies %>% # Data set pipes into...
ggplot(aes(x = gestation, y = bwt))+  # Specify variables
  geom_point(alpha=0.5) +  # Add scatterplot of points
  labs(x = "number of days of gestation",  # Label x-axis
       y = "birthweight (oz)",  # Label y-axis
       title = "Scatterplot of Gestation vs. Birthweight for Births
       between 1960 and 1967 in San Francisco") + 
    # Be sure to title your plots with the type of plot, observational units, variable(s)
  geom_smooth(method = "lm", se = FALSE) + # Add regression line
    theme_bw()
```



\begin{center}\includegraphics[width=0.8\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-2-1} \end{center}

Describe the scatterplot using the four characteristics of a scatterplot.

\vspace{1in}

\setstretch{1.5}

The summary measures for two quantitative variables are:

* ____________________________

* ____________________________

* ____________________________

\setstretch{1}

Notation:

* Population slope: 

* Population correlation:

* Sample slope:

* Sample correlation:


#### Correlation {-}

Correlation is always between the values of _______ and ________.  

* Measures the _____________ and ______________ of the linear relationship between two quantitative variables.

* The stronger the relationship between the variables the closer the value of _______________ is to ________ or ________.

* The sign gives the _________________.

The following code creates a correlation matrix between different quantitative variables in the data set.


``` r
babies %>%
    select(c("gestation", "age", "height", "weight", "bwt")) %>%
    cor(use="pairwise.complete.obs") %>%
    round(3)
```

```
#>           gestation    age height weight   bwt
#> gestation     1.000 -0.056  0.064  0.022 0.408
#> age          -0.056  1.000 -0.005  0.147 0.029
#> height        0.064 -0.005  1.000  0.436 0.201
#> weight        0.022  0.147  0.436  1.000 0.154
#> bwt           0.408  0.029  0.201  0.154 1.000
```
\setstretch{1.5}

The value of correlation between gestation and birthweight is ______________. This shows a ___________, _____________ relationship between gestation and birthweight.

\setstretch{1}

#### Slope {-}
* Least-squares regression line: $\hat{y}=b_0+b_1\times x$ (put y and x in the context of the problem) or $\widehat{response}=b_0+b_1 \times \text{explanatory}$

* $\hat{y}$ or $\widehat{\text{response}}$ is

\vspace{0.1in}

* $b_0$ is
    
\vspace{0.1in}

* $b_1$ is 
    
\vspace{0.1in}

* $x$ or explanatory is 
    
\vspace{0.1in}

\setstretch{1.5}
    * The estimates for the linear model output will give the value of the ___________________ and the ______________.
    
* Interpretation of slope: an increase in the _____________ variable of 1 unit is associated with an increase/decrease in the ________________ variable by the value of slope, on average.

* Interpretation of the y-intercept: for a value of 0 for the _____________ variable, the predicted value for the __________ variable would be the value of y-intercept.

* We can predict values of the ___________ variable by plugging in a given __________ variable value using the least squares equation line.

* A prediction of a response variable value for an explanatory  value outside the range of x values is called _______________.

* To find how far the predicted value deviates from the actual value we find the ____________.

\vspace{0.3in}
    
* To find the least squares regression line the line with the __________ SSE is found.

    SSE = sum of squared errors
    
    * To find SSE, the residual for each data point is found, squared and all the squared residuals are summed together
    
The linear model output for this study is given below:


``` r
# Fit linear model: y ~ x
babiesLM <- lm(bwt ~ gestation, data=babies)
round(summary(babiesLM)$coefficients,3) # Display coefficient summary
```

```
#>             Estimate Std. Error t value Pr(>|t|)
#> (Intercept)  -10.064      8.322  -1.209    0.227
#> gestation      0.464      0.030  15.609    0.000
```
Write the least squares equation of the line.

\vspace{0.6in}

Interpret the slope in context of the problem.

\vspace{0.6in}

Interpret the y-intercept in context of the problem.

\vspace{0.6in}

Predict the birthweight for a birth with a baby born at 310 days gestation.

\vspace{0.5in}

Calculate the residual for a birth of a baby with a birthweight of 151 ounces and born at 310 days gestation.

\vspace{0.5in}

Is this value (310, 151) above or below the line of regression?  Did the line of regression overestimate or underestimate the birthweight?

\vspace{0.2in}

#### Coefficient of Determination {-}

The coefficient of determination can be found by squaring the value of correlation, using the variances for each variable or using the SSE (sum of squares error) and SST (sum of squares total)

* $r^2 = (r)^2 = \frac{SST - SSE}{SST} = \frac{s^2_y - s^2_{residual}}{s^2_y}$

* The coefficient of determination measures the ____________ of total variation in the ___________ variable that is explained by the changes in the _____________ variable.


\setstretch{1}




\begin{center}\includegraphics[width=0.7\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-6-1} \end{center}

The value for SST was calculated as 406753.48.  The value for SSE was calculated as 339092.13.

Calculate the coefficient of determination between gestation and birthweight.

\vspace{0.3in}

Interpret the coefficient of determination between gestation and birthweight.

\vspace{0.5in}

\newpage

#### Multivariable plots - Video Chapter7 {-}

Aesthetics: visual property of the objects in your plot

\setstretch{1.5}

* Position on the axes: groups for _______________ variables, or a number line if the variable is _________________

* Color or shape - to represent _______________ variables

* Size - to represent ________________ variables

\setstretch{1}

Adding the quantitative variable maternal age to the scatterplot between gestation and birthweight.


``` r
babies %>% # Data set pipes into...
ggplot(aes(x = gestation, y = bwt))+  # Specify variables
  geom_point(alpha=0.5, shape=1, aes(size=age)) +  # Add scatterplot of points
  labs(x = "number of days of gestation",  # Label x-axis
       y = "birthweight (oz)",  # Label y-axis
       title = "Scatterplot of Gestation vs. Birthweight by Age 
       for Births between 1960 and 1967 in San Francisco") + 
    # Be sure to title your plots
  geom_smooth(method = "lm", se = FALSE)  # Add regression line
```



\begin{center}\includegraphics[width=0.8\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-7-1} \end{center}

\newpage


Let's add the categorical variable, whether a mother smoked, to the scatterplot between gestation and birthweight.


``` r
babies <- babies %>% 
    mutate(smoke = factor(smoke)) %>%
    na.omit()
           
babies %>% # Data set pipes into...
    ggplot(aes(x = gestation, y = bwt, color = smoke))+  #Specify variables
    geom_point(aes(shape = smoke), size = 2) +  #Add scatterplot of points
    labs(x = "number of days of gestation",  #Label x-axis
         y = "birthweight (oz)",  #Label y-axis
         title = "Scatterplot of Gestation vs. Birthweight by 
         Smoking Status for Births between 1960 and 1967 
         in San Francisco") + 
    #Be sure to title your plots
    geom_smooth(method = "lm", se = FALSE) + #Add regression line
    scale_color_grey()
```



\begin{center}\includegraphics[width=0.8\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-8-1} \end{center}

Does the relationship between length of gestation and birthweight appear to depend upon maternal smoking status? 

\vspace{1in}

Is the variable smoking status a potential confounding variable?

\vspace{1in}

Adding a categorical predictor:

\setstretch{1.5}

* Look at the regression line for each level of the ______________

* If the slopes are ________________, the two predictor variables do not _______________ to help explain the response

* If the slopes _________________, there is an interaction between the categorical predictor and the relationship between the two quantitative variables.

\setstretch{1}

### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1.  What are the three summary measures for two quantitative variables?

\vspace{0.5in}

2. What are the four characteristics used to describe a scatterplot?

\vspace{0.5in}

3. When we add a categorical predictor variable to a scatterplot of two quantitative variables, what summary measure will we compare across the categories to assess the change in the relationship between the two quantitative variables.

\vspace{0.2in}
\newpage

### Video Notes: Inference for Two Quantitative Variables

\setstretch{1}

Example:  Oceanic temperature is important for sea life.  The California Cooperative Oceanic Fisheries Investigations has measured several variables on the Pacific Ocean for more than 70 years hoping to better understand weather patterns and impacts on ocean life. [@ocean]  For this example, we will look at the most recent 100 measurements of salt water salinity (measured in PSUs or practical salinity units) and the temperature of the ocean measured in degrees Celsius. Is there evidence that water temperature in the Pacific Ocean tends to decrease with higher levels of salinity?


### Hypothesis Testing - Video 21.1 {-}

Null hypothesis assumes “no effect”, “no difference”, “nothing interesting happening”, etc.

\rgi Always of form:  “parameter” = null value

$H_0:$

\vspace{0.5in}

$H_A:$

\vspace{0.5in}

* Research question determines the alternative hypothesis.

Write the null and alternative for the ocean study:

In notation:

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}



``` r
water %>% # Pipe data set into...
ggplot(aes(x = Salnty, y = T_degC))+  # Specify variables
  geom_point(alpha=0.5) +  # Add scatterplot of points
  labs(x = "salinity (PSUs)",  # Label x-axis
       y = "temperature (C)",  # Label y-axis
       title = "Scatterplot of Pacific Ocean Salinity vs Temperature") +
               # Be sure to title your plots
  geom_smooth(method = "lm", se = FALSE)  # Add regression line

```



\begin{center}\includegraphics[width=0.7\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-10-1} \end{center}

Describe the four characteristics of the scatterplot:

\vspace{1in}

Linear model output:


``` r
lm.water <- lm(T_degC~Salnty, data=water) # lm(response~explanatory)
round(summary(lm.water)$coefficients, 3)
```

```
#>             Estimate Std. Error t value Pr(>|t|)
#> (Intercept)  197.156     21.478    9.18        0
#> Salnty        -5.514      0.636   -8.67        0
```

Correlation:


``` r
cor(T_degC~Salnty, data=water)
```

```
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

#### Simulation-based method {-}

Conditions:

* Independence: the response for one observational unit will not influence another observational unit

* Linear relationship:

\vspace{0.3in}

* Simulate many samples assuming $H_0: \beta_1 = 0$ or $H_0: \rho =0$

    * Write the response variable values on cards

    * Hold the explanatory variable values constant
    
    * Shuffle a new response variable to an explanatory variable
    
    * Plot the shuffled data points to find the least squares line of regression

    * Calculate and plot the simulated slope or correlation from each simulation

    * Repeat 1000 times (simulations) to create the null distribution

    * Find the proportion of simulations at least as extreme as $b_1$ or $r$
    
To test slope:    

``` r
set.seed(216)
regression_test(T_degC ~ Salnty, # response ~ explanatory
               data = water, # Name of data set
               direction = "less", # Sign in alternative ("greater", "less", "two-sided")
               summary_measure = "slope", # "slope" or "correlation"
               as_extreme_as = -5.514, # Observed slope or correlation
               number_repetitions = 10000) # Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-13-1} \end{center}

\newpage

To test correlation:

``` r
set.seed(216)
regression_test(T_degC~Salnty, # response ~ explanatory
               data = water, # Name of data set
               direction = "less", # Sign in alternative ("greater", "less", "two-sided")
               summary_measure = "correlation", # "slope" or "correlation"
               as_extreme_as = -0.659, # Observed slope or correlation
               number_repetitions = 10000) # Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-14-1} \end{center}

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

### Confidence interval - Video 21.3 {-}

To estimate the true slope (or true correlation) we will create a confidence interval.

#### Simulation-based method{-}

* Write the explanatory and response value pairs on cards

* Sample pairs with replacement $n$ times

* Plot the resampled data points to find the least squares line of regression
    
* Calculate and plot the simulated slope (or correlation) from each simulation

* Repeat 1000 times (simulations) to create the bootstrap distribution

* Find the cut-offs for the middle X\% (confidence level) in a bootstrap distribution.

Returning to the ocean example, we will estimate the true slope between salinity and temperature of the Pacific Ocean.


``` r
set.seed(216)
regression_bootstrap_CI(T_degC~Salnty, # response ~ explanatory
   data = water, # Name of data set
   confidence_level = 0.95, # Confidence level as decimal
   summary_measure = "slope", # Slope or correlation
   number_repetitions = 10000) # Number of simulated samples for bootstrap distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-15-1} \end{center}

Confidence interval interpretation:

* How confident you are (e.g., 90\%, 95\%, 98\%, 99\%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}

Now we will estimate the true correlation between salinity and temperature of the Pacific Ocean.


``` r
set.seed(216)
regression_bootstrap_CI(T_degC~Salnty, # response ~ explanatory
   data = water, # Name of data set
   confidence_level = 0.95, # Confidence level as decimal
   summary_measure = "correlation", # Slope or correlation
   number_repetitions = 10000) # Number of simulated samples for bootstrap distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-16-1} \end{center}

Confidence interval interpretation:

* How confident you are (e.g., 90\%, 95\%, 98\%, 99\%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}

#### Theory-based method - Video 21.4to21.5TheoryTests {-}

Conditions:

\setstretch{1.5}

* Linearity (for both simulation-based and theory-based methods): the data should follow a linear trend.

    * Check this assumption by examining the ____________________________ of the two variables, and ____________________________________________. The pattern in the residual plot should display a horizontal line.

\newpage

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

``` r
Diamonds %>% # Pipe data set into...
    ggplot(aes(x = carat, y = price))+  # Specify variables
    geom_point(alpha=0.5) +  # Add scatterplot of points
    labs(x = "carat",  # Label x-axis
       y = "price ($)",  # Label y-axis
       title = "Scatterplot of Diamonds Carats vs Price") +
               # Be sure to title your plots
    geom_smooth(method = "lm", se = FALSE)  # Add regression line

```



\begin{center}\includegraphics[width=0.7\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-18-1} \end{center}

\newpage

Diagnostic plots:

\begin{center}\includegraphics[width=0.7\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-19-1} \end{center}


Check the conditions for the ocean data:

Scatterplot:

``` r
water %>% # Pipe data set into...
ggplot(aes(x = Salnty, y = T_degC))+  # Specify variables
  geom_point(alpha=0.5) +  # Add scatterplot of points
  labs(x = "salinity (PSUs)",  # Label x-axis
       y = "temperature (C)",  # Label y-axis
       title = "Scatterplot of Pacific Ocean Salinity vs Temperature") + 
               # Be sure to title your plots
  geom_smooth(method = "lm", se = FALSE)  # Add regression line

```



\begin{center}\includegraphics[width=0.7\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-20-1} \end{center}

\newpage

Diagnostic plots:

\begin{center}\includegraphics[width=0.7\linewidth]{13-VN13-regression_files/figure-latex/unnamed-chunk-21-1} \end{center}

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


``` r
lm.water <- lm(T_degC~Salnty, data=water) # lm(response~explanatory)
round(summary(lm.water)$coefficients,3)
```

```
#>             Estimate Std. Error t value Pr(>|t|)
#> (Intercept)  197.156     21.478    9.18        0
#> Salnty        -5.514      0.636   -8.67        0
```

\vspace{1in}


\begin{center}\includegraphics[width=0.7\linewidth]{13-VN13-regression_files/figure-latex/pvalueoce-1} \end{center}

Interpret the standardized statistic:

\vspace{0.8in}

To find the theory-based p-value:


``` r
lm.water <- lm(T_degC~Salnty, data=water) # lm(response~explanatory)
round(summary(lm.water)$coefficients,3)
```

```
#>             Estimate Std. Error t value Pr(>|t|)
#> (Intercept)  197.156     21.478    9.18        0
#> Salnty        -5.514      0.636   -8.67        0
```

or


``` r
pt(-8.670, df = 98, lower.tail=TRUE)
#> [1] 4.623445e-14
```

\newpage



#### Theory-based method {-}

* Calculate the interval centered at the sample statistic

\rgi $\text{statistic} \pm \text{margin of error}$

\vspace{0.6in}



``` r
lm.water <- lm(T_degC~Salnty, data=water) # lm(response~explanatory)
round(summary(lm.water)$coefficients, 3)
```

```
#>             Estimate Std. Error t value Pr(>|t|)
#> (Intercept)  197.156     21.478    9.18        0
#> Salnty        -5.514      0.636   -8.67        0
```

Using the ocean data, calculate a 95\% confidence interval for the true slope.

* Need the $t^*$ multiplier for a 95\% confidence interval from a t-distribution with _________ df.


``` r
qt(0.975, df=98, lower.tail = TRUE)
```

```
#> [1] 1.984467
```

\vspace{1in}

### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. Explain why theory-based methods should not be used to analyze the salinity study?

\vspace{0.6in}

2. What is the proper notation for the population slope? Population correlation?

\vspace{0.4in}


\newpage
