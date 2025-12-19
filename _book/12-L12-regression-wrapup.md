## Module 12 Lab: Big Mac Index




\setstretch{1}

### Learning outcomes

* Given a research question involving two quantitative variables, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.
  
* Assess the conditions to determine in theory or simulation-based methods should be used.

* Find, interpret, and evaluate the p-value for a hypothesis test for a slope or correlation.

* Create and interpret a confidence interval for a slope or correlation.


### Big Mac Index

Can the relative cost of a Big Mac across different countries be used to predict the Gross Domestic Product (GDP) per person for that country?  The GDP per person (\$) the adjusted dollar equivalent to purchase a Big Mac (\$) was found on a random sample of 55 countries in January of 2022.  The cost of a Big Mac in each country was adjusted to US dollars based on current exchange rates.  Is there evidence of a positive relationship between Big Mac cost (`dollar_price`) and the GDP per person (`GDP_dollar`)?

* Upload and open the R script file for Module 12 lab. 

* Upload the csv file, `big_mac_adjusted_index_22.csv`. 

* Enter the name of the data set for datasetname in the R script file in line 9. 

* Highlight and run lines 1--9 to load the data.


``` r
# Read in data set 
mac <- read.csv("datasetname.csv")
```



#### Conditions for the least squares line {-}

1. Is there independence between the responses for the observational units?  Justify your answer.

\vspace{0.3in}

The following code will create a scatterplot and residuals vs. fitted plot to check for linearity.

* Highlight and run lines 14--24


``` r
par(mfrow=c(1,2)) # Set graphics parameters to plot 2 plots in 1 row
#Scatterplot
mac %>% # Pipe data set into...
  ggplot(aes(x = dollar_price, y = GDP_dollar))+  # Specify variables
  geom_point(alpha=0.5) +  # Add scatterplot of points
  labs(x = "big mac cost ($)",  # Label x-axis
       y = " gdp per person ($)",  # Label y-axis
       title = "Scatterplot of GDP per Person by Big Mac Cost for 
       Countries in 2022") +
    geom_smooth(method = "lm", se = FALSE)  # Add regression line

#Diagnostic plots to check linearity
macLM <- lm(GDP_dollar~dollar_price, data = mac) # Fit linear regression model
plot(macLM, which=1) # Residual vs fitted values
```



\begin{center}\includegraphics[width=0.47\linewidth]{12-L12-regression-wrapup_files/figure-latex/unnamed-chunk-4-1} \includegraphics[width=0.47\linewidth]{12-L12-regression-wrapup_files/figure-latex/unnamed-chunk-4-2} \end{center}

2. Is the linearity condition met to use regression methods to analyze the data?  Justify your answer.

\vspace{0.3in}

One way to "fix" the issues with linearity is to take the log of either the response, explanatory or both variables.  Let's check for linearity after log transforming the response variable.

* Enter the `dollar_price` for explanatory and `log_GDP` for response in line 32

* Enter a title and x and y axes labels

* Highlight and run lines 31--40


``` r
#Scatterplot
mac %>% # Pipe data set into...
  ggplot(aes(x = dollar_price, y = log_GDP))+  # Specify variables
  geom_point(alpha=0.5) +  # Add scatterplot of points
  labs(x = "include an x-axis label (don't forget units)",  # Label x-axis
       y = "include an y-axis label (don't forget units)",  # Label y-axis
       title = "A title should include type of plot, OUs, variables") +
    geom_smooth(method = "lm", se = FALSE)  # Add regression line
#Diagnostic plots to check linearity
macLM <- lm(log_GDP~dollar_price, data = mac) # Fit linear regression model
plot(macLM, which=1) # Residual vs fitted values
```

3.  Assess linearity using the scatterplot and the residuals vs. fitted plot for the log transformed data.

\vspace{0.8in}

For the remainder of this lab we will use the log transformed response variable, `log_GDP`.

* Highlight and run lines 44--427 to produce the histogram of residuals needed to assess normality of residuals condition


``` r
#Diagnostic plots
bigmacLM <- lm(log_GDP~dollar_price, data = mac) # Fit linear regression model
hist(bigmacLM$resid, xlab="Residuals", ylab="Frequency",
     main = "Histogram of Residuals") # Histogram of residuals
```

4. Are the conditions met to use the $t$-distribution to approximate the sampling distribution of the standardized statistic? Justify your answer.

