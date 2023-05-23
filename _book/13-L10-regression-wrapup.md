## Week 13 Lab: Big Mac Index

\setstretch{1}

### Learning outcomes

* Given a research question involving two quantitative variables, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.
  
* Assess the conditions to determine in theory or simulation-based methods should be used.

* Find, interpret, and evaluate the p-value for a hypothesis test for a slope or correlation.

* Create and interpret a confidence interval for a slope or correlation.


### Big Mac Index

Can the relative cost of a Big Mac across different countries be used to predict the Gross Domestic Product (GDP) per person for that country?  The GDP per person and the adjusted dollar equivalent to purchase a Big Mac was found on a random sample of 55 countries in January of 2022.  The cost of a Big Mac in each country was adjusted to US dollars based on current exchange rates.  Is there evidence of a positive relationship between Big Mac cost and the GDP per person?

Upload and open the R script file for Week 13 lab. Upload and import the csv file, `big_mac_adjusted_index_S22.csv`. Enter the name of the data set (see the environment tab) for datasetname in the R script file in line 7. Highlight and run lines 1--7 to load the data.


```r
# Read in data set 
mac <- datasetname
```

#### Summarize and visualize the data {-} 

To find the correlation between the variables, `GDP_dollar` and `dollar_price` highlight and run lines 10--13 in the R script file.


```r
mac %>% 
  select(c("GDP_dollar", "dollar_price")) %>%
  cor(use="pairwise.complete.obs") %>%
  round(3)
```

1.  Report the value of correlation between the variables. 
\vspace{0.2in}

2. **Calculate the value of the coefficient of determination between `GDP_dollar` and `dollar_price`.** 
\vspace{0.4in}

3. Interpret the value of the coefficient of determination in context of the problem.
\vspace{0.6in}

In the next part of the activity we will assess the linear model between Big Mac cost and GDP.  Enter the variable `GDP_dollar` for `response` and the variable `dollar_price` for `explanatory` in line 17.  Highlight and run lines 17--18 to get the linear model output. 


```r
# Fit linear model: y ~ x
bigmacLM <- lm(response~explanatory, data=mac)
summary(bigmacLM)$coefficients # Display coefficient summary
```

4. Give the value of the slope of the regression line.  Interpret this value in context of the problem.
\vspace{0.6in}

#### Conditions for the least squares line {-}

Highlight and run lines 22--35 to produce the diagnostic plots needed to assess conditions to use theory-based methods.  Use the scatterplot and the residual plots to assess the validity conditions for approximating the data with the $t$-distribution.


```r
#Scatterplot
mac %>% # Pipe data set into...
  ggplot(aes(x = dollar_price, y = GDP_dollar))+  # Specify variables
  geom_point() +  # Add scatterplot of points
  labs(x = "Big Mac Cost",  # Label x-axis
       y = "GDP",  # Label y-axis
       title = "Scatterplot of Big Mac Cost vs. GDP per person") +  # Be sure to tile your plots
  geom_smooth(method = "lm", se = FALSE)  # Add regression line

#Diagnostic plots
bigmacLM <- lm(GDP_dollar~dollar_price, data = mac) # Fit linear regression model
par(mfrow=c(1,2)) # Set graphics parameters to plot 2 plots in 1 row
plot(bigmacLM, which=1) # Residual vs fitted values
hist(bigmacLM$resid, xlab="Residuals", ylab="Frequency",
     main = "Histogram of Residuals") # Histogram of residuals
```

5. **Are the conditions met to use the $t$-distribution to approximate the sampling distribution of the standardized statistic? Justify your answer.**

\vspace{1.5in}


\newpage

#### Ask a research question {-}

6. Write out the null and alternative hypotheses in notation to test *correlation* between Big Mac cost and country GDP.

|    $H_0:$

|    $H_a:$

#### Use statistical inferential methods to draw inferences from the data {-}

#### Hypothesis test {-}

Use the `regression_test()` function in R (in the `catstats` package) to simulate the null distribution of sample **correlations** and compute a p-value.  We will need to enter the response variable name and the explanatory variable name for the formula, the data set name (identified above as `mac`), the summary measure used for the test, number of repetitions, the sample statistic (value of correlation), and the direction of the alternative hypothesis.

The response variable name is `GDP_dollar` and the explanatory variable name is `dollar_price`.

7. What inputs should be entered for each of the following to create the simulation to test correlation?

\vspace{.5 mm}

* Direction (`"greater"`, `"less"`, or `"two-sided"`):

\vspace{.2in}

* Summary measure (choose `"slope"` or `"correlation"`):

\vspace{.2in}
* As extreme as (enter the value for the sample correlation):

\vspace{0.2in}

* Number of repetitions:
    
\vspace{.2in}

Using the R script file for this activity, enter your answers for question 7 in place of the `xx`'s to produce the null distribution with 1000 simulations.  Highlight and run lines 38--43. **Upload a copy of your plot showing the p-value to Gradescope for your group.**


```r
regression_test(GDP_dollar~dollar_price, # response ~ explanatory
               data = mac, # Name of data set
               direction = "xx", # Sign in alternative ("greater", "less", "two-sided")
               summary_measure  = "xx", # "slope" or "correlation"
               as_extreme_as = xx, # Observed slope or correlation
               number_repetitions = 1000) # Number of simulated samples for null distribution
```

8.  Report the p-value from the R output. 
\vspace{0.3in}

9. Interpret the p-value in context of the problem.
\vspace{0.8in}

#### Simulation-based confidence interval {-}

We will use the `regression_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample **correlations** and calculate a confidence interval. Fill in the `xx`'s in the the provided R script file to find a 90\% confidence interval. Highlight and run lines 46--50. 


```r
regression_bootstrap_CI(GDP_dollar~dollar_price, # response ~ explanatory
   data = mac, # Name of data set
   confidence_level = xx, # Confidence level as decimal
   summary_measure = "xx", # Slope or correlation
   number_repetitions = 1000) # Number of simulated samples for bootstrap distribution
```
10.  Report the bootstrap 90\% confidence interval in interval notation.  
\vspace{0.5in}

11. Interpret the 90\% confidence interval in context of the problem.
\vspace{0.8in}
   
#### Communicate the results and answer the research question {-}

12. Based on the p-value, write a conclusion in context of the problem.

\vspace{.8in}

13. Using a significance level of 0.1, what decision would you make?
\vspace{0.2in}

14. What type of error is possible?
\vspace{0.3in}

15. Interpret this error in context of the problem.
\vspace{0.8in}

16. Write a paragraph summarizing the results of the study as if you are reporting these results in your local newspaper.  **Upload a copy of your paragraph to Gradescope for your group.**  Be sure to describe:

* Summary statistic

* P-value and interpretation

* Confidence interval and interpretation

* Conclusion (written to answer the research question)

* Scope of inference

\vspace{3in}

\newpage
