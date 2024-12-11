## Activity 11: Summarizing Quantitative Variables

\setstretch{1}

### Learning outcomes

* Identify and create appropriate summary statistics and plots given a data set or research question for quantitative data.

* Interpret the following summary statistics in context:
  median, lower quartile, upper quartile, 
  standard deviation, interquartile range.

### Terminology review

In today's activity, we will review summary measures and plots for quantitative variables.  Some terms covered in this activity are:

* Two measures of center: mean, median

* Two measures of spread (variability): standard deviation, interquartile range (IQR)

* Plots of quantitative variables: dotplots, boxplots, histograms

* Given a plot or set of plots, describe and compare the distribution(s)
  of quantitative variables
  (center, variability, shape, outliers).
  

To review these concepts, see Chapter 5 in the textbook.

### The Integrated Postsecondary Education Data System (IPEDS)

These data were collected on a subset of higher education institutions that met the following selection criteria [@ipeds]:

* Degree granting 

* United States only

* Title IV participating

* Not for profit

* 2-year or 4-year or above

* Has full-time first-time undergraduates

Some of the variables collected and their descriptions are below. Note that several variables have missing values for some institutions (denoted by “NA”).

| **Variable** 	| **Description** |
|----	|-------------	|
| `UnitID` | Unique institution identifier |
| `Name` | Institution name |
| `State` | State abbreviation |
| `Sector` | whether public or private |
| `LandGrant` | Is this a land-grant institution (Yes/No) |
| `Size` | Institution size category based on total student enrolled for credit, Fall 2018: Under 1,000, 1,000$-$4,999, 5,000$-$9,999, 10,000$-$19,999, 20,000 and above |
| `Cost_OutofState` | Cost of attendance for full-time out-of-state undergraduate students |
| `Cost_InState` | Cost of attendance for full-time in-state undergraduate students |
| `Retention` | Retention rate is the percent of the undergraduate students that re-enroll in the next year |
| `Graduation_Rate` | 6-year graduation rate for undergraduate students |
| `SATMath_75` | 75th percentile Math SAT score |
| `ACT_75` | 75th percentile ACT score |

#### Identifying variables in a data set {-}

Look through the provided table of variable descriptions.  The `UnitID` and `Name` are identifiers for each observational unit, *US degree-granting higher education institutions in 2018*.  

1. Identify in the table which variables collected on the US institutions are categorical (C) and which variables are quantitative (Q).


#### Summarizing quantitative variables {-}

The `favstats()` function from the `mosaic` package gives the summary statistics for a quantitative variable. The `R` output below provides the summary statistics for the variable `Graduation_Rate`. The summary statistics provided are the two measures of center (mean and median) and two measures of spread (standard deviation and the quartile values to calculate the IQR) for undergraduate 6-year graduation rate. 

* Highlight and run lines 1--12 in the provided `R` script file to load the data set.  Check that the summary statistics match the output given in the coursepack.

* Notice that the 2-year institutions were removed so the observational units for this study are **4-year US degree-granting higher education institutions in 2018.**


``` r
IPEDS <- read.csv("https://www.math.montana.edu/courses/s216/data/IPEDS_2018.csv") 
IPEDS <- IPEDS %>%
  filter(Sector != "Public 2-year") # Filters the data set to remove Public 2-year
IPEDS <- IPEDS %>%
  filter(Sector != "Private 2-year") # Filters the data set to remove Private 2-year
IPEDS %>%
    summarize(favstats(Graduation_Rate))
```

```
#>   min Q1 median Q3 max     mean       sd    n missing
#> 1   0 38     53 67 100 52.48749 20.63192 1918      49
```

2. Report the values for the two measures of center (mean and median).

\vspace{0.5in}


3. Calculate the interquartile range ($IQR = Q_3 - Q_1$) of graduation rates.

\vspace{0.5in}

4. Report the value of the standard deviation and interpret this value in context of the problem.
\vspace{0.8in}

5. Interpret the value of $Q_3$ in context of the study.

\vspace{0.8in}

#### Displaying a single quantitative variable {-}

There are three type of plots used to plot a single quantitative variable: a dotplot, a histogram or a boxplot.  A dotplot of graduation rates would plot a dot for the graduation rate for each 4-year US higher education institution.

First, let's create a histogram of the variable `Graduation_Rate`.

* Enter the name of the variable in line 19 for `variable` in the R script file.  

* Replace the word title for the plot in line 21 between the quotations with a descriptive title.  **A title should include: type of plot, variable or variables plotted, and observational units.**  

* Highlight and run the following lines to create the histogram. 


``` r
IPEDS %>% # Data set piped into...
ggplot(aes(x = xx)) +   # Name variable to plot
  geom_histogram(binwidth = 10) +  # Create histogram with specified binwidth
  labs(title = "Don't forget to title the plot!", # Title for plot
       x = "Graduation Rate", # Label for x axis
       y = "Frequency") # Label for y axis

```

Notice that the **bin width** for the histogram is 10.  For example the first bin consists of the number of institutions in the data set with a graduation rate of 0 to 10\%.  It is important to note that a graduation rate on the boundary of a bin will fall into the bin above it; for example, 20 would be counted in the bin 20--30. 

