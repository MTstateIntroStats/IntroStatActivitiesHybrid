## Activity 19:  Moneyball --- Linear Regression

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

### Moneyball

The goal of a Major League baseball team is to make the playoffs. In 2002, the manager of the Oakland A’s, Billy Bean, with the help of Paul DePodesta began to use statistics to determine which players to choose for their season. Based on past data, DePodesta determined that to make it to the playoffs, the A’s would need to win at least 95 games in the regular season. In order to win more games, they would need to score more runs than they allowed. The Oakland A’s won 20 consecutive games and a total of 103 games for the season. The success of this use of sports analytics was portrayed by the 2011 movie, Moneyball. In this study, we will see if there is evidence of a positive linear relationship between the difference in the number of runs scored minus the number of runs allowed (`RD`) and the number of wins for Major League baseball teams in the years before 2002. Some of the variables collected in the data set baseball consist of the following:

| **Variable** 	| **Description** |
|----	|-------------	|
| `RA` | Runs allowed |
| `RS` | Runs scored|
| `OBP` | On-base percentage|
| `SLG` | Slugging percentage|
| `BA` | Batting average |
| `OOBP` | Opponent's on-base percentage |
| `OSLG` | Opponent's slugging percentage |
| `W` | Number of wins in the season |
| `RD` | Difference of runs scored minus runs allowed |


``` r
moneyball <- read.csv("data/baseball.csv") # Reads in data set 
moneyball$RD <- moneyball$RS - moneyball$RA
moneyball <- 
    moneyball %>% # Pipe data set into
    subset(Year < 2002) # Select only years before 2002
```

* Observational units:

* Explanatory variable:

* Response variable:

### Notes on two quantitative variables{-}

\vspace{2in}

#### R Instructions {-}

* Use the provided R script file to create a scatterplot to examine the relationship between the difference in number of runs scored minus number of runs allowed and the number of wins by filling in the variable names (RD and W) for explanatory and response in line 13. Note, we are using the difference in runs scores minus runs allowed to predict the number of season wins.

* Highlight and run lines 1--19.


``` r
moneyball %>% # Data set pipes into...
    ggplot(aes(x = RD, y = W))+ # Specify variables
    geom_point() + # Add scatterplot of points
    labs(x = "Difference in number of runs", # Label x-axis
         y = "Number of Season wins", # Label y-axis
         title = "Scatterplot of Run Difference vs. Number of Season 
         Wins for MLB Teams") +
# Be sure to tile your plots
geom_smooth(method = "lm", se = FALSE) # Add regression line
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

The linear model function in R (`lm()`) gives us the summary for the least squares regression line.  The estimate for `(Intercept)` is the $y$-intercept for the line of least squares, and the estimate for `budget_mil` (the $x$-variable name) is the value of $b_1$, the slope.  

* Run lines 22--23 in the R script file to reproduce the linear model output found in the coursepack.


``` r
# Fit linear model: y ~ x
moneyballLM <- lm(W~RD, data=moneyball)
round(summary(moneyballLM)$coefficients, 3) # Display coefficient summary
```

```
#>             Estimate Std. Error t value Pr(>|t|)
#> (Intercept)   80.881      0.131 616.675        0
#> RD             0.106      0.001  81.554        0
```

**Write out the least squares regression line using the summary statistics provided above in context of the problem.**
\vspace{0.6in}

**Interpret the value of slope in context of the problem.**

\vspace{.6in}

**Using the least squares line, predict the number of season wins for a MLB team that has a run difference of -66 runs.**

\vspace{.6in}

#### Residuals {-}

The model we are using assumes the relationship between the two variables follows a straight line. The residuals are the errors, or the variability in the response that hasn't been modeled by the regression line.

\begin{center}

$\implies$ Residual = actual y value $-$ predicted y value

$e=y-\hat{y}$
\end{center}

**The MLB team *Florida Marlins* had a run difference of -66 runs and 79 wins for the season.  Find the residual for this MLB team.**

\vspace{.5in}

**Did the line of regression overestimate or underestimate the number of wins for the season for this team?**

\vspace{.2in}

#### Correlation  {-}

The following output shows a correlation matrix between several pairs of quantitative variables.  

* Highlight and run lines 26--30 to produce the same table as below.



``` r
moneyball %>%  # Data set pipes into
  select(c("RD", "BA", 
           "SLG", "W")) %>%
  cor(use="pairwise.complete.obs") %>%
  round(3)
```

```
#>        RD    BA   SLG     W
#> RD  1.000 0.442 0.428 0.939
#> BA  0.442 1.000 0.814 0.416
#> SLG 0.428 0.814 1.000 0.406
#> W   0.939 0.416 0.406 1.000
```
**Report the value of correlation between the run difference and the number of season wins.**

\vspace{0.3in}

**Calculate the coefficient of determination between the run difference and the number of season wins.**

\vspace{0.5in}

**Interpret the value of coefficient of determination in context of the study.**

\vspace{0.7in}

### Take-home messages

1.	Two quantitative variables are graphically displayed in a scatterplot.  The explanatory variable is on the $x$-axis and the response variable is on the $y$-axis.  When describing the relationship between two quantitative variables we look at the form (linear or non-linear), direction (positive or negative), strength, and for the presence of outliers. 

2.  There are three summary statistics used to summarize the relationship between two quantitative variables: correlation ($r$), slope of the regression line ($b_1$), and the coefficient of determination ($r^2$).  

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
