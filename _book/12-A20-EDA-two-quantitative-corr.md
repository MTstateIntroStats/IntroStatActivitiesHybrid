---
output:
  pdf_document: default
  html_document: default
---
## Activity 20:  IPEDS (continued)

\setstretch{1}

### Learning outcomes

* Identify and create appropriate summary statistics and plots
  given a data set with two quantitative variables.
  
* Find the estimated line of regression using summary statistics and `R` linear model (`lm()`) output.

* Interpret the slope coefficient in context of the problem.

* Calculate and interpret $r^2$, the coefficient of determination, in context of the problem.

* Find the correlation coefficient from `R` output or from $r^2$ and the sign of the slope.

### Terminology review

In today's activity, we will review summary measures and plots for two quantitative variables.  Some terms covered in this activity are:

* Least-squares line of regression

* Slope and $y$-intercept

* Residuals

* Correlation ($r$)

* Coefficient of determination ($r$-squared)

To review these concepts, see Chapter 6 in the textbook.  

### The Integrated Postsecondary Education Data System (IPEDS)

We will continue to assess the IPEDS data set collected on a subset of institutions that met the following selection criteria [@ipeds]:

* Degree granting 

* United States only

* Title IV participating

* Not for profit

* 2-year or 4-year or above

* Has full-time first-time undergraduates

Some of the variables collected and their descriptions are below. Note that several variables have missing values for some institutions (denoted by “NA”).

| **Variable** 	| **Description** |
|----	|-------------	|
| `UnitID` | Unique institution identifier |
| `Name` | Institution name |
| `State` | State abbreviation |
| `Sector` | whether public or private |
| `LandGrant` | Is this a land-grant institution (Yes/No) |
| `Size` | Institution size category based on total student enrolled for credit, Fall 2018: Under 1,000, 1,000 - 4,999, 5,000 - 9,999, 10,000 - 19,999, 20,000 and above |
| `Cost_OutofState` | Cost of attendance for full-time out-of-state undergraduate students |
| `Cost_InState` | Cost of attendance for full-time in-state undergraduate students |
| `Retention` | Retention rate is the percent of the undergraduate students that re-enroll in the next year |
| `Graduation_Rate` | 6-year graduation rate for undergraduate students |
| `SATMath_75` | 75th percentile Math SAT score |
| `ACT_75` | 75th percentile ACT score |

The code below reads in the needed data set, IPEDS_2018.csv, and filters out the 2-year institutions. 

* Highlight and run lines 1--11 to load the data set and filter out the 2-year institutions.


``` r
IPEDS <- read.csv("https://www.math.montana.edu/courses/s216/data/IPEDS_2018.csv") 
IPEDS <- IPEDS %>%
  filter(Sector != "Public 2-year") #Filters the data set to remove Public 2-year
IPEDS <- IPEDS %>%
  filter(Sector != "Private 2-year") #Filters the data set to remove Private 2-year
IPEDS <- na.omit(IPEDS)
```

To create a scatterplot of the 75th percentile Math SAT score by retention rate for 4-year US Higher Education Institutions...

* Enter the variable `SATMath_75` for explanatory and `Retention` for response in line 16.

* Highlight and run lines 15--21.


``` r
IPEDS %>% # Data sest pipes into...
    ggplot(aes(x = SATMath_75, y = Retention))+  # Specify variables
    geom_point(alpha=0.5) +  # Add scatterplot of points
    labs(x = "75th Percentile SAT Math Score",  # Label x-axis
       y = "Retention Rate (%)",  # Label y-axis
       title = "Scatterplot of SAT Math Score vs. Retention Rate for 
       4-year US Higher Education Institutions") + 
    # Be sure to title your plots with the type of plot, observational units, variable(s)
    geom_smooth(method = "lm", se = FALSE) + # Add regression line
    theme_bw()
```



\begin{center}\includegraphics[width=0.7\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-2-1} \end{center}

1. Describe the relationship, using the four characteristics of scatterplots, between 75th percentile SAT Math score and retention rate.

\vspace{1in}

#### Slope of the Least Squares Linear Regression Line {-}

