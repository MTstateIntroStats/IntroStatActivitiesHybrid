## Guided Activity 16: Golf Driving Distance

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

In golf the goal is to complete a hole with as few strokes as possible.  A long driving distance to start a hole can help minimize the strokes necessary to complete the hole, as long as that drive stays on the fairway.  Data were collected on 354 PGA and LPGA players in 2008 [@pga].  For each player, the average driving distance (yards), fairway accuracy (percentage), and sex was measured.  Use these data to assess, "Does a professional golfer give up accuracy when they hit the ball farther?"


```r
# Read in data set
golf <- read.csv("https://math.montana.edu/courses/s216/data/golf.csv")
```

#### Plot review. {-}

Following is a scatterplot showing the relationship between the driving distance and percent accuracy for professional golfers.  


```r
golf %>% # Pipe data set into...
ggplot(aes(x = Driving_Distance, y = Percent_Accuracy))+  # Specify variables
  geom_point(alpha=0.5) +  # Add scatterplot of points
  labs(x = "Driving Distance (yards)",  # Label x-axis
       y = "Percent Accuracy",  # Label y-axis
       title = "Scatterplot of Driving Distance by Percent Accuracy
       for Professional Golfers") + 
               # Be sure to tile your plots
  geom_smooth(method = "lm", se = FALSE)  # Add regression line
```



\begin{center}\includegraphics[width=0.7\linewidth]{11-GA14-regression-theory_files/figure-latex/unnamed-chunk-2-1} \end{center}

#### Conditions for the least squares line {-}

When performing inference on a least squares line, the follow conditions are generally required:

* *Independent observations* (for both simulation-based and theory-based methods): individual data points must be independent.
    - Check this assumption by investigating the sampling method and determining if the observational units are related in any way.
    
* *Linearity* (for both simulation-based and theory-based methods): the data should follow a linear trend.
    - Check this assumption by examining the scatterplot of the two variables, and a scatterplot of the residuals (on the $y$-axis) versus the fitted values (on the $x$-axis). The pattern in the residual plot should display a horizontal line.

* *Constant variability* (for theory-based methods only): the variability of points around the least squares line remains roughly constant
    - Check this assumption by examining a scatterplot of the residuals (on the $y$-axis) versus the fitted values (on the $x$-axis). The variability in the residuals around zero should be approximately the same for all fitted values.

