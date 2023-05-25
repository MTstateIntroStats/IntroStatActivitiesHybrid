## Activity Week 9:  Winter Sports Helmet Use and Head Injuries --- Theory-based Hypothesis Test

\setstretch{1}

### Learning outcomes

* Given a research question involving two categorical variables, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.
  
* Assess the conditions to use the normal distribution model for a difference in proportions.

* Calculate the Z test statistic for a difference in proportions.

* Find, interpret, and evaluate the p-value for a theory-based hypothesis test for a difference in proportions.

### Terminology review
In today's activity, we will use theory-based methods to analyze two categorical variables. Some terms covered in this activity are:

* Conditional proportion

* Z test

* $z^*$ multiplier

* Null hypothesis

* Alternative hypothesis

* Test statistic

* Standard normal distribution

* Independence and success-failure conditions

* Relative risk

To review these concepts, see Chapter 15 in your textbook.

### Helmet use and head injuries

In "Helmet Use and Risk of Head Injuries in Alpine Skiers and Snowboarders" by Sullheim et. al., [@sulheim2017], we can see the summary results from a random sample of 3562 skiers and snowboarders involved in accidents in the two-way table below. Is there evidence that safety helmet use is associated with a reduced risk of head injury for skiers and snowboarders? 

<!-- |                | Helmet Use | No Helmet Use | Total | -->
<!-- |:--------------:|:----------:|:-------------:|:-----:| -->
<!-- | Head Injury    |     96     |      480      |  576  | -->
<!-- | No Head Injury |     656    |      2330     |  2986 | -->
<!-- | Total          |     752    |      2810     |  3562 | -->
For this study the observational units are skiers and snowboarders involved in accidents.  A success will be considered a head injury in this context and we are comparing the groups helmet use (group 1) and no helmet use (group 2).  Use helmet use - no helmet use as the order of subtraction.  Highlight and runs lines 1--6 in the provided Rscript file to create the summary data table. 


```r
injury <- read.csv("https://math.montana.edu/courses/s216/data/HeadInjuries.csv") 
injury %>% group_by(Helmet) %>% count(Outcome)
```

```
#> # A tibble: 4 x 3
#> # Groups:   Helmet [2]
#>   Helmet Outcome            n
#>   <chr>  <chr>          <int>
#> 1 No     Head Injury      480
#> 2 No     No Head Injury  2330
#> 3 Yes    Head Injury       96
#> 4 Yes    No Head Injury   656
```

1. Fill in the following two-way table using the R output.

\begin{center}
\begin{tabular}{|c|c|c|c|}\hline
& \multicolumn{2}{|c|}{\textbf{Helmet Use}} & \\ \hline
\textbf{Head Injury} & Yes & No & Total \\ \hline
Head Injury & & & \\ 
 & & & \\ \hline
No Head Injury & & & \\ 
 & & & \\ \hline
 Total & & & \\ 
 & & & \\ \hline
\end{tabular}
\end{center}

2. Write the null and alternative hypotheses in notation. 

|    $H_0$: 
\vspace{0.2in}

|    $H_A$:
\vspace{0.2in}

3. Calculate the summary statistic (difference in proportions) for this study.  Use appropriate notation with clear subscripts.

\vspace{0.8in}

4. Interpret the difference in sample proportions in context of the study.
\vspace{1in}

\newpage

#### Use statistical analysis methods to draw inferences from the data {-}

To test the null hypothesis, we could use simulation-based methods as we did in Activity 8A. In this activity, we will focus on theory-based methods.  Like with a single proportion, the sampling distribution of a difference in sample proportions can be mathematically modeled using the normal distribution if certain conditions are met.

Conditions for the sampling distribution of $\hat{p}_1-\hat{p}_2$ to follow an approximate normal distribution:

* **Independence**: The data are independent within and between the two groups. (*Remember*: This also must be true to use simulation methods!)

* **Success-failure condition**: This condition is met if we have at least 10 successes and 10 failures in each sample. Equivalently, we check that all cells in the table have at least 10 observations. 

5.  Is the independence condition met? Explain your answer.

\vspace{0.4in}

6. Is the success-failure condition met for each group?  Explain in context of the study.

\vspace{0.8in}

To calculate the standardized statistic we use: 

$$
Z = \frac{(\hat{p_1} - \hat{p_2}) - \text{null value}}{SE_0(\hat{p_1}-\hat{p}_2)},
$$

where the null standard error is calculated using the pooled proportion of successes:

$$
SE_0(\hat{p}_1-\hat{p}_2)=\sqrt{\hat{p}_{pool}\times (1-\hat{p}_{pool})\times \left(\frac{1}{n_1}+\frac{1}{n_2}\right)}.
$$

For this study we would first calculate the pooled proportion of successes.

$$\hat{p}_{pool} = \frac{\text{number of "successes"}}{\text{number of cases}} = \frac{576}{3562} = 0.162$$
We use the value for the pooled proportion of successes to calculate the $SE_0(\hat{p}_1 - \hat{p}_2)$.


