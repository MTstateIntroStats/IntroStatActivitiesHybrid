---
output:
  pdf_document: default
  html_document: default
---
## Lecture Notes Week 11: Inference for a Single Mean & Paired Data 

\setstretch{1}

### Bootstrap confidence interval for a single quantitative variable

* Reminder: review summary measures and plots discussed in the Week 3 material and Chapter 5 of the textbook.

The summary measure for a single quantitative variable is the ______________.

Notation:

- Population mean: 

- Population standard deviation:

- Sample mean:

- Sample standard deviation:

- Sample size: 

Example:  What is the average weight of adult male polar bears?  The weight was measured on a representative sample of 83 male polar bears from the Southern Beaufort Sea.  


```r
pb <- read.csv("https://math.montana.edu/courses/s216/data/polarbear.csv")
```

Plots of the data:


```r
pb %>%
    ggplot(aes(x = Weight)) +   # Name variable to plot
    geom_histogram(binwidth = 10) +  # Create histogram with specified binwidth 
    labs(title = "Histogram of Male Polar Bear Weight", # Title for plot
       x = "Weight (kg)", # Label for x axis
       y = "Frequency") # Label for y axis

pb %>% # Data set piped into...
ggplot(aes(x = Weight)) +   # Name variable to plot
  geom_boxplot() +  # Create boxplot 
  labs(title = "Boxplot of Male Polar Bear Weight", # Title for plot
       x = "Weight (kg)", # Label for x axis
       y = "Frequency") # Label for y axis
```



\begin{center}\includegraphics[width=0.6\linewidth]{011-LN011-paired_files/figure-latex/unnamed-chunk-2-1} \includegraphics[width=0.6\linewidth]{011-LN011-paired_files/figure-latex/unnamed-chunk-2-2} \end{center}

Summary Statistics:


```r
pb %>%
  summarise(favstats(Weight)) #Gives the summary statistics
#>     min    Q1 median     Q3   max     mean       sd  n missing
#> 1 104.1 276.3  339.4 382.45 543.6 324.5988 88.32615 83       0
```
#### Confidence interval {-}

Simulation-based Method:

* Sample with replacement (bootstrap) from the original sample n times

* Plot the simulated sample mean on the bootstrap distribution

* Repeat at least 1000 times (simulations) 

* Find the cut-offs for the middle X% (confidence level) in a bootstrap distribution.

* ie. 95% CI = (2.5th percentile, 97.5th percentile) 

Conditions for inference for a single mean:

- Independence:

\vspace{0.5in}


```r
set.seed(216)
paired_bootstrap_CI(data = pb$Weight, # Enter vector of differences
            number_repetitions = 1000, # Number of bootstrap samples for CI
            confidence_level = 0.95,  # Confidence level in decimal form
            which_first = 1)  # Not needed when entering vector of differences
```



\begin{center}\includegraphics[width=0.7\linewidth]{011-LN011-paired_files/figure-latex/unnamed-chunk-4-1} \end{center}
The confidence interval estimates the _____________________________.

Confidence interval interpretation:

\vspace{0.8in}

Theory-based method:

* Calculate the interval centered at the sample statistic

$$\text{statistic} \pm \text{margin of error}$$

\vspace{0.8in}

Conditions for inference using theory-based methods:

- Independence:

\vspace{0.2in}

- Large enough sample size:

\vspace{0.5in}

In the theoretical approach, we use the CLT to tell us that the distribution of sample means will be approximately normal, centered at the assumed true mean under $H_0$ and with standard deviation $\frac{\sigma}{\sqrt{n}}$.

$$\bar{x} \sim N(\mu_0, \frac{\sigma}{\sqrt{n}})$$

The problem with this that in real life, we don’t know the value of sigma, the population standard deviation.  We can estimate it using sample standard deviation (s), but we need to account for that extra variability (that s is not sigma exactly).  We can do that with a t-distribution.  Just like the standard normal (same shape, same center) but with fatter tails.    

For quantitative data we use the t-distribution with $n - 1$ degrees of freedom.

The $t^*$ multiplier is the value at the percentile of the t-distribution with n - 1 degrees of freedom

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{011-LN011-paired_files/figure-latex/tstarpb-1} 

}

