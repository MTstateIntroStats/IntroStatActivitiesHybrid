## Activity 8:  What does confidence mean?

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

We will use the male boxer study to look at what confidence means.

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

### What does *confidence* mean? {-}

In the interpretation of a 95\% confidence interval, we say that we are 95\% confident that the parameter is within the confidence interval.  Why are we able to make that claim?  What does it mean to say "we are 95\% confident"?

1. In the last activity we found a 95\% confidence interval for the parameter of interest.  As a class, determine a plausible value for the true proportion of male boxers that are left-handed. *Note: we are making assumptions about the population here. This is not based on our calculated data, but we will use this applet to better understand what happens when we take many, many samples from this believed population.*

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

6.  Interpret the level of confidence.  *Hint*: What proportion of samples would we expect to give a confidence interval that contains the parameter of interest?

\vspace{0.8in}

### Impacts on the P-value {-}

Suppose that we want to show that the true proportion of male boxers **differs** from that in the general population.

7.  Write out the alternative hypothesis in notation for this new research question.

\vspace{0.5in}

8.  How would this impact the p-value?

\vspace{0.2in}

9.  How much evidence would this p-value provide against the null hypothesis?

\vspace{0.3in}

Suppose instead of 500 male boxers the researchers only took a sample of 300 male boxers and found the same proportion ($\hat{p}=0.182$) of male boxers that are left-handed.  Since we are still assuming the same null value, 0.1, the standard error would be calculated as below:

$$SE_0(\hat{p})=\sqrt{\frac{0.1\times(1-0.1)}{300}} = 0.017$$.

\newpage

10. Calculate the standardized statistic for this new sample.

\vspace{0.8in}

Use Rstudio to find the p-value for this new sample.  Enter the value of the standardized statistic found in question 10 for xx in line 4.  Highlight and run lines 4--6.


```r
pnorm(xx, # Enter value of standardized statistic
      m=0, s=1, # Using the standard normal mean = 0, sd = 1
      lower.tail=FALSE) # Gives a p-value greater than the standardized statistic
```

11.  How does the decrease in sample size affect the p-value?

\vspace{0.3in}

Suppose another sample of 500 male boxers was taken and 68 were found to be left-handed.  Since we are still assuming the same null value, 0.1, the standard error would be calculated as before:

$$SE_0(\hat{p})=\sqrt{\frac{0.1\times(1-0.1)}{500}} = 0.013$$.


12. Calculate the standardized statistic for this new sample.

\vspace{0.8in}

Use Rstudio to find the p-value for this new sample.


```r
pnorm(xx, # Enter value of standardized statistic
      m=0, s=1 # Using the standard normal mean = 0, sd = 1
      lower.tail=FALSE) # Gives a p-value greater than the standardized statistic
```

13.  How does a statistic closer to the null value affect the p-value?

\vspace{0.3in}

14.  Summarize how each of the following affected the p-value:

a) Switching to a two-sided test.

\vspace{0.4in}

b) Using a smaller sample size.

\vspace{0.4in}

c) Using a sample statistic closer to the null value.

\vspace{0.4in}


### Take-home messages

1.  If repeat samples of the same size are selected from the population, approximately 95\% of samples will create a 95\% confidence interval that contains the parameter of interest.

2.  The p-value for a two-sided test is approximately two times the value for a one-sided test.  A two-sided test provides less evidence against the null hypothesis.

3.  The larger the sample size, the smaller the sample to sample variability.  This will result in a larger standardized statistic and more evidence against the null hypothesis.

4.  The farther the statistic is from the null value, the larger the standardized statistic.  This will result in a smaller p-value and more evidence against the null hypothesis.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.


\newpage
