## Guided Activity 5: Summarizing Quantitative Variables

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

### IPEDS continued 

We will revist the IPEDS data set now analyzing quantitative variables.  These data were collected on a subset of institutions that met the following selection criteria [@ipeds]:

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
| `Size` | Institution size category based on total student enrolled for credit, Fall 2018: Under 1,000, 1,000 - 4,999, 5,000 - 9,999, 10,000 - 19,999, 20,000 and above |
| `Cost_OutofState` | Cost of attendance for full-time out-of-state undergraduate students |
| `Cost_InState` | Cost of attendance for full-time in-state undergraduate students |
| `Retention` | Retention rate is the percent of the undergraduate students that re-enroll in the next year |
| `Graduation_Rate` | 6-year graduation rate for undergraduate students |
| `SATMath_75` | 75th percentile Math SAT score |
| `ACT_75` | 75th percentile ACT score |

#### Summarizing quantitative variables {-}

The `favstats()` function from the `mosaic` package gives the summary statistics for a quantitative variable. The `R` output below provides the summary statistics for the variable `Graduation_Rate`. The summary statistics provided are the two measures of center (mean and median) and two measures of spread (standard deviation and the quartile values to calculate the IQR) for IMDb score. 

* Highlight and run lines 1 -- 12 in the provided `R` script file to load the data set.  Check that the summary statistics match the output given in the coursepack.


```r
IPEDS <- read.csv("https://www.math.montana.edu/courses/s216/data/IPEDS_2018.csv") 
IPEDS <- IPEDS %>%
  filter(Sector != "Public 2-year") #Filters the data set to remove Public 2-year
IPEDS <- IPEDS %>%
  filter(Sector != "Private 2-year") #Filters the data set to remove Private 2-year
IPEDS %>%
    summarize(favstats(Graduation_Rate))
```

```
#>   min Q1 median Q3 max     mean       sd    n missing
#> 1   0 38     53 67 100 52.48749 20.63192 1918      49
```
1. Calculate the interquartile range (IQR = Q3 $-$ Q1) of Graduation Rates.

\vspace{0.5in}

2. Report the value of the standard deviation and interpret this value in context of the problem.
\vspace{0.8in}

#### Displaying a single quantitative variable {-}

There are three type of plots used to plot a single quantitative variable: a dotplot, a histogram or a boxplot.  A dotplot of graduation rate would plot a dot for the graduation rate for each 4-year US higher education institution.

We will create both a histogram and a boxplot of the variable `Graduation_Rate`.  

* Enter the name of the variable in both line 19 and line 26 for `variable` in the R script file.  

* Replace the word title for each plot (lines 21 and 28) between the quotations with a descriptive title.  **A title should include: type of plot, variable or variables plotted, and observational units.**  

* Highlight and run lines 18 -- 30 to create a histogram and boxplot. 

Notice that the **bin width** for the histogram is 10.  For example the first bin consists of the number of institutions in the data set with a graduation rate of 0 to 10\%.  It is important to note that an graduation rate on the boundary of a bin will fall into the bin above it; for example, 20 would be counted in the bin 20--30.  

\newpage


```r
IPEDS %>% # Data set piped into...
ggplot(aes(x = Graduation_Rate)) +   # Name variable to plot
  geom_histogram(binwidth = 10) +  # Create histogram with specified binwidth
  labs(title = "", # Title for plot
       x = "Graduation Rate", # Label for x axis
       y = "Frequency") # Label for y axis
```



\begin{center}\includegraphics[width=0.6\linewidth]{03-GA04-EDA-quantitative_files/figure-latex/unnamed-chunk-2-1} \end{center}

```r
IPEDS %>% # Data set piped into...
ggplot(aes(x = Graduation_Rate)) +   # Name variable to plot
  geom_boxplot() +  # Create histogram with specified binwidth
  labs(title = "", # Title for plot
       x = "Graduation_Rate", # Label for x axis
       y = "") # Remove y axis label
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-GA04-EDA-quantitative_files/figure-latex/unnamed-chunk-3-1} \end{center}

\newpage

#### Summarizing one categorical and one quantitative variable {-}

Is there a difference in retention rates for public and private 4-year institutions? In this part of the activity we will compare retention rates for public and private 4-year institutions.  Note that this variable (public or private) is labelled `Sector` in the data set.

3.  Based on the research question, which variable will we treat as the explanatory variable?  Response variable?

\vspace{0.3in}

The `favstats()` function from the `mosaic` package gives the summary statistics for a quantitative variable. The summary statistics give the two measures of center and two measures of spread for retention rates between sector for 4-year institutions.

* To assess the research question described before question 3, enter the name of the explanatory variable and the name of the response variable in line 35 of the R script file.  Remember that the variable name must be typed in EXACTLY as it is written in the data set.

* Highlight and run lines 34--35


```r
IPEDS %>%
  reframe(favstats(Retention~Sector)) #Gives the summary statistics
```

```
#>                    Sector min Q1 median Q3 max     mean       sd    n missing
#> 1 Private 4-year or above   0 66     76 85 100 73.67244 16.72878 1212      54
#> 2  Public 4-year or above  27 67     74 82 100 74.21322 11.32172  605      96
```

* To create a side-by-side boxplot, enter the name of the explanatory variable and the name of the response variable in line 41 of the R script file.

* Highlight and run lines 39 -- 45.


```r
IPEDS %>%  # Data set piped into...
  ggplot(aes(y = Retention, x = Sector))+  # Identify variables
  geom_boxplot()+  # Create box plot
  labs(title = "Side-by-side Boxplot of Retention Rate among Public and
       Private 4-year Institutions",  
       # A title should include: type of plot,variable or variables plotted, and observational units
       x = "Sector",    # x-axis label
       y = "Retention Rates")  # y-axis label
```



\begin{center}\includegraphics[width=0.6\linewidth]{03-GA04-EDA-quantitative_files/figure-latex/unnamed-chunk-5-1} \end{center}

\newpage 

4.  Compare the two boxplots.
    
     Which sector of university has the highest center?
     \vspace{0.3in}
     
     Largest spread?
     \vspace{0.3in}
     
     What is the shape of each distribution?
     \vspace{0.3in}
     
     Does either distribution have potential outliers?
     \vspace{0.3in}
     
5. Report the difference in mean retention rates for private and public universities.  Use private minus public as the order of subtraction.  Use the appropriate notation.

\vspace{0.8in}

6. Interpret the difference in mean retention rates found in question 5.

\vspace{0.8in}

7.  Does there appear to be an association between retention rates and type of university?  Explain your answer using the boxplots and summary statistic.

\vspace{0.8in}

### Take-home messages

1.	Histograms, box plots, and dot plots can all be used to graphically display a single quantitative variable.  

2.  The box plot is created using the five number summary: minimum value, quartile 1, median, quartile 3, and maximum value.  Values in the data set that are less than $\text{Q}_1 - 1.5\times \text{IQR}$ and greater than $\text{Q}_3 + 1.5\times \text{IQR}$ are considered outliers and are graphically represented by a dot outside of the whiskers on the box plot.

3.  Data should be summarized numerically and displayed graphically to give us information about the study.

4.  When comparing distributions of quantitative variables we look at the shape, center, spread, and for outliers.  There are two measures of center: mean and the median and two measures of spread: standard deviation and the interquartile range, IQR = Q3 $-$ Q1. 

\newpage

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
