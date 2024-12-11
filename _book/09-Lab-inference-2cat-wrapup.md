## Module 9 Lab:  Poisonous Mushrooms 

\setstretch{1}

### Learning outcomes

* Given a research question involving two categorical variables, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.
  
* Describe and perform a simulation-based hypothesis test for a difference in proportions.

* Interpret and evaluate a p-value for a simulation-based hypothesis test for a difference in proportions.

* Interpret and evaluate a confidence interval for a simulation-based confidence interval for a difference in proportions.

### Poisonous Mushrooms

Wild mushrooms, such as chanterelles or morels, are delicious, but eating wild mushrooms carries the risk of accidental poisoning. Even a single bite of the wrong mushroom can be enough to cause fatal poisoning. An amateur mushroom hunter is interested in finding an easy rule to differentiate poisonous and edible mushrooms. They think that the mushroom’s gills (the part which holds and releases spores) might be related to a mushroom’s edibility. They used a data set of 8124 mushrooms and their descriptions. For each mushroom, the data set includes whether it is edible (e) or poisonous (p) and the size of the gills (broad (b) or narrow (n)).  Is there evidence gill size is associated with whether a mushroom is poisonous?  PLEASE NOTE: According to The Audubon Society Field Guide to North American Mushrooms, there is no simple rule for determining the edibility of a mushroom; no rule like "leaflets three, let it be'' for Poisonous Oak and Ivy. 

* Upload and open the R script file for the Module 9 lab. Upload and import the csv file, `mushrooms_edibility`. 

* Enter the name of the data set (see the environment tab) for datasetname.csv in the R script file in line 8. 

* Highlight and run lines 1--9 to get the counts for each combination of categories.


``` r
mushrooms <- read.csv("datasetname.csv") # Read data set in
mushrooms %>% group_by(gill_size) %>% count(edibility) #finds the counts in each group
```

1. What is the explanatory variable?  How are the two levels of the explanatory variable written in the data set?

\vspace{0.5in}

2. What is the response variable? How are the two levels of the response variable written in the data set?

\vspace{0.5in}

3. Write the parameter of interest in words, in context of the study.

\vspace{1in}

4.  Write the null hypothesis for this study in notation.

\vspace{0.25in}

\newpage

5.  **Using the research question, write the alternative hypothesis in words.**

\vspace{1in}

6. Fill in the following two-way table using the R output.

\begin{center}
\begin{tabular}{|c|c|c|c|}\hline
& \multicolumn{2}{|c|}{\textbf{Gill Size}} & \\ \hline
\textbf{Edibility} & \hspace{0.35in} Broad (b) \hspace{0.35in} & \hspace{0.35in} Narrow (n) \hspace{0.35in} & \hspace{0.35in} Total \hspace{0.35in} \\ \hline
 Poisonous (p) & & & \\ 
 & & & \\ \hline
Edible (e) & & & \\ 
 & & & \\ \hline
 Total & & & \\ 
 & & & \\ \hline
\end{tabular}
\end{center}

7. **Calculate the difference in proportion of mushrooms that are poisonous for broad gill mushrooms and narrow gill mushrooms.  Use broad - narrow for the order of subtraction.  Use appropriate notation.**

\vspace{0.8in}

<!-- Use the provided R script file to create a segmented bar plot of the data.  Make sure to title your plot.  Highlight and run lines 14--20. -->

<!-- ```{r, out.width="60%", echo=TRUE, eval=FALSE} -->
<!-- injuries %>% # Data set piped into... -->
<!--   ggplot(aes(x = Injury.Site, fill = Lethal)) +   # This specifies the variables -->
<!--   geom_bar(stat = "count", position = "fill") +  # Tell it to make a stacked bar plot -->
<!--   labs(title = "Title",  # Make sure to title your plot  -->
<!--        x = "Location of Injury",   # Label the x axis -->
<!--        y = "") +  # Remove y axis label -->
<!--   scale_fill_grey()  # Make figure black and white -->
<!-- ``` -->
<!-- 7.  Based on the plot does there appear to be an association between the variables?  Explain your answer. -->



* Fill in the missing values/names in the R script file for the `two-proportion_test` function to create the null distribution and find the p-value for the test.


``` r
two_proportion_test(formula = response~explanatory, # response ~ explanatory
    data= mushrooms, # Name of data set
    first_in_subtraction = "xx", # Order of subtraction: enter the name of Group 1
    number_repetitions = 1000, # Always use a minimum of 1000 repetitions
    response_value_numerator = "xx", # Define which outcome is a success 
    as_extreme_as = xx, # Calculated observed statistic (difference in sample proportions)
    direction="xx") # Alternative hypothesis direction ("greater","less","two-sided")
```

8.  Report the p-value for the study.

\vspace{0.2in}

9.  **Do you expect that a 90\% confidence interval would contain the null value of zero?  Explain your answer.**

\vspace{0.8in}

\newpage

* Fill in the missing values/names in the R script file in the two_proportion_bootstrap_CI function to create a simulation 90\% confidence interval.  

* **Upload a copy of the bootstrap distribution to Gradescope.**


``` r
two_proportion_bootstrap_CI(formula = response~explanatory, 
         data=mushrooms, # Name of data set
         first_in_subtraction = "xx", # Order of subtraction: enter the name of Group 1
         response_value_numerator = "xx", # Define which outcome is a success 
         number_repetitions = 1000, # Always use a minimum of 1000 repetitions
         confidence_level = xx) # Enter the level of confidence as a decimal
```

10. Report the 90\% confidence interval.

\vspace{0.2in}

11.  Write a paragraph summarizing the results of the study as if writing a press release.  Be sure to describe:

* Summary statistic and interpretation

    * Summary measure (in context)
    
    * Value of the statistic 
    
    * Order of subtraction when comparing two groups

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

**Upload your group's confidence interval interpretation and conclusion to Gradescope.** 

\newpage

Paragraph:

\newpage