\caption{t-distribution with 82 degrees of freedom}(\#fig:tstarpb)
\end{figure}
To find the $t^*$ multiplier for a 95\% confidence interval:


```r
qt(0.975, df = 82)
#> [1] 1.989319
```
Calculation of the confidence interval for the true mean weight of polar bears from the Southern Beaufort Sea:

\vspace{0.8in}

### Hypothesis testing for a single quantitative variable

*Hypotheses are always written about the _________________________.  For a single mean we will use the notation ___________.

Null Hypothesis: 

$H_0: $


Alternative Hypothesis: 

$H_A: $

* Direction of the alternative depends on the __________________________ __________________________________.


Simulation-based Methods:

* Simulate many samples assuming $H_0: \mu = \mu_0$

\rgi Shift the data by the difference between $\mu_0$ and $\bar{x}$

\rgi Sample with replacement $n$ times from the shifted data

\rgi Plot the simulated shifted sample mean from each simulation

\rgi Repeat 1000 times (simulations) to create the null distribution

\rgi Find the proportion of simulations at least as extreme as $\bar{x}$  - the p-value

Example:  Is there evidence that male polar bears weigh less than 370kg (previously recorded measure), on average?  The weight was measured on a representative sample of 83 male polar bears from the Southern Beaufort Sea.

Hypotheses:

$H_0: $

\vspace{0.1in}

$H_A: $

\vspace{0.1in}

Reminder of summary statistics:


```r
pb %>%
  summarise(favstats(Weight)) #Gives the summary statistics
#>     min    Q1 median     Q3   max     mean       sd  n missing
#> 1 104.1 276.3  339.4 382.45 543.6 324.5988 88.32615 83       0
```
Find the difference: 

$\mu_0 - \bar{x} =$


```r
set.seed(216)
paired_test(data = pb$Weight,   # Vector of differences 
                                         # or data set with column for each group
            shift = 45.4,   # Shift needed for bootstrap hypothesis test
            as_extreme_as = 324.6,  # Observed statistic
            direction = "less",  # Direction of alternative
            number_repetitions = 1000,  # Number of simulated samples for null distribution
            which_first = 1)  # Not needed when using calculated differences
```



\begin{center}\includegraphics[width=0.6\linewidth]{011-LN011-paired_files/figure-latex/unnamed-chunk-7-1} \end{center}
Interpretation of the p-value:

* Probability
* ..
*
*

\vspace{0.8in}

Conclusion: 

*
*

\vspace{0.8in}

Theory-based methods:

* Calculate the standardized statistic

* Find the area under the t-distribution with $n - 1$ df at least as extreme as the standardized statistic

Standardized sample mean:

\vspace{0.8in}

Calculate the standardized sample mean weight of adult male polar bears:

\vspace{1in}

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{011-LN011-paired_files/figure-latex/pvaluepb-1} 

}

