## Video Notes: Inference for Independent Samples 

Read Section 5.6 and Chapters 19 and 20 in the course textbook.  Use the following videos to complete the video notes for Module 11.

### Course Videos

* 5.6

* 19.3TheoryTests

* 19.4TheoryInterval

* Optional: 19.1

* Optional: 19.2

\setstretch{1}

### Theory-based method - Video 19.3TheoryTests {-}

Example: Every year, orange and black monarch butterflies migrate from their summer breeding grounds in the US and Canada to mountain forests in central Mexico, where they hibernate for the winter. Due to abnormal weather patterns and drought affecting monarch habitats and feeding grounds, the population of monarch butterflies is estimated to have decreased by 53% from the 2018-2019 wintering season to the 2019-2020 wintering season (WWF, 2020). While conservationists often resort to captive-rearing with the goal of raising biologically indistinct individuals for release into the wild, tagging studies have shown that captive-reared monarchs have lower migratory success compared to wild monarchs. For this study, the researchers raised 67 monarchs (descended from wild monarchs) from eggs to maturity and then compared them to a group of 40 wild-caught monarchs. The researchers want to explore whether the maximum grip strength (how many Newtons a butterfly exerts at the moment of release when gently tugged from a mesh-covered perch) differs between captive-reared and wild-caught monarchs. Use Captive – Wild for order of subtraction.

Write the null and alternative hypotheses in notation.

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}



``` r
butterfly <-read.csv("data/butterfly1.csv")
```




``` r
butterflies %>%
    reframe(favstats(MaxGrip~Monarch_Group))
#>   Monarch_Group   min    Q1 median     Q3   max      mean         sd  n missing
#> 1       Captive 0.081 0.162  0.217 0.2845 0.596 0.2363731 0.09412948 67       0
#> 2          Wild 0.108 0.271  0.352 0.4330 0.650 0.3607500 0.14066796 40       0
```


\begin{center}\includegraphics[width=0.7\linewidth]{12-VN12-1ofeach_files/figure-latex/unnamed-chunk-4-1} \end{center}

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

\newpage

### Optional Notes: Video Example (Video 19.3TheoryTests) {-}

Are the conditions met to analyze the butterfly data using theory based-methods?

\vspace{0.8in}

Calculate the standardized difference in mean max grip strength.

* First calculate the $SE(\bar{x}_1 - \bar{x}_2)$

\vspace{0.6in}

* Then calculate the T-score

\vspace{1in}

What theoretical distribution should we use to find the p-value?

\vspace{0.3in}

To find the theory-based p-value:


``` r
pt(-5, df=39, lower.tail=TRUE)*2
```

```
#> [1] 1.252417e-05
```

Conclusion: 

* Amount of evidence
    
* Parameter of interest 
    
* Direction of the alternative hypothesis

\vspace{0.6in}

### Confidence Interval - Video 19.3TheoryIntervals {-}

* Calculate the interval centered at the sample statistic

\rgi $\text{statistic} \pm \text{margin of error}$

\vspace{0.8in}

### Optional Notes: Video Example (Video 19.3TheoryIntervals) {-}

Using the butterfly data, calculate the 99\% confidence interval.


``` r
butterflies %>%
    reframe(favstats(MaxGrip~Monarch_Group))
```

```
#>   Monarch_Group   min    Q1 median     Q3   max      mean         sd  n missing
#> 1       Captive 0.081 0.162  0.217 0.2845 0.596 0.2363731 0.09412948 67       0
#> 2          Wild 0.108 0.271  0.352 0.4330 0.650 0.3607500 0.14066796 40       0
```

* Need the $t^*$ multiplier for a 99\% confidence interval from a t-distribution with _________ df.


``` r
qt(0.995, df=39, lower.tail = TRUE)
```

```
#> [1] 2.707913
```

* We will use the same value for the $SE(\bar{x}_1-\bar{x}_2)$ as calculated for the standardized statistic.

\vspace{1in}

Calculate the margin of error for a 99\% confidence interval for the parameter of interest.

\vspace{0.5in}

Calculate a 99\% confidence interval for the parameter of interest.

\vspace{0.6in}


### Optional Notes: Simulation Testing for a Difference in Means: Video 19.1 {-}

\setstretch{1.5}

* In this module, we will study inference for a ______________________ explanatory variable and a _________________________ response variable where the two groups are ____________________________.

* Independent groups:  When the measurements in one sample are not
related to the measurements in the other sample.

\setstretch{1}

* Two random samples taken separately from two populations and the same response variable is recorded. Compare the average number of sick days off from work for people who had a flu shot and people who didn’t.

* Participants are randomly assigned to one of two treatment conditions, and the same response variable is recorded.

Rather than analyzing the differences as a single mean we will calculate summary statistics on each sample.  

