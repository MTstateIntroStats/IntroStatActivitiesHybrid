# Inference for a Quantitative Response with Independent Samples

## Lecture Notes Module 13: Inference for Independent Samples 

\setstretch{1}

### Single categorical, single quantitative variable with independent samples {-}

\setstretch{1.5}

* In this week, we will study inference for a ______________________ explanatory variable and a _________________________ response variable where the two groups are ____________________________.

* Independent groups:  When the measurements in one sample are not
___________________ to the measurements in the other sample.

\setstretch{1}

* Two random samples taken separately from two populations and the same response variable is recorded. Compare the average number of sick days off from work for people who had a flu shot and people who didn’t.

* Participants are randomly assigned to one of two treatment conditions, and the same response variable is recorded.

Rather than analyzing the differences as a single mean we will calculate summary statistics on each sample.  

\setstretch{1.5}

* The summary measure for two independent groups is the ______________________ in _____________________________.

* Difference in means: the difference in average _______________________ variable outcome for observational units between ____________________ variable groups

\setstretch{1}

Parameter of Interest:  

* Include:
 
    * Reference of the population (true, long-run, population, all)
	
	* Summary measure

	* Context
	   
	    * Observational units/cases
	   
	    * Response variable (and explanatory variable if present)
	       
	        * If the response variable is categorical, define a ‘success’ in context

$\mu_1-\mu_2:$ 

\vspace{0.5in}

\newpage

\setstretch{1.5}

Notation for the Sample Statistics

* Sample mean for group 1:

* Sample mean for group 2:

* Sample difference in means: 

* Sample standard deviation for group 1:

* Sample standard deviation for group 2:

* Sample size for group 1:

* Sample size for group 2:

\setstretch{1}

Example for class discussion:  Fifty-one (51) college students volunteered to look at impacts on memorization, specifically if putting letters into recognizable patterns (like FBI, CIA, EDA, CDC, etc.) would increase the number letters memorized. [@miller1956] The college students were randomly assigned to either a recognizable or non-recognizable letter group. After a period of study time, the number of letters memorized was collected on each study.  Is there evidence that putting letters into recognizable letter groups improve memory?

Why should we treat this as two independent groups rather than paired data?

\vspace{0.6in}

Parameter of interest:

\vspace{0.8in}


```r
letters<-read.csv("data/letters.csv")
letters %>%
    reframe(favstats(Memorized~Grouped))
#>           Grouped min Q1 median    Q3 max     mean       sd  n missing
#> 1 NotRecognizable   1  6     12 14.75  24 11.15385 6.576883 26       0
#> 2    Recognizable   1  6     15 21.00  30 14.32000 8.518216 25       0
```

Summary statistic:

\vspace{0.4in}

Interpret the summary statistic in context of the problem:

\vspace{0.4in}


```r
letters%>%
  ggplot(aes(y = Memorized, x = Grouped))  + #Enter the name of the explanatory and response variable
  geom_boxplot()+
  labs(title = "Boxplot of Number of Letters memorized by Type 
       of Grouping for College Students", #Title your plot
       y = "Number of letter memorized", #y-axis label
       x = "Letter Grouping") #x-axis label
```



\begin{center}\includegraphics[width=0.6\linewidth]{12-LN012-1ofeach_files/figure-latex/unnamed-chunk-2-1} \end{center}

### Hypothesis Testing {-}

Conditions:

* Independence: the response for one observational unit will not influence the outcome for another observational unit

Null hypothesis assumes “no effect”, “no difference”, “nothing interesting happening”, etc.

\rgi Always of form:  “parameter” = null value

$H_0:$

\vspace{0.5in}

$H_A:$

\vspace{0.5in}

* Research question determines the alternative hypothesis.

Write the null and alternative hypotheses for the letters study:

In words: 

$H_0:$

\vspace{0.5in}

$H_A:$

\vspace{0.5in}

In notation:

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}

#### Simulation-based method {-}

* Simulate many samples assuming $H_0: \mu_1 = \mu_2$

    * Write the response variable values on cards

    * Mix the explanatory variable groups together
    
    * Shuffle cards into two explanatory variable groups to represent the sample size in each group ($n_1$ and $n_2$)

    * Calculate and plot the simulated difference in sample means from each simulation

    * Repeat 1000 times (simulations) to create the null distribution

    * Find the proportion of simulations at least as extreme as $\bar{x}_1 - \bar{x}_2$

\vspace{1mm}


