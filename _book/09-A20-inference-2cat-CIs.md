## Activity 20:  Diabetes

\setstretch{1}

### Learning outcomes

* Assess the conditions to use the normal distribution model for a difference in proportions.

* Describe and perform a simulation-based confidence interval for a difference in proportions.

* Create and interpret a theory-based confidence interval for a difference in proportions.

### Glycemic control in diabetic adolescents

Researchers compared the efficacy of two treatment regimens to achieve durable glycemic control in children and adolescents with recent-onset type 2 diabetes [@zeitler2012].  A convenience sample of patients 10 to 17 years of age with recent-onset type 2 diabetes were randomly assigned to either a medication (rosiglitazone) or a lifestyle-intervention program focusing on weight loss through eating and activity.  Researchers measured whether the patient still needs insulin (failure) or had glycemic control (success).  Of the 233 children who received the Rosiglitazone treatment, 143 had glycemic control, while of the 234 who went through the lifestyle-intervention program, 125 had glycemic control. Is there evidence that there is difference in proportion of patients that achieve durable glycemic control between the two treatments?  Use Rosiglitazone – Lifestyle as the order of subtraction.

* Upload and open the R script file. Upload the csv file, `diabetes`. 

* Enter the name of the data set for `datasetname.csv` in the R script file in line 7. 

* Highlight and run lines 1--8 to get the counts for each combination of categories.


``` r
glycemic <- read.csv("datasetname.csv")
glycemic %>% group_by(treatment) %>% count(outcome)
```

1. Is this an experiment or an observational study?
\vspace{0.2in}

2. Complete the following two-way table using the R output.

\begin{center}
\begin{tabular}{|c|c|c|c|}\hline
 & \multicolumn{2}{|c|}{\textbf{Treatment}} & \\ \hline
\textbf{Outcome} & \hspace{0.35in} rosiglitazone \hspace{0.35in} & \hspace{0.35in} lifestyle \hspace{0.35in} & \hspace{0.35in} Total \hspace{0.35in} \\ \hline
 glycemic control & & & \\ 
 (success) & & & \\ \hline
 insulin required & & & \\ 
 (failure) & & & \\ \hline
 Total & & &  \\ 
 & & & \\ \hline  
\end{tabular}
\end{center}

3. Is the independence condition met for this study? Explain your answer.
\vspace{0.6in}

4. Is the success failure condition met for this study?  Explain your answer.

\vspace{0.6in}

5. Write the parameter of interest for the research question.
\vspace{0.6in}

6. **Calculate the summary statistic (difference in proportions).  Use appropriate notation.**
\vspace{0.3in}

### Simulation methods {-}

First we will use simulation methods to find the confidence interval.  This will give an interval estimate for the parameter of inference.

We will use the `two_proportion_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of differences in sample proportions and calculate a 90\% confidence interval. We will need to enter the response variable name and the explanatory variable name for the formula, the data set name (identified above as `glycemic`), the outcome for the explanatory variable that is first in subtraction, number of repetitions, the outcome for the response variable that is a success (what the numerator counts when calculating a sample proportion), and the confidence level as a decimal.

7.  What inputs should be entered for each of the following to create the bootstrap simulation?
\vspace{1mm}

* First in subtraction (What is the outcome for the explanatory variable that is used as first in the order of subtraction? `"rosi"` or `"lifestyle"`):

\vspace{.15in}
* Number of repetitions:

\vspace{.15in}
* Response value numerator (What is the outcome for the response variable that is considered a success? `"success"` or `"failure"`):

\vspace{.15in}
* confidence_level:

\vspace{.15in}

* Fill in the missing values/names in the R script file in the two_proportion_bootstrap_CI function to create a simulation 90\% confidence interval.  


``` r
two_proportion_bootstrap_CI(formula = response~explanatory, 
         data=mushrooms, # Name of data set
         first_in_subtraction = "xx", # Order of subtraction: enter the name of Group 1
         response_value_numerator = "xx", # Define which outcome is a success 
         number_repetitions = 1000, # Always use a minimum of 1000 repetitions
         confidence_level = xx) # Enter the level of confidence as a decimal
```

8.  Report the 90\% confidence interval.

\vspace{0.2in}

9.  Interpret the confidence interval in context of the problem.

\vspace{1in}

### Theory-based Methods {-}

Next we will use theory-based methds to find the 90\% confidence interval.

10.  Is the sample size large enough to use theory-based methods to find the confidence interval?  Explain in context of the study,

\vspace{1.2in}


To find a confidence interval for the difference in proportions we will add and subtract the margin of error from the point estimate to find the two endpoints.

 $$\hat{p}_1-\hat{p}_2\pm z^*\times SE(\hat{p}_1-\hat{p}_2), \hspace{.2cm} \text{where}$$
 $$SE(\hat{p}_1-\hat{p}_2) = \sqrt{\frac{\hat{p}_1 \times  (1-\hat{p}_1)}{n_1}+\frac{\hat{p}_2 \times  (1-\hat{p}_2)}{n_2}}$$
 
In this formula, we use the sample proportions for each group to calculate the standard error for the difference in proportions since we are not assuming that the true difference is zero.

11. Calculate the standard error of the sample proportion not assuming the null hypothesis is true.

\vspace{1in}

Recall that the $z^*$ multiplier is the percentile of a standard normal distribution that corresponds to our confidence level. If our confidence level is 90\%, we find the Z values that encompass the middle 90\% of the standard normal distribution. If 90\% of the standard normal distribution should be in the middle, that leaves 10\% in the tails, or 5\% in each tail.  The `qnorm()` function in R will tell us the $z^*$ value for the desired percentile (in this case, 90\% + 5\% = 95\% percentile). 


``` r
qnorm(0.95, lower.tail = TRUE) # Multiplier for 90% confidence interval
```

```
#> [1] 1.644854
```

12. Mark the value of the $z^*$ multiplier and the percentages used to find this multiplier on the standard normal distribution shown below.  


\begin{center}\includegraphics[width=0.5\linewidth]{09-A20-inference-2cat-CIs_files/figure-latex/standNormc-1} \end{center}

\vspace{1mm}

Remember that the margin of error is the value added and subtracted to the sample difference in proportions to find the endpoints for the confidence interval.

$$ME = z^*\times SE(\hat{p}_1 - \hat{p}_2)$$

13. Using the multiplier of $z^*$ = 1.645 and the calculated standard error, calculate the margin of error for a 90\% confidence interval.

\vspace{0.8in}

14. Calculate the 90\% confidence interval for the parameter of interest. 

\vspace{1in}

\newpage