## Out-of-Class Activity Module 3: Summarizing Categorical Variables

\setstretch{1}

### Learning outcomes

* Identify and create appropriate summary statistics and plots given a data set or research question involving categorical variables.
  
* Plots for a single categorical variable: bar plot.

* Plots for association between two categorical variables:
  segmented bar plot, mosaic plot.
  
### Terminology review

In today's activity, we will review summary measures and plots for categorical variables.  Some terms covered in this activity are:

* Proportions 

* Bar plots

* Segmented bar plots

* Mosaic plots

To review these concepts, see Chapter 4 in the textbook.  

### Graphing categorical variables

For this out-of-class activity we will walk through how to use the statistical package R to analyze data through the IDE (integrated development environment) RStudio.  Even though the completed code is provided for you in this activity, we recommend that you login to the RStudio server and follow along to see how to create the plots and get the summary statistics for categorical data.

For almost all activities and labs it will be necessary to upload the provided R script file from D2L for that day.  Follow these steps to upload the necessary R script file for this activity: 

* Download the Myopia Activity R script file from D2L.
* Click "Upload" in the "Files" tab in the bottom right window of RStudio. In the pop-up window, click "Choose File", and navigate to the folder where the Myopia Activity R script file is saved (most likely in your downloads folder). Click "Open"; then click "Ok". 
* You should see the uploaded file appear in the list of files in the bottom right window. Click on the file name to open the file in the Editor window (upper left window).

Notice that the first three lines of code contain a prompt called, `library`.  Packages needed to run functions in R are stored in directories called libraries.  When using the MSU RStudio server, all the packages needed for the class are already installed.  We simply must tell R which packages we need for each R script file.  We use the prompt `library` to load each **package** (or library) needed for each activity. Note, these `library` lines MUST be run each time you open a R script file in order for the functions in R to work. 

* Highlight and run lines 1--3 to load the packages needed for this activity. Notice the use of the \# symbol in the R script file.  The \# sign is not part of the R code. It is used by these authors to add comments to the R code and explain what each call is telling the program to do.
R will ignore everything after a \# sign when executing the code. Refer to the instructions following the \# sign to understand what you need to enter in the code.

### Nightlight use and myopia {-}

In a study reported in *Nature* [@quinn1999], a survey of 479 children found that those who had slept with a nightlight or in a fully lit room before the age of two had a higher incidence of nearsightedness (myopia) later in childhood.

In this study, there are two variables studied: `Light`: level of light in room at night (no light, nightlight, full light) and `Sight`: level of myopia developed later in childhood (high myopia, myopia, no myopia).  

1. Which variable is the explanatory variable? Which is the response variable?

\vspace{0.8in}

An important part of understanding data is to create visual pictures of what the data represent.  In this activity, we will create graphical representations of categorical data.  

#### R code {-}

Throughout these activities, we will often include the R code you would use in order to produce output or plots. These "code chunks" appear in gray. In the code chunk below, we demonstrate how to read the data set into R using the `read.csv()` function.  The line of code shown below (line 6 in the R script file) reads in the data set and names the data set `myopia`.  

* Highlight and run line 6 in the R script file to load the data from the Stat 216 webpage.


```r
# This will read in the data set
myopia <- read.csv("https://math.montana.edu/courses/s216/data/ChildrenLightSight.csv") 
```

* Click on the data set name (`myopia`) in the Environment tab (upper right window).  This will open the data set in a 2nd tab in the Editor window (upper left window).  R is case sensitive, which means that you must always type the name of a variable EXACTLY as it is written in the data set including upper and lower case letters and without misspellings!  

There are two variables in this data set. `Light` with three possible outcomes: `Full Light`, `Nightlight`, and `No Light` and `Sight` with three possible outcomes: `High Myopia`, `Myopia`, and `No Myopia`.

#### Displaying a single categorical variable {-}

If we wanted to know how many children in our data set were in each level of myopia, we could create a frequency bar plot of the variable `Sight`.  

* In the R code below (and the provided R script file), we will enter the variable name, `Sight` (*note the capital S*), for `variable` into the `ggplot` code. This is in line 12 in the R script file.  

* Highlight and run lines 11--16 to create the plot. Note: this is a **frequency** bar plot plotting counts (the number of children in each level of sight is displayed on the $y$-axis).  


```r
myopia %>% # Data set piped into...
ggplot(aes(x = varible)) +   # This specifies the variable
  geom_bar(stat = "count") +  # Tell it to make a bar plot
  labs(title = "Frequency Bar Plot of Level of Myopia for Children",  
       # Give your plot a title
       x = "Level of Myopia",   # Label the x axis
       y = "Frequency")  # Label the y axis
```
\newpage

Frequency bar plot of sight:


```r
myopia %>% # Data set piped into...
ggplot(aes(x = Sight)) +   # This specifies the variable
  geom_bar(stat = "count") +  # Tell it to make a bar plot
  labs(title = "Frequency Bar Plot of Level of Myopia for Children",  
       # Give your plot a title
       x = "Level of Myopia",   # Label the x axis
       y = "Frequency")  # Label the y axis
```



\begin{center}\includegraphics[width=0.5\linewidth]{03-OCA02-EDA_files/figure-latex/unnamed-chunk-3-1} \end{center}

2. Using the bar chart created, estimate how many children have some level of myopia.

\vspace{0.2in}

We could also choose to display the data as a proportion in a **relative frequency** bar plot. To find the relative frequency, the count in each level of myopia is divided by the sample size.  This calculation is the sample proportion for each level of myopia. Notice that in this code we told R to create a bar plot with proportions.  


