## Activity 17:  Summarizing Two Categorical Variables


\setstretch{1}

### Learning outcomes

* Identify and create appropriate summary statistics and plots given a data set or research question involving categorical variables.
  
* Plots for association between two categorical variables:
  segmented bar plot, mosaic plot.
  
* Calculate and interpret relative risk
  
### Terminology review

In today's activity, we will review summary measures and plots for categorical variables.  Some terms covered in this activity are:

* Conditional proportions 

* Segmented bar plots

* Mosaic plots

* Relative risk

To review these concepts, see Chapter 4 in the textbook.  

### Graphing categorical variables

Follow these steps to upload the necessary R script file for today's activity: 

* Download the RScript file for this Activity from D2L

* Upload and open the file on the server

the  R script file from D2L

* Enter the name of the dataset ("myopia.csv") in line 6

Highlight and run lines 1--3 to load the packages needed for today's activity. Notice the use of the \# symbol in the R script file.  The \# sign is not part of the R code. It is used by these authors to add comments to the R code and explain what each call is telling the program to do.

R will ignore everything after a \# sign when executing the code. Refer to the instructions following the \# sign to understand what you need to enter in the code.

### Nightlight use and myopia {-}

In a study reported in Nature [@quinn1999], a survey of 479 children found that those who had slept with a nightlight or in a fully lit room before the age of two had a higher incidence of nearsightedness (myopia) later in childhood.

In this study, there are two variables studied: `Light`: level of light in room at night (no light, nightlight, full light) and `Sight`: level of myopia developed later in childhood (high myopia, myopia, no myopia).  

1. Which variable is the explanatory variable? Which is the response variable?

\vspace{0.8in}

An important part of understanding data is to create visual pictures of what the data represent.  In this activity, we will create graphical representations of categorical data.  

#### R code {-}

The line of code shown below (line 6 in the R script file) reads in the data set and names the data set `myopia`.  Highlight and run line 6 in the R script file to load the data from the Stat 216 webpage.


``` r
# This will read in the data set
myopia <- read.csv("https://math.montana.edu/courses/s216/data/ChildrenLightSight.csv") 
```

2.  Click on the data set name (`myopia`) in the Environment tab (upper right window).  This will open the data set in a 2nd tab in the Editor window (upper left window).  R is case sensitive, which means that you must always type the name of a variable EXACTLY as it is written in the data set including upper and lower case letters and without misspellings!  Write down the name of each variable (column names) as it is written in the data set.  

\vspace{0.3in}

#### Summarizing two categorical variables {-}

Is there an association between the level of light in a room and the development of myopia?  Fill in the name of the explanatory variable, `Light` for explanatory and name of the response variable, `Sight` in line 29 in the R script file, highlight and run line 29 to get the counts for each combination of levels of variables. 


``` r
myopia %>% group_by(explanatory) %>% count(response)
```

3.  Fill in the following table with the values from the R output.

\begin{center}
\begingroup
\setlength{\tabcolsep}{14pt} % Default value: 6pt
\renewcommand{\arraystretch}{2} % Default value: 1
\begin{tabular}{|c|c|c|c|c|}
\hline
 & \multicolumn{3}{|c|}{\textbf{Light Level}} & \\ \hline
\textbf{Myopia Level} & Full Light & Nightlight & No Light & Total \\ \hline
 High Myopia & & & & \\ \hline
 Myopia & & & & \\ \hline
 No Myopia & & & & \\ \hline
 Total & & & & \\ \hline  
\end{tabular}
\endgroup
\end{center}

In the following questions, use the table to calculate the described proportions.  Notation is important for each calculation. Since this is sample data, it is appropriate to use statistic notation for the proportion, $\hat{p}$. When calculating a proportion dependent on a single level of a variable, subscripts are needed when reporting the notation.

4.  Calculate the proportion of children with no myopia. Use appropriate notation.
\vspace{0.3in}

5.  Calculate the proportion of children with no myopia among those that slept with full light. Use appropriate notation.
\vspace{0.3in}

