## Week 9 Lab:  Diabetes

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

Upload and open the R script file for Week 9 lab. Upload and import the csv file, `diabetes`. Enter the name of the data set (see the environment tab) for `datasetname` in the R script file in line 7. Highlight and run lines 1--8 to get the counts for each combination of categories.


```r
glycemic <- datasetname
glycemic %>% group_by(treatment) %>% count(outcome)
```

1. Is this an experiment or an observational study?
\vspace{0.2in}

2. Complete the following two-way table using the R output.

\begin{center}
\begin{tabular}{|c|c|c|c|}\hline
 & \multicolumn{2}{|c|}{\textbf{Treatment}} & \\ \hline
\textbf{Outcome} & Rosiglitazone & Lifestyle & Total \\ \hline
 Glycemic Control & & & \\ 
 & & & \\ \hline
 Insulin Required & & & \\ 
 & & & \\ \hline
 Total & & &  \\ 
 & & & \\ \hline  
\end{tabular}
\end{center}

3. Is the independence condition met for this study? Explain your answer.
\vspace{0.6in}

4. Write the parameter of interest for the research question.
\vspace{0.6in}

5. Using the research question, write the alternative hypothesis in notation.
\vspace{0.3in}

6. **Calculate the summary statistic (difference in proportions).  Use appropriate notation.**
\vspace{0.3in}

Fill in the missing values/names in the R script file in the two-proportion_test function to create the null distribution and find the simulation p-value for the test.


```r
two_proportion_test(formula = outcome~treatment, # response ~ explanatory
         data= glycemic, # Name of data set
         first_in_subtraction = "xx", # Order of subtraction: enter the name of Group 1
         number_repetitions = 1000, # Always use a minimum of 1000 repetitions
         response_value_numerator = "xx", # Define which outcome is a success 
         as_extreme_as = xx, # Calculated observed statistic (difference in sample proportions)
         direction="xx") # Alternative hypothesis direction ("greater","less","two-sided")
```

7. Report the p-value. How much evidence does the p-value provide against the null hypothesis?
\vspace{0.3in}

8.  **Will the theory-based p-value be similar to the simulation p-value?  Explain your answer.**
\vspace{0.8in}

9. **Calculate the number of standard errors the sample difference in proportion is from the null value of zero.**
\vspace{0.8in}

10.  **Will a 95\% simulation confidence interval contain the null value of zero? Explain your answer.**
\vspace{0.8in}

11. Calculate the standard error for a difference in proportions to create a 95\% confidence interval.  
\vspace{1in}

12.  Use the multiplier of $z^*$ = 1.96 and the standard error found in question 11 to calculate a 95\% confidence interval for the parameter of interest.
\vspace{1in}

13. Write a paragraph summarizing the results of the study.  Be sure to describe:

* Summary statistic and interpretation

* P-value and interpretation

    * Statement about probability or proportion of samples
    
    * Statistic (summary measure and value)
    
    * Direction of the alternative 
    
    * Null hypothesis (in context) 


* Confidence interval and interpretation

    * How confident you are (e.g., 90%, 95%, 98%, 99%)
    
    * Parameter of interest
    
    * Calculated interval
    
    * Order of subtraction when comparing two groups


* Conclusion (written to answer the research question)

    * Amount of evidence
    
    * Parameter of interest 
    
    * Direction of the alternative hypothesis


* Scope of inference

    * To what group of observational units do the results apply (target population or observational units similar to the sample)?
	
    * What type of inference is appropriate (causal or non-causal)?

**Upload a copy of your group's p-value interpretation and scope of inference to Gradescope.** 

\newpage

Paragraph (continued): 

\newpage
