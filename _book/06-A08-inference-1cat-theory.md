## Activity 7:  Handedness of Male Boxers

\setstretch{1}

### Learning outcomes

* Describe and perform a theory-based hypothesis test for a single proportion.

* Check the appropriate conditions to use a theory-based hypothesis test.

* Calculate and interpret the standardized sample proportion.

* Interpret and evaluate a p-value for a theory-based hypothesis test for a single proportion.

* Use the normal distribution to find the p-value.


### Terminology review

In this activity, we will introduce theory-based hypothesis tests for a single categorical variable. Some terms covered in this activity are:

* Parameter of interest

* Standardized statistic

* Normal distribution

* p-value

To review these concepts, see Chapter 11 & 14 in your textbook.

Activities from module 5 covered simulation-based methods for hypothesis tests involving a single categorical variable. This activity covers theory-based methods for testing a single categorical variable.  

### Handedness of male boxers

Left-handedness is a trait that is found in about 10\% of the general population. Past studies have shown that left-handed men are over-represented among professional boxers [@richardson2019]. The fighting claim states that left-handed men have an advantage in competition.  In this random sample of 500 male professional boxers, we want to see if there is an over-prevalence of left-handed fighters.  In the sample of 500 male boxers, 81 were left-handed.



```r
 # Read in data set
boxers <- read.csv("https://math.montana.edu/courses/s216/data/Male_boxers_sample.csv")
boxers %>% count(Stance)  # Count number in each Stance category
```

```
#>         Stance   n
#> 1  left-handed  81
#> 2 right-handed 419
```

### Review of summary statistics {-}

1.  Write out the parameter of interest in words, in context of the study.  

\vspace{0.8in}

2.  Write out the null hypothesis in words.
\vspace{0.8in}

3. Write out the alternative hypothesis in notation.
\vspace{0.3in}

4. Give the value of the summary statistic (sample proportion) for this study.  Use proper notation.

\vspace{0.3in}

### Theory-based methods {-}

The sampling distribution of a single proportion --- how that proportion varies from sample to sample --- can be mathematically modeled using the normal distribution if certain conditions are met.

Conditions for the sampling distribution of $\hat{p}$ to follow an approximate normal distribution:

* **Independence**: The sample’s observations are independent, e.g., are from a simple random sample. (*Remember*: This also must be true to use simulation methods!)

* **Success-failure condition**: We *expect* to see at least 10 successes and 10 failures in the sample, $n\hat{p}≥10$  and $n(1-\hat{p})≥10$.

5. Verify that the independence condition is satisfied.

\vspace{0.5in}

6. Is the success-failure condition met to model the data with the normal distribution?  Explain your answer in context of the problem.

\vspace{0.8in}

To calculate the standardized statistic we use the general formula 

$$
Z = \frac{\text{point estimate} - \text{null value}}{SE_0(\text{point estimate})}.
$$
For a single categorical variable the standardized sample proportion is calculated using

$$
Z = \frac{\hat{p} - \pi_0}{SE_0(\hat{p})},
$$
where the standard error is calculated using the null value:

$$SE_0(\hat{p})=\sqrt{\frac{\pi_0\times(1-\pi_0)}{n}}$$.

For this study, the null standard error of the sample proportion is calculated using the null value, 0.1.

$$SE_0(\hat{p})=\sqrt{\frac{0.1\times(1-0.1)}{500}} = 0.013$$.

Each sample proportion of male boxers that are left-handed is 0.013 from the true proportion of male boxers that are left-handed, on average.

\newpage

7. Label the standard normal distribution shown below with the null value as the center value (below the value of zero).  Label the tick marks to the right of the null value by adding 1 standard error to the null value to represent 1 standard error, 2 standard errors, and 3 standard errors from the null.  Repeat this process to the left of the null value by subtracting 1 standard error for each tick mark.

\vspace{2mm}

\begin{figure}

