## Activity 13:  Body Temperature

\setstretch{1}

### Learning outcomes

* Given a research question involving a quantitative variable, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.
  
* Describe and perform a theory-based hypothesis test for a single mean.

* Interpret and evaluate a p-value for a theory-based hypothesis test for a single mean.

### Terminology review

In today's activity, we will analyze quantitative data using theory-based methods. Some terms covered in this activity are:

* Normality

* $t$-distribution

* Degrees of freedom

* T-score

To review these concepts, see Chapter 5and? in the textbook.

### Body Temperature

It has long been reported that the mean body temperature of adults is $98.6^{\circ}$F.  There have been a few articles that challenge this assertion.  In 2018, a sample of 52 Stat 216 undergraduates, were asked to report their body temperature.  Is there evidence that body temperatures of adults differ from the known temperature of $98.6^{\circ}$F?

#### Ask a research question {-}

1. Write out the null hypothesis in proper notation for this study.  

\vspace{0.8in}

2. Write out the null hypothesis in words for this study.

\vspace{0.5in}

In general, the sampling distribution for a sample mean, $\bar{x}$, based on a sample of size $n$ from a population with a true mean $\mu$ and true standard deviation $\sigma$ can be modeled using a Normal distribution when certain conditions are met.

Conditions for the sampling distribution of $\bar{x}$ to follow an approximate Normal distribution:

* **Independence**: The sample’s observations are independent.  For paired data, that means each pairwise difference should be independent.

* **Normality**: The data should be approximately normal or the sample size should be large.

    - $n < 30$: If the sample size $n$ is less than 30 and the distribution of the data is approximately normal with no clear outliers in the data, then we typically assume the data come from a nearly normal distribution to satisfy the condition.

    - $30 \leq n < 100$: If the sample size $n$ is betwe 30 and 100 and there are no particularly extreme outliers in the data, then we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
    
    - $n \geq 100$: If the sample size $n$ is at least 100 (regardless of the presence of skew or outliers), we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
 
\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{06-A13-quantitative_theory_files/figure-latex/tdist-1} 

}

\caption{Comparison of the standard Normal vs t-distribution with various degrees of freedom}(\#fig:tdist)
\end{figure}
    
 
Like we saw in Chapter **5**, we will not know the values of the parameters and must use the sample data to estimate them.  Unlike with proportions, in which we only needed to estimate the population proportion, $\pi$, quantitative sample data must be used to estimate both a population mean $\mu$ and a population standard deviation $\sigma$. This additional uncertainty will require us to use a theoretical distribution that is just a bit wider than the Normal distribution. Enter the **$t$-distribution**!


As you can seen from Figure \@ref(fig:tdist), the $t$-distributions (dashed and dotted lines) are centered at 0 just like a standard Normal distribution (solid line), but are slightly wider.  The variability of a $t$-distribution depends on its degrees of freedom, which is calculated from the sample size of a study.  (For a single sample of $n$ observations or paired differences, the degrees of freedom is equal to $n-1$.) Recall from previous classes that larger sample sizes tend to result in narrower sampling distributions.  We see that here as well.  The larger the sample size, the larger the degrees of freedom, the narrower the $t$-distribution.  (In fact, a $t$-distribution with infinite degrees of freedom actually IS the standard Normal distribution!)


#### Summarize and visualize the data {-}

The following code is used to create a boxplot of the data.

* Download the R script file for this activity and upload to the R studio server.

* Open the file and follow the instructions given in the R file.


``` r
bodytemp <- read.csv("data/normal_temperature.csv")
bodytemp %>%
  ggplot(aes(x = Temp))+
  geom_boxplot()+
  labs(title="Boxplot of the Difference in Time to Read Words 
       Between Color and Black for College Undergraduates",
       x = "Differences in time to read words (Color - Black)")
```



\begin{center}\includegraphics[width=0.7\linewidth]{06-A13-quantitative_theory_files/figure-latex/unnamed-chunk-1-1} \end{center}

The following code gives the summary statistics for the pairwise differences.


``` r
bodytemp %>% 
  summarise(favstats(Temp))
```

```
#>    min     Q1 median   Q3 max     mean        sd  n missing
#> 1 97.2 97.675   98.2 98.7 100 98.28462 0.6823789 52       0
```
#### Check theoretical conditions {-}

3. Report the sample size of the study. Give appropriate notation.

\vspace{0.2in}

4. Report the sample mean of the study.  Give appropriate notation.

\vspace{0.2in}

5.  How do you know the independence condition is met for these data?
\vspace{0.8in}

6. Is the normality condition met to use the theory-based methods for analysis?  Explain your answer.
\vspace{1in}

#### Use statistical inferential methods to draw inferences from the data {-}


To find the standardized statistic for the mean we will use the following formula:

$$T = \frac{\bar{x} - \mu_0}{SE(\bar{x})},$$
where the standard error of the sample mean difference is:

$$SE(\bar{x})=\frac{s}{\sqrt{n}}.$$

7.  Calculate the standard error of the sample mean.

\vspace{0.5in}

8. Interpret the standard error in context of the study.

\vspace{1in}

9.  Calculate the standardized mean.

\vspace{1in}

10. We model a single mean with a t-distribution with $n-1$ degrees of freedom.  Calculate the degrees of freedom for this study.

\vspace{0.2in}

11. Mark the value of the standardized statistic on the t-distribution and illustrate how the p-value is found.


\begin{center}\includegraphics[width=0.7\linewidth]{06-A13-quantitative_theory_files/figure-latex/tdistmean-1} \end{center}

To find the p-value for the theory-based test: 

* Enter the value for the standardized statistic for xx in the pt function.  

* Enter the df for yy in the pt function.

* Highlight and run line 27


``` r
pt(xx, df=yy, lower.tail=FALSE)
```

12.  What does this p-value mean, in the context of the study?  Hint: it is the probability of what...assuming what?
\vspace{1in}

Next we will calculate a theory-based confidence interval.  To calculate a theory-based confidence interval for the paired mean difference, use the following formula:

$$\bar{x}\pm t^* \times SE(\bar{x}).$$

We will need to find the $t^*$ multiplier using the function `qt()`. 

* Enter the appropriate percentile in the R code to find the multiplier for a 90\% confidence interval.

* Enter the df for yy. 

* Highlight and run lines ...


``` r
qt(percentile, df = yy, lower.tail=TRUE)
```


13. Report the $t^*$ multiplier for the 90\% confidence interval.

\vspace{0.2in}

14.  Calculate the margin of error for the true mean using theory-based methods.

\vspace{0.6in}

15.  Calculate the confidence interval.

\vspace{0.6in}


16.  Interpret the confidence interval in context of the study.

\vspace{1in}

17.  Write a conclusion to the test in context of the study.
\vspace{0.6in}

### Take-home messages

1.  In order to use theory-based methods for dependent groups (paired data), the independent observational units and normality conditions must be met.  

2.  A T-score is compared to a $t$-distribution with $n - 1$ df in order to calculate a one-sided p-value. To find a two-sided p-value using theory-based methods we need to multiply the one-sided p-value by 2.  

3.  A $t^*$ multiplier is found by obtaining the bounds of the middle X% (X being the desired confidence level) of a $t$-distribution with $n - 1$ df.


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered

\newpage