```r
myopia %>% # Data set piped into...
ggplot(aes(x = Sight)) +   # This specifies the variable
  geom_bar(aes(y = after_stat(prop), group = 1)) +  # Tell it to make a bar plot with proportions
  labs(title = "Relative Frequency Bar Plot of Level of Myopia for Children",  # Give your plot a title
       x = "Level of Myopia",   # Label the x axis
       y = "Relative Frequency")  # Label the y axis
```



\begin{center}\includegraphics[width=0.5\linewidth]{03-OCA02-EDA_files/figure-latex/unnamed-chunk-4-1} \end{center}

3.  Which features in the relative frequency bar plot are the same as the frequency bar plot?  Which are different?

\vspace{0.3in}

#### Displaying two categorical variables {-}

Is there an association between the level of light in a room and the development of myopia?  

*  Fill in the name of the explanatory variable, `Light` for explanatory and name of the response variable, `Sight` in line 29 in the R script file.  

* Highlight and run line 29 to get the counts for each combination of levels of variables. 


```r
myopia %>% group_by(explanatory) %>% count(response)
```

Here is the completed code and R output:


```r
myopia %>% group_by(Light) %>% count(Sight) %>% print(n=9)
#> # A tibble: 9 x 3
#> # Groups:   Light [3]
#>   Light      Sight           n
#>   <chr>      <chr>       <int>
#> 1 Full Light High Myopia     5
#> 2 Full Light Myopia         42
#> 3 Full Light No Myopia      38
#> 4 Nightlight High Myopia     9
#> 5 Nightlight Myopia         65
#> 6 Nightlight No Myopia     149
#> 7 No Light   High Myopia     2
#> 8 No Light   Myopia         15
#> 9 No Light   No Myopia     154
```

4.  Fill in the following table with the values from the R output.

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

5.  Calculate the proportion of children with no myopia. Use appropriate notation.
\vspace{0.3in}

6.  Calculate the proportion of children with no myopia among those that slept with full light. Use appropriate notation.
\vspace{0.3in}

7.  Calculate the proportion of children with no myopia among those that slept with no light. Use appropriate notation.
\vspace{0.3in}

8.  Calculate the difference in proportion of children with no myopia for those that slept with full light minus those who slept with no light. Give the appropriate notation. Use full light minus no light as the order of subtraction.
\vspace{0.4in}

9.  Interpret the difference in proportion calculated in question 8 in context of the study.

\vspace{0.5in}

Two types of plots can be created to display two categorical variables.  To examine the differences in level of myopia for the level of light, we will first create a segmented bar plot of `Light` segmented by `Sight`.  

* To create the segmented bar plot enter the variable name, `Light` for `explanatory` and the variable name, `Sight` for `response` in line 35 in the R script file.

* Highlight and run lines 34--40.


```r
myopia %>% # Data set piped into...
ggplot(aes(x = explanatory, fill = response)) +   # This specifies the variables
  geom_bar(stat = "count", position = "fill") +  # Tell it to make a stacked bar plot
  labs(title = "Segmented Bar Plot of Night Light Use by Level of 
       Myopia for Children",  # Make sure to title your plot 
       x = "Level of Light",   # x axis label
       y = "Relative Frequency")  + # y axis label
  scale_fill_viridis_d()  # Make figure color
```

Segmented bar plot of Night Light Use by Level of Myopia:


```r
myopia %>% # Data set piped into...
ggplot(aes(x = Light, fill = Sight)) +   # This specifies the variables
  geom_bar(stat = "count", position = "fill") +  # Tell it to make a stacked bar plot
  labs(title = "Segmented Bar Plot of Night Light Use by Level 
       of Myopia for Children",  # Make sure to title your plot 
       x = "Level of Light",   # x axis label
       y = "Relative Frequency") + # y axis label
    scale_fill_grey()
```



\begin{center}\includegraphics[width=0.6\linewidth]{03-OCA02-EDA_files/figure-latex/unnamed-chunk-8-1} \end{center}

10. From the segmented bar plot, which level of light has the highest proportion of `No Myopia`?

\vspace{0.5in}

\newpage

We could also create a mosaic plot of the data, shown below.  


```r
myopia$Sight <- factor(myopia$Sight, levels = c("No Myopia", "Myopia", "High Myopia"))
myopia %>% #Data set piped into...
  ggplot() +   #This specifies the variables
  geom_mosaic(aes(x=product(Light), fill = Sight)) +  #Tell it to make a mosaic plot
  labs(title = "Mosaic Plot of Night Light Use by Level of Myopia", #Make sure to title your plot 
       x = "Level of Light",   #Label the x axis
       y = "") +  #Remove y axis label
  scale_fill_grey(guide = guide_legend(reverse = TRUE))  #Make figure color
```



\begin{center}\includegraphics[width=0.6\linewidth]{03-OCA02-EDA_files/figure-latex/unnamed-chunk-9-1} \end{center}

11.  What is similar and what is different between the segmented bar chart and the mosaic bar chart?

\vspace{1in}

12.  Explain why the bar for `Nightlight` is the widest in the mosaic plot.

\vspace{0.8in}

\newpage

### Take-home messages

1.	Bar charts can be used to graphically display a single categorical variable either as counts or proportions.  Segmented bar charts and mosaic plots are used to display two categorical variables.

2. Segmented bar charts always have a scale from 0 -- 100\%. The bars represent the outcomes of the explanatory variable. Each bar is segmented by the response variable. If the heights of each segment are the same for each bar there is no association between variables.

3. Mosaic plots are similar to segmented bar charts but the widths of the bars also show the number of observations within each outcome. This allows assessment of the relative sizes of the levels of one variable in assessing changes in relative distributions of the levels of the other variable and the proportions of the totals in each combination of levels.


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage

