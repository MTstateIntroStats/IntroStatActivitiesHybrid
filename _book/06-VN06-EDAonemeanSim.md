---
output:
  pdf_document: default
  html_document: default
---
## Video Notes: Exploratory Data Analysis and Hypothesis Testing of Quantitative Variables

Read Chapters 5 and 17 in the course textbook.  Use the following videos to complete the video notes for Module 6.

### Course Videos

* 5.2to5.4

* 5.5

* 5.7

* 17.2

* 17.1

\setstretch{1}

### Summarizing quantitative data - Video 5.2to5.4 {-}

#### Types of plots {-}

We will revisit the moving to Montana data set and plot the age of the buyers.



Dotplot:

\vspace{0.5in}


``` r
moving %>%
  ggplot(aes(x = Age))+ #Enter variable to plot
  geom_dotplot() + 
  labs(title = "Dotplot of Age of Buyers from Gallatin 
       County Home Sales", #Title your plot
       x = "Age", #x-axis label
       y = "Proportion") #y-axis label
```



\begin{center}\includegraphics[width=0.75\linewidth]{06-VN06-EDAonemeanSim_files/figure-latex/unnamed-chunk-2-1} \end{center}

\newpage

Histogram:

\vspace{0.2in}


``` r
moving %>%
  ggplot(aes(x = Age))+
  geom_histogram(binwidth = 7) + 
  labs(title = "Histogram of Age of Buyers from Gallatin 
       County Home Sales",
       #Title your plot
       x = "Age",
       y = "Count")
```



\begin{center}\includegraphics[width=0.7\linewidth]{06-VN06-EDAonemeanSim_files/figure-latex/unnamed-chunk-3-1} \end{center}

\setstretch{1.5}

Quantitative data can be numerically summarized by finding:

Two measures of center: 

* Mean: ____________ of all the _____________ in the data set.

    - Sum the values in the data set and divide
    the sum by the sample size
    
* Notation used for the population mean:
       
\vspace{0.1in}
    
* Notation used for the sample mean:
    
\vspace{0.1in}

* Median: Value at the _____________ percentile

    - __________ % of values are at and ___________ and at and ___________ the value of the ______________.

    - Middle value in a list of ordered values

Two measures of spread:

* Standard deviation:  Average ___________________ each data point is from the ______________ of the data set.

\vspace{1mm}

\rgi \rgi - Notation used for the population standard deviation

\vspace{0.2in}

\rgi \rgi - Notation used for the sample standard deviation

\vspace{0.2in}

* Interquartile range: middle 50% of data values

\rgi Formula:

\rgi \rgi Quartile 3 (Q3) - value at the 75th percentile

\rgi \rgi - ____________ % of values are at and _____________ the value of Q3

\rgi \rgi Quartile 1 (Q1) - value at the 25th percentile

\rgi \rgi - _____________ % of values are at and _____________ the value of Q1

\vspace{1mm}

\setstretch{1}

\newpage

### Summarizing quantitative data - Video 5.5 {-}

Boxplot (3rd type of plot for quantitative variables)

    - Five number summary: minimum, Q1, median, Q3, maximum

\vspace{0.3in}


``` r
moving %>%
  ggplot(aes(x = Age))+ #Enter variable to plot
  geom_boxplot() + 
  labs(title = "Boxplot of Age of Buyers from Gallatin 
       County Home Sales", #Title your plot
       x = "Age", #x-axis label
       y = "") + #y-axis label
    theme(axis.text.y = element_blank(), 
          axis.ticks.y = element_blank()) # Removes y-axis ticks
```



\begin{center}\includegraphics[width=0.7\linewidth]{06-VN06-EDAonemeanSim_files/figure-latex/unnamed-chunk-4-1} \end{center}


``` r
favstats(moving$Age)
```

```
#>  min Q1 median    Q3 max  mean       sd   n missing
#>   20 28     36 49.25  77 39.77 14.35471 100       0
```


Interpret the value of $Q_3$ for the age of buyers.

\vspace{0.5in}

Interpret the value of s for the age of buyers.

\vspace{0.5in}

\newpage

#### Four characteristics of plots for quantitative variables {-}

* Shape: overall pattern of the data


\begin{center}\includegraphics[width=0.8\linewidth]{images/shape2} \end{center}

\rgi \rgi - What is the shape of the distribution of age of buyers for Gallatin County home sales?

\vspace{0.3in}

* Center:  

\rgi Mean or Median

\rgi \rgi - Report the measure of center based on the boxplot of age of buyers for Gallatin County home sales.

\vspace{0.3in}

* Spread (or variability):

\rgi Standard deviation or IQR

\rgi \rgi - Report the IQR for the distribution of age of buyers from Gallatin County home sales.

\vspace{0.3in}

* Outliers?

\rgi values < $Q_1 - 1.5 \times IQR$

\rgi values > $Q_3 + 1.5 \times IQR$

\rgi \rgi - Use these formulas to show that there are no outliers in the distribution of age of buyers from Gallatin County home sales.

\vspace{0.8in}

\newpage

### Robust statistics - Video 5.7 {-}

Let's review the summary statistics and histogram of age of buyers from sampled home sales.