* *Nearly normal residuals* (for theory-based methods only: residuals must be nearly normal.
    - Check this assumption by examining a histogram of the residuals, which should appear approximately normal^[A better plot for checking the normality assumption is called a *normal quantile-quantile plot* (or QQ-plot). However, this type of plot will be covered in a future course].

The scatterplot generated earlier and the residual plots shown below will be used to assess these conditions for approximating the data with the $t$-distribution.


\begin{center}\includegraphics[width=0.7\linewidth]{11-GA14-regression-theory_files/figure-latex/unnamed-chunk-3-1} \end{center}
1. Are the conditions met to use the $t$-distribution to approximate the sampling distribution of the standardized statistic? Justify your answer.

\vspace{1.5in}


#### Ask a research question {-}

2. Write out the null hypothesis in words to test the slope.

\vspace{1in}

3. Using the research question, write the alternative hypothesis in notation to test the slope.

\newpage

#### Summarize and visualize the data {-}

The linear model output for this study is shown below.


```r
lm.golf <- lm(Percent_Accuracy~Driving_Distance, data=golf) # lm(response~explanatory)
round(summary(lm.golf)$coefficients, 3)
```

```
#>                  Estimate Std. Error t value Pr(>|t|)
#> (Intercept)       103.586      3.329  31.119        0
#> Driving_Distance   -0.142      0.012 -11.553        0
```

#### Use statistical inferential methods to draw inferences from the data {-}

##### Hypothesis test {-}
To find the value of the standardized statistic to test the slope we will use, 

$$
T = \frac{\mbox{slope estimate}-null value}{SE} = \frac{b_1-0}{SE(b_1)}.
$$
 
We will use the linear model R output above to get the estimate for slope and the standard error of the slope.

4.  Calculate the standardized statistic for slope.  Identify where this calculated value is in the linear model R output.

\vspace{0.7in}

5.  The p-value in the linear model R output is the two-sided p-value for the test of significance for slope.  Report the p-value to answer the research question.  

\vspace{0.5in}

6. Based on the p-value, how much evidence is there against the null hypothesis?

\vspace{0.5in}

##### Confidence interval {-}
Recall that a confidence interval is calculated by adding and subtracting the margin of error to the point estimate.  
$$\mbox{point estimate}\pm t^*\times SE(\mbox{estimate}).$$
When the point estimate is a regression slope, this formula becomes 
$$b_1 \pm t^* \times SE(b_1).$$
 
The $t^*$ multiplier comes from a $t$-distribution with $n-2$ degrees of freedom.  Recall for a 95\% confidence interval, we use the 97.5\% percentile (95\% of the distribution is in the middle, leaving 2.5\% in each tail).  The sample size for this study is 354 so we will use the degrees of freedom 352 ($n-2$).


```r
qt(0.975, 352, lower.tail = TRUE) # 95% t* multiplier 
```

```
#> [1] 1.966726
```

7. Calculate the 95\% confidence interval for the true slope.
\vspace{0.8in}

8. Interpret the 95\% confidence interval in context of the problem.

\vspace{.8in}

#### Communicate the results and answer the research question {-}

9. Write a conclusion to answer the research question in context of the problem.

\vspace{.8in}

### Multivariable plots {-}

Another variable that may affect the percent accuracy is the which league the golfer is part of. We will look at how this variable may change the relationship between driving distance and percent accuracy. 


```r
golf %>%
  ggplot(aes(x = Driving_Distance, y = Percent_Accuracy, color=League))+  # Specify variables
  geom_point(aes(shape = League), size = 2, alpha=0.5) +  # Add scatterplot of points
  labs(x = "Driving Distance (yards)",  # Label x-axis
       y = "Percent Accuracy",  # Label y-axis
       color = "League", shape = "League",
       title = "Scatterplot of Golf Driving Distance and Percent 
       Accuracy by League for Professional Golfers") + # Be sure to title your plots
  geom_smooth(method = "lm", se = FALSE) + # Add regression line
    scale_color_grey()
```



\begin{center}\includegraphics[width=0.6\linewidth]{11-GA14-regression-theory_files/figure-latex/unnamed-chunk-6-1} \end{center}

10. Does the association between driving distance and percent accuracy change depending on which league the golfer is a part of?  Explain your answer.
\vspace{1in}

11.  Explain the association between league and each of the other two variables.

\vspace{0.8in}

### Take-home messages


1. To check the validity conditions for using theory-based methods we must use the residual diagnostic plots to check for normality of residuals and constant variability, and the scatterplot to check for linearity.  

2. To interpret a confidence interval for the slope, think about how to interpret the sample slope and use that information in the confidence interval interpretation for slope.  

3. Use the explanatory variable row in the linear model R output to obtain the slope estimate (`estimate` column) and standard error of the slope (`Std. Error` column) to calculate the standardized slope, or T-score.  The calculated T-score should match the `t value` column in the explanatory variable row. The standardized slope tells the number of standard errors the observed slope is above or below 0.

4. The explanatory variable row in the linear model R output provides a **two-sided** p-value under the `Pr(>|t|)` column.

5. The standardized slope is compared to a $t$-distribution with $n-2$ degrees of freedom in order to obtain a p-value.  The $t$-distribution with $n-2$ degrees of freedom is also used to find the appropriate multiplier for a given confidence level.


### Additional notes

Use this space to summarize your thoughts and take additional notes on this week's activity and material covered.

\newpage
