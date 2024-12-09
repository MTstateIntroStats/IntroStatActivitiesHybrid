## Activity 28:  Prediction of Crocodilian Body Size

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

* Download the R script file from D2L and upload to the RStudio server

* Open the file and run lines 1 - 8 to load the dataset


``` r
# Read in data set
croc <- read.csv("https://math.montana.edu/courses/s216/data/Crocodylian_headwidth.csv")
croc <- croc %>%
    na.omit()
```

To create a scatterplot to examine the relationship between head width and total body length we will use `HW_cm` as the explanatory variable and `TL_cm` as the response variable. 

* Enter the name of the explanatory and response variable in line 14

* Highlight and run lines 13 - 20

\newpage
 

``` r
croc %>% # Pipe data set into...
ggplot(aes(x = explanatory, y = response))+  # Specify variables
  geom_point(alpha=0.5) +  # Add scatterplot of points
  labs(x = "head width (cm)",  # Label x-axis
       y = "total length (cm)",  # Label y-axis
       title = "Scatterplot of Crocodilian Head Width vs. Total Length") + 
    # Be sure to title your plots
  geom_smooth(method = "lm", se = FALSE)  # Add regression line
```

1. Describe the features of the plot, addressing all four characteristics of a scatterplot.  

\vspace{1in}

|        If you indicated there are potential outliers, which points are they?

\vspace{0.5in}

#### Hypotheses {-}

When analyzing two quantitative variables we can either test regression slope or correlation.  In both cases, we are testing that there is a linear relationship between variables.

2. Write the null hypothesis in words.

\vspace{0.6in}

3. Write the null hypothesis to test slope in notation.

\vspace{0.3in}

4. Write the null hypothesis to test correlation in notation.

\vspace{0.3in}

5. Write the alternative hypothesis in words.

\vspace{0.6in}

\newpage

#### Summarize and visualize the data {-}

To create the linear model output and find the value of correlation for the linear relationship...

* Enter the the name of the explanatory and response in line 25

* Highlight and run lines 25 - 27


``` r
#Linear model
lm.croc <- lm(response~explanatory, data=croc) #lm(response~explanatory)
round(summary(lm.croc)$coefficients, 5)
#Correlation
cor(croc$HW_cm, croc$TL_cm)
```


6.  Using the output from the evaluated R code, write the equation of the regression line in the context of the problem using appropriate statistical notation.

\vspace{1in}

7.  Interpret the estimated slope in context of the problem.

\vspace{1in}

#### Use statistical inferential methods to draw inferences from the data {-}

In this activity, we will focus on using simulation-based methods for inference in regression.  

#### Simulation-based hypothesis test {-}

Let's start by thinking about how one simulation would be created on the null distribution using cards.  First, we would write the values for the response variable, total length, on each card.  Next, we would shuffle these $y$ values while keeping the $x$ values (explanatory variable) in the same order.  Then, find the line of regression for the shuffled $(x, y)$ pairs and calculate either the slope or correlation of the shuffled sample.  

We will use the `regression_test()` function in R (in the `catstats` package) to simulate the null distribution of shuffled slopes (or shuffled correlations) and compute a p-value.  We will need to enter the response variable name and the explanatory variable name for the formula, the data set name (identified above as `croc`), the summary measure for the test (either slope or correlation), number of repetitions, the sample statistic (value of slope or correlation), and the direction of the alternative hypothesis.

The response variable name is `TL_cm` and the explanatory variable name is `HW_cm` for these data.

8. What inputs should be entered for each of the following to create the simulation to test regression slope?

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

* Enter your answers for question 8 in place of the `xx`'s to produce the null distribution with 1000 simulations.  

* Highlight and run lines 32--37.


``` r
regression_test(TL_cm~HW_cm, # response ~ explanatory
               data = croc, # Name of data set
               direction = "xx", # Sign in alternative ("greater", "less", "two-sided")
               summary_measure = "xx", # "slope" or "correlation"
               as_extreme_as = xx, # Observed slope or correlation
               number_repetitions = 10000) # Number of simulated samples for null distribution
```

9.  Report the p-value from the R output. 
\vspace{0.5in}

10.  Suppose we wanted to complete the simulation test using correlation as the summary measure, instead of slope.  Which two inputs in #8 would need to be changed to test for correlation?  What inputs should you use instead?
\vspace{0.75in}

11.  Change the inputs in lines 32--37 to test for correlation instead of slope.  Highlight and run those lines, then report the new p-value of the test.
\vspace{0.5in}

12.  The p-values from the test of slope (#9) and the test of correlation (#11) should be similar.  Explain why the two p-values should match. *Hint: think about the relationship between slope and correlation!*
\vspace{1in}

#### Simulation-based confidence interval {-}

We will use the `regression_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample slopes (or sample correlations) and calculate a confidence interval. 

* Fill in the missing values in the provided R script file to find a 95\% confidence interval for slope.

* Highlight and run lines 42--46. 


``` r
regression_bootstrap_CI(response~explanatory, # response ~ explanatory
   data = croc, # Name of data set
   confidence_level = xx, # Confidence level as decimal
   summary_measure = "xx", # Slope or correlation
   number_repetitions = 10000) # Number of simulated samples for bootstrap distribution
```

13.  Report the bootstrap 95\% confidence interval in interval notation.  
\vspace{0.5in}

14.  Interpret the interval in question 14 in context of the problem.  *Hint: use the interpretation of slope in your confidence interval interpretation.*

\vspace{0.8in}
   
#### Communicate the results and answer the research question {-}

15. Based on the p-value and confidence interval, write a conclusion in context of the problem.

\vspace{.8in}

### Take-home messages

1.	The p-value for a test for correlation should be approximately the same as the p-value for the test of slope.  In the simulation test, we just change the statistic type from slope to correlation and use the appropriate sample statistic value.  

2. To interpret a confidence interval for the slope, think about how to interpret the sample slope and use that information in the confidence interval interpretation for slope.  

3. To create one simulated sample on the null distribution when testing for a relationship between two quantitative variables, hold the $x$ values constant and shuffle the $y$ values to new $x$ values. Find the regression line for the shuffled data and plot the slope or the correlation for the shuffled data.

4. To create one simulated sample on the bootstrap distribution when assessing two quantitative variables, label $n$ cards with the original (response, explanatory) values.  Randomly draw with replacement $n$ times.  Find the regression line for the resampled data and plot the resampled slope or correlation. 

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