\begin{center}\includegraphics[width=0.85\linewidth]{06-VN06-EDAonemeanSim_files/figure-latex/unnamed-chunk-7-1} \end{center}


```
#>  min Q1 median    Q3 max  mean       sd   n missing
#>   20 28     36 49.25  77 39.77 14.35471 100       0
```

\setstretch{1.5}

Notice that the _____________ has been pulled in the direction of the _______________.  

* The ___________ is a robust measure of center.

* The ___________ is a robust measure of spread.

* Robust means not _________________ by outliers.

When the distribution is symmetric use the ____________ as the measure of center and the ___________ as the measure of spread.

When the distribution is skewed with outliers use the _____________ as the measure of center and the ____________ as the measure of spread.

\setstretch{1}

\newpage

### Simulation-based Testing for a Single Mean - Video 17.2 {-}

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
       y = "") + # Label for y axis  
    theme(axis.text.y = element_blank(), 
          axis.ticks.y = element_blank()) # Removes y-axis ticks

```



\begin{center}\includegraphics[width=0.6\linewidth]{06-VN06-EDAonemeanSim_files/figure-latex/unnamed-chunk-10-1} \includegraphics[width=0.6\linewidth]{06-VN06-EDAonemeanSim_files/figure-latex/unnamed-chunk-10-2} \end{center}

\newpage

Summary Statistics:


``` r
pb %>%
  summarise(favstats(Weight)) #Gives the summary statistics
#>     min    Q1 median     Q3   max     mean       sd  n missing
#> 1 104.1 276.3  339.4 382.45 543.6 324.5988 88.32615 83       0
```

#### Hypothesis testing {-}

\setstretch{1.5}

* Hypotheses are always written about the _________________________.  For a single mean we will use the notation ___________.

\setstretch{1}

Null Hypothesis:

$H_0:$

\vspace{0.2in}
Alternative Hypothesis:

$H_A:$

\vspace{0.2in}

\setstretch{1.5}

* Direction of the alternative depends on the __________________
___________________.

\setstretch{1}

#### Simulation-based method {-}

* Simulate many samples assuming $H_0: \mu = \mu_0$

    * Shift the data by the difference between $\mu_0$ and $\bar{x}$

    * Sample with replacement $n$ times from the shifted data

    * Plot the simulated shifted sample mean from each simulation

    * Repeat 10000 times (simulations) to create the null distribution

    * Find the proportion of simulations at least as extreme as $\bar{x}$

### Optional Notes: Video Example (Video 17.2) {-}

Is there evidence that male polar bears weigh less than 370kg (previously recorded measure), on average?  The weight was measured on a representative sample of 83 male polar bears from the Southern Beaufort Sea.

Hypotheses:

In notation:

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}


In words:

$H_0:$

\vspace{0.6in}

$H_A:$

\vspace{0.6in}

Reminder of summary statistics:


``` r
pb %>%
  summarise(favstats(Weight)) #Gives the summary statistics
#>     min    Q1 median     Q3   max     mean       sd  n missing
#> 1 104.1 276.3  339.4 382.45 543.6 324.5988 88.32615 83       0
```
Find the difference:

$\mu_0 - \bar{x} =$


``` r
set.seed(216)
one_mean_test(pb$Weight,   #Enter the object name and variable
              null_value = 370, #Enter null value for the study
              summary_measure = "mean",  #Can choose between mean or median
              shift = 45.4,   # Shift needed for bootstrap hypothesis test
              as_extreme_as = 324.6,  # Observed statistic
              direction = "less",  # Direction of alternative
              number_repetitions = 10000)  # Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.6\linewidth]{06-VN06-EDAonemeanSim_files/figure-latex/unnamed-chunk-13-1} \end{center}


Interpretation of the p-value:

* Statement about probability or proportion of samples

* Statistic (summary measure and value)

* Direction of the alternative

* Null hypothesis (in context)


\vspace{0.8in}
\newpage

Conclusion:

* Amount of evidence

* Parameter of interest

* Direction of the alternative hypothesis

\vspace{0.8in}

### Simuation-based Confidence Intervals for a Single Mean - Video 17.1 {-}

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
       y = "") + # Label for y axis
    theme(axis.text.y = element_blank(), 
          axis.ticks.y = element_blank()) # Removes y-axis ticks
```



\begin{center}\includegraphics[width=0.6\linewidth]{06-VN06-EDAonemeanSim_files/figure-latex/unnamed-chunk-15-1} \includegraphics[width=0.6\linewidth]{06-VN06-EDAonemeanSim_files/figure-latex/unnamed-chunk-15-2} \end{center}

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

* Repeat at least 10000 times (simulations)

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



\begin{center}\includegraphics[width=0.7\linewidth]{06-VN06-EDAonemeanSim_files/figure-latex/unnamed-chunk-17-1} \end{center}
The confidence interval estimates the ________________
of ____________________.

Confidence interval interpretation:

* How confident you are (e.g., 90%, 95%, 98%, 99%)

* Parameter of interest

* Calculated interval

* Order of subtraction when comparing two groups

\vspace{0.8in}

### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. What plots can be used to summarize quantitative data?

\vspace{0.7in}

2. Which measure of center is robust to outliers?

\vspace{0.2in}

3. How do we determine the direction of the alternative hypothesis?


\newpage
