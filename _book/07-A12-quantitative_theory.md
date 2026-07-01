## Activity 12:  Inference for a Single Quantitative Variable: Theory-based Methods

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

* $T$-score

To review these concepts, see Chapters 11 and 17 in the textbook.

### College student sleep habits

According to an article in *Sleep* [@watson2015], experts recommend adults (>18 years old) get at least 7 hours of sleep per night. A professor at MSU is interested in the sleep habits of MSU students.  The professor obtained a representative sample of MSU students and asked each student to report the amount of sleep they get on a typical night.  Is there evidence that MSU students get less than the recommended 7 hours of sleep per night, on average?

\vspace{2mm}
* Observational units:

\vspace{2mm}
* Variable:

    * Units?:
    
\vspace{2mm}

#### Ask a research question {-}

1. Write out the null hypothesis in proper notation for this study.  

\vspace{0.5in}

2. Write out the alternative hypothesis in words for this study.

\vspace{0.8in}

#### Summarize and visualize the data {-}

#### R Instructions {-}

* Download the R script file for this activity

* Highlight and run lines 1--7 to load the data set


``` r
sleep <- read.csv("https://www.math.montana.edu/courses/s216/data/sleep_college.csv")
```

The following code is used to create a boxplot of the data.

* Highlight and run lines 10--17.


``` r
sleep %>% # Data set piped into...
    ggplot(aes(x = SleepHours)) +   # Name variable to plot
    geom_boxplot() +  # Create boxplot with specified binwidth
    labs(title = "Boxplot of Number of Hours of Sleep for MSU Students", # Title for plot
       x = "Amount of sleep (hrs)", # Label for x axis
       y = "") + # Remove y axis label
    theme(axis.text.y = element_blank(), 
          axis.ticks.y = element_blank()) # Removes y-axis ticks
```

* Highlight and run lines 20--21 to get the summary statistics for the variable `SleepHours`.


``` r
sleep %>% 
  summarise(favstats(SleepHours))
```

```
#>   min Q1 median  Q3 max     mean       sd   n missing
#> 1   3  6      7 7.8  13 6.919376 1.467231 123       0
```
#### Check theoretical conditions {-}

3. Report the sample size of the study. Give appropriate notation.

\vspace{0.4in}

4. Report the sample mean of the study.  Give appropriate notation.

\vspace{0.4in}

In general, the sampling distribution for a sample mean, $\bar{y}$, based on a sample of size $n$ from a population with a true mean $\mu$ and true standard deviation $\sigma$ can be modeled using a Normal distribution when certain conditions are met.

\newpage

Conditions for the sampling distribution of $\bar{y}$ to follow an approximate Normal distribution:

* **Independence**: the sample’s observations are independent. (*Remember*: This also must be true to use simulation methods!)

* **Normality Condition**: either the sample observations come from a normally distributed population or we have a large enough sample size.  To check this condition, use the following rules of thumb:

    - $n < 30$: If the sample size $n$ is less than 30 and the distribution of the data is approximately normal with no clear outliers in the data, then we typically assume the data come from a nearly normal distribution to satisfy the condition.

    - $30 \leq n < 100$: If the sample size $n$ is between 30 and 100 and there are no particularly extreme outliers in the data, then we typically assume the sampling distribution of $\bar{y}$ is nearly normal, even if the underlying distribution of individual observations is not.
    
    - $n \geq 100$: If the sample size $n$ is at least 100 (regardless of the presence of skew or outliers), we typically assume the sampling distribution of $\bar{y}$ is nearly normal, even if the underlying distribution of individual observations is not.
 

Like we saw in Chapter **5**, we will not know the values of the parameters and must use the sample data to estimate them.  Unlike with proportions, in which we only needed to estimate the population proportion, $\pi$, quantitative sample data must be used to estimate both a population mean $\mu$ and a population standard deviation $\sigma$. This additional uncertainty will require us to use a theoretical distribution that is just a bit wider than the standard Normal distribution. Enter the **$t$-distribution**!


