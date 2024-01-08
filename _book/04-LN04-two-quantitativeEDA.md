# Exploring Multivariable Data

## Lecture Notes Week 4: Regression and Correlation

\setstretch{1}

### Summary measures and plots for two quantitative variables {-}

\setstretch{1.5}

A __________________ is used to display the relationship
between two ___________________ variables.

\setstretch{1}

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

\setstretch{1.5}

The summary measures for two quantitative variables are:

* ____________________________

* ____________________________

* ____________________________

\setstretch{1}

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

    SSE = 
    
    * To find SSE, the _________ for each data point is found, squared and all the squared residuals are summed together
    
Correlation is always between the values of _______ and ________.  

* Measures the _____________ and ______________ of the linear relationship between two quantitative variables.

* The stronger the relationship between the variables the closer the value of _______________ is to ________ or ________.

* The sign gives the _________________.

The coefficient of determination can be found by squaring the value of correlation, using the _____________ for each variable or using the SSE (sum of squares error) and SST (sum of squares total)

* $r^2 = (r)^2 = \frac{SST - SSE}{SST} = \frac{s^2_y - s^2_{residual}}{s^2_y}$

* The coefficient of determination measures the ____________ of total variation in the ___________ variable that is explained by the changes in the _____________ variable.

Notation:

* Population slope: 

* Population correlation:

* Sample slope:

* Sample correlation:

\setstretch{1}

\vspace{1mm}

Example for class discussion: Data were collected from 1236 births between 1960 and 1967 in the San Francisco East Bay area to better understand what variables contributed to child birthweight, as children with low birthweight often suffer from an array of complications later in life [@babies]. There were some missing values in the study and with those observations removed we have a total of 1223 births.


```r
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

The following shows a scatterplot of length of gestation as a predictor of birthweight.


```r
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



\begin{center}\includegraphics[width=0.8\linewidth]{04-LN04-two-quantitativeEDA_files/figure-latex/unnamed-chunk-2-1} \end{center}

Describe the scatterplot using the four characteristics of a scatterplot.

\vspace{1in}

The linear model output for this study is given below:


```r
# Fit linear model: y ~ x
babiesLM <- lm(bwt ~ gestation, data=babies)
summary(babiesLM)$coefficients # Display coefficient summary
#>                Estimate Std. Error   t value     Pr(>|t|)
#> (Intercept) -10.0641842 8.32220357 -1.209317 2.267751e-01
#> gestation     0.4642626 0.02974366 15.608793 3.224362e-50
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

The following code creates a correlation matrix between different quantitative variables in the data set.


```r
babies %>%
    select(c("gestation", "age", "height", "weight", "bwt")) %>%
    cor(use="pairwise.complete.obs") %>%
    round(3)
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




\begin{center}\includegraphics[width=0.7\linewidth]{04-LN04-two-quantitativeEDA_files/figure-latex/unnamed-chunk-6-1} \end{center}

The value for SST was calculated as 406753.48.  The value for SSE was calculated as 339092.13.

Calculate the coefficient of determination between gestation and birthweight.

\vspace{0.3in}

Interpret the coefficient of determination between gestation and birthweight.

\vspace{0.5in}

\newpage

#### Multivariable plots {-}

Aesthetics: visual property of the objects in your plot

\setstretch{1.5}

* Position on the axes: groups for _______________ variables, or a number line if the variable is _________________

* Color or shape - to represent _______________ variables

* Size - to represent ________________ variables

\setstretch{1}

Adding the quantitative variable maternal age to the scatterplot between gestation and birthweight.


```r
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



\begin{center}\includegraphics[width=0.8\linewidth]{04-LN04-two-quantitativeEDA_files/figure-latex/unnamed-chunk-7-1} \end{center}

\newpage


Let's add the categorical variable, whether a mother smoked, to the scatterplot between gestation and birthweight.


```r
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



\begin{center}\includegraphics[width=0.8\linewidth]{04-LN04-two-quantitativeEDA_files/figure-latex/unnamed-chunk-8-1} \end{center}

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

\newpage
