## Activity 12:  COVID-19 and Air Pollution

\setstretch{1}

### Learning outcomes

* Given a research question involving paired differences, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.
  
* Describe and perform a simulation-based hypothesis test for a paired mean difference.

* Interpret and evaluate a p-value for a simulation-based hypothesis test for a paired mean difference.

* Use bootstrapping to find a confidence interval for a paired mean difference.

* Interpret a confidence interval for a paired mean difference.

* Use a confidence interval to determine the conclusion of a hypothesis test.

### Terminology review

In today's activity, we will analyze paired quantitative data using simulation-based methods. Some terms covered in this activity are:

* Mean difference

* Paired data

* Independent groups

* Shifted bootstrap (null) distribution

To review these concepts, see Section 18 in the textbook.

### COVID-19 and air pollution

In June 2020, the social distancing efforts and stay-at-home directives to help combat the spread of COVID-19 appeared to help 'flatten the curve' across the United States, albeit at a high cost to many individuals and businesses. The impact of these measures, though, goes far beyond the infection and death rates from the disease. You may have seen images comparing air quality in large international cities like Rome, Milan, Wuhan, and New Delhi such as the one pictured in Figure \@ref(fig:covid), which seem to indicate, perhaps unsurprisingly, that fewer people driving and factories being shut down have reduced air pollutants. 

Have high population-density US cities seen the same improved air quality conditions? To study this question, data were gathered from the US Environmental Protection Agency (EPA) AirData website which records the ozone (O3) and fine particulate matter (PM2.5) values for cities across the US [@usepa2020]. These measures are used to calculate an air quality index (AQI) score for each city each day of the year. Thirty-three of the most densely populated US cities were selected and the AQI score recorded for April 20, 2020 as well as the five-year median AQI score for April 20th (2015--2019). Note that higher AQI scores indicate worse air quality. A box plot of the differences in AQI scores for the 33 cities and a table of summary statistics are shown on the next page.  Use Current - 5-year median as the order of subtraction.


\begin{figure}

{\centering \includegraphics[width=0.6\linewidth]{images/air_pollution_greyscale} 

}

