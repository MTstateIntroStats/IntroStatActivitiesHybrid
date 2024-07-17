## Activity 11:  Diabetes

\setstretch{1}

### Learning outcomes

* Given a research question involving two categorical variables, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.
  
* Assess the conditions to use the normal distribution model for a difference in proportions.

* Describe and perform a simulation-based hypothesis test for a difference in proportions.

* Calculate the Z test statistic for a difference in proportions.

* Find, interpret, and evaluate the p-value for a hypothesis test for a difference in proportions.

* Create and interpret a theory-based confidence interval for a difference in proportions.

### Glycemic control in diabetic adolescents

Researchers compared the efficacy of two treatment regimens to achieve durable glycemic control in children and adolescents with recent-onset type 2 diabetes [@zeitler2012].  A convenience sample of patients 10 to 17 years of age with recent-onset type 2 diabetes were randomly assigned to either a medication (rosiglitazone) or a lifestyle-intervention program focusing on weight loss through eating and activity.  Researchers measured whether the patient still needs insulin (failure) or had glycemic control (success).  Of the 233 children who received the Rosiglitazone treatment, 143 had glycemic control, while of the 234 who went through the lifestyle-intervention program, 125 had glycemic control. Is there evidence that there is difference in proportion of patients that achieve durable glycemic control between the two treatments?  Use Rosiglitazone – Lifestyle as the order of subtraction.

* Upload and open the R script file for this activity. Upload the csv file, `diabetes`. 

* Enter the name of the data set `datasetname` in the R script file in line 7. 

* Highlight and run lines 1--8 to get the counts for each combination of categories.


```r
glycemic <- read.csv("datasetname")
glycemic %>% group_by(treatment) %>% count(outcome)
```

1. Complete the following two-way table using the R output.

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

2. Is the independence condition met for this study? Explain your answer.
\vspace{0.6in}

3. Write the null hypothesis in words.
\vspace{0.6in}

4. Using the research question, write the alternative hypothesis in notation.
\vspace{0.3in}

5. Calculate the summary statistic (difference in proportions).  Use appropriate notation.
\vspace{0.3in}

6. Calculate the null standard error for the difference in sample proportions.

\vspace{0.6in}

7. How many standard errors is the sample difference in proportions from the null value?

\vspace{0.6in}

Use the `pnorm()` function in R to find the p-value.

* Enter the value of Z calculated in question 7 for xx.


```r
2*pnorm(xx, # Enter value of standardized statistic
      m=0, s=1, # Using the standard normal mean = 0, sd = 1
      lower.tail=FALSE) # Gives a p-value less than the standardized statistic
```

8. Report the p-value. How much evidence does the p-value provide against the null hypothesis?
\vspace{0.3in}

9.  Will a 95\% simulation confidence interval contain the null value of zero? Explain your answer.
\vspace{0.7in}

10. Calculate the standard error for a difference in proportions to create a 95\% confidence interval.  
\vspace{0.8in}

11.  Use the multiplier of $z^*$ = 1.96 and the standard error found in question 10 to calculate a 95\% confidence interval for the parameter of interest.
\vspace{1in}

12. Write a conclusion to the research question.

\vspace{0.8in}

#### Relative Risk {-}

Another summary statistic that can be calculated for two categorical variables is the relative risk.  The relative risk is calculated as the ratio of the conditional proportions:


$$\text{relative risk} = \frac{\hat{p}_1}{\hat{p}_2}.$$


13.  Calculate the relative risk of glycemic control for patients given Rosiglitazone compared to patients given the placebo.

\vspace{0.7in}

14.  Interpret the value of relative risk in context of the problem.

\vspace{0.7in}

15. Calculate the increase or decrease in risk of glycemic control for patients given Rosiglitazone compared to patients given the placebo.

\vspace{0.7in}

16. Interpret the increase or decrease in risk of glycemic control in context of the problem. 

\vspace{0.8in}

17. Calculate the percent increase or percent decrease in glycemic control.

\vspace{0.7in}

18. Interpret the value of relative risk as a percent increase or percent decrease in glycemic control.

\vspace{0.8in}

### Take-home messages

1. Relative risk calculates the ratio of the proportion of successes in group 1 compared to the proportion of successes in group 2.

2. Relative risk evaluates the percent increase or percent decrease in the response variable attributed to the explanatory variable.  To find the percent increase or percent decrease we calculate the following $\text{percent change}=(RR - 1)\times 100\%$. If relative risk is less than 1 there is a percent decrease.  If relative risk is greater than 1 there is a percent increase.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