As you can seen from Figure \@ref(fig:tdist), the $t$-distributions (dashed and dotted lines) are centered at 0 just like a standard Normal distribution (solid line), but are slightly wider.  The variability of a $t$-distribution depends on its degrees of freedom, which is calculated from the sample size of a study.  (For a single sample of $n$ observations or paired differences, the degrees of freedom is equal to $n-1$.) Recall from previous classes that larger sample sizes tend to result in narrower sampling distributions.  We see that here as well.  The larger the sample size, the larger the degrees of freedom, the narrower the $t$-distribution.  (In fact, a $t$-distribution with infinite degrees of freedom actually IS the standard Normal distribution!)

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{07-A12-quantitative_theory_files/figure-latex/tdist-1} 

}

\caption{Comparison of the standard Normal vs t-distribution with various degrees of freedom}(\#fig:tdist)
\end{figure}

\newpage

**Verify the independence condition is met:**
\vspace{0.8in}

**Verify the normality condition is met to use the theory-based methods:**
\vspace{1in}

#### Use statistical inferential methods to draw inferences from the data {-}


To find the standardized statistic for the mean we will use the following formula:

$$T = \frac{\bar{y} - \mu_0}{SE(\bar{y})},$$
where the standard error of the sample mean is:

$$SE(\bar{y})=\frac{s}{\sqrt{n}}.$$

**Calculate the standard error of the sample mean.**

\vspace{0.8in}

**Interpretation of the standard error in context of the study**

\vspace{0.8in}

**Calculate the standardized mean.**

\vspace{0.8in}

We model a single mean with a $t$-distribution with $n-1$ degrees of freedom.  Calculate the degrees of freedom for this study and use it to fill in the blank in the title of the $t$-distribution displayed on the next page.

\newpage

Mark the value of the standardized statistic on the $t$-distribution and illustrate how the p-value is found.


\begin{center}\includegraphics[width=0.7\linewidth]{07-A12-quantitative_theory_files/figure-latex/tdistmean-1} \end{center}

To find the p-value for the theory-based test in R: 

* Enter the value for the standardized statistic for `xx` in the `pt` function.  

* Enter the degrees of freedom for `yy` in the `pt` function.

* Enter the correct tail for zz (TRUE or FALSE)

* Highlight and run line 27.


``` r
pt(xx, df=yy, lower.tail=zz)
```

5. What does this p-value mean, in the context of the study?  Hint: it is the probability of what...assuming what?
\vspace{0.8in}

6.  Write a conclusion to the test in context of the study.

\vspace{0.6in}

### Theory-based methods to create a confidence interval {-}

Next we will calculate a theory-based confidence interval.  To calculate a theory-based confidence interval for the a single mean, use the following formula:

$$\bar{y}\pm t^* \times SE(\bar{y}).$$


We will need to find the $t^*$ multiplier using the function `qt()`. 

* Enter the appropriate percentile in the R code to find the multiplier for a 95\% confidence interval.

* Enter the degrees of freedom for `yy`. *The degrees of freedom for a single mean is $n-1$*.

* Highlight and run line 32.


``` r
qt(0.975, df = 122, lower.tail=TRUE)
```

```
#> [1] 1.9796
```


Mark on the $t$-distribution found below the values of $\pm t^*$.  Draw a line at each multiplier and write the percentiles used to find each.
\vspace{1mm}

\begin{figure}

{\centering \includegraphics[width=0.75\linewidth]{07-A12-quantitative_theory_files/figure-latex/tst-1} 

}

\end{figure}

**Calculate the margin of error using theory-based methods**

\vspace{0.6in}

**Calculate the confidence interval for the true mean using theory-based methods.**

\vspace{0.8in}


7.  Interpret the confidence interval in context of the study.

\vspace{1in}

8. Can we generalize the results of the study to all adults? Explain your answer.

\vspace{0.5in}
### Take-home messages

1.  In order to use theory-based methods for a quantitative variable, the independent observational units and normality conditions must be met.  

2.  In order to find a theory-based p-value, we use R to calculate the area under a $t$-distribution with $n - 1$ degrees of freedom (df) that is at or more extreme than the observed $T$-score.  

3.  A $t^*$ multiplier is found by obtaining the bounds of the middle X% (X being the desired confidence level) of a $t$-distribution with $n - 1$ df.


### Additional notes

Activity 12--13 cover the material in Module 7.  For more practice with theory-based inference for a single quantitative variable use the Module 7 Review worksheet in the Unit 2 Review Materials (pgs. 251--254).

Use this space to summarize your thoughts and take additional notes on today's activity and material covered

\newpage
