## Activity 12: Hypothesis Testing of a Single Quantitative Variable

\setstretch{1}

### Learning outcomes

* Given a research question involving one quantitative variable, construct the null and alternative hypotheses
in words and using appropriate statistical symbols.

* Investigate the process of creating a null distribution for one quantitative variable

* Find, evaluate, and interpret a p-value from the null distribution

### Terminology review

In today's activity, we will simulation and theory-based methods to analyze a single quantitative variable.  Some terms covered in this activity are:

* Null hypothesis

* Alternative hypothesis

To review these concepts, see Chapter 17 in the textbook.

### College student sleep habits

According to the an article in *Sleep* [@watson2015], experts recommend adults (>18) get at least 7 hours of sleep per night. A survey was sent to students in four sections of Stat 216 asking about their sleep habits.  Is there evidence that sleep college students get less than the recommended 7 hours of sleep per night, on average?

#### Summarizing quantitative variables {-}

* Download the R script file and data file for this activity

* Upload both files to the RStudio server and open the R script file

* Enter the name of the dataset for datasetname.csv 

* Highlight and run lines 1--8 to load the data


``` r
sleep <- read.csv("datasetname.csv")
```

#### Ask a research question {-}

1. Write the parameter of interest in context of the study.

\vspace{1in}

2. Write the null hypothesis in words in context of the study.

\vspace{1in}

3. Write the alternative hypothesis in notation.

\vspace{0.4in}

#### Summarize and visualize the data {-}

The `favstats()` function from the `mosaic` package gives the summary statistics for a quantitative variable.

* Enter the variable name, `SleepHours` for variable in line 13

* Highlight and run lines 12--13


``` r
sleep %>%
    summarize(favstats(variable))
```
4. How far is each number of hours of sleep for a Stat 216 student from the mean number of hours of sleep, on average?

\vspace{0.3in}

Create a boxplot of the variable `SleepHours`.

* Enter the name of the variable in line 19 for `variable` in the R script file. 

* Enter a title in line 21 for the plot between the quotations

* Highlight and run lines 18 - 25


``` r
sleep %>% # Data set piped into...
    ggplot(aes(x = variable)) +   # Name variable to plot
    geom_boxplot() +  # Create boxplot with specified binwidth
    labs(title = "Don't forget to title your plot!", # Title for plot
       x = "Amount of sleep (hrs)", # Label for x axis
       y = "") + # Remove y axis label
    theme(axis.text.y = element_blank(), 
          axis.ticks.y = element_blank()) # Removes y-axis ticks
```
5. Describe the boxplot using the four characteristics of boxplots.

\vspace{1in}


### Simulation methods {-}

To simulate the null distribution of sample means we will use a bootstrapping method.  Recall that the null distribution must be created under the assumption that the null hypothesis is true.  Therefore, before bootstrapping, we will need to *shift* each data point by the difference $\mu_0 - \bar{x}$.  This will ensure that the mean of the shifted data is $\mu_0$ (rather than the mean of the original data, $\bar{x}$), and that the simulated null distribution will be centered at the null value.  

6. Calculate the difference $\mu_0 - \bar{x}$.  Will we need to shift the data up or down?

\vspace{0.3in}

* Open the data set (sleep_college) in Excel 

* Create a new column labeled Shift

* In the column, Shift, add the shifted value to each value in the column, SleepHours

* Save the file and upload again to the RStudio server

* Find the favstats of the variable, Shift

* Highlight and run lines 30--32


``` r
sleep <- read.csv("sleep_college.csv")
sleep %>%
    summarize(favstats(Shift))
```
7. Report the mean of the Shift variable.  Why does it make sense that this value is the same as the null value?

\vspace{0.9in}

8. Report the standard deviation of the Shift variable. How does this compare to the standard deviation for the variable SleepHours?  Explain why these values are the same?

\vspace{0.9in}

9. What inputs should be entered for each of the following to create the simulation?
\vspace{1mm}

* Null Value (What is the null value for the study?):

\vspace{.15in}
* Summary measure ("mean" or "median"):

\vspace{0.15in}
* Shift (Difference between $\mu_0 -\bar{x}$):

\vspace{0.15in}

* As extreme as (enter the value for the sample difference in proportions):

\vspace{.15in}
* Direction (`"greater"`, `"less"`, or `"two-sided"`):

\vspace{.15in}

* Number of repetitions:

\vspace{.15in}

Using the R script file for this activity...

* Enter your answers for question 9 in place of the `xx`'s to produce the null distribution with 10000 simulations

* Highlight and run lines 361--42.


``` r
one_mean_test(sleep$SleepHours,#Enter the object name and variable
              null_value = xx,
              summary_measure = "xx",  #Can choose between mean or median
              shift = xx, #Difference between the null value and the sample mean
              as_extreme_as = xx, #Value of the summary statistic
              direction = "xx", #Specify direction of alternative hypothesis
              number_repetitions = 10000)
```
10. Interpret the p-value of the test in context of the problem.

\vspace{1in}

11. Write a conclusion to the test in context of the problem.

\vspace{1in}


### Take-home messages

1.	Histograms, box plots, and dot plots can all be used to graphically display a single quantitative variable.  

2.  The box plot is created using the five number summary: minimum value, quartile 1, median, quartile 3, and maximum value.  Values in the data set that are less than $\text{Q}_1 - 1.5\times \text{IQR}$ and greater than $\text{Q}_3 + 1.5\times \text{IQR}$ are considered outliers and are graphically represented by a dot outside of the whiskers on the box plot.

3.  Data should be summarized numerically and displayed graphically to give us information about the study.

4.  When comparing distributions of quantitative variables we look at the shape, center, spread, and for outliers.  There are two measures of center: mean and the median and two measures of spread: standard deviation and the interquartile range, IQR = Q3 $-$ Q1. 


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
