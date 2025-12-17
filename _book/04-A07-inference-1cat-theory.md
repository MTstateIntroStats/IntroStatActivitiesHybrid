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

Activities from module 3 covered simulation-based methods for hypothesis tests involving a single categorical variable. This activity covers theory-based methods for testing a single categorical variable.  

### Handedness of male boxers

Left-handedness is a trait that is found in about 10\% of the general population. Past studies have shown that left-handed men are over-represented among professional boxers [@richardson2019]. Is there evidence that there is an over-prevalence of left-handed fighters?  In this random sample of 500 professional male boxers, 81 were left-handed.

* Observational units:

* Variable:

    * Type of variable:

    * Success:

### R Instructions {-}

* Download the R file for today's activity from Canvas

* Upload the file to the R server

* Run lines 1--15 to load the needed packages and the data set and create a plot of the data



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
\newpage


``` r
boxers %>% # Data set piped into...
    ggplot(aes(x = Stance)) +   # This specifies the variable
    geom_bar(aes(y = after_stat(prop), group = 1)) +  # Tell it to make a bar plot with proportions
    labs(title = "____________________ of Handedness of Male \n Professional Boxers",  
       # Give your plot a title
       x = "Handedness",   # Label the x axis
       y = "Relative Frequency")  # Label the y axis
```



\begin{center}\includegraphics[width=0.5\linewidth]{04-A07-inference-1cat-theory_files/figure-latex/unnamed-chunk-2-1} \end{center}
1.  What type of plot was created of these data?

\vspace{0.2in}

### Hypotheses and summary statistics {-}

2.  Write out the parameter of interest in words, in context of the study.  

\vspace{1in}

3.  Write out the null hypothesis **in words**.
\vspace{1in}

4. Write out the alternative hypothesis **in notation**.
\vspace{0.5in}

5. Calculate the value of the summary statistic (sample proportion) for this study.  Use proper notation.

\vspace{0.3in}

\newpage

### Theory-based methods {-}

The sampling distribution of a single proportion --- how that proportion varies from sample to sample --- can be mathematically modeled using the normal distribution if certain conditions are met.

Conditions for the sampling distribution of $\hat{p}$ to follow an approximate normal distribution:

* **Independence**: The sample’s observations are independent, e.g., are from a simple random sample. (*Remember*: This also must be true to use simulation methods!)

* **Large enough sample size**: Success-failure condition: We *expect* to see at least 10 successes and 10 failures in the sample, $n\hat{p}≥10$  and $n(1-\hat{p})≥10$.

### Additional notes on Theory-based methods {-}

\vspace{1.4in}

* Verify that the independence condition is satisfied.

\vspace{0.3in}

* Verify that the sample size is large enough.

\vspace{0.5in}

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

Label the standard normal distribution shown below with the null value as the center value (below the value of zero).  Label the tick marks to the right of the null value by adding 1 standard error to the null value to represent 1 standard error, 2 standard errors, and 3 standard errors from the null.  Repeat this process to the left of the null value by subtracting 1 standard error for each tick mark.

\vspace{2mm}

\begin{figure}

{\centering \includegraphics[width=0.5\linewidth]{04-A07-inference-1cat-theory_files/figure-latex/Normcur-1} 

}

