## Video Notes: Inference for Paired Data 

Read Chapters 17 and 18 in the course textbook.  Use the following videos to complete the video notes for Module 9.

### Course Videos

* PairedData

* 18.1and18.2

* 18.3

\setstretch{1}

<!-- ### Single quantitative variable -->

<!-- * Reminder: review summary measures and plots discussed in the Week 3 material and Chapter 5 of the textbook. -->

<!-- * The summary measure for a single quantitative variable is the ______________. -->

<!-- \setstretch{1.5} -->

<!-- Notation: -->

<!-- - Population mean:  -->

<!-- - Population standard deviation: -->

<!-- - Sample mean: -->

<!-- - Sample standard deviation: -->

<!-- - Sample size:  -->

<!-- \setstretch{1} -->

<!-- Example:  What is the average weight of adult male polar bears?  The weight was measured on a representative sample of 83 male polar bears from the Southern Beaufort Sea.   -->

<!-- ```{r, echo=TRUE} -->
<!-- pb <- read.csv("https://math.montana.edu/courses/s216/data/polarbear.csv") -->
<!-- ``` -->

<!-- Plots of the data: -->

<!-- ```{r, echo=TRUE, out.width="60%"} -->
<!-- pb %>% -->
<!--     ggplot(aes(x = Weight)) +   # Name variable to plot -->
<!--     geom_histogram(binwidth = 10) +  # Create histogram with specified binwidth  -->
<!--     labs(title = "Histogram of Male Polar Bear Weight", # Title for plot -->
<!--        x = "Weight (kg)", # Label for x axis -->
<!--        y = "Frequency") # Label for y axis -->

<!-- pb %>% # Data set piped into... -->
<!-- ggplot(aes(x = Weight)) +   # Name variable to plot -->
<!--   geom_boxplot() +  # Create boxplot  -->
<!--   labs(title = "Boxplot of Male Polar Bear Weight", # Title for plot -->
<!--        x = "Weight (kg)", # Label for x axis -->
<!--        y = "Frequency") # Label for y axis -->
<!-- ``` -->

<!-- Summary Statistics: -->

<!-- ```{r, echo=TRUE} -->
<!-- pb %>% -->
<!--   summarise(favstats(Weight)) #Gives the summary statistics -->
<!-- ``` -->
<!-- ### Confidence interval {-} -->

<!-- #### Simulation-based method{-} -->

<!-- * Label cards with the values from the data set -->

<!-- * Sample with replacement (bootstrap) from the original sample $n$ times -->

<!-- * Plot the simulated sample mean on the bootstrap distribution -->

<!-- * Repeat at least 1000 times (simulations)  -->

<!-- * Find the cut-offs for the middle X% (confidence level) in a bootstrap distribution. -->

<!-- * ie. 95% CI = (2.5th percentile, 97.5th percentile)  -->

<!-- Conditions for inference for a single mean: -->

<!-- - Independence: -->

<!-- \vspace{0.5in} -->

<!-- ```{r, echo=TRUE, warning=FALSE} -->
<!-- set.seed(216) -->
<!-- paired_bootstrap_CI(data = pb$Weight, # Enter vector of differences -->
<!--             number_repetitions = 1000, # Number of bootstrap samples for CI -->
<!--             confidence_level = 0.95,  # Confidence level in decimal form -->
<!--             which_first = 1)  # Not needed when entering vector of differences -->
<!-- ``` -->
<!-- The confidence interval estimates the ________________ -->
<!-- of ____________________. -->

<!-- Confidence interval interpretation: -->

<!-- * How confident you are (e.g., 90%, 95%, 98%, 99%) -->

<!-- * Parameter of interest -->

<!-- * Calculated interval -->

<!-- * Order of subtraction when comparing two groups -->

<!-- \vspace{0.8in} -->

<!-- \newpage -->

<!-- #### Theory-based method {-} -->

<!-- * Calculate the interval centered at the sample statistic -->