Example:  Fifty-one (51) college students volunteered to look at impacts on memorization, specifically if putting letters into recognizable patterns (like FBI, CIA, EDA, CDC, etc.) would increase the number letters memorized. [@miller1956] The college students were randomly assigned to either a recognizable or non-recognizable letter group. After a period of study time, the number of letters memorized was collected on each study.  Is there evidence that putting letters into recognizable letter groups improve memory?

\setstretch{1.5}

* The summary measure for two independent groups is the ______________________ in _____________________________.

\setstretch{1}

\setstretch{1.5}

Notation for Independent Groups

* Population mean for group 1:

* Population mean for group 2:

* Sample mean for group 1:

* Sample mean for group 2:

* Sample difference in means: 

* Population standard deviation for group 1:

* Population standard deviation for group 2:

* Sample standard deviation for group 1:

* Sample standard deviation for group 2:

* Sample size for group 1:

* Sample size for group 2:

\setstretch{1}

Why should we treat this as two independent groups rather than paired data?

\vspace{0.6in}

#### Hypothesis Testing {-}

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

In notation:

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}


``` r
letters<-read.csv("data/letters.csv")
letters %>%
    reframe(favstats(Memorized~Grouped))
```

```
#>           Grouped min Q1 median    Q3 max     mean       sd  n missing
#> 1 NotRecognizable   1  6     12 14.75  24 11.15385 6.576883 26       0
#> 2    Recognizable   1  6     15 21.00  30 14.32000 8.518216 25       0
```

Summary statistic:

\vspace{0.4in}

Interpret the summary statistic in context of the problem:

\vspace{0.4in}


``` r
letters%>%
  ggplot(aes(y = Memorized, x = Grouped))  + #Enter the name of the explanatory and response variable
  geom_boxplot()+
  labs(title = "Boxplot of Number of Letters memorized by Type 
       of Grouping for College Students", #Title your plot
       y = "Number of letters memorized", #y-axis label
       x = "Letter Grouping") #x-axis label
```



\begin{center}\includegraphics[width=0.6\linewidth]{12-VN12-1ofeach_files/figure-latex/unnamed-chunk-9-1} \end{center}

\newpage

#### Simulation-based method {-}

* Simulate many samples assuming $H_0: \mu_1 = \mu_2$

    * Write the response variable values on cards

    * Mix the explanatory variable groups together
    
    * Shuffle cards into two explanatory variable groups to represent the sample size in each group ($n_1$ and $n_2$)

    * Calculate and plot the simulated difference in sample means from each simulation

    * Repeat 10000 times (simulations) to create the null distribution

    * Find the proportion of simulations at least as extreme as $\bar{x}_1 - \bar{x}_2$

\vspace{1mm}


``` r
set.seed(216)
two_mean_test(Memorized~Grouped, #Enter the names of the variables
              data = letters,  # Enter the name of the dataset
              first_in_subtraction = "Recognizable", # First outcome in order of subtraction
              number_repetitions = 10000,  # Number of simulations
              as_extreme_as = 3.166,  # Observed statistic
              direction = "greater")  # Direction of alternative: "greater", "less", or "two-sided"
```



\begin{center}\includegraphics[width=0.7\linewidth]{12-VN12-1ofeach_files/figure-latex/unnamed-chunk-10-1} \end{center}

Explain why the null distribution is centered at the value of zero:

\vspace{0.8in}

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


#### Confidence interval {-}

To estimate the difference in true mean we will create a confidence interval.

### Optional Notes: Simulation Confidence Interval for a Difference in Means - Video 19.2 {-}

* Write the response variable values on cards

* Keep explanatory variable groups separate
    
* Sample with replacement $n_1$ times in explanatory variable group 1 and $n_2$ times in explanatory variable group 2

* Calculate and plot the simulated difference in sample means from each simulation

* Repeat 10000 times (simulations) to create the bootstrap distribution

* Find the cut-offs for the middle X\% (confidence level) in a bootstrap distribution.

For the letters example, we will estimate the difference in true mean number of letters recognized for students given  recognizable letter groupings and students given non-recognizable letter groupings.


``` r
set.seed(216)
two_mean_bootstrap_CI(Memorized ~ Grouped, #Enter the name of the variables
                      data = letters,  # Enter the name of the data set
                      first_in_subtraction = "Recognizable", # First value in order of subtraction
                      number_repetitions = 10000,  # Number of simulations
                      confidence_level = 0.95)
```



\begin{center}\includegraphics[width=0.7\linewidth]{12-VN12-1ofeach_files/figure-latex/unnamed-chunk-11-1} \end{center}

Confidence interval interpretation:

* How confident you are (e.g., 90\%, 95\%, 98\%, 99\%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}


### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. Why is the recognizable letter study analyzed as two independent groups rather than paired data?

\vspace{0.6in}

2. Write out the equation for the standard error for a difference in sample means.

\vspace{1in}

\newpage