6. Which range of Graduation Rates have the highest frequency?

\vspace{0.2in}

Next we will create a boxplot of the variable `Graduation_Rate`.  

* Enter the name of the variable in line 19 for `variable` in the R script file.  

* Highlight and run the following lines to create the boxplot.


``` r
IPEDS %>% # Data set piped into...
ggplot(aes(x = variable)) +   # Name variable to plot
  geom_boxplot() +  # Create boxplot with specified binwidth
  labs(title = "Boxplot of Graduation Rates for \n 4-year Higher Education Institutions", 
           # Title for plot
           # Note the \n starts a new line
       x = "Graduation_Rate", # Label for x axis
       y = "") + # Remove y axis label
    theme(axis.text.y = element_blank(), 
          axis.ticks.y = element_blank()) # Removes y-axis ticks
```

7. Sketch the boxplot created and identify the values of the 5-number summary (minimum value, $Q_1$, median, $Q_3$, maximum value) on the plot.  Use the following formulas to find the invisible fence on both ends of the distribution.  Draw a dotted line at the invisible fence to show how the outliers were detected (any values less than the lower fence or greater than the upper fence were flagged as outliers).

$$\text{Lower Fence:} ~~~ Q_1 - 1.5\times IQR$$

$$\text{Upper Fence:} ~~~ Q_3 + 1.5\times IQR$$
\vspace{1.8in}

When describing distributions of quantitative variables we discuss the **shape** (symmetric or skewed), the **center** (mean or median), **spread** (standard deviation or IQR), and if there are **outliers** present.

8.  What is the shape of the distribution of graduation rates?

\vspace{0.4in}

9.  From which plot (histogram or boxplot) is it easier to determine the shape of the distribution?

\vspace{0.3in}

10. From which plot is it easier to determine if there are outliers?

\vspace{0.3in}

#### Robust statistics {-}

Let’s examine how the presence of outliers affects the different summary measures for center and spread. For this part of the activity, we will look at the retention rate variable (`Retention`) in the IPEDS data set.  


``` r
IPEDS %>% # Data set piped into...
    summarise(favstats(Retention))
#>   min Q1 median Q3 max    mean       sd    n missing
#> 1   0 66     75 83 100 73.8525 15.14323 1817     150

IPEDS %>% # Data set piped into...
    ggplot(aes(x = Retention)) + # Name variable to plot
    geom_boxplot() + # Create boxplot 
    labs(title = "Boxplot of Retention Rates for \n 4-year Higher Education Institutions",
           # Title for plot
         x = "Retention Rates (%)", # Label for x axis
         y = "Frequency") # Label for y axis

```



\begin{center}\includegraphics[width=0.7\linewidth]{06-A11-EDA-quantitative_files/figure-latex/unnamed-chunk-4-1} \end{center}

11. Report the values for the two measures of center for these data.

\vspace{0.5in}

12. Report the values for the two measures of spread for these data.

\vspace{0.5in}

To show the effect of outliers on the measures of center and spread, the smallest values of retention rate in the
data set were increased by 30%. This variable is called `Retention_Inc`.


``` r
IPEDS %>% # Data set piped into...
    summarise(favstats(Retention_Inc))
#>   min Q1 median Q3 max     mean       sd    n missing
#> 1  30 66     75 83 100 74.49642 13.41255 1817     150

IPEDS %>% # Data set piped into...
    ggplot(aes(x = Retention_Inc)) + # Name variable to plot
    geom_boxplot() + # Create histogram 
    labs(title = "Boxplot of Increased Retention Rates for \n 4-year Higher Education Institutions", 
        # Title for plot
        x = "Retention Rates (%)", # Label for x axis
        y = "Frequency") # Label for y axis
```



\begin{center}\includegraphics[width=0.7\linewidth]{06-A11-EDA-quantitative_files/figure-latex/unnamed-chunk-5-1} \end{center}

13. Report the values for the two measures of center for this new data set.
\vspace{0.5in}

14. Report the values for the two measures of spread for this new data set.
\vspace{0.5in}

15. Which measure of center is robust to outliers? Explain your answer.
\vspace{0.8in}

16. Which measure of spread is robust to outliers? Explain your answer.
\vspace{0.8in}

### Take-home messages

1.	Histograms, box plots, and dot plots can all be used to graphically display a single quantitative variable.  

2.  The box plot is created using the five number summary: minimum value, quartile 1, median, quartile 3, and maximum value.  Whiskers extend to the lowest value and highest value that are _not_ considered outliers. Values in the data set that are less than $Q_1 - 1.5\times IQR$ or greater than $Q_3 + 1.5\times IQR$ are considered outliers and are graphically represented by a dot outside of the whiskers on the box plot.

3.  Data should be summarized numerically and displayed graphically to give us information about the study.

4.  When comparing distributions of quantitative variables we look at the shape, center, spread, and for outliers.  In this course, we only consider two measures of center (mean and the median), and two measures of spread (standard deviation and the interquartile range, $IQR = Q_3 - Q_1$). 


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
