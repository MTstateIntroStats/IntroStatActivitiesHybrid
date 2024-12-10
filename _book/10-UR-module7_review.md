## Module 7 Review - One Mean Confidence Interval

There are about 4 million tourists to Yellowstone National Park per year.  One of the most visited sites within the park is the Old Faithful Geyser.  The reason this geyser is called old faithful is because of the regularity of eruptions.  Tourists report a typical wait time of 30 minutes, on average.  A sample of 299 tourists reported their wait time to see Old Faithful erupt.  How long, on average, do tourists wait for Old Faithful to erupt?




```
#>   min Q1 median Q3 max     mean       sd   n missing
#> 1  43 59     76 83 108 72.31438 13.89032 299       0
```

The following code created the boxplot of waiting time. 

\begin{center}\includegraphics[width=0.6\linewidth]{10-UR-module7_review_files/figure-latex/unnamed-chunk-2-1} \end{center}

	
1. Write the parameter of interest in context of the study.  

\vspace{0.8in}

2. In the last module review, we saw very strong evidence that the true mean wait time reported by tourists for Old Faithful to erupt differs from 30 minutes.  Do you expect the 99\% confidence inteval to contain the null value of zero?  Explain your answer.

\vspace{1in}

We will start with simulation methods to create the 99\% confidence interval. 
	

``` r
set.seed(216)
one_mean_CI(data = geyser$waiting,   #Object and variable
            summary_measure = "mean", 
            confidence_level = 0.99, #Level of context as a decimal
            number_repetitions = 10000)  #Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{10-UR-module7_review_files/figure-latex/unnamed-chunk-3-1} \end{center}

3.  How many simulations are at and below the value of 70.241?

\vspace{1in}

4. Report the 99\% confidence interval.

\vspace{1in}

Now let's focus on theory-based methods.  **In the last module review, we verified the normality conditions were met.**

Conditions for the sampling distribution of $\bar{x}$ to follow an approximate Normal distribution:

* **Independence**: The sample’s observations are independent.  For paired data, that means each pairwise difference should be independent.

* **Normality**: The data should be approximately normal or the sample size should be large.

    - $n < 30$: If the sample size $n$ is less than 30 and the distribution of the data is approximately normal with no clear outliers in the data, then we typically assume the data come from a nearly normal distribution to satisfy the condition.

    - $30 \leq n < 100$: If the sample size $n$ is betwe 30 and 100 and there are no particularly extreme outliers in the data, then we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
    
    - $n \geq 100$: If the sample size $n$ is at least 100 (regardless of the presence of skew or outliers), we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
    
\newpage

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
5. Mark on the t-distribution found below the values of $\pm t^*$.  Draw a line at each multiplier and write the percentiles used to find each.
\vspace{1mm}

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{10-UR-module7_review_files/figure-latex/tstarmean-1} 

}

\caption{t-distribution with 602 degrees of freedom}(\#fig:tstarmean)
\end{figure}
6. Calculate the 99\% confidence interval using theory-based methods.
\vspace{1in}

7. Interpret the confidence interval in context of the study.

\vspace{1in}

\newpage

Types of Errors:

\vspace{3.5in}

8. What type of error may have occurred for this study?

\vspace{0.3in}

9. Interpret this error in context of the study.


\newpage

