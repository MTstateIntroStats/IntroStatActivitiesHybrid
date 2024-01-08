## Out-of-Class Activity Week 14:  Prediction of Crocodilian Body Size

\setstretch{1}

### Learning outcomes

* Given a research question involving two quantitative variables, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.
  
* Describe and perform a simulation-based hypothesis test for slope or correlation.

* Interpret and evaluate a p-value for a simulation-based hypothesis test for a slope or correlation.

* Use bootstrapping to find a confidence interval for the slope or correlation.

* Interpret a confidence interval for a slope or correlation.

### Terminology review
In today's activity, we will use simulation-based methods for hypothesis tests and confidence intervals for a linear regression slope or correlation. Some terms covered in this activity are:

* Correlation

* Slope 

* Regression line

To review these concepts, see Chapter 21 in the textbook.


### Crocodilian Body Size

Much research surrounds using measurements of animals to estimate body-size of extinct animals.  Many challenges exist in making accurate estimates for extinct crocodilians.  The term crocodilians refers to all members of the family Crocodylidae (“true” crocodiles), family Alligatoridae (alligators and caimans) and family Gavialidae (gharial, Tomistoma). The researchers in this study [@obrien2019] state, "Among extinct crocodilians and their precursors (e.g., suchians), several methods have been developed to predict body size from suites of hard-tissue proxies. Nevertheless, many have limited applications due to the disparity of some major suchian groups and biases in the fossil record. Here, we test the utility of head width (HW) as a broadly applicable body-size estimator in living and fossil suchians."  Data were collected on 76 male and female individuals of different species. Is there evidence that head width (measured in cm) is a good predictor of total body length (measured in cm) for crocodilians? 



```r
# Read in data set
croc <- read.csv("https://math.montana.edu/courses/s216/data/Crocodylian_headwidth.csv")
croc <- croc %>%
    na.omit()
```

#### Vocabulary review {-}

1. Explain why regression methods are appropriate to use to address the researchers' question. Make sure you clearly define the variables of interest in your explanation and their roles.

\vspace{.5in}

\newpage

To create a scatterplot to examine the relationship between head width and total body length we will use `HW_cm` as the explanatory variable and `TL_cm` as the response variable. 
 

```r
croc %>% # Pipe data set into...
ggplot(aes(x = HW_cm, y = TL_cm))+  # Specify variables
  geom_point(alpha=0.5) +  # Add scatterplot of points
  labs(x = "head width (cm)",  # Label x-axis
       y = "total length (cm)",  # Label y-axis
       title = "Scatterplot of Crocodilian Head Width vs. Total Length") + 
    # Be sure to title your plots
  geom_smooth(method = "lm", se = FALSE)  # Add regression line
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-OCA10-regression-simulation_files/figure-latex/unnamed-chunk-2-1} \end{center}

2. Describe the features of the plot above, addressing all four characteristics of a scatterplot.  

\vspace{1in}

|        If you indicated there are potential outliers, which points are they?

\vspace{0.5in}

#### Ask a research question {-}

3. Write out the null hypothesis in words to test **slope**.

\vspace{0.8in}

4. Using the research question, write the alternative hypothesis in notation using **slope** as the summary measure.

\vspace{0.5in}

#### Summarize and visualize the data {-}

The linear model output for the data is given below.


```r
lm.croc <- lm(TL_cm~HW_cm, data=croc) #lm(response~explanatory)
round(summary(lm.croc)$coefficients, 5)
#>             Estimate Std. Error  t value Pr(>|t|)
#> (Intercept) 17.61250   11.36269  1.55003  0.12687
#> HW_cm       10.59983    0.51294 20.66494  0.00000
```
The value of correlation is given below.


```r
cor(croc$HW_cm, croc$TL_cm)
#> [1] 0.9412234
```


5.  Using the output from the evaluated R code above, write the equation of the regression line in the context of the problem using appropriate statistical notation.

\vspace{1in}

6.  Interpret the estimated slope in context of the problem.

\vspace{1in}

7.  Report the value of correlation between head width and total body length. 

\vspace{0.3in}

#### Use statistical inferential methods to draw inferences from the data {-}

In this activity, we will focus on using simulation-based methods for inference in regression.  

#### Simulation-based hypothesis test {-}

Let's start by thinking about how one simulation would be created on the null distribution using cards.  First, we would write the values for the response variable, total length, on each card.  Next, we would shuffle these $y$ values while keeping the $x$ values (explanatory variable) in the same order.  Then, find the line of regression for the shuffled $(x,y)$ pairs and calculate either the slope or correlation of the shuffled sample.  

We will use the `regression_test()` function in R (in the `catstats` package) to simulate the null distribution of shuffled slopes (or shuffled correlations) and compute a p-value.  We will need to enter the response variable name and the explanatory variable name for the formula, the data set name (identified above as `croc`), the summary measure for the test (either slope or correlation), number of repetitions, the sample statistic (value of slope or correlation), and the direction of the alternative hypothesis.

\newpage

The response variable name is `TL_cm` and the explanatory variable name is `HW_cm` for these data.

8. What inputs should be entered for each of the following to create the simulation to test regression slope?

\vspace{.5mm}

* Direction (`"greater"`, `"less"`, or `"two-sided"`):

\vspace{.2in}

* Summary measure (choose `"slope"` or `"correlation"`):

\vspace{.2in}
* As extreme as (enter the value for the sample slope):

\vspace{0.2in}

* Number of repetitions:
    
\vspace{.2in}

Check that your answers to question 8 reflect what is shown below in the R code to produce the null distribution for slope.


```r
set.seed(216)
regression_test(TL_cm~HW_cm, # response ~ explanatory
               data = croc, # Name of data set
               direction = "two-sided", # Sign in alternative ("greater", "less", "two-sided")
               summary_measure = "slope", # "slope" or "correlation"
               as_extreme_as = 10.600, # Observed slope or correlation
               number_repetitions = 1000) # Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-OCA10-regression-simulation_files/figure-latex/unnamed-chunk-5-1} \end{center}

