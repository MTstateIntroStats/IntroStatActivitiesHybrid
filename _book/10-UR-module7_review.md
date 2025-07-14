## Module 7 Review - One Mean Confidence Interval

There are about 4 million tourists to Yellowstone National Park per year.  One of the most visited sites within the park is the Old Faithful Geyser.  The reason this geyser is called old faithful is because of the regularity of eruptions.  Tourists report a typical wait time of 30 minutes, on average.  A sample of 299 tourists reported their wait time to see Old Faithful erupt.  How long, on average, do tourists wait for Old Faithful to erupt?




```
#>   min Q1 median Q3 max     mean       sd   n missing
#> 1  43 59     76 83 108 72.31438 13.89032 299       0
```

The following code created the boxplot of waiting time. 

\begin{center}\includegraphics[width=0.6\linewidth]{10-UR-module7_review_files/figure-latex/unnamed-chunk-2-1} \end{center}
In the last module review, we used simulation methods to analyze these data.  Now we will use theory-based methods.
	
Conditions for the sampling distribution of $\bar{x}$ to follow an approximate Normal distribution:

* **Independence**: the sample’s observations are independent, e.g., are from a simple random sample. (*Remember*: This also must be true to use simulation methods!)

* **Normality Condition**: either the sample observations come from a normally distributed population or we have a large enough sample size.  To check this condition, use the following rules of thumb:

    - $n < 30$: If the sample size $n$ is less than 30 and the distribution of the data is approximately normal with no clear outliers in the data, then we typically assume the data come from a nearly normal distribution to satisfy the condition.

    - $30 \leq n < 100$: If the sample size $n$ is betwe 30 and 100 and there are no particularly extreme outliers in the data, then we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
    
    - $n \geq 100$: If the sample size $n$ is at least 100 (regardless of the presence of skew or outliers), we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
    
1. Is the independence condition met?

\vspace{0.5in}

2. Is the normality condition met to use theory-based methods?

\vspace{1in}

To find the standardized statistic for the mean we will use the following formula:

$$T = \frac{\bar{x} - \mu_0}{SE(\bar{x})},$$
where the standard error of the sample mean difference is:

$$SE(\bar{x})=\frac{s}{\sqrt{n}}.$$

3. Calculate the standard error of the sample mean.

\vspace{0.8in}

4. Calculate the standardized mean for the study.

\vspace{1in}

\newpage

5. Mark on the t-distribution shown below on how to find the p-value of the test.


\begin{center}\includegraphics[width=0.7\linewidth]{10-UR-module7_review_files/figure-latex/tdistave-1} \end{center}

6. Interpret the standardized mean in context of the study.
\vspace{1in}

The following code calculates the p-value for the study.

``` r
2*pt(-52.676, df=298, lower.tail=TRUE)
#> [1] 5.045442e-153
```


To calculate a theory-based confidence interval for the a single mean, use the following formula:

$$\bar{x}\pm t^* \times SE(\bar{x}).$$

We will need to find the $t^*$ multiplier using the function `qt()`. 

* Enter the appropriate percentile (0.995) in the R code to find the multiplier for a 99\% confidence interval.

* Enter the df $n - 1 = 299 - 1 = 298$


``` r
qt(0.995, df = 298, lower.tail=TRUE)
```

```
#> [1] 2.592428
```
7. Mark on the t-distribution found below the values of $\pm t^*$.  Draw a line at each multiplier and write the percentiles used to find each.
\vspace{1mm}

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{10-UR-module7_review_files/figure-latex/tstarmean-1} 

}

\caption{t-distribution with 602 degrees of freedom}(\#fig:tstarmean)
\end{figure}
8. Calculate the 99\% confidence interval using theory-based methods.
\vspace{1in}

Types of Errors:

\vspace{3.5in}

9. What type of error may have occurred for this study?

\vspace{0.3in}

10. Interpret this error in context of the study.


\newpage

