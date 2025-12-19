## Activity 19:  IPEDS (continued) --- Linear Regression

\setstretch{1}

### Learning outcomes

* Identify and create appropriate summary statistics and plots
  given a data set with two quantitative variables.
  
* Use scatterplots to assess the relationship between two quantitative variables.

* Find the estimated line of regression using summary statistics and `R` linear model (`lm()`) output.

* Interpret the slope coefficient in context of the problem.

### Terminology review

In today's activity, we will review summary measures and plots for two quantitative variables.  Some terms covered in this activity are:

* Scatterplot

* Least-squares line of regression

* Slope and $y$-intercept

* Residuals

To review these concepts, see Chapter 6 & 7 in the textbook.  

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


``` r
IPEDS <- read.csv("https://www.math.montana.edu/courses/s216/data/IPEDS_2018.csv") 
IPEDS <- IPEDS %>%
  filter(Sector != "Public 2-year") #Filters the data set to remove Public 2-year
IPEDS <- IPEDS %>%
  filter(Sector != "Private 2-year") #Filters the data set to remove Private 2-year
IPEDS <- na.omit(IPEDS)
```

### Notes on two quantitative variables{-}

\vspace{2in}

#### R Instructions {-}

For this study, we will look to see if 75th percentile math SAT score can be used to predict the retention rate of 4-year higher education institutions.

\vspace{2mm}
* Observational units:

\vspace{2mm}   

* Explanatory variable:

    * Units?:

\vspace{2mm}
* Response variable:

    * Units?:

\vspace{2mm}

* Use the provided R script file to create a scatterplot to examine the relationship between 75th percentile Math SAT score by retention rate for 4-year US Higher Education Institutions by filling in the variable names for explanatory and response in line 16. Note, we are using the 75th percentile Math SAT score to predict the retention rate.

* Highlight and run lines 1--21.


``` r
IPEDS %>% # Data set pipes into...
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



\begin{center}\includegraphics[width=0.7\linewidth]{12-A19-EDA-two-quantitative_files/figure-latex/unnamed-chunk-2-1} \end{center}

Assess the four features of the scatterplot that describe this relationship. 

* Form (linear, non-linear)

\vspace{.075in}

* Direction (positive, negative)

\vspace{.075in}

* Strength

\vspace{.075in}

* Unusual observations or outliers

\vspace{.075in}

#### Slope {-}

The linear model function in R (`lm()`) gives us the summary for the least squares regression line.  The estimate for `(Intercept)` is the estimated $y$-intercept, $b_0$ for the line of least squares, and the estimate for `STAMath_75` (the $x$-variable name) is the value of $b_1$, the estimated slope.  

* Enter `Retention` for response and `SATMath_75` for explanatory in line 25

* Highlight and run lines 25--26 to fit the linear model.


``` r
# Fit linear model: y ~ x
IPEDSLM <- lm(Retention~SATMath_75, data=IPEDS)
round(summary(IPEDSLM)$coefficients, 5) # Display coefficient summary
```

```
#>             Estimate Std. Error  t value Pr(>|t|)
#> (Intercept)  0.05926    1.89844  0.03121   0.9751
#> SATMath_75   0.12481    0.00308 40.48525   0.0000
```

**Write out the least squares regression line using the summary statistics provided above in context of the problem.**
\vspace{0.6in}

**Interpret the value of slope in context of the problem.**

\vspace{.6in}

**Using the least squares line, predict the retention rate for a 4-year US higher education institution with a 75th percentile SAT Math score of 445.**

\vspace{.6in}


#### Residuals {-}

The model we are using assumes the relationship between the two variables follows a straight line. The residuals are the errors, or the variability in the response that hasn't been modeled by the regression line.

\begin{center}

$\implies$ Residual = actual y value $-$ predicted y value

$e=y-\hat{y}$
\end{center}

**Calculate the residual for a 4-year US higher education institution with a 75th percentile SAT Math score of 445 and a retention rate of 11\%.**

\vspace{.5in}

1. Circle the point ($445, 11$) on the scatterplot.  Is the residual positive or negative?

\vspace{0.2in}

2. Did the line of regression overestimate or underestimate the retention rate for this 4-year US higher education institution?

\vspace{.2in}

#### Correlation  {-}

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

**Report the value of correlation between the 75th SAT Math score and the retention rate.**

\vspace{0.3in}

3.  Which pair of variables have the strongest correlation?  

\vspace{0.4in}

4. Which pair of variables have the weakest correlation?

\vspace{0.4in}

#### Leverage and influential observations {-}

* Influential points are outliers that change the regression line; these points are far from the line of regression

* High leverage points are outliers that are extreme in the x-axis; these points are far from the mean of the variable on the x-axis

Let's review the scatterplot between the two variables.  


\begin{center}\includegraphics[width=0.6\linewidth]{12-A19-EDA-two-quantitative_files/figure-latex/unnamed-chunk-5-1} \end{center}
5. Circle any values that may have high leverage.  Put a square around any values that may be influential.

\vspace{0.1in}

Earlier in the activity we identified a couple of observations that are potential outliers.  One of these values is ($445, 11$).  The following plot was created without this point included.


\begin{center}\includegraphics[width=0.6\linewidth]{12-A19-EDA-two-quantitative_files/figure-latex/unnamed-chunk-6-1} \end{center}


```
#>             Estimate Std. Error t value Pr(>|t|)
#> (Intercept)    0.861      1.875   0.459    0.646
#> SATMath_75     0.124      0.003  40.598    0.000
```

6. Note that the slope of the line has not changed much between the original data set and the data set with the values removed.  Would you consider this point to be influential?

\vspace{0.6in}

7. In the next plot, note that one extreme values have been added to the data set.  Circle this point on the plot.


\begin{center}\includegraphics[width=0.6\linewidth]{12-A19-EDA-two-quantitative_files/figure-latex/unnamed-chunk-8-1} \end{center}
8.  The linear model and correlation output for the data set with the added point is provided below.  Did the slope and/or value of correlation change?

Linear model output for the data set with the added points:

```
#>                  Estimate Std. Error t value Pr(>|t|)
#> (Intercept)         2.408      2.031   1.186    0.236
#> IPEDS.SATMath_75    0.121      0.003  36.650    0.000
```

Correlation between the 75th percentile Math SAT score and retention rate for the data set with the added point:


```
#> [1] 0.7347292
```
\vspace{0.5in}

9. Are the values of slope and correlation resistant to outliers?

\vspace{0.6in}

### Take-home messages

1.	Two quantitative variables are graphically displayed in a scatterplot.  The explanatory variable is on the $x$-axis and the response variable is on the $y$-axis.  When describing the relationship between two quantitative variables we look at the form (linear or non-linear), direction (positive or negative), strength, and for the presence of outliers. 

2.  There are three summary statistics used to summarize the relationship between two quantitative variables: correlation ($r$), slope of the regression line ($b_1$), and the coefficient of determination ($r^2$).  In this activity, we reviewed the first two summary measures, correlation and slope.  We will explore the coefficient of determination in the next activity.

3. Points that are far from the mean of the predictor (x-axis variable) and that do not follow the pattern of the relationship can impact the line and be influential. 

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