<!-- \rgi $\text{statistic} \pm \text{margin of error}$ -->

<!-- \vspace{0.5in} -->

<!-- Conditions for inference using theory-based methods: -->

<!-- - Independence: -->

<!-- \vspace{0.2in} -->

<!-- - Large enough sample size: -->

<!-- \vspace{0.2in} -->

<!-- ### T - distribution {-} -->

<!-- In the theoretical approach, we use the CLT to tell us that the distribution of sample means will be approximately normal, centered at the assumed true mean under $H_0$ and with standard deviation $\frac{\sigma}{\sqrt{n}}$. -->

<!-- $$\bar{x} \sim N(\mu_0, \frac{\sigma}{\sqrt{n}})$$ -->
<!-- \setstretch{1.5} -->

<!-- * Estimate the population standard deviation, $\sigma$, with the -->
<!-- ___________________________ standard deviation, ________. -->

<!-- * For a single quantitative variable we use the ____ - distribution -->
<!-- with _______________  -->
<!-- degrees of freedom to approximate the sampling distribution. -->

<!-- \setstretch{1} -->

<!-- The $t^*$ multiplier is the value at the given percentile of the t-distribution with $n - 1$ degrees of freedom. -->

<!-- ```{r, tstarpb, echo = F} -->

<!-- x <- seq(-4, 4, length=100) -->
<!-- hx<-dt(x, 82) -->
<!-- degf <- 82 -->

<!-- plot(x, hx, type="l", lty=1, lwd=3, xlab="", -->
<!--   ylab="Density", main="t-distribution with 82 df") -->

<!-- ``` -->

<!-- \newpage -->
<!-- To find the $t^*$ multiplier for a 95\% confidence interval: -->

<!-- ```{r, echo=TRUE} -->
<!-- qt(0.975, df = 82) -->
<!-- ``` -->
<!-- Calculation of the confidence interval for the true mean weight of polar bears from the Southern Beaufort Sea: -->

<!-- \vspace{0.8in} -->

<!-- ### Hypothesis testing {-} -->

<!-- \setstretch{1.5} -->

<!-- * Hypotheses are always written about the _________________________.  For a single mean we will use the notation ___________. -->

<!-- \setstretch{1} -->

<!-- Null Hypothesis:  -->

<!-- $H_0:$ -->

<!-- \vspace{0.2in} -->
<!-- Alternative Hypothesis:  -->

<!-- $H_A:$ -->

<!-- \vspace{0.2in} -->

<!-- \setstretch{1.5} -->

<!-- * Direction of the alternative depends on the __________________ -->
<!-- ___________________. -->

<!-- \setstretch{1} -->

<!-- #### Simulation-based method {-} -->

<!-- * Simulate many samples assuming $H_0: \mu = \mu_0$ -->

<!--     * Shift the data by the difference between $\mu_0$ and $\bar{x}$ -->

<!--     * Sample with replacement $n$ times from the shifted data -->

<!--     * Plot the simulated shifted sample mean from each simulation -->

<!--     * Repeat 1000 times (simulations) to create the null distribution -->

<!--     * Find the proportion of simulations at least as extreme as $\bar{x}$   -->

<!-- Example:  Is there evidence that male polar bears weigh less than 370kg (previously recorded measure), on average?  The weight was measured on a representative sample of 83 male polar bears from the Southern Beaufort Sea. -->

<!-- Hypotheses: -->

<!-- In notation:   -->

<!-- $H_0:$ -->

<!-- \vspace{0.2in} -->

<!-- $H_A:$ -->

<!-- \vspace{0.2in} -->

<!-- \newpage -->

<!-- In words:  -->

<!-- $H_0:$ -->

<!-- \vspace{0.6in} -->

<!-- $H_A:$ -->

<!-- \vspace{0.6in} -->

<!-- Reminder of summary statistics: -->

<!-- ```{r, echo=TRUE} -->
<!-- pb %>% -->
<!--   summarise(favstats(Weight)) #Gives the summary statistics -->
<!-- ``` -->
<!-- Find the difference:  -->