```r
set.seed(216)
two_mean_test(Memorized~Grouped, #Enter the names of the variables
              data = letters,  # Enter the name of the dataset
              first_in_subtraction = "Recognizable", # First outcome in order of subtraction
              number_repetitions = 1000,  # Number of simulations
              as_extreme_as = 3.166,  # Observed statistic
              direction = "greater")  # Direction of alternative: "greater", "less", or "two-sided"
```



\begin{center}\includegraphics[width=0.7\linewidth]{12-LN012-1ofeach_files/figure-latex/unnamed-chunk-3-1} \end{center}

Explain why the null distribution is centered at the value of zero:

\newpage

Interpretation of the p-value:

* Statement about probability or proportion of samples

* Statistic (summary measure and value)
    
* Direction of the alternative 
    
* Null hypothesis (in context) 

\vspace{0.8in}

Conclusion: 

* Amount of evidence
    
* Parameter of interest 
    
* Direction of the alternative hypothesis

\vspace{0.6in}

#### Theory-based method {-}

Conditions:

* Independence: the response for one observational unit will not influence the outcome for another observational unit

* Large enough sample size

\vspace{1in}

Like with paired data the t-distribution can be used to model the difference in means. 

\setstretch{1.5}

* For independent samples we use the ______- distribution
with ________________ degrees of freedom to approximate the sampling distribution.

\setstretch{1}

Theory-based test:

* Calculate the standardized statistic

* Find the area under the t-distribution with the smallest $n - 1$ df [min($n_1-1, n_2-1$)] at least as extreme as the standardized statistic

Equation for the standard error of the difference in sample mean:

\vspace{0.5in}

Equation for the standardized difference in sample mean:

\vspace{0.5in}

Are the conditions met to analyze the data using theory based-methods?

\vspace{0.8in}

Calculate the standardized difference in memorized letters.

* First calculate the $SE(\bar{x}_1 - \bar{x}_2)$

\vspace{0.6in}

* Then calculate the T-score

\vspace{1in}


\begin{center}\includegraphics[width=0.7\linewidth]{12-LN012-1ofeach_files/figure-latex/pvaluepb-1} \end{center}

Interpret the standardized statistic:

\vspace{0.8in}

To find the theory-based p-value:


```r
pt(1.482, df=24, lower.tail=FALSE)*2
#> [1] 0.1513523
```

\newpage

### Confidence interval {-}

To estimate the difference in true mean we will create a confidence interval.

#### Simulation-based method {-}

* Write the response variable values on cards

* Keep explanatory variable groups separate
    
* Sample with replacement $n_1$ times in explanatory variable group 1 and $n_2$ times in explanatory variable group 2

* Calculate and plot the simulated difference in sample means from each simulation

* Repeat 1000 times (simulations) to create the bootstrap distribution

* Find the cut-offs for the middle X\% (confidence level) in a bootstrap distribution.

For the letters example, we will estimate the difference in true mean number of letters recognized for students given  recognizable letter groupings and students given non-recognizable letter groupings.


```r
set.seed(216)
two_mean_bootstrap_CI(Memorized ~ Grouped, #Enter the name of the variables
                      data = letters,  # Enter the name of the data set
                      first_in_subtraction = "Recognizable", # First value in order of subtraction
                      number_repetitions = 1000,  # Number of simulations
                      confidence_level = 0.95)
```



\begin{center}\includegraphics[width=0.7\linewidth]{12-LN012-1ofeach_files/figure-latex/unnamed-chunk-5-1} \end{center}

Confidence interval interpretation:

* How confident you are (e.g., 90\%, 95\%, 98\%, 99\%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}


#### Theory-based method {-}

* Calculate the interval centered at the sample statistic

\rgi $\text{statistic} \pm \text{margin of error}$

\vspace{0.8in}

Using the letters data, calculate the 99\% confidence interval.


```r
letters<-read.csv("data/letters.csv")
letters %>%
    reframe(favstats(Memorized~Grouped))
#>           Grouped min Q1 median    Q3 max     mean       sd  n missing
#> 1 NotRecognizable   1  6     12 14.75  24 11.15385 6.576883 26       0
#> 2    Recognizable   1  6     15 21.00  30 14.32000 8.518216 25       0
```

* Need the $t^*$ multiplier for a 99\% confidence interval from a t-distribution with _________ df.


```r
qt(0.995, df=24, lower.tail = TRUE)
#> [1] 2.79694
```

* We will use the same value for the $SE(\bar{x}_1-\bar{x}_2)$ as calculated for the standardized statistic.

\vspace{1in}

\newpage