There are three summary measures calculated from two quantitative variables: slope, correlation, and the coefficient of determination.  We will first assess the slope of the least squares regression line between 75th percentile SAT Math score and retention rate.  

* Enter `Retention` for response and `SATMath_75` for explanatory in line 25

* Highlight and run lines 25--26 to fit the linear model.


``` r
# Fit linear model: y ~ x
IPEDSLM <- lm(Retention~SATMath_75, data=IPEDS)
round(summary(IPEDSLM)$coefficients,3) # Display coefficient summary
```

```
#>             Estimate Std. Error t value Pr(>|t|)
#> (Intercept)    0.059      1.898   0.031    0.975
#> SATMath_75     0.125      0.003  40.485    0.000
```

2.  Write out the least squares regression line using the summary statistics from the R output in context of the problem.

\vspace{0.5in}

3. Interpret the value of slope.

\vspace{0.8in}

4. Predict the retention rate for a 4-year US higher education institution with a 75th percentile SAT Math score of 440.

\vspace{0.4in}

5. Calculate the residual for a 4-year US higher education institution with a 75th percentile SAT Math score of 440 and a retention rate of 24%.

\vspace{0.4in}

#### Correlation  {-}

Correlation measures the strength and the direction of the linear relationship between two quantitative variables.  The closer the value of correlation to $+1$ or $-1$, the stronger the linear relationship.  Values close to zero indicate a very weak linear relationship between the two variables.  

The following output creates a correlation matrix between several pairs of quantitative variables.  


``` r
IPEDS %>%  # Data set pipes into
  select(c("Retention", "Cost_InState", 
           "Graduation_Rate", "Salary", 
           "SATMath_75", "ACT_75")) %>%
  cor(use="pairwise.complete.obs") %>%
  round(3)
```

```
#>                 Retention Cost_InState Graduation_Rate Salary SATMath_75 ACT_75
#> Retention           1.000        0.388           0.832  0.698      0.767  0.768
#> Cost_InState        0.388        1.000           0.563  0.365      0.502  0.514
#> Graduation_Rate     0.832        0.563           1.000  0.683      0.817  0.833
#> Salary              0.698        0.365           0.683  1.000      0.747  0.706
#> SATMath_75          0.767        0.502           0.817  0.747      1.000  0.920
#> ACT_75              0.768        0.514           0.833  0.706      0.920  1.000
```

6.  What is the value of correlation between SATMath_75 and Retention?

\vspace{0.3in}

#### Coefficient of determination (squared correlation) {-}

Another summary measure used to explain the linear relationship between two quantitative variables is the coefficient of determination ($r^2$). The coefficient of determination, $r^2$, can also be used to describe the strength of the linear relationship between two quantitative variables. The value of $r^2$ (a value between 0 and 1) represents the **proportion of variation in the response that is explained by the least squares line with the explanatory variable**.  There are two ways to calculate the coefficient of determination: 

|    Square the correlation coefficient:  $r^2 = (r)^2$

|    Use the variances of the response and the residuals:  $r^2 = \dfrac{s_y^2 - s_{RES}^2}{s_y^2} = \dfrac{SST - SSE}{SST}$


7.  Use the correlation, $r$, found in question 6, to calculate the coefficient of determination between SATMath_75 and Retention, $r^2$.

\vspace{.4in}

The variance of the response variable, Retention (%), is $s_{Retention}^2 = 138.386$ $\%^2$  and the variability in the residuals is $s_{RES}^2 = 56.934$ \%$^2$.  Use these values to calculate the coefficient of determination.

\vspace{1in}

In the next part of the activity we will explore what the coefficient of determination measures. 

In the first scatterplot, we see the data plotted with a horizontal line. Note that the regression line in this plot has a slope of zero; this assumes there is no relationship between SATMath_75 and Retention. The value of the y-intercept, 76.387, is the mean of the response variable when there is no relationship between the two variables.  To find the sum of squares total (SST) we find the residual ($residual = y - \hat{y}$) for each response value from the horizontal line (from the value of 76.387).  Each residual is squared and the sum of the squared values is calculated.  The SST gives the **total variability in the response variable, Retention**.  


\begin{center}\includegraphics[width=0.7\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-5-1} \end{center}

