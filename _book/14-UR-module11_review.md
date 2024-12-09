## Module 11 Review - Paired Data


Students in an introductory statistics class were asked to participate in an experiment to answer this question.  Each student flipped a coin to determine which exercise to complete first.  If the coin landed on heads the student would do jumping jacks for 30 seconds and then measure their heart rate in beats per minute (bpm).  After a 2 minute break the student would do bicycle kicks for 30 seconds and then record their heart rate.  If the coin landed on tails the student would complete bicycle kicks first followed by jumping jacks using the same times as above. For this study we will use the order of subtraction jumping jacks – bicycle kicks. Which exercise, jumping jacks or bicycle kicks will raise your heart rate more? 



```
#>   min Q1 median Q3 max     mean       sd  n missing
#> 1 -16 -4      8 15  57 7.604651 15.91666 43       0
```

The following code created the boxplot of differences. 

\begin{center}\includegraphics[width=0.6\linewidth]{14-UR-module11_review_files/figure-latex/unnamed-chunk-2-1} \end{center}

	
1.  What is the study design (observational or randomized experiment)?

\vspace{0.5in}

2.  Is this paired study or two independent samples?

\vspace{0.2in}

3.  Circle one answer for each bracket to complete the description of each variable listed: 

* Type of exercise (jumping jacks or bicycle kicks) is the (*explanatory/response*)  variable and it is (*categorical/quantitative*).

* Heart rate is the (*explanatory/response*)  variable and it is (*categorical/quantitative*).

	
4. What is the scope of inference for this study?

\vspace{0.5in}

5. Write the parameter of interest for this study.  

\vspace{0.8in}

6. Write the null hypothesis in notation.

\vspace{0.5in}

7. Write the alternative hypothesis in words.

\vspace{0.8in}

We will start with simulation methods. 
	
8.  Calculate the difference $\mu_0 - \bar{x}_d$.  Will we need to shift the data up or down?
\vspace{0.5in}


``` r
set.seed(216)
paired_test(data = heartrate$Diff,   #Vector of differences or data set with column for each group
            shift = -6.429,   #Shift needed for bootstrap hypothesis test
            as_extreme_as = 6.429,  #Observed statistic
            direction = "two-sided",  #Direction of alternative
            number_repetitions = 10000,  #Number of simulated samples for null distribution
            which_first = 1)  #Not needed when using calculated differences
```



\begin{center}\includegraphics[width=0.7\linewidth]{14-UR-module11_review_files/figure-latex/unnamed-chunk-3-1} \end{center}

9. Based on the p-value for this study, which of the following are true?	

\vspace{0.3mm}

*  There is very strong evidence that there is a true difference in heart rates for students who did jumping jacks and bicycle kicks (jumping jacks – bicycle kicks), on average.

\vspace{0.5in}

*  If there is no true mean difference in heart rates for students who did jumping jacks and bicycle kicks, in 1 out of 1000 simulated samples, we would observe a sample mean difference in heart rates of 6.429 bpm or more extreme.

\vspace{0.5in}
*  The 95% confidence interval would be entirely positive.

\vspace{0.5in}
*  There could be a potential Type I error.

\vspace{0.5in}
*  We would conclude that there is evidence of a difference in heart rates between exercises, on average, when in fact there is not.

\vspace{0.5in}


Bootstrap CI simulation to create a 95% confidence interval


``` r
paired_bootstrap_CI(data = heartrate$Diff, #Enter vector of differences
                    number_repetitions = 10000, #Number of bootstrap samples for CI
                    confidence_level = 0.95,  #Confidence level in decimal form
                    which_first = 1)  #Not needed when entering vector of differences
```



\begin{center}\includegraphics[width=0.7\linewidth]{14-UR-module11_review_files/figure-latex/unnamed-chunk-4-1} \end{center}

 
10.  Interpret the 95% confidence interval in context of the study.

\vspace{0.8in}

11.  Interpret the confidence level in context of the study.  What does confidence mean?

\vspace{0.8in}

Next we will use theory-based methods.

The sampling distribution for $\bar{x}$ based on a sample of size $n$ from a population with a true mean $\mu$ and true standard deviation $\sigma$ can be modeled using a normal distribution when certain conditions are met.

Conditions for the sampling distribution of $\bar{x}$ to follow an approximate normal distribution:

* **Independence**: The sample’s observations are independent

* **Normality**: The data should be approximately normal or the sample size should be large.

    - $n < 30$: If the sample size $n$ is less than 30 and there are no clear outliers in the distribution of differences, then we typically assume the data come from a nearly normal distribution to satisfy the condition.

    - $30 \le n < 100$: If the sample size $n$ is between 30 and 100 and there are no particularly extreme outliers in the differences of differences, then we typically assume the sampling distribution of $\bar{x}$ is nearly normal to satisfy the condition
    
    - $n \ge 100$: If the sample size is greater than 100 then we typically assume the sampling distribution of $\bar{x}$ is nearly normal to satisfy the condition, even if the underlying distribution of individual observations is not.
    
12.  Are the conditions met to model the data with theory-based methods?

\vspace{0.8in}

To find the standardized statistic for the paired differences we will use the following formula:

$$T = \frac{\bar{x}_d - \text{null value}}{SE(\bar{x}_d)},$$

where the standard error of the sample mean difference is:

$$SE(\bar{x}_d)=\frac{s_d}{\sqrt{n}}.$$
13. Calculate the standard error of the mean difference.

\vspace{0.8in}


14. Calculate the standardized mean difference.

\vspace{0.8in}


15. Interpret the standardized statistic in context of the problem.

\vspace{0.8in}



``` r
2*pt(2.957, df=41, lower.tail=FALSE)
#> [1] 0.005134632
```

\newpage

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{14-UR-module11_review_files/figure-latex/pvalue-1} 

}

\caption{t-distribution with 41 degrees of freedom}(\#fig:pvalue)
\end{figure}



To calculate the 95\% theory-based confidence interval for the paired mean difference, use the following formula:

$$\bar{x}_d\pm t^* SE(\bar{x}_d).$$

We will need to find the $t^*$ multiplier using the function `qt()`. For a 95\% confidence level, we are finding the $t^*$ value at the 97.5th percentile with `df` = $n_d - 1 = 42 - 1 = 41$.


\newpage



``` r
qt(0.975, df = 41, lower.tail=TRUE)
#> [1] 2.019541
```

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{14-UR-module11_review_files/figure-latex/tstar-1} 

}

\caption{t-distribution with 41 degrees of freedom}(\#fig:tstar)
\end{figure}

16.  Calculate the 95\% confidence interval.

\vspace{0.8in}

17. Write a conclusion to the research question.