<!-- $\mu_0 - \bar{x} =$ -->

<!-- ```{r, echo=TRUE, warning=FALSE, out.width="60%"} -->
<!-- set.seed(216) -->
<!-- paired_test(data = pb$Weight,   # Vector of differences  -->
<!--                                          # or data set with column for each group -->
<!--             shift = 45.4,   # Shift needed for bootstrap hypothesis test -->
<!--             as_extreme_as = 324.6,  # Observed statistic -->
<!--             direction = "less",  # Direction of alternative -->
<!--             number_repetitions = 1000,  # Number of simulated samples for null distribution -->
<!--             which_first = 1)  # Not needed when using calculated differences -->
<!-- ``` -->

<!-- \newpage -->

<!-- Interpretation of the p-value: -->

<!-- * Statement about probability or proportion of samples -->

<!-- * Statistic (summary measure and value) -->

<!-- * Direction of the alternative  -->

<!-- * Null hypothesis (in context)  -->


<!-- \vspace{0.8in} -->

<!-- Conclusion:  -->

<!-- * Amount of evidence -->

<!-- * Parameter of interest  -->

<!-- * Direction of the alternative hypothesis -->

<!-- \vspace{0.8in} -->

<!-- #### Theory-based method {-} -->

<!-- * Calculate the standardized statistic -->

<!-- * Find the area under the t-distribution with $n - 1$ df at least as extreme as the standardized statistic -->

<!-- Equation for the standard error of the sample mean: -->

<!-- \vspace{0.5in} -->

<!-- Equation for the standardized sample mean: -->

<!-- \vspace{0.5in} -->

<!-- Calculate the standardized sample mean weight of adult male polar bears: -->

<!-- \vspace{0.4in} -->

<!-- ```{r, pvaluepb, echo = F} -->

<!-- x <- seq(-4, 4, length=100) -->
<!-- hx<-dt(x, 82) -->
<!-- degf <- 82 -->

<!-- plot(x, hx, type="l", lty=1, lwd=3, xlab="", -->
<!--   ylab="Density", main="t-distribution with 82 df") -->

<!-- ``` -->

<!-- Interpret the standardized sample mean weight: -->

<!-- \vspace{0.8in} -->

<!-- To find the theory-based p-value: -->

<!-- ```{r, echo=TRUE} -->
<!-- pt(-4.683, df=82, lower.tail=TRUE) -->
<!-- ``` -->
### Single categorical, single quantitative variables Video Paired_Data {-}

* In this module, we will study inference for a ______________________ explanatory variable and a _________________________ response variable where the two groups are ____________________________.

### Paired vs. Independent Samples {-}

Two groups are paired if an observational unit in one group is connected to an observational unit in another group 
	
\rgi Data are paired if the samples are ___________________
	
Examples: 

* Change in test score from pre and post test

* Weight of college students before and after 1st year

* Change in blood pressure

\begin{figure}

{\centering \includegraphics[width=0.6\linewidth]{images/paired_independent} 

}