9.  Report the p-value from the R output. 

\vspace{0.5in}

10.  Suppose we wanted to complete the simulation test using correlation as the summary measure, instead of slope.  Which two inputs in question 8 would need to be changed to test for correlation?  What inputs should you use instead?

\vspace{0.75in}

Check that your answers to question 10 reflect what is shown below in the R code to produce the null distribution for correlation.


```r
set.seed(216)
regression_test(TL_cm~HW_cm, # response ~ explanatory
               data = croc, # Name of data set
               direction = "two-sided", # Sign in alternative ("greater", "less", "two-sided")
               summary_measure = "correlation", # "slope" or "correlation"
               as_extreme_as = 0.941, # Observed slope or correlation
               number_repetitions = 1000) # Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-OCA10-regression-simulation_files/figure-latex/unnamed-chunk-6-1} \end{center}

11.  The p-values from the test of slope and the test of correlation should be similar.  Explain why the two p-values should match. *Hint: think about the relationship between slope and correlation!*

\vspace{1in}

#### Simulation-based confidence interval {-}

We will use the `regression_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample slopes (or sample correlations) and calculate a confidence interval. The following code gives the 95\% confidence interval for the true slope. 


```r
set.seed(216)
regression_bootstrap_CI(TL_cm~HW_cm, # response ~ explanatory
   data = croc, # Name of data set
   confidence_level = 0.95, # Confidence level as decimal
   summary_measure = "slope", # Slope or correlation
   number_repetitions = 1000) # Number of simulated samples for bootstrap distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-OCA10-regression-simulation_files/figure-latex/unnamed-chunk-7-1} \end{center}

12.  Report the bootstrap 95\% confidence interval in interval notation.  

\vspace{0.5in}

13.  Interpret the interval in question 12 in context of the problem.  *Hint: use the interpretation of slope in your confidence interval interpretation.*

\vspace{0.8in}
   
#### Communicate the results and answer the research question {-}

14. Based on the p-value, write a conclusion in context of the problem.

\vspace{.8in}

15. Does the conclusion based on the p-value agree with the results of the 95\% confidence interval?  What does each tell you about the null hypothesis?

\vspace{.6in}

\newpage

### Take-home messages

1.	The p-value for a test for correlation should be approximately the same as the p-value for the test of slope.  In the simulation test, we just change the statistic type from slope to correlation and use the appropriate sample statistic value.  

2. To interpret a confidence interval for the slope, think about how to interpret the sample slope and use that information in the confidence interval interpretation for slope.  

3. To create one simulated sample on the null distribution when testing for a relationship between two quantitative variables, hold the $x$ values constant and shuffle the $y$ values to new $x$ values. Find the regression line for the shuffled data and plot the slope or the correlation for the shuffled data.

4. To create one simulated sample on the bootstrap distribution when assessing two quantitative variables, label $n$ cards with the original (response, explanatory) values.  Randomly draw with replacement $n$ times.  Find the regression line for the resampled data and plot the resampled slope or correlation. 

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
