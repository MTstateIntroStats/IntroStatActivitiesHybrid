## Activity 21: Golf Driving Distance

\setstretch{1}

### Learning outcomes

* Given a research question involving two quantitative variables, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.
  
* Assess the conditions to use the normal distribution model for a slope.

* Find the T test statistic (T-score) for a slope based off of `lm()` output in R.

* Find, interpret, and evaluate the p-value for a theory-based hypothesis test for a slope.

* Create and interpret a theory-based confidence interval for a slope.

* Use a confidence interval to determine the conclusion of a hypothesis test.

### Terminology review
In this week's in-class activity, we will use theory-based methods for hypothesis tests and confidence intervals for a linear regression slope. Some terms covered in this activity are:

* Slope 

* Regression line

To review these concepts, see Chapter 21 in the textbook.


### Golf driving distance

In golf the goal is to complete a hole with as few strokes as possible.  A long driving distance to start a hole can help minimize the strokes necessary to complete the hole, as long as that drive stays on the fairway.  Data were collected on 354 PGA and LPGA players in 2008 [@pga].  For each player, the average driving distance (yards), fairway accuracy (percentage), and league (PGA or LPGA) was measured.  Use these data to assess, "Does a professional golfer give up accuracy when they hit the ball farther?"

* Observational units:

* Explanatory variable:

* Response variable:

### R Instructions {-}
* Download the R script file from Canvas and open in the RStudio server


``` r
# Read in data set
golf <- read.csv("https://math.montana.edu/courses/s216/data/golf.csv")
```

#### Plot review. {-}

To create a scatterplot showing the relationship between the driving distance and percent accuracy for professional golfers:

* Enter the name of the explanatory and response in line 10

* Highlight and run lines 1 - 16


``` r
golf %>% # Pipe data set into...
ggplot(aes(x = Driving_Distance, y = Percent_Accuracy))+  # Specify variables
  geom_point(alpha=0.5) +  # Add scatterplot of points
  labs(x = "Driving Distance (yards)",  # Label x-axis
       y = "Percent Accuracy (%)",  # Label y-axis
       title = "Scatterplot of Driving Distance by Percent Accuracy
       for Professional Golfers") + 
               # Be sure to tile your plots
  geom_smooth(method = "lm", se = FALSE)  # Add regression line
```



\begin{center}\includegraphics[width=0.7\linewidth]{12-A21-regression-theory_files/figure-latex/unnamed-chunk-2-1} \end{center}

#### Conditions for the least squares line {-}

When performing inference on a least squares line, the follow conditions are generally required:

* *Independent observations* (for both simulation-based and theory-based methods): individual data points must be independent.
    - Check this assumption by investigating the sampling method and determining if the observational units are related in any way.
    
* *Linearity* (for both simulation-based and theory-based methods): the data should follow a linear trend.
    - Check this assumption by examining the scatterplot of the two variables, and a scatterplot of the residuals (on the $y$-axis) versus the fitted values (on the $x$-axis). The pattern in the residual plot should display a horizontal line.

* *Constant variability* (for theory-based methods only): the variability of points around the least squares line remains roughly constant
    - Check this assumption by examining a scatterplot of the residuals (on the $y$-axis) versus the fitted values (on the $x$-axis). The variability in the residuals around zero should be approximately the same for all fitted values.

