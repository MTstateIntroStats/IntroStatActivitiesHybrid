## Module 6 Review - One Mean Testing

There are about 4 million tourists to Yellowstone National Park per year.  One of the most visited sites within the park is the Old Faithful Geyser.  The reason this geyser is called old faithful is because of the regularity of eruptions.  Tourists report a typical wait time of 30 minutes, on average.  A sample of 299 tourists reported their wait time to see Old Faithful erupt.  Is there evidence that the average wait time differs from 30 minutes?




```
#>   min Q1 median Q3 max     mean       sd   n missing
#> 1  43 59     76 83 108 72.31438 13.89032 299       0
```

The following code created the boxplot of waiting time. 

\begin{center}\includegraphics[width=0.6\linewidth]{10-UR-module6_review_files/figure-latex/unnamed-chunk-2-1} \end{center}

	
1.  Report and interpret the value of $Q_1$ in context of the study.

\vspace{0.5in}

2.  Report and interpret the standard deviation of wait time in context of the study.
\vspace{0.2in}

3.  Descripe the plot using the four characteristics for boxplots.

\vspace{1in}

4. Write the parameter of interest for this study in context of the study.  


\vspace{0.8in}

5. Write the null hypothesis in notation.

\vspace{0.5in}

6. Write the alternative hypothesis in words.

\vspace{0.8in}

We will start with simulation methods. 
	
7.  Calculate the difference $\mu_0 - \bar{x}$.  Will we need to shift the data up or down?
\vspace{0.5in}


``` r
set.seed(216)
one_mean_test(data = geyser$waiting,   #Object and variable
              null_value = 30, #null value for the study
              shift = -42.31438,   #Shift needed for bootstrap hypothesis test
              summary_measure = "mean", 
              as_extreme_as = 72.314,  #Observed statistic
              direction = "two-sided",  #Direction of alternative
              number_repetitions = 10000)  #Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{10-UR-module6_review_files/figure-latex/unnamed-chunk-3-1} \end{center}

8. Interpret the p-value of the test.

\vspace{1in}

Now let's focus on theory-based methods.

Conditions for the sampling distribution of $\bar{x}$ to follow an approximate Normal distribution:

* **Independence**: The sample’s observations are independent.  For paired data, that means each pairwise difference should be independent.

* **Normality**: The data should be approximately normal or the sample size should be large.

    - $n < 30$: If the sample size $n$ is less than 30 and the distribution of the data is approximately normal with no clear outliers in the data, then we typically assume the data come from a nearly normal distribution to satisfy the condition.

    - $30 \leq n < 100$: If the sample size $n$ is betwe 30 and 100 and there are no particularly extreme outliers in the data, then we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
    
    - $n \geq 100$: If the sample size $n$ is at least 100 (regardless of the presence of skew or outliers), we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
    
9. Is the independence condition met?

\vspace{0.5in}

10. Is the normality condition met to use theory-based methods?

\vspace{1in}

To find the standardized statistic for the mean we will use the following formula:

$$T = \frac{\bar{x} - \mu_0}{SE(\bar{x})},$$
where the standard error of the sample mean difference is:

$$SE(\bar{x})=\frac{s}{\sqrt{n}}.$$

11. Calculate the standard error of the sample mean.

\vspace{0.8in}

12. Calculate the standardized mean for the study.

\vspace{1in}

13. Mark on the t-distribution shown below on how to find the p-value of the test.


\begin{center}\includegraphics[width=0.7\linewidth]{10-UR-module6_review_files/figure-latex/tdistave-1} \end{center}

14. Interpret the standardized mean in context of the study.
\vspace{1in}

The following code calculates the p-value for the study.

``` r
2*pt(-52.676, df=298, lower.tail=TRUE)
#> [1] 5.045442e-153
```
15. Write a conclusion to the test.

\vspace{1in}

\newpage