The calculated value for the SST is 158451.8.  

<!-- 6.  Write down the value of SSE given in this image.  Since this is the sum of squared errors (SSE) for the horizontal line we call this the total sum of squares (SST). -->
<!-- \vspace{3mm} -->

<!--     SST =  -->

This next scatterplot, shows the plotted data with the best fit regression line.  This is the line of best fit between budget and revenue and has the smallest sum of squares error (SSE).  The SSE is calculated by finding the residual from each response value to the regression line.  Each residual is squared and the sum of the squared values is calculated.


\begin{center}\includegraphics[width=0.7\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-6-1} \end{center}

The calculated value for the SSE is 65133.022.

<!-- * Go to the website www.rossmanchance.com/ISIapplets.html and click on Corr/Regresssion under Quantitative Response.   -->

<!-- * Click `Clear` below the box containing the sample data.  -->

<!-- * Download and open the csv file "Movie2016" from D2L.  Copy the two columns containing `budget_mil` and `revenue_mil` including the headers and paste into the sample data box.   -->

<!-- * Click 'Use Data`. -->

<!-- 8.  Click on `Show Moveable Line`.  Write down the equation of the line given.  Why is the slope zero for this line? -->

<!-- \vspace{0.8in} -->

<!-- 9.  Click on `Show Squared Residuals`.  Write down the value for SSE.  Since this is the sum of squared errors (SSE) for the horizontal line we call this the total sum of squares (SST). -->

<!-- \newpage -->

<!-- 10. Click on `Show Regression Line`.  Write down the equation of the line given.  Does this match the least squares line found in Activity 4A question 4? -->

<!-- \vspace{1in} -->

<!-- 11. Click on `Show Squared Residuals`.  Write down the value for SSE. -->

<!-- \vspace{0.5in} -->

**Calculate the value for $r^2$ using the values for SST and SSE provided below each of the previous graphs.**

\vspace{0.6in}

8.  Write a sentence interpreting the coefficient of determination in context of the problem.

\newpage


#### Multivariable plots {-}

When adding another categorical predictor, we can add that variable as shape or color to the plot.  In the following code we have added the variable `Size`.  


``` r
IPEDS$Size <- factor(IPEDS$Size, levels = c("< 1000", "1,000-4,999", "5,000-9,999",
                                            "10,000-19,999", "20,000 and above"))
IPEDS %>% # Data set pipes into...
    ggplot(aes(x = SATMath_75, y = Retention, shape = Size, color=Size))+  # Specify variables
    geom_point(alpha=0.5) +  # Add scatterplot of points
    labs(x = "75th Percentile SAT Math Score",  # Label x-axis
       y = "Retention Rate (%)",  # Label y-axis
       title = "Scatterplot of SAT Math Score vs. Retention Rate for 
       4-year US Higher Education Institutions by Size") + 
    # Be sure to title your plots with the type of plot, observational units, variable(s)
    geom_smooth(method = "lm", se = FALSE) + # Add regression line
    scale_color_grey()
```



\begin{center}\includegraphics[width=0.7\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-7-1} \end{center}
9. Does the relationship between 75th percentile SAT math score and retention rate of 4-year institutions change depending on the level of size?

\vspace{0.8in}


\begin{center}\includegraphics[width=0.7\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-8-1} \includegraphics[width=0.7\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-8-2} \end{center}
10.  Is size of the higher education institution associated with retention rate?  Is size of the higher education institution associated with 75th percentile SAT Math Score?  

\vspace{1in}

\newpage

### Take-home messages

1. The sign of correlation and the sign of the slope will always be the same.  The closer the value of correlation is to $-1$ or $+1$, the stronger the linear relationship between the explanatory and the response variable.  

2.  The coefficient of determination multiplied by 100 ($r^2 \times 100$) measures the percent of variation in the response variable that is explained by the relationship with the explanatory variable.  The closer the value of the coefficient of determination is to 100\%, the stronger the relationship.

3.  We can use the line of regression to predict values of the response variable for values of the explanatory variable. Do not use values of the explanatory variable that are outside of the range of values in the data set to predict values of the response variable (reflect on why this is true.).  This is called **extrapolation**. 

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
