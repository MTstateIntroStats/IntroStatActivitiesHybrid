## Guided Lecture Module 4:  IPEDS (continued)

\setstretch{1}

### Learning outcomes

* Identify and create appropriate summary statistics and plots
  given a data set with two quantitative variables.
  
* Calculate and interpret $r^2$, the coefficient of determination, in context of the problem.

* Find the correlation coefficient from `R` output or from $r^2$ and the sign of the slope.

### Terminology review

In today's activity, we will review summary measures and plots for two quantitative variables.  Some terms covered in this activity are:

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

* Note that several variables have missing values for some institutions (denoted by “NA”).


\begin{center}\includegraphics[width=0.77\linewidth]{images/IPEDS_Description} \end{center}

The following shows a scatterplot of in-state tution cost by retention rate for 4-year US Higher Education Institutions.


```r
IPEDS <- read.csv("https://www.math.montana.edu/courses/s216/data/IPEDS_2018.csv") 
IPEDS <- IPEDS %>%
  filter(Sector != "Public 2-year") #Filters the data set to remove Public 2-year
IPEDS <- IPEDS %>%
  filter(Sector != "Private 2-year") #Filters the data set to remove Private 2-year
IPEDS <- na.omit(IPEDS)

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



\begin{center}\includegraphics[width=0.8\linewidth]{04-GA04-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-2-1} \end{center}
1. Describe the relationship between SAT Math 75th percentile score and retention rate.

\vspace{0.6in}

#### Linear Regression {-}


```r
# Fit linear model: y ~ x
IPEDSLM <- lm(Retention~SATMath_75, data=IPEDS)
summary(IPEDSLM)$coefficients # Display coefficient summary
```

```
#>               Estimate  Std. Error     t value      Pr(>|t|)
#> (Intercept) 0.05925934 1.898441535  0.03121473  9.751037e-01
#> SATMath_75  0.12480572 0.003082746 40.48524871 4.370412e-223
```

2.  Write out the least squares regression line using the summary statistics from the R output in context of the problem.

\vspace{0.3in}

**Slope Interpretation**: An increase of one point in SAT Math 75th percentile score is associated with an increase in retention rate, on average, of 0.124 percentage points for 4-year higher education institutions.

3. Predict the retention rate for a 4-year US higher education institution with a SAT Math 75th percentile score of 440.

\vspace{0.4in}

4. Calculate the residual for a 4-year US higher education institution with a SAT Math 75th percentile score of 440 and a retention rate of 24%.

\vspace{0.4in}

#### Correlation  {-}

Correlation measures the strength and the direction of the linear relationship between two quantitative variables.  The closer the value of correlation to $+1$ or $-1$, the stronger the linear relationship.  Values close to zero indicate a very weak linear relationship between the two variables.  

<!-- The following output shows a correlation matrix between several pairs of quantitative variables.  Upload and open the Movie Profits Out of Class Activity F22 Code `R` script file. Highlight and run lines 1--12. Highlight and run lines 1--12 to produce the same table as below. -->



```r
IPEDS %>%  # Data set pipes into
  select(c("Retention", "Cost_InState", 
           "Graduation_Rate", "Salary", 
           "SATMath_75", "ACT_75", "Enrollment")) %>%
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
#> Enrollment          0.382       -0.241           0.274  0.511      0.356  0.329
#>                 Enrollment
#> Retention            0.382
#> Cost_InState        -0.241
#> Graduation_Rate      0.274
#> Salary               0.511
#> SATMath_75           0.356
#> ACT_75               0.329
#> Enrollment           1.000
```

5.  What is the value of correlation between SATMath_75 and Retention?

\vspace{0.3in}

#### Coefficient of determination (squared correlation) {-}

Another summary measure used to explain the linear relationship between two quantitative variables is the coefficient of determination ($r^2$). The coefficient of determination, $r^2$, can also be used to describe the strength of the linear relationship between two quantitative variables. The value of $r^2$ (a value between 0 and 1) represents the **proportion of variation in the response that is explained by the least squares line with the explanatory variable**.  There are two ways to calculate the coefficient of determination: 

|    Square the correlation coefficient:  $r^2 = (r)^2$

|    Use the variances of the response and the residuals:  $r^2 = \dfrac{s_y^2 - s_{RES}^2}{s_y^2} = \dfrac{SST - SSE}{SST}$


6.  Use the correlation, $r$, found in question 3 of the activity, to calculate the coefficient of determination between budget and revenue, $r^2$.

\vspace{.4in}

\newpage

7.  *The variance of the response variable, revenue in \$MM, is about $s_{revenue}^2 = 8024.261$ \$MM$^2$  and the variability in the residuals is about $s_{RES}^2 = 4244.832$ \$MM$^2$.  Use these values to calculate the coefficient of determination.  Verify that your answers to 4 and 5 are the same.*

\vspace{1in}

In the next part of the activity we will explore what the coefficient of determination measures. 

In the scatterplot below, we see the data plotted with a horizontal line. Note that the regression line in this plot has a slope of zero; this assumes there is no relationship between budget and revenue. The value of the y-intercept, 73.8525, is the mean of the response variable when there is no relationship between the two variables.  To find the sum of squares total (SST) we find the residual ($residual = y - \hat{y}$) for each response value from the horizontal line (from the value of 73.8525).  Each residual is squared and the sum of the squared values is calculated.  The SST gives the **total variability in the response variable, revenue**.  


\begin{center}\includegraphics[width=0.7\linewidth]{04-GA04-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-5-1} \end{center}

The calculated value for the SST is 93318.731.  

<!-- 6.  Write down the value of SSE given in this image.  Since this is the sum of squared errors (SSE) for the horizontal line we call this the total sum of squares (SST). -->
<!-- \vspace{3mm} -->

<!--     SST =  -->

This next scatterplot, shows the plotted data with the best fit regression line.  We will learn more about the regression line in the next class. This is the line of best fit between budget and revenue and has the smallest sum of squares error (SSE).  The SSE is calculated by finding the residual from each response value to the regression line.  Each residual is squared and the sum of the squared values is calculated.


\begin{center}\includegraphics[width=0.7\linewidth]{04-GA04-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-6-1} \end{center}

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

6.  Calculate the value for $r^2$ using the values for SST and SSE provided below each of the previous graphs.  

\vspace{1in}

7.  Write a sentence interpreting the coefficient of determination in context of the problem.

\newpage


**ADD multivariable**


```r
IPEDS %>% # Data sest pipes into...
    ggplot(aes(x = SATMath_75, y = Retention, shape = Sector, color=Sector))+  # Specify variables
    geom_point(alpha=0.5) +  # Add scatterplot of points
    labs(x = "75th Percentile SAT Math Score",  # Label x-axis
       y = "Retention Rate (%)",  # Label y-axis
       title = "Scatterplot of SAT Math Score vs. Retention Rate for 
       4-year US Higher Education Institutions") + 
    # Be sure to title your plots with the type of plot, observational units, variable(s)
    geom_smooth(method = "lm", se = FALSE) + # Add regression line
    theme_bw()
```



\begin{center}\includegraphics[width=0.7\linewidth]{04-GA04-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-7-1} \end{center}


### Take-home messages

1. The sign of correlation and the sign of the slope will always be the same.  The closer the value of correlation is to $-1$ or $+1$, the stronger the linear relationship between the explanatory and the response variable.  

2.  The coefficient of determination multiplied by 100 ($r^2 \times 100$) measures the percent of variation in the response variable that is explained by the relationship with the explanatory variable.  The closer the value of the coefficient of determination is to 100\%, the stronger the relationship.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