\caption{Illustration of Independent vs. Paired Samples}(\#fig:pairedindependent)
\end{figure}

Example 1:  Three hundred registered voters were selected at random to participate in a study on attitudes about how well the president is performing. They were each asked to answer a short multiple-choice questionnaire and then they watched a 20-minute video that presented information about the job description of the president. After watching the video, the same 300 selected voters were asked to answer a follow-up multiple-choice questionnaire. 

* Is this an example of a paired samples or independent samples study?

\vspace{0.3in}

\newpage

Example 2: Thirty dogs were selected at random from those residing at the humane society last month. The 30 dogs were split at random into two groups. The first group of 15 dogs was trained to perform a certain task using a reward method. The second group of 15 dogs was trained to perform the same task using a reward-punishment method. 

* Is this an example of a paired samples or independent samples study?

\vspace{0.3in}

Example 3: Fifty skiers volunteered to study how different waxes impacted their downhill race times. The participants were split into groups of two based on similar race times from the previous race. One of the two then had their skis treated with Wax A while the other was treated with Wax B. The downhill ski race times were then measured for each of the 25 volunteers who used Wax A as well as for each of the 25 volunteers who used Wax B.

* Is this an example of a paired samples or independent samples study?

\vspace{0.3in}

Example: Is there a difference in heights between husbands and wives?  The heights were measured on the husband and wife in a random sample of 199 married couples from Great Britain [@gbmarried]. 

For a paired experiment, we look at the difference between responses for each unit (pair), rather than just the average difference between treatment groups



```r
hw <-read.csv("data/husbands_wives_ht.csv")
paired_observed_plot(hw)
```



\begin{center}\includegraphics[width=0.7\linewidth]{09-VN09-paired_files/figure-latex/unnamed-chunk-1-1} \end{center}



<!-- ```{r, echo=TRUE, collapse=FALSE} -->
<!-- hw_diff %>% -->
<!--     summarise(favstats(ht_husband)) -->
<!-- ``` -->

<!-- ```{r, echo=TRUE, collapse=FALSE} -->
<!-- hw_diff %>% -->
<!--     summarise(fav_stats(ht_wife)) -->
<!-- ``` -->


```r
hw_diff %>%
    summarise(fav_stats(ht_diff))
```

```
#>   min   Q1 median  Q3 max     mean       sd   n missing
#> 1 -96 83.5    131 179 303 130.5427 74.13608 199       0
```

\setstretch{1.5}

* The summary measure for paired data is the _______________________.

\newpage

* Mean difference: the average _______________ in the _________________ 
variable outcomes for observational units between ____________________ variable groups

\setstretch{1}

Notation for the Paired differences

* Population mean of the differences:

* Population standard deviation of the differences:

* Sample mean of the differences: 

* Sample standard deviation of the differences: 

Conditions for inference for paired data:

- Independence:

\vspace{0.5in}

Is the independence condition met for the height study?

\vspace{0.5in}
	
### Hypothesis testing {-}

Null hypothesis assumes “no effect”, “no difference”, “nothing interesting happening”, etc.

* Treat the differences like a single mean

* Always of form:  “parameter” = null value

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}

* Research question determines the direction of the alternative hypothesis.

Write the null and alternative for the height study:

In notation:

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}

#### Simulation-based method {-}

* Simulate many samples assuming $H_0: \mu_d = 0$

    * Shift the data by the difference between $\mu_0$ and $\bar{x}_d$

    * Sample with replacement $n$ times from the shifted data

    * Plot the simulated shifted sample mean from each simulation

    * Repeat 1000 times (simulations) to create the null distribution

    * Find the proportion of simulations at least as extreme as $\bar{x}_d$
    
Reminder of summary statistics:


```r
hw_diff %>%
    summarise(fav_stats(ht_diff))
```

```
#>   min   Q1 median  Q3 max     mean       sd   n missing
#> 1 -96 83.5    131 179 303 130.5427 74.13608 199       0
```

Find the difference:

$\mu_0 - \bar{x}_d =$


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



\begin{center}\includegraphics[width=0.7\linewidth]{09-VN09-paired_files/figure-latex/unnamed-chunk-5-1} \end{center}
Interpret the p-value:

* Statement about probability or proportion of samples

* Statistic (summary measure and value)
    
* Direction of the alternative 
    
* Null hypothesis (in context) 

\vspace{0.8in}

\newpage 

Conclusion: 

* Amount of evidence
    
* Parameter of interest 
    
* Direction of the alternative hypothesis

\vspace{0.8in}


### Confidence interval {-}

#### Simulation-based method{-}

* Label cards with the values (differences) from the data set

* Sample with replacement (bootstrap) from the original sample $n$ times

* Plot the simulated sample mean on the bootstrap distribution

* Repeat at least 1000 times (simulations)

