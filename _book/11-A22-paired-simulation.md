## Activity 22: Snakes

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

### Snake mazes

 “Sidewinding” refers to a method of locomotion used by snakes to travel over slippery or loose terrain, such as sand. This manner of movement is a form of lateral undulation, in which an animal uses wave-like movement patterns to propel themselves forward. The desert horned viper is one of a handful of snake species that primarily uses sidewinding. As part of a recent study [@subach2022], researchers exploring foraging behaviors of these vipers in the Sahara and western Negev deserts captured 27 unique vipers with the goal of examining how environment complexity affected movement. Each snake was placed in a circular “maze” of 1045 poles stuck into a sand dune (meant to simulate a dense-vegetation area). The snake was timed to see how long it took to get out of the maze. Researchers also measured how far the snake had “traveled” within the maze by examining the tracks left in the sand. Once the snake had completed the maze, it was allowed to travel in an open area for the same length of time as it spent in the maze; distance was again measured by the tracks in the sand. Is there evidence the distance traveled (in meters) by snakes is less in areas of dense vegetation than in open spaces, on average? Use circular maze - open area as the order of subtraction.
 
* Download the R script file from D2L and upload to the RStudio server

* Highlight and run lines....


``` r
snakes <- read_csv("data/vipers.csv")
paired_observed_plot(snakes)
```



\begin{center}\includegraphics[width=0.7\linewidth]{11-A22-paired-simulation_files/figure-latex/unnamed-chunk-1-1} \end{center}

To find the difference in distance traveled in the circular maze vs in open spaces for each snake we will create the variable differences. 


``` r
snakes_diff <- snakes %>% 
  mutate(differences = DistanceMaze - DistanceOpen)
snakes_diff %>% 
    summarise(favstats(differences))
```

```
#> # A tibble: 1 x 9
#>     min    Q1 median    Q3    max  mean    sd     n missing
#>   <dbl> <dbl>  <dbl> <dbl>  <dbl> <dbl> <dbl> <int>   <int>
#> 1   -62 -17.2   -9.2  -6.1 -0.300 -14.5  14.2    27       0
```

``` r
snakes_diff %>% 
    ggplot(aes(x = differences)) +
    geom_boxplot()+
    labs(title="Boxplot of the Difference in Distance for Snakes to 
         Complete the Open Area vs the Maze 
         (Maze - Open)")
```



\begin{center}\includegraphics[width=0.7\linewidth]{11-A22-paired-simulation_files/figure-latex/unnamed-chunk-2-1} \end{center}

1. Explain why simulation methods should be used to analyze these data.

\vspace{0.6in}

2. Explain why this is a paired study design.

\vspace{0.6in}

#### Ask a research question {-}

3. Write the null hypothesis in words.

\vspace{0.8in}

4. Write the alternative hypothesis in notation.

\vspace{0.3in}

#### Use statistical inferential methods to draw inferences from the data {-}

5. Report the sample mean difference with appropriate notation.

\vspace{0.2in}

##### Hypothesis test {-}
To simulate the null distribution of paired sample mean differences we will use a bootstrapping method.  Recall that the null distribution must be created under the assumption that the null hypothesis is true.  Therefore, before bootstrapping, we will need to *shift* each data point by the difference $\mu_0 - \bar{x}_d$.  This will ensure that the mean of the shifted data is $\mu_0$ (rather than the mean of the original data, $\bar{x}_d$), and that the simulated null distribution will be centered at the null value.  

6. Calculate the difference $\mu_0 - \bar{x}_d$.  Will we need to shift the data up or down?

\vspace{.7in}

We will use the `paired_test()` function in R (in the `catstats` package) to simulate the shifted bootstrap (null) distribution of sample mean differences and compute a p-value. 

* Use the provided R script file and enter the calculated value from question 6 for `xx` to simulate the null distribution and enter the summary statistic from question 5 for `yy` to find the p-value.  

* Highlight and run lines 1--24.


``` r
    paired_test(data = snakes_diff$differences,   # Vector of differences 
                                         # or data set with column for each group
            shift = xx,   # Shift needed for bootstrap hypothesis test
            as_extreme_as = yy,  # Observed statistic
            direction = "less",  # Direction of alternative
            number_repetitions = 1000,  # Number of simulated samples for null distribution
            which_first = 1)  # Not needed when using calculated differences
```
    
7. Interpret the p-value in the context of the problem.
\vspace{1in}

##### Confidence interval {-}
We will use the `paired_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample mean differences and calculate a 99\% confidence interval. 

* Highlight and run lines....to create the 99\% confidence interval


``` r
paired_bootstrap_CI(data = snakes_diff$differences, # Enter vector of differences
                    number_repetitions = 1000, # Number of bootstrap samples for CI
                    confidence_level = 0.99,  # Confidence level in decimal form
                    which_first = 1)  # Not needed when entering vector of differences
```

8. Report the 99\% confidence interval.

\vspace{0.2in}

9. Interpret the 99\% confidence interval in the context of the problem.

\vspace{0.7in}

10. Do the results of your confidence interval and hypothesis test agree?  What does each tell you about the null hypothesis?

\vspace{.7in}

11. Write a conclusion to the test.

\vspace{0.8in}


### Take-home messages

1.	The differences in a paired data set are treated like a single quantitative variable when performing a statistical analysis.  Paired data (or paired samples) occur when pairs of measurements are collected. We are only interested in the population (and sample) of differences, and not in the original data. 

2.  When using bootstrapping to create a null distribution centered at the null value for both paired data and a single quantitative variable, we first need to shift the data by the difference $\mu_0 - \bar{x}_d$, and then sample with replacement from the shifted data. 

3. When analyzing paired data, the summary statistic is the 'mean difference' NOT the 'difference in means'^[Technically, if we calculate the differences and then take the mean (mean difference), and we calculate the two means and then take the difference (difference in means), the value will be the same. However, the *sampling variability* of the two statistics will differ, as we will see in Week 12.].  This terminology will be *very* important in interpretations.

4. To create one simulated sample on the null distribution for a sample mean or mean difference, shift the original data by adding $(\mu_0 - \bar{x})$ or $(0 - \bar{x}_d)$. Sample with replacement from the shifted data $n$ times. Calculate and plot the sample mean or the sample mean difference.

5. To create one simulated sample on the bootstrap distribution for a sample mean or mean difference, label $n$ cards with the original response values.  Randomly draw with replacement $n$ times.  Calculate and plot the resampled mean or the resampled mean difference.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
