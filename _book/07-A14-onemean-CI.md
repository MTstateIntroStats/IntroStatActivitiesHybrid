## Activity 14: Danceability of Songs

\setstretch{1}

### Learning outcomes

* Use simulation methods to find a confidence interval for a single mean

* Use theory-based methods to find a confidence interval for a single mean.

* Interpret a confidence interval for a single mean.

* Use a confidence interval to determine the conclusion of a hypothesis test.

### Terminology review

In today's activity, we will estimate the parameter of interest using simulation and theory-based methods. Some terms covered in this activity are:

* Bootstrap distribution

* $t$-distribution

* Degrees of freedom

* T-score

To review these concepts, see Chapter 15 in the textbook.

### Danceability

Spotify created a list of the top songs around the world for the past 10 years and several different audio features of those songs.  One of the variables measured on these songs is Danceability.  Danceability measures how easy it is to dance to a song; the higher the point value the easier it is to dance to the song.  Estimate the average danceability of top songs from Spotify.

* Download the R script file for this activity from D2L and upload to the RStudio server

* Open the R script file, highlight and run


```
#>   min Q1 median Q3 max     mean       sd   n missing
#> 1   0 57     66 73  97 64.37977 13.37872 603       0
```


``` r
songs %>% # Data set piped into...
    ggplot(aes(x = Danceability)) +   # Name variable to plot
    geom_boxplot() +  # Create boxplot with specified binwidth
    labs(title = "Boxplot of Danceability Score for Top Spotify Songs", # Title for plot
         x = "danceability score (points)", # Label for x axis
         y = "") + # Remove y axis label
    theme(axis.text.y = element_blank(), 
          axis.ticks.y = element_blank()) # Removes y-axis ticks
```
#### Summarizing quantitative variables {-}

1. Describe the boxplot of danceability of top songs over the past 10 years on Spotify.

\vspace{1in}

2. Write the parameter of interest in context of the study.

\vspace{1in}

### Simulation methods to create a confidence interval {-}

Unlike creation of the null, the bootstrap distribution is found by sampling with replacement from the original sample.

* Write the original values for the variable on the cards

* Sample with replacement $n$ times

* Plot the mean from each resampled sample on the distribution

Use the provided R script file to find a 95\% confidence interval

* Enter the name of the variable for variable

* Enter the appropriate confidence interval

* Highlight and run lines 22--25


``` r
one_mean_CI(songs$variable, #Enter the name of the variable
            summary_measure = "mean", #choose the mean or median
            number_repetitions = 10000,  # Number of simulations
            confidence_level = xx)
```
3. Report the 95\% confidence interval for the parameter of interest.

\vspace{0.2in}


### Theory-based methods to create a confidence interval {-}

* **Conditions for the sampling distribution of $\bar{x}$ to follow an approximate normal distribution**:

    * **Independence**: The sample’s observations are independent, e.g., are from a simple random sample. (*Remember*: This also must be true to use simulation methods!)

     * **Large enough sample size: Normality Condition**: The sample observations come from a normally distributed population.  To check use the the following rules of thumb:
     
         - $n < 30$: The distribution of the sample must be approximately normal with no outliers
         
         - $30 \ge n < 100$: We can relax the condition a little; the distribution of the sample must have no extreme outliers or skewness
         
         - $n > 100$: Can assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observational is not
         

Next we will calculate a theory-based confidence interval.  To calculate a theory-based confidence interval for the paired mean difference, use the following formula:

$$\bar{x}\pm t^* \times SE(\bar{x}).$$

\newpage

We will need to find the $t^*$ multiplier using the function `qt()`. 

* Enter the appropriate percentile in the R code to find the multiplier for a 95\% confidence interval.

* Enter the df for yy. *The degrees of freedom for a single mean is $n-1$*

* Highlight and run line 31


``` r
qt(percentile, df = yy, lower.tail=TRUE)
```


4. Mark on the t-distribution found below the values of $\pm t^*$.  Draw a line at each multiplier and write the percentiles used to find each.
\vspace{1mm}

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{07-A14-onemean-CI_files/figure-latex/tstar-1} 

}

\caption{t-distribution with 602 degrees of freedom}(\#fig:tstar)
\end{figure}

5.  Calculate the margin of error for the true mean using theory-based methods.

\vspace{0.6in}

6.  Calculate the confidence interval for the true mean using theory-based methods.

\vspace{0.6in}


7.  Interpret the confidence interval in context of the study.

\vspace{1in}

8. Explain why the CI with theory-based methods is similar to the simulation CI.

\vspace{1in}

 
### Take-home messages

1.  In order to use theory-based methods for a single mean, the independent observational units and normality conditions must be met.  

2.  The simulation based confidence interval and theory-based confidence interval should be similar if the normality condtion is met.  

3.  A $t^*$ multiplier is found by obtaining the bounds of the middle X% (X being the desired confidence level) of a $t$-distribution with $n - 1$ df.


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered

\newpage