\caption{Standard Normal Curve}(\#fig:Normcur)
\end{figure}

6.  Using the null standard error of the sample proportion, calculate the standardized sample proportion (Z). Mark this value on the standard normal distribution above.

\vspace{0.6in}

The standardized statistic is used as a ruler to measure how far the sample statistic is from the null value.  Essentially, we are converting the sample proportion into a measure of standard errors to compare to the standard normal distribution.  

The standardized statistic measures the *number of standard errors the sample statistic is from the null value*.

**Interpretation of the standardized sample proportion:**

\vspace{.8in}

We will use the `pnorm()` function in `R` to find the p-value. In the code below, notice that we used `lower.tail = FALSE` to find the p-value.  `R` will calculate the p-value *greater* than the value of the standardized statistic.  

Notes:

* Use `lower.tail = TRUE` when doing a left-sided test.
* Use `lower.tail = FALSE` when doing a right-sided test.
* To find a two-sided p-value, use a left-sided test for negative Z or a right-sided test for positive Z, then multiply the value found by 2 to get the p-value.



``` r
pnorm(4.769, # Enter value of standardized statistic
      m=0, s=1, # Using the standard normal mean = 0, sd = 1
      lower.tail=FALSE) # Gives a p-value greater than the standardized statistic
```

```
#> [1] 9.257133e-07
```
  
  
7.  Report the p-value obtained from the `R` output.
\vspace{0.3in}

8.  Write a conclusion based on the p-value.

\vspace{0.6in}

9. To what group of observational units can the results be generalized to?

\vspace{0.4in}

### Two-sided test {-}

Suppose that we want to show that the true proportion of male boxers **differs** from that in the general population.

10.  Write out the alternative hypothesis in notation for this new research question.

\vspace{0.3in}

\begin{figure}

{\centering \includegraphics[width=0.5\linewidth]{04-A07-inference-1cat-theory_files/figure-latex/Norm-1} 

}

\caption{Standard Normal Curve}(\#fig:Norm)
\end{figure}

11.  How would this impact the p-value?  Would the p-value be larger or smaller?

\vspace{0.2in}

<!-- Suppose instead of 500 male boxers the researchers only took a sample of 300 male boxers and found the same proportion ($\hat{p}=0.162$) of male boxers that are left-handed.  Since we are still assuming the same null value, 0.1, the standard error would be calculated as below: -->

<!-- $$SE_0(\hat{p})=\sqrt{\frac{0.1(1-0.1)}{300}} = 0.017$$. -->

<!-- The standardized statistic for this new sample is calculated below: -->

<!-- $$Z = \frac{0.162-0.1}{0.017} = 3.64$$ -->

<!-- \newpage -->

<!-- ```{r Norcur, warning=FALSE, out.width="50%", echo = FALSE, fig.align='center', fig.cap="Standard Normal Curve"} -->
<!-- openintro::normTail() -->
<!-- ```  -->


<!-- 12.  How does the decrease in sample size affect the p-value? -->

<!-- \vspace{0.3in} -->

<!-- Suppose another sample of 500 male boxers was taken and 68 were found to be left-handed.  Since we are still assuming the same null value, 0.1, the standard error would be calculated as before: -->

<!-- $$SE_0(\hat{p})=\sqrt{\frac{0.1(1-0.1)}{500}} = 0.013$$. -->

<!-- The standardized statistic for this new sample is calculated below: -->

<!-- $$Z = \frac{0.136-0.1}{0.013} = 2.769$$ -->

<!-- ```{r Norcuv, warning=FALSE, out.width="50%", echo = FALSE, fig.align='center', fig.cap="Standard Normal Curve"} -->
<!-- openintro::normTail() -->
<!-- ```  -->

<!-- 13.  How does a statistic closer to the null value affect the p-value? -->

<!-- \vspace{0.3in} -->

<!-- \newpage -->

<!-- 14.  Summarize how each of the following affected the p-value: -->

<!-- a) Switching to a two-sided test. -->

<!-- \vspace{0.4in} -->

<!-- b) Using a smaller sample size. -->

<!-- \vspace{0.4in} -->

<!-- c) Using a sample statistic closer to the null value. -->

<!-- \vspace{0.4in} -->

### Take-home messages

1.	Both simulation and theory-based methods can be used to find a p-value for a hypothesis test.  In order to use theory-based methods we need to check that both the independence and the success-failure conditions are met. 

2.  The standardized statistic measures how many standard errors the statistic is from the null value. The larger the standardized statistic the more evidence there is against the null hypothesis.

3.  The p-value for a two-sided test is approximately two times the value for a one-sided test.  A two-sided test provides less evidence against the null hypothesis.


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
