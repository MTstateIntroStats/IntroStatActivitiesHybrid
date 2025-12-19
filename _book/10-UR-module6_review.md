## Module 6 Review - Simulation Methods - One Mean

There are about 4 million tourists to Yellowstone National Park per year.  One of the most visited sites within the park is the Old Faithful Geyser.  The reason this geyser is called old faithful is because of the regularity of eruptions.  Tourists report a typical wait time of 30 minutes, on average.  A sample of 299 tourists reported their wait time to see Old Faithful erupt.  Is there evidence that the average wait time differs from 30 minutes?





```
#>   min Q1 median Q3 max     mean       sd   n missing
#> 1  43 59     76 83 108 72.31438 13.89032 299       0
```

The following code creates the boxplot of waiting time. 

\begin{center}\includegraphics[width=0.6\linewidth]{10-UR-module6_review_files/figure-latex/unnamed-chunk-3-1} \end{center}

	
1.  Report and interpret the value of $Q_1$ in context of the study.

\vspace{0.5in}

2.  Report and interpret the standard deviation of reported wait time in context of the study.
\vspace{0.2in}

3.  Describe the plot using the four characteristics for boxplots.

\vspace{1in}

4. Write the parameter of interest for this study in context of the study.  


\vspace{0.8in}

5. Write the null hypothesis in notation.

\vspace{0.5in}

6. Write the alternative hypothesis in words.

\vspace{0.8in}

We will start with simulation methods. 
	
7.  Calculate the difference $\mu_0 - \bar{x}$.  Will we need to shift the data up or down?
\vspace{0.5in}


``` r
one_mean_test(data = geyser$waiting,   #Object and variable
              null_value = 30, #null value for the study
              shift = -42.31438,   #Shift needed for bootstrap hypothesis test
              summary_measure = "mean", 
              as_extreme_as = 72.314,  #Observed statistic
              direction = "two-sided",  #Direction of alternative
              number_repetitions = 10000)  #Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{10-UR-module6_review_files/figure-latex/unnamed-chunk-4-1} \end{center}

8. Interpret the p-value of the test.

\vspace{1in}

9. Do you expect the 99\% confidence inteval to contain the null value of 30 minutes?  Explain your answer.

\vspace{1in}

\newpage

In the next part of the activity, we will estimate the mean wait time for Old Faithful to erupt reported by tourists by creating a 99\% confidence interval using simulation methods.


``` r
one_mean_CI(data = geyser$waiting,   #Object and variable
            summary_measure = "mean", 
            confidence_level = 0.99, #Level of context as a decimal
            number_repetitions = 10000)  #Number of simulated samples for null distribution
```



\begin{center}\includegraphics[width=0.7\linewidth]{10-UR-module6_review_files/figure-latex/unnamed-chunk-5-1} \end{center}

10.  How many simulations are at and below the value of 70.241?

\vspace{1in}

11. Interpret the 99\% confidence interval.

\vspace{1in}


12. Write a conclusion to the test.

\vspace{1in}

\newpage

