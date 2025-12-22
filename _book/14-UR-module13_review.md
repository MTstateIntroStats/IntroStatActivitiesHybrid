## Module 12 Review - Regression



Spotify created a list of the top songs around the world for the past 10 years and several different audio features of those songs.  Among the variables measured on these songs, we will look at the relationship between Valance and Danceability.  Valance measures the positive mood of a song; the higher the point value the more positive the mood of the song.  Danceability measures how easy it is to dance to a song; the higher the point value the easier it is to dance to the song.  Is there evidence that songs with a higher valance value are more danceable, on average?


``` r
songs <- read.csv("data/top10s.csv") #Reads in data set
songs %>% #Data set pipes into...
ggplot(aes(x = Valance, y = Danceability))+  #Specify variables
  geom_point() +  #Add scatterplot of points
  labs(x = "valance",  #Label x-axis
       y = "danceability",  #Label y-axis
       title = "Scatterplot of Valance vs. Danceability for Top songs") + #Be sure to title your plot
  theme_bw()  #Add regression line
```



\begin{center}\includegraphics[width=0.7\linewidth]{14-UR-module13_review_files/figure-latex/unnamed-chunk-2-1} \end{center}

1.  Identify the explanatory variable and the response variable.

\vspace{0.3in}

2. Describe the scatterplot using the four charactistics of scatterplots.


\newpage
The linear model output is given below with the correlation coefficient.

``` r
# Fit linear model: y ~ x
songsLM <- lm(Danceability~Valance, data=songs)
round(summary(songsLM)$coefficients, 5) # Display coefficient summary
```

```
#>             Estimate Std. Error  t value Pr(>|t|)
#> (Intercept) 48.80920    1.19239 40.93393        0
#> Valance      0.29814    0.02097 14.21805        0
```

``` r
cor(songs$Danceability, songs$Valance)
```

```
#> [1] 0.5016962
```

3.  Write the least squares equation of the regression line in context of the problem. 

\vspace{0.5in}


4. Interpret the slope in context of the problem.

\vspace{0.7in}

5. Write the null hypothesis, in words, in context of the problem.

\vspace{1in}

6. Write the alternative hypothesis, in notation, to test slope, in context of the problem.

\vspace{0.5in}

*Simulation Methods*

The following code creates the null distribution for this study.

``` r
# Simulation-based test for slope
regression_test(Danceability~Valance, # response ~ explanatory
               data = songs, # name of data set
               direction = "greater", # sign in alternative ("greater", "less", "two-sided")
               summary_measure = "slope", 
               as_extreme_as = 0.298, #observed slope
               number_repetitions = 10000) #Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{14-UR-module13_review_files/figure-latex/unnamed-chunk-4-1} \end{center}

7. Report the value of the p-value.  Interpret this value in context of the problem.

\vspace{1in}

8.  Based on the p-value, write a conclusion in context of the problem.

\vspace{1in}

We could also test correlation:


``` r
# Simulation-based test for slope
regression_test(Danceability~Valance, # response ~ explanatory
               data = songs, # name of data set
               direction = "greater", # sign in alternative ("greater", "less", "two-sided")
               summary_measure = "correlation", 
               as_extreme_as = 0.501, #observed slope
               number_repetitions = 10000) #Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{14-UR-module13_review_files/figure-latex/unnamed-chunk-5-1} \end{center}

Now let's estimate the true regression slope for the relationship between valance and danceability of songs.


``` r
# Bootstrap CI for slope
regression_bootstrap_CI(Danceability~Valance, # response ~ explanatory
                        data = songs, # name of data set
                        confidence_level = 0.99, # confidence level as decimal
                        summary_measure =  "slope", # slope or correlation
                        number_repetitions = 10000) #Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{14-UR-module13_review_files/figure-latex/unnamed-chunk-6-1} \end{center}

9.  Interpret the 99% confidence interval in context of the problem.

\vspace{1in}

To create the confidence interval for correlation.


``` r
# Bootstrap CI for correlation
regression_bootstrap_CI(Danceability~Valance, # response ~ explanatory
                        data = songs, # name of data set
                        confidence_level = 0.99, # confidence level as decimal
                        summary_measure =  "correlation", # slope or correlation
                        number_repetitions = 10000) #Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{14-UR-module13_review_files/figure-latex/unnamed-chunk-7-1} \end{center}

10.  Interpret the 99% confidence interval for correlation in context of the problem.

\vspace{1in}

*Theory-based Methods*

When performing inference on a least squares line, the follow conditions are generally required

* Linearity: the data should follow a linear trend

* Nearly normal residuals: residuals must be nearly normal

* Constant variability: the variability of points around the least squares line remains roughly constant

* Independent observations: individual data points must be independent 

The scatterplot and the residual plots will be used to assess the conditions for approximating the data with the $t$-distribution.     

\begin{center}\includegraphics[width=0.7\linewidth]{14-UR-module13_review_files/figure-latex/unnamed-chunk-8-1} \end{center}
11. Are the conditions met to use the $t$-distribution to approximate the sampling distribution of our test statistic?

\vspace{1in}

To find the value of the test statistic to test the slope we will use, 

$$
T = \frac{b_1- \text{null value}}{SE(b_1)}
$$
 
We will use the linear model output above to get the estimate for slope and standard error.

12.  Calculate the standardized slope.

\vspace{1in}

13.  Using the linear model output, report the p-value for the test of significance.

\vspace{0.5in}
14. Based on the p-value, how much evidence is there against the null hypothesis?

\vspace{0.5in}
\newpage

Recall that a confidence interval is calculated by adding and subtracting the margin of error to the point estimate.  
$$\mbox{point estimate}\pm t^* \times SE(estimate)$$
$$b_1 \pm t^* \times SE(b_1)$$
 
The $t^*$ multiplier comes from the $t$-distribution with $n-2$ df.  Recall for a 99\% confidence interval, use the 99.5\% percentile (99\% of the distribution is in the middle, leaving 0.5\% in each tail).  The sample size is 603 so the df is 601.


``` r
qt(0.995, 601) #95% t* multiplier 
```

```
#> [1] 2.584034
```

15. Calculate the 99% confidence interval for the true slope.
\vspace{1in}

\newpage