$$
SE_0(\hat{p}_1-\hat{p}_2)=\sqrt{0.162 \times (1-0.162)\times \left(\frac{1}{752}+\frac{1}{2810}\right)} = 0.015
$$

7. Use the value of the null standard error to calculate the standardized statistic (standardized difference in proportion).

\vspace{1in}
\newpage

\begin{figure}

{\centering \includegraphics[width=0.6\linewidth]{09-A08-inference-2cat_test-theory_files/figure-latex/simpleNormal-1} 

}

\caption{A standard normal curve.}(\#fig:simpleNormal)
\end{figure}

8. Mark the value of the standardized statistic on the standard normal distribution above and shade the area to find the p-value.

\vspace{0.1in}

We will use the `pnorm()` function in R to find the p-value. Use the provided R script file and enter the value of the standardized statistic found in question 7 at `xx` in line 11; highlight and run lines 11--13.


```r
pnorm(xx, # Enter value of standardized statistic
      m=0, s=1, # Using the standard normal mean = 0, sd = 1
      lower.tail=TRUE) # Gives a p-value less than the standardized statistic
```
    

9.  Report the p-value from the R output.
\vspace{0.2in}


10.  Interpret the p-value in context of the study.

\vspace{1in}

11. Write a conclusion to the research question based on the p-value found.

\vspace{0.8in}

12. Would a 90\% confidence interval contain the null value of zero?  Explain your answer.

\vspace{0.8in}
\newpage

13. What is the scope of inference for this study?

\vspace{0.8in}


### Impacts on the p-value {-}

Suppose that we want to show that there is a **difference** in true proportion of head injuries for those that wear helmets and those that do not.

14.  Write out the alternative hypothesis in notation for this new research question.

\vspace{0.3in}

15.  How would this impact the p-value?

\vspace{0.2in}

Suppose in a larger sample of skiers and snowboarders involved in accidents we saw the following results. 

|                | Helmet Use | No Helmet Use | Total |
|:--------------:|:----------:|:-------------:|:-----:|
|   Head Injury  |     135    |      674      |  809  |
| No Head Injury |     921    |      3270     |  4191 |
|      Total     |    1056    |      3944     |  5000 |

Note that the sample proportions for each group are the same as the smaller sample size.

$$\hat{p}_h = \frac{135}{1056}=0.127, \hat{p}_n = \frac{674}{3944}=0.171$$

16. The standard error for the difference in proportions for this new sample is 0.013 ($SE(\hat{p}_h - \hat{p}_n) = 0.013$).  Calculate the standardized statistic for this new sample.

\vspace{0.8in}

Use Rstudio to find the p-value for this new sample.  Enter the value of the standardized statistic found in question 16 for xx in line 18.  Highlight and run lines 18--20.


```r
pnorm(xx, # Enter value of standardized statistic
      m=0, s=1, # Using the standard normal mean = 0, sd = 1
      lower.tail=TRUE) # Gives a p-value greater than the standardized statistic
```

\newpage

17.  How does the increase in sample size affect the p-value?

\vspace{0.4in}

18. Suppose another sample of 3562 skiers and snowboarders was taken.  In this new sample a difference in proportions of head injuries was found to be -0.009, ($\hat{p}_h - \hat{p}_n = -0.009$) with a standard error for the difference in proportions of 0.015, ($SE(\hat{p}_h - \hat{p}_n) = 0.015$).  Calculate the standardized statistic for this new sample.

\vspace{0.5in}

Use Rstudio to find the p-value for this new sample.  Enter the value of the standardized statistic found in question 18 for xx in line 25.  Highlight and run lines 25--27.


```r
pnorm(xx, # Enter value of standardized statistic
      m=0, s=1 # Using the standard normal mean = 0, sd = 1
      lower.tail=TRUE) # Gives a p-value greater than the standardized statistic
```

19.  How does a statistic closer to the null value affect the p-value?

\vspace{0.3in}

20.  Summarize how each of the following affected the p-value:

a) Switching to a two-sided test.

\vspace{0.4in}

b) Using a larger sample size.

\vspace{0.4in}

c) Using a sample statistic closer to the null value.

\vspace{0.4in}
\newpage

### Take-home messages

1.	When comparing two groups, we are looking at the difference between two parameters.  In the null hypothesis, we assume the two parameters are equal, or that there is no difference between the two proportions.  

2.  The standardized statistic when the response variable is categorical is a Z-score and is compared to the standard normal distribution to find the p-value.  To find the standardized statistic, we take the value of the statistic minus the null value, divided by the null standard error of the statistic.  The standardized statistic measures the number of standard errors the statistic is from the null value. 

3.  The p-value for a two-sided test is approximately two times the value for a one-sided test.  A two-sided test provides less evidence against the null hypothesis.

4.  The larger the sample size, the smaller the sample to sample variability.  This will result in a larger standardized statistic and more evidence against the null hypothesis.

5.  The farther the statistic is from the null value, the larger the standardized statistic.  This will result in a smaller p-value and more evidence against the null hypothesis.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
