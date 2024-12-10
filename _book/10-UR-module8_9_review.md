## Module 8 - 9  Review


``` r
allergy <- read.csv("https://math.montana.edu/courses/s216/data/PeanutAllergy.csv") 
allergy %>% group_by(Treatment) %>% count(Allergy)
```

```
#> # A tibble: 4 x 3
#> # Groups:   Treatment [2]
#>   Treatment Allergy     n
#>   <chr>     <chr>   <int>
#> 1 Avoiders  No        220
#> 2 Avoiders  Yes        35
#> 3 Peanuts   No        240
#> 4 Peanuts   Yes         5
```

In the last 10 years, the proportion of children who are allergic to peanuts has doubled in Western countries. However, the allergy is not very common in some other countries where peanut protein is an important part of peoples' diets. The LEAP randomized trial, reported by Du Toit, et.al in the New England Journal of Medicine in February 2015 identified over 500 children ages 4 to 10 months who showed some sensitivity to peanut protein. They randomly assigned them to two groups: 

•	Peanut avoiders: parents were told to not give their kids any food which contained peanuts

•	Peanut eaters: parents were given a snack containing peanut protein and told to feed it to their child several times per week (target dose was at least 6g of peanut protein per week).

At age 5 years, children were tested with a standard skin prick to see if they had an allergic reaction to peanut protein (yes or no).  Is there evidence that exposure to peanuts reduces the likelihood of developing peanut allergies? 

|                   |     Peanut Avoiders    |     Peanut Eaters    |     Total    |
|-------------------|:----------------------:|:--------------------:|:------------:|
|     Allergy       |            35          |           5          |       40     |
|     No Allergy    |           220          |          240         |      460     |
|     Total         |           255          |          245         |      500     |

For this study we will use the order of subtraction avoiders – eaters.  

1.  Fill in the blanks with one answer from each set of parentheses: 

The variable whether or not a child is given peanut protein is the ________________ (explanatory/response) variable and it is _________________ (categorical/quantitative).

The variable whether or not a child developed a peanut allergy is the ________________ (explanatory/response) variable and it is _________________ (categorical/quantitative).

2. Write the parameter of interest for this study.  

\vspace{1in}

3. Write the null hypothesis in notation.

\vspace{0.5in}

4. Write the alternative hypothesis in words.

\vspace{0.8in}

5. Calculate the conditional proportion of children that developed a peanut allergy among those that avoided peanuts.  Use proper notation.

\vspace{0.6in}

6. Calculate the conditional proportion of children that developed a peanut allergy among those that ate peanuts.  Use proper notation.

\vspace{0.6in}

7. Calculate the difference in proportion of children that developed a peanut allergy for those that avoided peanuts and those who ate peanuts.  Use proper notation.

\vspace{0.6in}

8.  First, let's think about how one simulation would be created on the null distribution using cards.  

    How many cards would you need?
\vspace{0.1in}

    What would be written on each card?

\vspace{0.5in}

9. Next, we would mix the cards together and shuffle into two piles.  How many cards would be in each pile?  What would each pile represent?

\vspace{0.8in}

10. Once we have one simulated sample, what would we calculate and plot on the null distribution?  *Hint*: What statistic are we calculating from the data?

\vspace{0.8in}
\newpage


``` r
two_proportion_test(formula = Allergy ~ Treatment, #response~explanatory
                    data=allergy, #name of dataset
                    first_in_subtraction = "Avoiders", #order of subtraction: avoiders - peanuts
                    number_repetitions = 1000, #always use a minimum of 1000 repetitions
                    response_value_numerator = "Yes", #define a success as having an allergy
                    as_extreme_as = 0.117, #type your calculated observed statistic (difference in sample proportions)
                    direction="greater") #type your selected direction to match the alternative hypothesis direction
```



\begin{center}\includegraphics[width=0.7\linewidth]{10-UR-module8_9_review_files/figure-latex/unnamed-chunk-2-1} \end{center}
11.  Interpret the p-value in context of the problem:

\vspace{1in}

12.  Write a conclusion to the test in context of the study.

\vspace{1in}

\newpage

We will use the `two_proportion_bootstrap_CI()` function in `R` (in the `catstats` package) to simulate the bootstrap distribution of differences in sample proportions and calculate a confidence interval. We will need to enter the response variable name and the explanatory variable name for the formula, the data set name (identified above as `allergy`), the outcome for the explanatory variable that is first in subtraction, number of repetitions, the outcome for the response variable that is a success (what the numerator counts when calculating a sample proportion), and the confidence level as a decimal.


``` r
two_proportion_bootstrap_CI(formula = Allergy~Treatment, 
        data=allergy, # Name of data set
        first_in_subtraction = "Avoiders", # Order of subtraction: enter the name of Group 1
        response_value_numerator = "Yes", # Define which outcome is a success 
        number_repetitions = 1000, # Always use a minimum of 1000 repetitions
        confidence_level = 0.90) # Enter the level of confidence as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{10-UR-module8_9_review_files/figure-latex/unnamed-chunk-3-1} \end{center}

13. Interpret the 90\% confidence interval in context of the problem.

\vspace{0.8in}

\newpage

**Theory-based Methods**

Conditions for the sampling distribution of $\hat{p}_1-\hat{p}_2$ to follow an approximate normal distribution:

* **Independence**: The data are independent within and between the two groups. (*Remember*: This also must be true to use simulation methods!)

* **Success-failure condition**: This condition is met if we have at least 10 successes and 10 failures in each sample. Equivalently, we check that all cells in the table have at least 10 observations.


14. Are the conditions met to use theory-based methods?

\vspace{1in}

To calculate the standardized statistic we use: 

$$
Z = \frac{(\hat{p_1} - \hat{p_2}) - \text{null value}}{SE_0(\hat{p_1}-\hat{p}_2)},
$$

where the null standard error is calculated using the pooled proportion of successes:

$$
SE_0(\hat{p}_1-\hat{p}_2)=\sqrt{\hat{p}_{pool}\times (1-\hat{p}_{pool})\times \left(\frac{1}{n_1}+\frac{1}{n_2}\right)}.
$$
15. Calculate the null standard error of the difference in proportion.

\vspace{1in}

16. Calculate the standardized statistic.

\vspace{1in}

17. Interpret the standardized statistic in context of the problem.

\vspace{1in}


``` r
pnorm(4.814, lower.tail = FALSE)
#> [1] 7.39694e-07
```

\newpage

$$\hat{p}_1-\hat{p}_2\pm z^*\times SE(\hat{p}_1-\hat{p}_2), \hspace{.2cm} \text{where}$$
$$SE(\hat{p}_1-\hat{p}_2) = \sqrt{\frac{\hat{p}_1 \times  (1-\hat{p}_1)}{n_1}+\frac{\hat{p}_2 \times  (1-\hat{p}_2)}{n_2}}$$
18.  Calculate the standard error of the difference in proportions to calculate the confidence interval.

\vspace{1in}


``` r
qnorm(0.90, lower.tail = TRUE)
#> [1] 1.281552
```


19. Calculate the 90\% confidence interval.

\vspace{1in}

20. What is the scope of inference for this study?



\newpage
