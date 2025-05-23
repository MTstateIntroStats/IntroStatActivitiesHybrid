## Activity 7:  Handedness of Male Boxers --- Theory CI

\setstretch{1}

### Learning objectives

* Calculate a theory-based confidence interval for a single proportion.

* Check the appropriate conditions to find a theory-based confidence interval.

* Interpret a confidence interval for a single proportion.

* Use the normal distribution to find the multiplier needed for a confidence interval

### Terminology review

In this activity, we will introduce theory-based confidence intervals for a single proportion. Some terms covered in this activity are:

* Parameter of interest

* Multiplier

* Normal distribution

To review these concepts, see Chapters 11 & 14 in your textbook.

### Handedness of Male Boxers

In the out-of-class activity we found very strong evidence that the true proportion of male boxers that are left-handed is greater than 0.1.  In this activity we will use the same data set to find the theory-based 95\% confidence interval.

Remember from the last activity: Left-handedness is a trait that is found in about 10\% of the general population. Past studies have shown that left-handed men are over-represented among professional boxers. The fighting claim states that left-handed men have an advantage in competition.  In this random sample of 500 male professional boxers, we want to see if there is an over-prevalence of left-handed fighters.  In the sample of 500 male boxers, 81 were left-handed.

Recall that to use theory-based methods we must check the conditions to approximate the sampling distribution with the normal distribution.  From the previous activity, we saw that independence was satisfied as the researchers took a random sample and that the sample had more than 10 successes and 10 failures.

#### Theory-based confidence interval {-}

To calculate a theory-based 95\% confidence interval for $\pi$, we will first find the **standard error** of $\hat{p}$ by plugging in the value of $\hat{p}$ for $\pi$ in $SD(\hat{p})$:

$$SE(\hat{p}) = \sqrt{\frac{\hat{p}\times (1-\hat{p})}{n}}.$$
Note that we do not include a "0" subscript, since we are not assuming a null hypothesis. 

1.  Calculate the standard error of the sample proportion to find a 95\% confidence interval.

\vspace{0.3in}
\newpage

We will calculate the margin of error and confidence interval in questions 4 and 5 of this activity. **The margin of error (ME)** is the value of the $z^*$ multiplier times the standard error of the statistic.

$$ME = z^* \times SE(\hat{p})$$
The $z^*$ multiplier is the percentile of a standard normal distribution that corresponds to our confidence level. If our confidence level is 95\%, we find the Z values that encompass the middle 95\% of the standard normal distribution.  If 95\% of the standard normal distribution should be in the middle, that leaves 5\% in the tails, or 2.5\% in each tail.  

The `qnorm()` function in R will tell us the $z^*$ value for the desired percentile (in this case, 95\% + 2.5\% = 97.5\% percentile). 

* Enter the value of 0.975 for xx in the provided R script file. 

* Highlight and run line 4. This will give the value of the multiplier for a 95\% confidence interval.


```r
qnorm(xx. lower.tail = TRUE) # Multiplier for 95% confidence interval
```

2. Report the value of the multiplier needed to calculate the 95\% confidence interval for the true proportion of male boxers that are left-handed.
\vspace{0.2in}

3. Fill in the normal distribution shown below to show how R found the $z^*$ multiplier.

\begin{figure}

{\centering \includegraphics[width=0.45\linewidth]{07-A06-inference-1cat_CI-theory_files/figure-latex/Normalcur-1} 

}

\caption{Standard Normal Curve}(\#fig:Normalcur)
\end{figure}

4.  Calculate the margin of error for the 95\% confidence interval.
\vspace{0.6in}

To find the confidence interval, we will add and subtract the **margin of error** to the point estimate:
$$\text{point estimate}\pm\text{margin of error}$$
$$\hat{p}\pm z^* \times SE(\hat{p})$$

5.  Calculate the 95\% confidence interval for the parameter of interest.
\vspace{0.6in}

\newpage

6.  Interpret the 95\% confidence interval in the context of the problem.
\vspace{1in}

7. Is the null value, 0.1, contained in the 95\% confidence interval?  Explain, based on the p-value from the last activity, why you expected this to be true.
\vspace{0.6in}

#### Simulation Methods {-}

In the out-of-class activity, we found that the success-failure condition was met to use theory-based methods.  Here we will use simulation methods to find a 95\% confidence interval for the parameter of interest.

Use the `one_proportion_bootstrap_CI()` function in R to simulate the bootstrap distribution of sample proportions and calculate a confidence interval. 

* Using the provided R script file, fill in the values/words for each `xx` in the one proportion bootstrap confidence interval (CI) code to create a bootstrap distribution with 1000 simulations. 

* Make sure to run the library(catstats) function before running the one_proportion_bootstrap_CI function.

* Highlight and run lines 9--13


```r
one_proportion_bootstrap_CI(sample_size = xx, # Sample size
                    number_successes = xx, # Observed number of successes
                    number_repetitions = 1000, # Number of bootstrap samples to use
                    confidence_level = 0.95) # Confidence level as a decimal
```

8. Report the simulation 95\% confidence interval.  Is this confidence interval similar to the confidence interval calculated in question 5?  Explain why this makes sense.

\vspace{0.8in}

### What does *confidence* mean? {-}

In the interpretation of a 95\% confidence interval, we say that we are 95\% confident that the parameter is within the confidence interval.  Why are we able to make that claim?  What does it mean to say "we are 95\% confident"?

9. In the last part of the activity we found a 95\% confidence interval for the parameter of interest.  As a class, determine a plausible value for the 
true proportion of male boxers that are left-handed. *Note: we are making assumptions about the population here. This is not based on our calculated data, but we will use this applet to better understand what happens when we take many, many samples from this believed population.*

\vspace{0.2in}

10.  Go to this website, [http://www.rossmanchance.com/ISIapplets.html](http://www.rossmanchance.com/ISIapplets.html) and choose 'Simulating Confidence Intervals'.  In the input on the left-hand side of the screen enter the value from question 9 for $\pi$ (the true value), 500 for $n$, and 100 for 'Number of intervals'.  Click 'sample'.

\vspace{1mm}

* In the graph on the bottom right, click on a green dot.  Write down the confidence interval for this sample given on the graph on the left.  Does this confidence interval contain the true value chosen in question 9?

\vspace{0.4in}

* Now click on a red dot.  Write down the confidence interval for this sample.  Does this confidence interval contain the true value chosen in question 9?
\vspace{0.5in}

* How many intervals out of 100 contain $\pi$, the true value chosen in question 9? *Hint*:  This is given to the left of the graph of green and red intervals.
\vspace{0.4in}

11.  Click on 'sample' nine more times.  Write down the 'Running Total' for the proportion of intervals that contain $\pi$.

\vspace{0.5in}

12.  **Interpret the level of confidence.  *Hint*: What proportion of samples would we expect to give a confidence interval that contains the parameter of interest?**

\vspace{0.8in}


### Take-home messages

1.  In theory-based methods, we add and subtract a margin of error to the sample statistic.  The margin of error is calculated using a multiplier that corresponds to the level of confidence times the variability (standard error) of the statistic.

2. The confidence interval calculated using theory-based methods should be similar to the confidence interval found using simulation methods provided the success-failure condition is met.

<!-- 3.  A smaller sample size will increase the margin of error which results in a wider confidence interval.  -->

3. If repeat samples of the same size are selected from the population, approximately 95\% of samples will create a 95\% confidence interval that contains the parameter of interest.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.


\newpage
