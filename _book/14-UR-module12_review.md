## Module 11 Review - Independent Samples

The “social brain hypothesis,” or the “social intelligence hypothesis,” suggests that living in socially cohesive groups with differentiated relationships requires a higher cognitive load, in turn resulting in higher brain volume. There is evidence this hypothesis holds for primates and some other mammal groups, but it hasn’t been explored in birds, as most birds typically have temporary social groupings that lack clear relationships. However, woodpeckers have a wide range of clearly differing social relationships while also having the benefit of being physiologically and environmentally similar across species. Researchers want to know if the “social brain hypothesis” holds true for woodpeckers: is the average brain volume (in mm^3) smaller for woodpeckers that tend to be solitary compared to woodpeckers that tend to live in pairs or groups? For the purpose of this study, “solitary” birds are classified as those that only pair-bond to breed, and otherwise are solitary for more than half a year each year. “Group-living” birds are those that spend more than half the year in communal groups or flocks. Researchers examined 61 species of woodpeckers.  Use solitary - group living as the order of subtraction

The summary of the data and boxplots are given below:


``` r
woodpeckers <- read.csv("data/woodpeckers.csv")
# Summary statistics
woodpeckers %>% 
    reframe(favstats(Volume~SocialCategory))
#>   SocialCategory min      Q1 median     Q3  max     mean       sd  n missing
#> 1   group_living 292 1623.75 2731.5 4562.5 7856 3179.900 2062.236 20       0
#> 2       solitary 600 1450.00 2106.0 3060.0 7700 2483.927 1539.478 41       0
```


``` r
# Side-by-side box plots
woodpeckers %>%
ggplot(aes(x = SocialCategory, y = Volume)) +
    geom_boxplot() + 
    labs(title = "Boxplots of Brain Volume for Woodpecker \n Species by Social Grouping",
         x = "Social Grouping", 
         y = "Brain Volume (mm^3") 
  
```



\begin{center}\includegraphics[width=0.6\linewidth]{14-UR-module12_review_files/figure-latex/unnamed-chunk-2-1} \end{center}

1. Write out the parameter of interest in context of the problem.  Use proper notation.

\vspace{0.5in}

2.  Write the null hypothesis in notation.

\vspace{0.5in}

3. Write the alternative hypothesis in words.

\vspace{0.5in}

4.  Calculate the summary statistic.  Use proper notation.

\vspace{0.5in}

**Simulation Methods**

**Hypothesis Testing**

In the two_mean_test function, enter the response~explanatory variable names in for the formula (response~explanatory) and the name of the data set (woodpeckers) for data.  Since the order of subtraction is `solitary` - `group_living` enter `solitary` for first_in_subtraction.  Enter the summary statistic in for as_extreme_as and choose the direction to match the alternative hypothesis.


``` r
set.seed(216)
two_mean_test(Volume~SocialCategory, data = woodpeckers,  #Variables and data
                    first_in_subtraction = "solitary", #First value in order of subtraction
                    number_repetitions = 10000,  #Number of simulations
                    as_extreme_as = -695.973, #Observed statistic
                    direction = "less")  #Direction of alternative: "greater", "less", or "two-sided"
```



\begin{center}\includegraphics[width=0.7\linewidth]{14-UR-module12_review_files/figure-latex/unnamed-chunk-3-1} \end{center}

5.  Based on the p-value for this study, explain why each of the following are false.

A.	There is strong evidence that there is a true mean difference in brain volume for species of woodpeckers that live solo and those that live in groups (solitary - group).

\vspace{0.5in}

B.	If the difference in true mean brain volume for species of woodpeckers that live solo and  that live in groups is less than zero, in 717 out of 10000 samples, we would observe a sample difference in mean brain volume of -695.973 $mm^3$ or less.

\vspace{0.5in}

C.	The 99% confidence interval would not include the value of zero.

\vspace{0.5in}

D.	We could conclude that the brain volume for species of woodpeckers that live solo is less than for those that live in groups when in fact there is no difference in brain volume for species of woodpeckers that live solo and that live in groups.

\vspace{0.5in}

**Bootstrap Confidence Interval**
To find the 99% confidence interval for the true difference in mean brain volume for species of woodpeckers that live in groups and species of woodpeckers that live solo use the two_mean_bootstrap_CI.  The inputs are similar as to what we used in the two_mean_test.


``` r
set.seed(216)
two_mean_bootstrap_CI(Volume~SocialCategory, data = woodpeckers,  #Variables and data
                      first_in_subtraction = "solitary", #First value in order of subtraction
                      number_repetitions = 10000,  #Number of simulations
                      confidence_level = 0.99)
```



\begin{center}\includegraphics[width=0.7\linewidth]{14-UR-module12_review_files/figure-latex/unnamed-chunk-4-1} \end{center}

6. Interpret the confidence interval in context of the problem.

\vspace{0.5in}

7.  Write a conclusion to the research question.

\vspace{0.5in}

\newpage

**Hypothesis testing using theory-based methods**

Standardized Statistic:

|     $T = \frac{\bar{x}_1 - \bar{x}_2-\mbox{null value}}{SE(\bar{x}_1 - \bar{x}_2)}$

|     $SE(\bar{x}_1 - \bar{x}_2)=\sqrt{\frac{s_1^2}{n_1}+\frac{s_2^2}{n_2}}$

8.  Calculate the standard error of the difference in means.

\vspace{0.5in}

9.  Calculate the standardized difference in sample mean.

\vspace{0.5in}

Enter the t score into the pt function using a df = minimum(n - 1) = 20 - 1 = 19, and lower.tail = FALSE.  


``` r
pt(-1.338, df=19, lower.tail=TRUE)
#> [1] 0.09834555
```

10.  Why do we use lower.tail=TRUE to find the p-value?
\vspace{0.5in}

**Confidence interval using theory-based methods**

To calculate the 99% confidence interval we use the formula:

$\bar{x}_1- \bar{x}_2\pm t^* \times SE(\bar{x}_1- \bar{x}_2)$ we will need to find the $t^*$ multiplier using the function qt.  

For a 95% confidence interval we are finding the $t^*$ value at the 99.5th percentile with df = minimum(n - 1) = 20 - 1 = 19.


``` r
qt(0.995, df = 19, lower.tail=TRUE)
#> [1] 2.860935
```

11.  Calculate the 99% confidence interval.

\vspace{0.5in}

12. Why do the simulation and theory based methods not give the same results?

\vspace{0.5in}


\newpage