* *Nearly normal residuals* (for theory-based methods only: residuals must be nearly normal.
    - Check this assumption by examining a histogram of the residuals, which should appear approximately normal.

The scatterplot generated earlier and the residual plots shown below will be used to assess these conditions for approximating the data with the $t$-distribution.


\begin{center}\includegraphics[width=0.7\linewidth]{12-A21-regression-theory_files/figure-latex/unnamed-chunk-3-1} \end{center}
**Verify the conditions are met to use theory-based methods**

\vspace{3in}


#### Ask a research question {-}

Use these data to assess, "Does a professional golfer give up accuracy when they hit the ball farther?"

**Parameter of interest in context of the study:**

\vspace{1in}

**Null Hypothesis (in words):**

\vspace{1in}

**Null Hypothesis (in notation):**

\vspace{0.3in}

**Alternative Hypothesis (in words):**

\vspace{1in}

**Alternative Hypothesis (in notation):**

\vspace{0.3in}

#### Summarize and visualize the data {-}

The linear model output for this study is shown below.


``` r
lm.golf <- lm(Percent_Accuracy~Driving_Distance, data=golf) # lm(response~explanatory)
round(summary(lm.golf)$coefficients, 3)
```

```
#>                  Estimate Std. Error t value Pr(>|t|)
#> (Intercept)       103.586      3.329  31.119        0
#> Driving_Distance   -0.142      0.012 -11.553        0
```
1. Report and interpret the summary statistic (sample slope) for the linear relationship between driving distance and percent accuracy of golfers.  Use proper notation.

\vspace{1in}

#### Use statistical inferential methods to draw inferences from the data {-}

##### Hypothesis test {-}
To find the value of the standardized statistic to test the slope we will use, 

$$
T = \frac{\mbox{slope estimate}-null value}{SE} = \frac{b_1-0}{SE(b_1)}.
$$
 
We will use the linear model R output above to get the estimate for slope and the standard error of the slope.

**Calculate the standardized statistic for slope.**

\vspace{0.7in}

**Report the p-value to answer the research question.**

\vspace{0.5in}

##### Confidence interval {-}
Recall that a confidence interval is calculated by adding and subtracting the margin of error to the point estimate.  
$$\mbox{point estimate}\pm t^*\times SE(\mbox{estimate}).$$
When the point estimate is a regression slope, this formula becomes 
$$b_1 \pm t^* \times SE(b_1).$$
 
The $t^*$ multiplier comes from a $t$-distribution with $n-2$ degrees of freedom.  The sample size for this study is 354 so we will use the degrees of freedom 352 ($n-2$).

* Enter the percentile needed to find the multiplier for a 95\% confidence interval for xx

* Enter the degrees of freedom for yy

* Highlight and run line 34


``` r
qt(xx, yy, lower.tail = TRUE) # 95% t* multiplier 
```

**Calculate the 95\% confidence interval for the true slope.**
\vspace{0.8in}

**Interpret the 95\% confidence interval in context of the problem.**

\vspace{.8in}

#### Communicate the results and answer the research question {-}

2. Write a conclusion to answer the research question in context of the problem.

\vspace{.8in}

#### Simulation-based hypothesis test {-}

Let's start by thinking about how one simulation would be created on the null distribution using cards.  First, we would write the values for the response variable, total length, on each card.  Next, we would shuffle these $y$ values while keeping the $x$ values (explanatory variable) in the same order.  Then, find the line of regression for the shuffled $(x, y)$ pairs and calculate either the slope or correlation of the shuffled sample.  

We will use the `regression_test()` function in R (in the `catstats` package) to simulate the null distribution of shuffled slopes (or shuffled correlations) and compute a p-value.  We will need to enter the response variable name and the explanatory variable name for the formula, the data set name, the summary measure for the test (either slope or correlation), number of repetitions, the sample statistic (value of slope or correlation), and the direction of the alternative hypothesis.

3. What inputs should be entered for each of the following to create the simulation to test regression slope?

\vspace{.5 mm}

* Direction (`"greater"`, `"less"`, or `"two-sided"`):

\vspace{.2in}

* Summary measure (choose `"slope"` or `"correlation"`):

\vspace{.2in}
* As extreme as (enter the value for the sample slope):

\vspace{0.2in}

* Number of repetitions:
    
\vspace{.2in}

Using the R script file for this activity...

* Enter your answers for question 3 in place of the `xx`'s to produce the null distribution with 10000 simulations.  

* Highlight and run lines 38--43.


``` r
regression_test(Percent_Accuracy~Driving_Distance, # response ~ explanatory
               data = golf, # Name of data set
               direction = "less", # Sign in alternative ("greater", "less", "two-sided")
               summary_measure = "slope", # "slope" or "correlation"
               as_extreme_as = -0.142, # Observed slope or correlation
               number_repetitions = 10000) # Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{12-A21-regression-theory_files/figure-latex/unnamed-chunk-6-1} \end{center}

#### Simulation-based confidence interval {-}

We will use the `regression_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample slopes (or sample correlations) and calculate a confidence interval. 

* Fill in the missing values in the provided R script file to find a 95\% confidence interval for slope.

* Highlight and run lines 42--46. 


``` r
regression_bootstrap_CI(Percent_Accuracy~Driving_Distance, # response ~ explanatory
   data = golf, # Name of data set
   confidence_level = 0.95, # Confidence level as decimal
   summary_measure = "slope", # Slope or correlation
   number_repetitions = 10000) # Number of simulated samples for bootstrap distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{12-A21-regression-theory_files/figure-latex/unnamed-chunk-7-1} \end{center}

### Multivariable plots {-}

Another variable that may affect the percent accuracy is the which league the golfer is part of. We will look at how this variable may change the relationship between driving distance and percent accuracy. 


``` r
golf %>%
  ggplot(aes(x = Driving_Distance, y = Percent_Accuracy, color=League))+  # Specify variables
  geom_point(aes(shape = League), size = 2, alpha=0.5) +  # Add scatterplot of points
  labs(x = "Driving Distance (yards)",  # Label x-axis
       y = "Percent Accuracy (%)",  # Label y-axis
       color = "League", shape = "League",
       title = "Scatterplot of Golf Driving Distance and Percent 
       Accuracy by League for Professional Golfers") + # Be sure to title your plots
  geom_smooth(method = "lm", se = FALSE) + # Add regression line
    scale_color_grey()
```



\begin{center}\includegraphics[width=0.6\linewidth]{12-A21-regression-theory_files/figure-latex/unnamed-chunk-8-1} \end{center}

4. Does the association between driving distance and percent accuracy change depending on which league the golfer is a part of?  Explain your answer.  
\vspace{1in}

5.  Explain the association between league and each of the other two variables.  Use the following plots in addition to the scatterplot from Q4 to explain your answer.


\begin{center}\includegraphics[width=0.7\linewidth]{12-A21-regression-theory_files/figure-latex/unnamed-chunk-9-1} \includegraphics[width=0.7\linewidth]{12-A21-regression-theory_files/figure-latex/unnamed-chunk-9-2} \end{center}

\vspace{0.8in}

\newpage

### Take-home messages


1. To check the validity conditions for using theory-based methods we must use the residual diagnostic plots to check for normality of residuals and constant variability, and the scatterplot to check for linearity.  

2. To interpret a confidence interval for the slope, think about how to interpret the sample slope and use that information in the confidence interval interpretation for slope.  

3. Use the explanatory variable row in the linear model R output to obtain the slope estimate (`estimate` column) and standard error of the slope (`Std. Error` column) to calculate the standardized slope, or T-score.  The calculated T-score should match the `t value` column in the explanatory variable row. The standardized slope tells the number of standard errors the observed slope is above or below 0.

4. The explanatory variable row in the linear model R output provides a **two-sided** p-value under the `Pr(>|t|)` column.

5. The standardized slope is compared to a $t$-distribution with $n-2$ degrees of freedom in order to obtain a p-value.  The $t$-distribution with $n-2$ degrees of freedom is also used to find the appropriate multiplier for a given confidence level.


### Additional notes

Use this space to summarize your thoughts and take additional notes on this week's activity and material covered.

\newpage