\caption{t-distribution with 82 degrees of freedom}(\#fig:pvaluepb)
\end{figure}
Interpret the standardized sample mean weight:

\vspace{0.8in}

To find the theory-based p-value:


```
#> [1] 5.531605e-06
```
### Paired vs. Independent Samples {-}

Two groups are paired if an observational unit in one group is connected to an observational unit in another group 
	
	Data is paired if the samples are ___________________
	
Examples: 

* Change in test score from pre and post test



* Weight of college students before and after 1st year

* Change in blood pressure

Example:  Three hundred registered voters were selected at random to participate in a study on attitudes about how well the president is performing. They were each asked to answer a short multiple-choice questionnaire and then they watched a 20-minute video that presented information about the job description of the president. After watching the video, the same 300 selected voters were asked to answer a follow-up multiple-choice questionnaire. 

* Is this an example of a paired samples or independent samples study?

Thirty dogs were selected at random from those residing at the humane society last month. The 30 dogs were split at random into two groups. The first group of 15 dogs was trained to perform a certain task using a reward method. The second group of 15 dogs was trained to perform the same task using a reward-punishment method. 

* Is this an example of a paired samples or independent samples study?

Fifty skiers volunteered to study how different waxes impacted their downhill race times. The participants were split into groups of two based on similar race times from the previous race. One of the two then had their skis treated with Wax A while the other was treated with Wax B. The downhill ski race times were then measured for each of the 25 volunteers who used Wax A as well as for each of the 25 volunteers who used Wax B.

* Is this an example of a paired samples or independent samples study?

	
For a paired experiment, we look at the difference between responses for each unit (pair), rather than just the average difference between treatment groups
	
	The summary measure for paired data is the _______________________

	Mean difference: the average difference in the response variable outcomes for observational units between explanatory variable groups

Parameter of Interest:  
Include:
	Reference of the population (true, long-run, population, all)
	Summary measure
	Context
	Observational units/cases
	Response variable (and explanatory variable if present)
	If the response variable is categorical, define a ‘success’ in context

$\mu_d:$ 


Notation for the Sample Statistics
	Sample mean of the differences: $\bar{x}_d$
	Sample standard deviation of the differences: $s_d$
	
	
Example: Is there a difference in heights between husbands and wives?  The heights were measured on the husband and wife in a random sample of 199 married couples from Great Britain.  

Parameter of interest:

\vspace{0.8in}



```r
hw <-read.csv("data/husbands_wives_ht.csv")
paired_observed_plot(hw)
```



\begin{center}\includegraphics[width=0.7\linewidth]{011-LN011-paired_files/figure-latex/unnamed-chunk-9-1} \end{center}


```
#>    min   Q1 median   Q3  max     mean       sd   n missing
#> 1 1559 1691   1725 1774 1949 1732.492 68.75067 199       0
#>    min   Q1 median   Q3  max    mean     sd   n missing
#> 1 1410 1560   1600 1650 1760 1601.95 62.435 199       0
#>   min   Q1 median  Q3 max     mean       sd   n missing
#> 1 -96 83.5    131 179 303 130.5427 74.13608 199       0
```

Null hypothesis assumes “no effect”, “no difference”, “nothing interesting happening”, etc.

* Treat the differences like a single mean

\rgi Always of form:  “parameter” = null value


\vspace{0.5in}


Research question determines the alternative hypothesis.

\vspace{0.5in}

Write the null and alternative for example 2:

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}

Simulated null distribution:


```r
set.seed(216)
paired_test(data = hw_diff$ht_diff,   # Vector of differences 
                                         # or data set with column for each group
            shift = -130.543,   # Shift needed for bootstrap hypothesis test
            as_extreme_as = 130.543,  # Observed statistic
            direction = "two-sided",  # Direction of alternative
            number_repetitions = 1000,  # Number of simulated samples for null distribution
            which_first = 1)  # Not needed when using calculated differences
```



\begin{center}\includegraphics[width=0.7\linewidth]{011-LN011-paired_files/figure-latex/unnamed-chunk-11-1} \end{center}
Interpret the p-value:

\vspace{0.8in}

Conclusion: 

\vspace{0.8in}

Simulated bootstrap distribution:


```r
set.seed(216)
paired_bootstrap_CI(data = hw_diff$ht_diff, # Enter vector of differences
            number_repetitions = 1000, # Number of bootstrap samples for CI
            confidence_level = 0.99,  # Confidence level in decimal form
            which_first = 1)  # Not needed when entering vector of differences
```



\begin{center}\includegraphics[width=0.7\linewidth]{011-LN011-paired_files/figure-latex/unnamed-chunk-12-1} \end{center}

Interpret the 99\% confidence interval:

\vspace{0.8in}

Theory-based methods:


```r
hw_diff %>%
    summarise(fav_stats(ht_diff))
#>   min   Q1 median  Q3 max     mean       sd   n missing
#> 1 -96 83.5    131 179 303 130.5427 74.13608 199       0
```

Check the conditions to use theory-based methods:

\vspace{1in}

Calculate the standardized sample mean difference in height:

\vspace{1in}

What is theoretical distribution should we use to find the p-value using the value of the standardized statistic?

\vspace{0.3in}

To find the p-value:


```
#> [1] 9.477617e-63
```
Calculate a 99\% confidence interval:

* First need to find the $t*$ multiplier from the t-distribution with 198 df


```
#> [1] 2.600887
```

Calculate the margin of error:
\vspace{0.4in}

Calculate the theory-based confidence interval.
\vspace{0.5in}
\newpage
