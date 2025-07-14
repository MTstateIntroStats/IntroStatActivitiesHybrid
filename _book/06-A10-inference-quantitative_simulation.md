## Activity 10: Inference for a Single Quantitative Variable: Simulation Methods

\setstretch{1}

### Learning outcomes

* Given a research question involving one quantitative variable, construct the null and alternative hypotheses
in words and using appropriate statistical symbols.

* Investigate the process of creating a null distribution for one quantitative variable.

* Find, evaluate, and interpret a p-value from the null distribution.

### Terminology review

In today's activity, we will use simulation-based and theory-based methods to analyze a single quantitative variable.  Some terms covered in this activity are:

* Null hypothesis

* Alternative hypothesis

* Null distribution

* Bootstrap distribution

* p-value

To review these concepts, see Chapters 9 and 17 in the textbook.

### College student sleep habits

According to an article in *Sleep* [@watson2015], experts recommend adults (>18 years old) get at least 7 hours of sleep per night. A professor at MSU is interested in the sleep habits of MSU students.  The professor obtained a representative sample of MSU students and asked each student to report the amount of sleep they get on a typical night.  Is there evidence that MSU students get less than the recommended 7 hours of sleep per night, on average?

* Observational units:

* Variable:

* Type of variable:

#### Summarizing quantitative variables {-}

* Download the R script file and data file for this activity

* Upload both files to the RStudio server and open the R script file

* Enter the name of the dataset for datasetname.csv 

* Highlight and run lines 1--8 to load the data


``` r
sleep <- read.csv("datasetname.csv")
```




#### Ask a research question {-}

**Parameter of interest in context of the study:**

\vspace{1in}

**Null Hypothesis (in words):**

\vspace{1in}

**Null Hypothesis (in notation):**

\vspace{0.3in}

**Alternative Hypothesis (in words):**

\vspace{1in}

**Alternative Hypothesis (in notation):**

\vspace{0.3in}

#### Summarize and visualize the data {-}

The `favstats()` function from the `mosaic` package gives the summary statistics for a quantitative variable.

* Enter the variable name, `SleepHours`, for `variable` in line 13

* Highlight and run lines 12--13


``` r
sleep %>%
    summarize(favstats(variable))
```
1. About how far is each number of hours of sleep for a Stat 216 student from the mean number of hours of sleep, on average?

\vspace{0.3in}

Create a boxplot of the variable `SleepHours`.

* Enter the name of the variable in line 19 for `variable` in the R script file. 

* Enter a title in line 21 for the plot between the quotations.

* Highlight and run lines 18--25.


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
2. Describe the distribution of number of hours of sleep using the four characteristics of boxplots.

\vspace{1in}


### Simulation methods {-}

#### Notes on simulation methods for a single mean {-}

\vspace{2in}

To simulate the null distribution of sample means we will use a bootstrapping method.  Recall that the null distribution must be created under the assumption that the null hypothesis is true.  Therefore, before bootstrapping, we will need to *shift* each data point by the difference $\mu_0 - \bar{x}$.  This will ensure that the mean of the shifted data is $\mu_0$ (rather than the mean of the original data, $\bar{x}$), and that the simulated null distribution will be centered at the null value.  

* Calculate the difference $\mu_0 - \bar{x}$.  Based on the sign of this difference, will we need to shift the data up or down?

\vspace{0.4in}

Your instructor will demonstrate how the shift is performed in Excel.

* Open the data set (`sleep_college`) in Excel. 

* Create a new column labeled Shift.

* In the column, Shift, add the shifted value to each value in the `SleepHours` column.


``` r
sleep <- read.csv("sleep_college.csv")
sleep %>%
    summarize(favstats(Shift))
```
3. Report the mean of the `Shift` variable.  Why does it make sense that this value is the same as the null value?

\vspace{0.9in}

4. Report the standard deviation of the `Shift` variable. How does this compare to the standard deviation for the variable `SleepHours`?  Explain why these values are the same.

\vspace{0.9in}

\newpage

5. What inputs should be entered for each of the following to create the simulated null distribution?
\vspace{1mm}

* Null value (What is the null value for the study?):

\vspace{.15in}
* Summary measure ("mean" or "median"):

\vspace{0.15in}
* Shift (difference between $\mu_0 -\bar{x}$):

\vspace{0.15in}

* As extreme as (enter the value for the observed sample mean):

\vspace{.15in}
* Direction (`"greater"`, `"less"`, or `"two-sided"`):

\vspace{.15in}

* Number of repetitions:

\vspace{.15in}

The `one_mean_test` will be used to find the p-value for the simulation test.  Following the instructions below to complete the code.

* Enter your answers for question 5 in place of the `xx`'s to produce the null distribution with 10000 simulations.

* Highlight and run lines 36--42.


``` r
one_mean_test(sleep$SleepHours,#Enter the object name and variable
              null_value = 7,
              summary_measure = "mean",  #Can choose between mean or median
              shift = 0.081, #Difference between the null value and the sample mean
              as_extreme_as = 6.919, #Value of the summary statistic
              direction = "less", #Specify direction of alternative hypothesis
              number_repetitions = 10000)
```



\begin{center}\includegraphics[width=0.7\linewidth]{06-A10-inference-quantitative_simulation_files/figure-latex/unnamed-chunk-6-1} \end{center}

#### Notes on the null distribution {-}

\vspace{2in}

**Interpretation of the p-value in context of the problem.**

\vspace{1in}

**Conclusion of the test:**

\vspace{1in}


### Simulation methods to create a confidence interval {-}

Unlike creation of the null distribution, the bootstrap distribution we use for creating a confidence interval is found by sampling with replacement from the original sample.  To create one dot on the bootstrap distribution:

* Write the original values for the variable on $n$ cards; one card for each observational unit.

* Sample with replacement from the cards $n$ times.

* Plot the mean from each resample on the bootstrap distribution.

Use the provided R script file to find a 95\% confidence interval.

* Enter the appropriate confidence level for `xx`.

* Highlight and run lines 46--49.


``` r
one_mean_CI(sleep$SleepHours, #Enter the name of the variable
            summary_measure = "mean", #choose the mean or median
            number_repetitions = 10000,  # Number of simulations
            confidence_level = 0.95) #Enter as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{06-A10-inference-quantitative_simulation_files/figure-latex/unnamed-chunk-7-1} \end{center}


#### Notes on the bootstrap distribution {-}

\vspace{2in}

**Confidence Interval:**

\vspace{1in}

**Interpretation of the confidence interval:**

\vspace{1in}

\newpage

### Take-home messages

1.	We use bootstrapping---sampling with replacement---from the shifted data to generate a null distribution of simulated sample means. In order to ensure that the null distribution is centered at the null value, $\mu_0$, we shift the data by adding $\mu_0 - \bar{x}$ to each value in the original data set. Note that if this value of the shift is negative, we are shifting the data down; if it is positive, we shift the data up.

2.  The mean of the shifted data will equal the null value, $\mu_0$, but the standard deviation of the shifted data will be the same as the standard deviation of the original data.

3.  As in the one proportion scenario, we calculate the p-value for a simulation-based hypothesis test for a single mean by finding the proportion of simulated sample means that are as or more extreme (in the direction of $H_A$) as the observed sample mean, $\bar{x}$.


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