6.  Calculate the proportion of children with no myopia among those that slept with no light. Use appropriate notation.
\vspace{0.3in}

7.  Calculate the difference in proportion of children with no myopia for those that slept with full light minus those who slept with no light. Give the appropriate notation. Use full light minus no light as the order of subtraction.
\vspace{0.8in}

8. Interpret the calculated difference in proportion in context of the study.

\vspace{1in}

#### Displaying two categorical variables {-}

Two types of plots can be created to display two categorical variables.  To examine the differences in level of myopia for the level of light, we will first create a segmented bar plot of `Light` segmented by `Sight`.  To create the segmented bar plot enter the variable name, `Light` for `explanatory` and the variable name, `Sight` for `response` in the R script file in line 35. Highlight and run lines 34--40.


``` r
myopia %>% # Data set piped into...
ggplot(aes(x = explanatory, fill = response)) +   # This specifies the variables
  geom_bar(stat = "count", position = "fill") +  # Tell it to make a stacked bar plot
  labs(title = "Segmented Bar Plot of Night Light Use by Level of Myopia",  
       # Make sure to title your plot 
       x = "Level of Light",   # Label the x axis
       y = "")  + # Remove y axis label
  scale_fill_viridis_d()  # Make figure color
```

9. Sketch the segmented bar plot created here. Be sure to label the axes.  

\vspace{2in}

10. From the segmented bar plot, which level of light has the highest proportion of `No Myopia`?

\vspace{0.5in}

11. Based on the plot, is there an association between level of light and level of myopia?

\vspace{1in}

We could also plot the data using a mosaic plot which is shown below.  


``` r
myopia$Sight <- factor(myopia$Sight, levels = c("No Myopia", "Myopia", "High Myopia"))
myopia %>% # Data set piped into...
  ggplot() +   # This specifies the variables
  geom_mosaic(aes(x=product(Light), fill = Sight)) +  # Tell it to make a mosaic plot
  labs(title = "Mosaic Plot of Night Light Use by Level of Myopia",  # Make sure to title your plot 
       x = "Level of Light",   # Label the x axis
       y = "") +  # Remove y axis label
  scale_fill_grey(guide = guide_legend(reverse = TRUE))  # Make figure color
#> Warning: The `scale_name` argument of `continuous_scale()` is deprecated as of ggplot2
#> 3.5.0.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
#> Warning: The `trans` argument of `continuous_scale()` is deprecated as of ggplot2 3.5.0.
#> i Please use the `transform` argument instead.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
#> Warning: `unite_()` was deprecated in tidyr 1.2.0.
#> i Please use `unite()` instead.
#> i The deprecated feature was likely used in the ggmosaic package.
#>   Please report the issue at <https://github.com/haleyjeppson/ggmosaic>.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
```



\begin{center}\includegraphics[width=0.6\linewidth]{08-A17-EDA-categorical_files/figure-latex/unnamed-chunk-4-1} \end{center}

12.  What is similar and what is different between the segmented bar chart and the mosaic bar chart?

\vspace{1in}

13.  Explain why the bar for `Nightlight` is the widest in the mosaic plot.

\vspace{0.8in}

#### Relative Risk {-}

14.  Calculate the relative risk of myopia for children that slept with full light compared to those that slept with no light.

\vspace{0.8in}

15. Interpret the value of relative risk in context of the problem.

\vspace{1in}

16. Calculate the percent increase/decrease in risk of myopia for children that slept with full light compared to those that slept with no light.

\vspace{0.8in}

17. Interpret as a percent increase/decrease in risk in context of the problem.

\vspace{1in}

### Take-home messages

1.	Bar charts can be used to graphically display a single categorical variable either as counts or proportions.  Segmented bar charts and mosaic plots are used to display two categorical variables.

2. Segmented bar charts always have a scale from 0 - 100%. The bars represent the outcomes of the explanatory variable. Each bar is segmented by the response variable. If the heights of each segment are the same for each bar there is no association between variables.

3. Mosaic plots are similar to segmented bar charts but the widths of the bars also show the number of observations within each outcome. 


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