\vspace{1.5in}

#### Ask a research question {-}

5. Write out the null and alternative hypotheses in notation to test *correlation* between Big Mac cost and log GDP.

\vspace{.2in}

|    $H_0:$

\vspace{.2in}

|    $H_A:$

\vspace{.2in}

#### Summary statistics {-}

* To find the correlation between the variables, `log_GDP` and `dollar_price` enter the name of the explanatory and response variable

* Highlight and run lines 51--54 in the R script file.


``` r
mac %>% 
  select(c("explanatory", "response")) %>%
  cor(use="pairwise.complete.obs") %>%
  round(5)
```

6.  Report the value of correlation between the variables. 
\vspace{0.2in}

7. Calculate the value of the coefficient of determination between `log_GDP` and `dollar_price`.
\vspace{0.4in}

8. Interpret the value of the coefficient of determination in context of the problem.
\vspace{0.6in}


#### Use statistical inferential methods to draw inferences from the data {-}

#### Hypothesis test {-}

Use the `regression_test()` function in R (in the `catstats` package) to simulate the null distribution of sample **correlations** and compute a p-value.  We will need to enter the response variable name and the explanatory variable name for the formula, the data set name (identified above as `mac`), the summary measure used for the test, number of repetitions, the sample statistic (value of correlation), and the direction of the alternative hypothesis.

The response variable name is `log_GDP` and the explanatory variable name is `dollar_price`.

9. What inputs should be entered for each of the following to create the simulation to test correlation?

\vspace{.5 mm}

* Direction (`"greater"`, `"less"`, or `"two-sided"`):

\vspace{.2in}

* Summary measure (choose `"slope"` or `"correlation"`):

\vspace{.2in}
* As extreme as (enter the value for the sample correlation):

\vspace{0.2in}

* Number of repetitions:
    
\vspace{.2in}

Using the R script file for this activity, enter your answers for question 9 in place of the `xx`'s to produce the null distribution with 10000 simulations. 

* Highlight and run lines 59--64. 


``` r
regression_test(response~explanatory, # response ~ explanatory
               data = mac, # Name of data set
               direction = "xx", # Sign in alternative ("greater", "less", "two-sided")
               summary_measure  = "xx", # "slope" or "correlation"
               as_extreme_as = xx, # Observed slope or correlation
               number_repetitions = 10000) # Number of simulated samples for null distribution
```

10.  Report the p-value from the R output. 
\vspace{0.3in}


#### Simulation-based confidence interval {-}

We will use the `regression_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample **correlations** and calculate a confidence interval. 

* Fill in the `xx`'s in the the provided R script file to find a 90\% confidence interval. 

* Highlight and run lines 69--73. 


``` r
regression_bootstrap_CI(response~explanatory, # response ~ explanatory
   data = mac, # Name of data set
   confidence_level = xx, # Confidence level as decimal
   summary_measure = "xx", # Slope or correlation
   number_repetitions = 10000) # Number of simulated samples for bootstrap distribution
```
11.  Report the bootstrap 90\% confidence interval in interval notation.  
\vspace{0.5in}

#### Communicate the results and answer the research question {-}

12. Using a significance level of 0.1, what decision would you make?
\vspace{0.2in}

13. What type of error is possible?
\vspace{0.3in}

14. Interpret this error in context of the problem.
\vspace{0.8in}

15. Write a paragraph summarizing the results of the study as if you are reporting these results in your local newspaper.  **Upload a copy of your paragraph to Gradescope for your group.**  Be sure to describe:

* Summary statistic and interpretation

    * Summary measure (in context)
    
    * Value of the statistic 
    
    * Order of subtraction when comparing two groups


* P-value and interpretation

    * Statement about probability or proportion of samples
    
    * Statistic (summary measure and value)
    
    * Direction of the alternative 
    
    * Null hypothesis (in context) 


* Confidence interval and interpretation

    * How confident you are (e.g., 90%, 95%, 98%, 99%)
    
    * Parameter of interest
    
    * Calculated interval
    
    * Order of subtraction when comparing two groups


* Conclusion (written to answer the research question)

    * Amount of evidence
    
    * Parameter of interest 
    
    * Direction of the alternative hypothesis


* Scope of inference

    * To what group of observational units do the results apply (target population or observational units similar to the sample)?
	
    * What type of inference is appropriate (causal or non-causal)?
    
\newpage

Paragraph:

\newpage