\caption{The India Gate in New Delhi, India. Source: Reuters/Anushree Fadnavis/Adnan Abidi}(\#fig:covid)
\end{figure}

\vspace{.05in}




\begin{center}\includegraphics[width=0.6\linewidth]{11-A09-paired-simulation_files/figure-latex/unnamed-chunk-2-1} \end{center}

\vspace{.2in}


Table: Summary statistics for current AQI scores, median AQI scores from 2015--2019, and the differences in AQI scores.

|               |         Mean         | Standard deviation | Sample size |
|:-------------:|:--------------------:|--------------------|-------------|
| Current       | $\bar{x}_1$ = 47.394 | $s_1$ = 14.107     | $n_1$ = 33  |
| 5 Year Median | $\bar{x}_2$ = 51.545 | $s_2$ = 17.447     | $n_2$ = 33  |
| Differences   | $\bar{x}_d$ = $-4.152$ | $s_d$ = 17.096     | $n_d$ = 33  |

\newpage
#### Vocabulary review.  {-}

1.  Identify the variables in this study.  What role (explanatory or response) do each have?

\vspace{.5in}

2. Are the differences in AQI scores independent for each case (US city)?  Explain.

\vspace{0.5in}

3. Why is this treated as a paired study design and not two independent samples?

\vspace{0.5in}

#### Ask a research question {-}

4. Write the null hypothesis in words.

\vspace{0.8in}

5. What is the research question?

\vspace{0.8in}

6. Write the alternative hypothesis in notation.

\vspace{0.3in}

#### Summarize and visualize the data  {-}

7. Report the summary statistic of interest (mean difference) for the data.  

\vspace{0.3in}

8. What notation is used for the value in question 7? 

\vspace{0.3in}


#### Use statistical inferential methods to draw inferences from the data {-}

##### Hypothesis test {-}
To simulate the null distribution of paired sample mean differences we will use a bootstrapping method.  Recall that the null distribution must be created under the assumption that the null hypothesis is true.  Therefore, before bootstrapping, we will need to *shift* each data point by the difference $\mu_0 - \bar{x}_d$.  This will ensure that the mean of the shifted data is $\mu_0$ (rather than the mean of the original data, $\bar{x}_d$), and that the simulated null distribution will be centered at the null value.  

9. Calculate the difference $\mu_0 - \bar{x}_d$.  Will we need to shift the data up or down?

\vspace{.7in}

We will use the `paired_test()` function in R (in the `catstats` package) to simulate the shifted bootstrap (null) distribution of sample mean differences and compute a p-value. 

* Use the provided R script file and enter the calculated value from question 9 for `xx` to simulate the null distribution and enter the summary statistic from question 7 for `yy` to find the p-value.  

* Highlight and run lines 1--24.


```r
    paired_test(data = Air$Difference,   # Vector of differences 
                                         # or data set with column for each group
            shift = xx,   # Shift needed for bootstrap hypothesis test
            as_extreme_as = yy,  # Observed statistic
            direction = "less",  # Direction of alternative
            number_repetitions = 1000,  # Number of simulated samples for null distribution
            which_first = 1)  # Not needed when using calculated differences
```
    
10. Sketch the null distribution created using the R output here.

\vspace{1.8in}

11. Explain why the null distribution is centered at zero. 

\vspace{.5in}


12. What proportion of samples are at or less than the observed sample mean difference in AQI scores for current scores minus 5 year median scores? What is the statistical term for this proportion?
\vspace{.3in}

13. Interpret the p-value in the context of the problem.
\vspace{1in}

14. How much evidence does this provide for improved air quality in US cities?
\vspace{.3in}

15. If evidence was found for improved air quality in US cities, could we conclude that the stay-at-home directives *caused* the improvement in air quality? Explain.
\vspace{.8in}

\newpage

##### Confidence interval {-}
We will use the `paired_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample mean differences and calculate a confidence interval. 

16. Write out the parameter of interest in context of the study.

\vspace{0.8in}


17. Using the provided R script file, fill in the missing value at `xx` to find a 99\% bootstrap confidence interval; highlight and run lines 29--32.  Report the confidence interval in interval notation.


```r
paired_bootstrap_CI(data = Air$Difference, # Enter vector of differences
                    number_repetitions = 1000, # Number of bootstrap samples for CI
                    confidence_level = xx,  # Confidence level in decimal form
                    which_first = 1)  # Not needed when entering vector of differences
```

\vspace{.5in}


#### Communicate the results and answer the research question {-}

18. Interpret the 99\% confidence interval in the context of the problem.

\vspace{0.7in}


19. Do the results of your confidence interval and hypothesis test agree?  What does each tell you about the null hypothesis?

\vspace{.7in}


### Take-home messages

1.	The differences in a paired data set are treated like a single quantitative variable when performing a statistical analysis.  Paired data (or paired samples) occur when pairs of measurements are collected. We are only interested in the population (and sample) of differences, and not in the original data. 

2.  When using bootstrapping to create a null distribution centered at the null value for both paired data and a single quantitative variable, we first need to shift the data by the difference $\mu_0 - \bar{x}_d$, and then sample with replacement from the shifted data. 

3. When analyzing paired data, the summary statistic is the 'mean difference' NOT the 'difference in means'^[Technically, if we calculate the differences and then take the mean (mean difference), and we calculate the two means and then take the difference (difference in means), the value will be the same. However, the *sampling variability* of the two statistics will differ, as we will see in Week 12.].  This terminology will be *very* important in interpretations.

4. To create one simulated sample on the null distribution for a sample mean or mean difference, shift the original data by adding $(\mu_0 - \bar{x})$ or $(0 - \bar{x}_d)$. Sample with replacement from the shifted data $n$ times. Calculate and plot the sample mean or the sample mean difference.

5. To create one simulated sample on the bootstrap distribution for a sample mean or mean difference, label $n$ cards with the original response values.  Randomly draw with replacement $n$ times.  Calculate and plot the resampled mean or the resampled mean difference.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