* Find the cut-offs for the middle X% (confidence level) in a bootstrap distribution.

    * i.e., 95\% CI = (2.5th percentile, 97.5th percentile)

Simulated bootstrap distribution:


```r
set.seed(216)
paired_bootstrap_CI(data = hw_diff$ht_diff, # Enter vector of differences
            number_repetitions = 1000, # Number of bootstrap samples for CI
            confidence_level = 0.95,  # Confidence level in decimal form
            which_first = 1)  # Not needed when entering vector of differences
```



\begin{center}\includegraphics[width=0.7\linewidth]{09-VN09-paired_files/figure-latex/unnamed-chunk-6-1} \end{center}

\newpage

Interpret the 99\% confidence interval:

* How confident you are (e.g., 90%, 95%, 98%, 99%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}

#### Theory-based method - Video 18.3 {-}

#### t-distribution {-}

In the theoretical approach, we use the CLT to tell us that the distribution of sample means will be approximately normal, centered at the assumed true mean under $H_0$ and with standard deviation $\frac{\sigma}{\sqrt{n}}$.

$$\bar{x} \sim N(\mu_0, \frac{\sigma_d}{\sqrt{n}})$$
\setstretch{1.5}

* Estimate the population standard deviation, $\sigma_d$, with the
___________________________ standard deviation, ________.

* For a single quantitative variable we use the ____ - distribution
with _______________
degrees of freedom to approximate the sampling distribution.

\setstretch{1}

Conditions for inference using theory-based methods for paired data (categorical explanatory and quantitative response):

- Independence: (same as for simulation); the difference in outcome for one observational unit will not influence another observation.

- Large enough sample size:

    - Normality: The data should be approximately normal or the sample size should be large.

\rgi \rgi $n < 30$: 
    
\vspace{0.2in}

\rgi \rgi $30 \leq n < 100$: 
    
\vspace{0.2in}

\rgi \rgi $n \geq 100$: 
    
\vspace{0.2in}

Theory-based Hypothesis Test:

* Calculate the standardized statistic 

* Find the area under the t-distribution with $n - 1$ df at least as extreme as the standardized statistic

Equation for the standard error for the sample mean difference:

\vspace{0.5in}

Equation for the standardized sample mean difference:

\vspace{0.5in}

Reminder of summary statistics for height data:

```r
hw_diff %>%
    summarise(fav_stats(ht_diff))
```

```
#>   min   Q1 median  Q3 max     mean       sd   n missing
#> 1 -96 83.5    131 179 303 130.5427 74.13608 199       0
```

Calculate the standardized sample mean difference in height:

* 1st calculate the standard error of the sample mean difference

\vspace{0.5in}

* Then calculate the T score

\vspace{0.5in}

What theoretical distribution should we use to find the p-value using the value of the standardized statistic?

\vspace{0.3in}


\begin{center}\includegraphics[width=0.7\linewidth]{09-VN09-paired_files/figure-latex/pvalueheight-1} \end{center}

To find the p-value:


```r
pt(24.84, df = 198, lower.tail=FALSE)*2
```

```
#> [1] 9.477617e-63
```


Theory-based Confidence Interval:

\rgi $\text{statistic} \pm \text{margin of error}$

\vspace{0.5in}


The $t^*$ multiplier is the value at the given percentile of the t-distribution with $n - 1$ degrees of freedom.

For the height data, we will use a t-distribution with _________ df.


\begin{center}\includegraphics[width=0.7\linewidth]{09-VN09-paired_files/figure-latex/tstar-1} \end{center}

To find the $t^*$ multiplier for a 99\% confidence interval:


```r
qt(0.975, df=198, lower.tail = TRUE)
```

```
#> [1] 1.972017
```

Calculate the margin of error:
\vspace{0.4in}

Calculate the theory-based confidence interval.
\vspace{0.5in}


### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. What theoretical distribution is used to approximate paired quantitative data?

\vspace{0.2in}

2. What is the difference between a paired and independent study design?

\vspace{1in}

\newpage