{\centering \includegraphics[width=0.5\linewidth]{06-A08-inference-1cat-theory_files/figure-latex/Norcur-1} 

}

\caption{Standard Normal Curve}(\#fig:Norcur)
\end{figure}

8.  Using the null standard error of the sample proportion, calculate the standardized sample proportion (Z). Mark this value on the standard normal distribution above.

\vspace{0.6in}

The standardized statistic is used as a ruler to measure how far the sample statistic is from the null value.  Essentially, we are converting the sample proportion into a measure of standard errors to compare to the standard normal distribution.  

The standardized statistic measures the *number of standard errors the sample statistic is from the null value*.

9.  Interpret the standardized sample proportion from question 8 in context of the problem.

\vspace{.8in}

We will use the `pnorm()` function in `R` to find the p-value. The value for Z was entered into the code below to get the p-value.  Check that this answer matches what you calculated in question 7. Notice that we used `lower.tail = FALSE` to find the p-value.  `R` will calculate the p-value *greater* than the value of the standardized statistic.  

Notes:

* Use `lower.tail = TRUE` when doing a left-sided test.
* Use `lower.tail = FALSE` when doing a right-sided test.
* To find a two-sided p-value, use a left-sided test for negative Z or a right-sided test for positive Z, then multiply the value found by 2 to get the p-value.


```r
pnorm(4.769, # Enter value of standardized statistic
      m=0, s=1, # Using the standard normal mean = 0, sd = 1
      lower.tail=FALSE) # Gives a p-value greater than the standardized statistic
```

```
#> [1] 9.257133e-07
```
  
  
10.  Report the p-value obtained from the `R` output.
\vspace{0.3in}

11.  Write a conclusion based on the value of the p-value.

\vspace{0.6in}

#### Theory-based confidence interval {-}

To calculate a theory-based 95\% confidence interval for $\pi$, we will first find the **standard error** of $\hat{p}$ by plugging in the value of $\hat{p}$ for $\pi$ in $SD(\hat{p})$:

$$SE(\hat{p}) = \sqrt{\frac{\hat{p}\times (1-\hat{p})}{n}}.$$
Note that we do not include a "0" subscript, since we are not assuming a null hypothesis. 

12.  Calculate the standard error of the sample proportion to find a 95\% confidence interval.

\vspace{0.5in}

We will calculate the margin of error and confidence interval in questions 4 and 5 of this activity. **The margin of error (ME)** is the value of the $z^*$ multiplier times the standard error of the statistic.

$$ME = z^* \times SE(\hat{p})$$
The $z^*$ multiplier is the percentile of a standard normal distribution that corresponds to our confidence level. If our confidence level is 95\%, we find the Z values that encompass the middle 95\% of the standard normal distribution.  If 95\% of the standard normal distribution should be in the middle, that leaves 5\% in the tails, or 2.5\% in each tail.  

The `qnorm()` function in R will tell us the $z^*$ value for the desired percentile (in this case, 95\% + 2.5\% = 97.5\% percentile). 

* Enter the value of 0.975 for xx in the provided R script file. 

* Highlight and run line 15. This will give the value of the multiplier for a 95\% confidence interval.


```r
qnorm(xx, lower.tail = TRUE) # Multiplier for 95% confidence interval
```

13. Report the value of the multiplier needed to calculate the 95\% confidence interval for the true proportion of male boxers that are left-handed.
\vspace{0.2in}

\newpage

14. Fill in the normal distribution shown below to show how R found the $z^*$ multiplier.

\begin{figure}

{\centering \includegraphics[width=0.45\linewidth]{06-A08-inference-1cat-theory_files/figure-latex/Normalcur-1} 

}

\caption{Standard Normal Curve}(\#fig:Normalcur)
\end{figure}

15.  Calculate the margin of error for the 95\% confidence interval.
\vspace{0.6in}

To find the confidence interval, we will add and subtract the **margin of error** to the point estimate:
$$\text{point estimate}\pm\text{margin of error}$$
$$\hat{p}\pm z^* \times SE(\hat{p})$$

16.  Calculate the 95\% confidence interval for the parameter of interest.
\vspace{0.6in}


17.  Interpret the 95\% confidence interval in the context of the problem.
\vspace{1in}

\newpage

<!-- ### Impacts on the P-value {-} -->

<!-- Suppose that we want to show that the true proportion of male boxers **differs** from that in the general population.  -->

<!-- 13.  Write out the alternative hypothesis in notation for this new research question. -->

<!-- \vspace{0.5in} -->

<!-- 14.  How would this impact the p-value?   -->

<!-- \vspace{0.2in} -->

<!-- 15.  How much evidence would this p-value provide against the null hypothesis? -->

<!-- \vspace{0.3in} -->

<!-- 16. Suppose instead of 500 male boxers the researchers only took a sample of 300 male boxers and found the same proportion ($\hat{p}=0.182$) of male boxers that are left-handed.  Since we are still assuming the same null value, 0.1, the standard error would be calculated as below: -->

<!-- $$SE_0(\hat{p})=\sqrt{\frac{0.1(1-0.1)}{300}} = 0.017$$. -->

<!-- Calculate the standardized statistic for this new sample. -->

<!-- \vspace{0.8in} -->

<!-- Use Rstudio to find the p-value for this new sample.  Enter the value of the standardized statistic found in question 14 for xx in line 12.  Highlight and run lines 12--14. -->

<!-- ```{r, echo=TRUE, eval=FALSE} -->
<!-- pnorm(xx, # Enter value of standardized statistic -->
<!--       m=0, s=1, # Using the standard normal mean = 0, sd = 1 -->
<!--       lower.tail=FALSE) # Gives a p-value greater than the standardized statistic -->
<!-- ``` -->

<!-- 17.  How does the decrease in sample size affect the p-value? -->

<!-- \vspace{0.3in} -->

<!-- 18. Suppose another sample of 500 male boxers was taken and 68 were found to be left-handed.  Since we are still assuming the same null value, 0.1, the standard error would be calculated as before: -->

<!-- $$SE_0(\hat{p})=\sqrt{\frac{0.1(1-0.1)}{500}} = 0.013$$.Calculate the standardized statistic for this new sample. -->

<!-- \vspace{0.8in} -->

<!-- Use Rstudio to find the p-value for this new sample.   -->

<!-- ```{r, echo=TRUE, eval=FALSE} -->
<!-- pnorm(xx, # Enter value of standardized statistic -->
<!--       m=0, s=1 # Using the standard normal mean = 0, sd = 1 -->
<!--       lower.tail=FALSE) # Gives a p-value greater than the standardized statistic -->
<!-- ``` -->

<!-- 19.  How does a statistic closer to the null value affect the p-value?   -->

<!-- \vspace{0.3in} -->

<!-- 20.  Summarize how each of the following affected the p-value: -->

<!-- a) Switching to a two-sided test. -->

<!-- \vspace{0.4in} -->

<!-- b) Using a smaller sample size. -->

<!-- \vspace{0.4in} -->

<!-- c) Using a sample statistic closer to the null value. -->

<!-- \vspace{0.4in} -->

### Take-home messages

1.	Both simulation and theory-based methods can be used to find a p-value for a hypothesis test.  In order to use theory-based methods we need to check that both the independence and the success-failure conditions are met. 

2.  The standardized statistic measures how many standard errors the statistic is from the null value. The larger the standardized statistic the more evidence there is against the null hypothesis.

<!-- 3.  The p-value for a two-sided test is approximately two times the value for a one-sided test.  A two-sided test provides less evidence against the null hypothesis. -->

<!-- 4.  The larger the sample size, the smaller the sample to sample variability.  This will result in a larger standardized statistic and more evidence against the null hypothesis. -->

<!-- 5.  The farther the statistic is from the null value, the larger the standardized statistic.  This will result in a smaller p-value and more evidence against the null hypothesis. -->

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
