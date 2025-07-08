## Activity 8:  Confidence interval and what confidence means

\setstretch{1}

### Learning outcomes

* Explore what confidence means

* Interpret the confidence level

* Explore impact of sample size, direction of the alternative hypothesis, and value of the sample statistic on the p-value.

### Terminology review

In this activity, we will explore what being 95\% confidence means. Some terms covered in this activity are:

* Parameter of interest

* Two-sided vs. one-sided tests

* Confidence level

### Handedness of male boxers continued

In today's activity, we will use the male boxer study to look at what confidence means.

Left-handedness is a trait that is found in about 10\% of the general population. Past studies have shown that left-handed men are over-represented among professional boxers [@richardson2019]. Is there evidence that there is an over-prevalence of left-handed fighters?  In this random sample of 500 professional male boxers, 81 were left-handed.



``` r
 # Read in data set
boxers <- read.csv("https://math.montana.edu/courses/s216/data/Male_boxers_sample.csv")
boxers %>% count(Stance)  # Count number in each Stance category
```

```
#>         Stance   n
#> 1  left-handed  81
#> 2 right-handed 419
```

### What does *confidence* mean? {-}

In the interpretation of a 95\% confidence interval, we say that we are 95\% confident that the parameter is within the confidence interval.  Why are we able to make that claim?  What does it mean to say "we are 95\% confident"?

1. In the last activity we found very strong evidence that the true proportion of male professional boxers that are left-handed is greater than 0.1.  As a class, determine a plausible value for the true proportion of male boxers that are left-handed. *Note: we are making assumptions about the population here. This is not based on our calculated data, but we will use this applet to better understand what happens when we take many, many samples from this believed population.*

\vspace{0.2in}

2.  Go to this website, [http://www.rossmanchance.com/ISIapplets.html](http://www.rossmanchance.com/ISIapplets.html) and choose 'Simulating Confidence Intervals'.  In the input on the left-hand side of the screen enter the value from question 1 for $\pi$ (the true value), 500 for $n$, and 100 for 'Number of intervals'.  Click 'sample'.

\vspace{1mm}

* In the graph on the bottom right, click on a green dot.  Write down the confidence interval for this sample given on the graph on the left.  Does this confidence interval contain the true value chosen in question 1?

\vspace{0.4in}

* Now click on a red dot.  Write down the confidence interval for this sample.  Does this confidence interval contain the true value chosen in question 1?
\vspace{0.5in}

* How many intervals out of 100 contain $\pi$, the true value chosen in question 1? *Hint*:  This is given to the left of the graph of green and red intervals.
\vspace{0.4in}

3.  Click on 'sample' nine more times.  Write down the 'Running Total' for the proportion of intervals that contain $\pi$.

\vspace{0.5in}

4. Change the confidence level to 90\%.  What happened to the width of the intervals?

\vspace{0.2in}

5. Write down the `Running Total` for the proportion of intervals that contain $\pi$ using a 90\% confidence level.

\vspace{0.4in}

**Interpretation of the level of confidence:**

\vspace{0.8in}

#### Notes on theory-based confidence intervals {-}

To calculate a theory-based 95\% confidence interval for $\pi$, we will first find the **standard error** of $\hat{p}$ by plugging in the value of $\hat{p}$ for $\pi$ in $SD(\hat{p})$:

$$SE(\hat{p}) = \sqrt{\frac{\hat{p}\times (1-\hat{p})}{n}}$$

Note that we do not include a "0" subscript, since we are not assuming a null hypothesis. 

**Calculate the standard error of the sample proportion to find a 95\% confidence interval.**

\vspace{0.5in}

We will calculate the margin of error and confidence interval later in this activity. **The margin of error (ME)** is the value of the $z^*$ multiplier times the standard error of the statistic.

$$ME = z^* \times SE(\hat{p})$$
The $z^*$ multiplier is the percentile of a standard normal distribution that corresponds to our confidence level. If our confidence level is 95\%, we find the Z values that encompass the middle 95\% of the standard normal distribution.  If 95\% of the standard normal distribution should be in the middle, that leaves 5\% in the tails, or 2.5\% in each tail.  

The `qnorm()` function in R will tell us the $z^*$ value for the desired percentile (in this case, 95\% + 2.5\% = 97.5\% percentile). 

\begin{figure}

{\centering \includegraphics[width=0.45\linewidth]{04-A08-confidenceLevel_files/figure-latex/Normalcur-1} 

}

\caption{Standard Normal Curve}(\#fig:Normalcur)
\end{figure}

The following code will find the $z^*$ value for a 95\% confidence interval.


``` r
qnorm(c(0.025, 0.975), lower.tail = TRUE) # Multiplier for 95% confidence interval
```

**Calculate the margin of error for the 95\% confidence interval.**
\vspace{0.6in}

To find the confidence interval, we will add and subtract the **margin of error** to the point estimate:
$$\text{point estimate}\pm\text{margin of error}$$
$$\hat{p}\pm z^* \times SE(\hat{p})$$

**Calculate the 95\% confidence interval for the parameter of interest.**
\vspace{0.6in}


6.  Interpret the 95\% confidence **interval** in the context of the problem.
\vspace{1in}

#### Simulation methods {-}

We could also use simulation-based methods to analyze these data.


``` r
one_proportion_test(probability_success=0.1,
                    sample_size=500,
                    number_repetitions=10000,
                    as_extreme_as=0.162,
                    direction="greater",
                    summary_measure="proportion")
```



\begin{center}\includegraphics[width=0.7\linewidth]{04-A08-confidenceLevel_files/figure-latex/unnamed-chunk-3-1} \end{center}


``` r
one_proportion_bootstrap_CI(sample_size = 500,
                            number_successes = 81,
                            number_repetitions = 10000,
                            confidence_level = 0.95)
```



\begin{center}\includegraphics[width=0.7\linewidth]{04-A08-confidenceLevel_files/figure-latex/unnamed-chunk-4-1} \end{center}

7. Explain why the results for simulation methods and theory-based methods are similar.

\vspace{1in}

\newpage

### Take-home messages

1.  If repeat samples of the same size are selected from the population, approximately 95\% of samples will create a 95\% confidence interval that contains the parameter of interest.

2.  The calculation of the confidence interval uses the standard error calculated using the sample proportion rather than the null value.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.


\newpage
