## Video Notes: Theory-based Inference for a single quantitative variable 

Read Chapters 5 and 17 in the course textbook.  Use the following videos to complete the video notes for Module 7.

### Course Videos

* 17.1

* 17.3TheoryIntervals

\setstretch{1}


### Single quantitative variable

* Reminder: review summary measures and plots discussed in the Module 6 material and Chapter 5 of the textbook.

* The summary measure for a single quantitative variable is the ______________.

\setstretch{1.5}

Notation:

- Population mean:

- Population standard deviation:

- Sample mean:

- Sample standard deviation:

- Sample size:

\setstretch{1}

Example:  What is the average weight of adult male polar bears?  The weight was measured on a representative sample of 83 male polar bears from the Southern Beaufort Sea.


``` r
pb <- read.csv("https://math.montana.edu/courses/s216/data/polarbear.csv")
```

Plots of the data:


``` r
pb %>%
    ggplot(aes(x = Weight)) +   # Name variable to plot
    geom_histogram(binwidth = 10) +  # Create histogram with specified binwidth
    labs(title = "Histogram of Male Polar Bear Weight", # Title for plot
       x = "Weight (kg)", # Label for x axis
       y = "Frequency") # Label for y axis

pb %>% # Data set piped into...
ggplot(aes(x = Weight)) +   # Name variable to plot
  geom_boxplot() +  # Create boxplot
  labs(title = "Boxplot of Male Polar Bear Weight", # Title for plot
       x = "Weight (kg)", # Label for x axis
       y = "Frequency") # Label for y axis
```



\begin{center}\includegraphics[width=0.6\linewidth]{07-VN07-one_meantheory_files/figure-latex/unnamed-chunk-2-1} \includegraphics[width=0.6\linewidth]{07-VN07-one_meantheory_files/figure-latex/unnamed-chunk-2-2} \end{center}

Summary Statistics:


``` r
pb %>%
  summarise(favstats(Weight)) #Gives the summary statistics
#>     min    Q1 median     Q3   max     mean       sd  n missing
#> 1 104.1 276.3  339.4 382.45 543.6 324.5988 88.32615 83       0
```
### Confidence interval {-}

#### Simulation-based method{-}

* Label cards with the values from the data set

* Sample with replacement (bootstrap) from the original sample $n$ times

* Plot the simulated sample mean on the bootstrap distribution

* Repeat at least 1000 times (simulations)

* Find the cut-offs for the middle X% (confidence level) in a bootstrap distribution.

* ie. 95% CI = (2.5th percentile, 97.5th percentile)

Conditions for inference for a single mean:

- Independence:

\vspace{0.5in}


``` r
set.seed(216)
one_mean_CI(pb$Weight,
  summary_measure = "mean",
  number_repetitions = 10000,
  confidence_level = 0.95)
```



\begin{center}\includegraphics[width=0.7\linewidth]{07-VN07-one_meantheory_files/figure-latex/unnamed-chunk-4-1} \end{center}
The confidence interval estimates the ________________
of ____________________.

Confidence interval interpretation:

* How confident you are (e.g., 90%, 95%, 98%, 99%)

* Parameter of interest

* Calculated interval

* Order of subtraction when comparing two groups

\vspace{0.8in}

\newpage

#### Theory-based method {-}

* Calculate the interval centered at the sample statistic

\rgi $\text{statistic} \pm \text{margin of error}$

\vspace{0.5in}

Conditions for inference using theory-based methods:

- Independence:

\vspace{0.2in}

- Large enough sample size:

\vspace{0.2in}

### $t$-distribution {-}

In the theoretical approach, we use the CLT to tell us that the distribution of sample means will be approximately normal, centered at the assumed true mean under $H_0$ and with standard deviation $\frac{\sigma}{\sqrt{n}}$.

$$\bar{x} \sim N\left(\mu_0, \frac{\sigma}{\sqrt{n}}\right)$$
\setstretch{1.5}

* Estimate the population standard deviation, $\sigma$, with the
___________________________ standard deviation, ________.

* For a single quantitative variable we use the ____ - distribution
with _______________
degrees of freedom to approximate the sampling distribution.

\setstretch{1}

The $t^*$ multiplier is the value at the given percentile of the t-distribution with $n - 1$ degrees of freedom.


\begin{center}\includegraphics[width=0.7\linewidth]{07-VN07-one_meantheory_files/figure-latex/tstarpb-1} \end{center}

\newpage
To find the $t^*$ multiplier for a 95\% confidence interval:


``` r
qt(0.975, df = 82)
#> [1] 1.989319
```
Calculation of the confidence interval for the true mean weight of polar bears from the Southern Beaufort Sea:

\vspace{0.8in}

### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. Are the conditions met to analyze the polar bear data using theory-based methods?

\vspace{0.7in}

2. Interpret the confidence interval found with simulation methods.

\vspace{0.2in}


\newpage
