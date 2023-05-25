## Week 3 Lab:  IPEDs

\setstretch{1}

### Learning outcomes

* Identify and create appropriate summary statistics and plots
  given a data set or research question for quantitative data.

* Interpret the following summary statistics in context:
  median, lower quartile, upper quartile, 
  standard deviation, interquartile range.

### Terminology review

In today's lab, we will review summary measures and plots for quantitative variables.  Some terms covered in this activity are:

* Two measures of center: mean, median

* Two measures of spread (variability): standard deviation, interquartile range (IQR)

* Types of graphs: box plots, dot plots, histograms

* Identify and create appropriate summary statistics and plots given a data set or research question for a single categorical and a single quantitative variable.

* Interpret the following summary statistics in context:
  median, lower quartile, upper quartile,
  standard deviation, interquartile range.

* Given a plot or set of plots, describe and compare the distribution(s)
  of a single quantitative variable
  (center, variability, shape, outliers).
  

To review these concepts, see Chapter 5 in the textbook.

### The Integrated Postsecondary Education Data System (IPEDS)

Upload and open the provided R script file for the week 3 lab to answer the following questions.  **Remember bolded questions will be answered on Gradescope for your group.**

These data are on a subset of institutions that met the following selection criteria [@ipeds]:

* Degree granting 

* United States only

* Title IV participating

* Not for profit

* 2-year or 4-year or above

* Has full-time first-time undergraduates

* Note that several variables have missing values for some institutions (denoted by “NA”).


\begin{center}\includegraphics[width=0.75\linewidth]{images/IPEDS_Description} \end{center}

#### Summary statistics for a single quantitative variable {-}

Look through the provided chart above showing the description of variables measured.  The UnitID and Name are identifiers for each observational unit, *US degree granting institutions in 2018*.  

1. Identify in the chart above which variables collected on the US institutions are categorical (C) and which variables are quantitative (Q).

\newpage

In Wednesday's activity, the code was provided to import the data set needed directly from the Stat 216 website.  Follow these steps to upload and import the data set for today's lab.

* Download the provided data set `IPED_Data_2018` from D2L

* Upload the data set `IPEDS_Data_2018` to the RStudio server using the same steps to upload the R script file.  

* Click on "Import Dataset" in the Environment tab in the upper right hand corner.  

* Choose "From Text(base)" in the drop-down menu and select the correct csv file.  

* Be sure that "Yes" is selected next to "Heading" in the pop-up screen.  Click "Import".  

* To view the data set, click on the data set name (`IPEDS_Data_2018`).  Verify that that column names match the first column in the chart on the previous page.  If the columns are named V1, V2, V3...etc, you did not select "Yes" for "Heading".

Enter the name of the data set (see the environment tab) for `datasetname` in the R script file in line 6.  We will look at the retention rates for the 4-year institutions only.  Enter the variable name `Retention` for `variable` in line 12.  Highlight and run lines 1 -- 12.  **Note that the two lines of code (lines 8 and 10) are filtering to remove the 2-year institutions so we are only assessing Public 4-year and Private 4-year institutions.**  The `favstats()` function from the `mosaic` package gives the summary statistics for a quantitative variable. The summary statistics give the two measures of center and two measures of spread for retention rate.


```r
IPEDS <- datasetname #Creates the object IPEDS 
IPEDS <- IPEDS %>%
  filter(Sector != "Public 2-year") #Filters the data set to remove Public 2-year
IPEDS <- IPEDS %>%
  filter(Sector != "Private 2-year") #Filters the data set to remove Private 2-year
IPEDS %>%
  summarise(favstats(variable)) #Gives the summary statistics
```

2.  **Report the value for quartile 3 and interpret this value in context of the study.**

\vspace{1in}

3.  Calculate the interquartile range (IQR = Q3 - Q1) for this study.

\vspace{0.5in}

4. Report and interpret the value of the standard deviation.

\vspace{1in}

5.  How many missing values are there?  What does this indicate?

\vspace{0.8in}

#### Displaying a single quantitative variable {-}

There are three type of plots used to plot a single quantitative variable: a dotplot, a histogram or a boxplot.  A dotplot of retention rates would plot a dot for the retention rate for each 4-year institution.

We will create both a histogram and a boxplot of the variable `Retention`.  Enter the name of the variable in both line 16 and line 23 for `variable` in the R script file.  **Give each plot a descriptive title.**  Highlight and run lines 15 -- 27 to give the histogram and boxplot. Notice that the **bin width** for the histogram is 10.  For example, the first bin consists of the number of 4-year institutions in the data set with a retention rate of 0 to 10\%.  It is important to note that a 4-year institution with a retention rate on the boundary of a bin will fall into the bin above it; for example, 10 would be counted in the bin 10--20. 

**Export and upload both plots to Gradescope for your group.**  

* To export the graphs:  in the bottom right corner in the Plots tab, click on `Export`.

* Then choose `Save as Image`.  Save the image as a png.  This will save your graph to the server.  

* In the Files tab, click on the box next to your saved image file, click `More` and choose `Export`.  This will save your file to your downloads folder on your computer.


```r
IPEDS %>% # Data set piped into...
ggplot(aes(x = variable)) +   # Name variable to plot
  geom_histogram(binwidth = 10) +  # Create histogram with specified binwidth 
  labs(title = "Title", # Title for plot
       x = "Rentention Rate", # Label for x axis
       y = "Frequency") # Label for y axis
```


```r
IPEDS %>% # Data set piped into...
ggplot(aes(x = variable)) +   # Name variable to plot
  geom_boxplot() +  # Create boxplot 
  labs(title = "Title", # Title for plot
       x = "Retention Rates", # Label for x axis
       y = "Frequency") # Label for y axis
```

6.  What is the shape of the distribution of retention rates?  

\newpage

7.  Sketch the boxplot created and identify the values of the 5-number summary (minimum value, Q1, median, Q3, maximum value) on the plot.  Use the following formulas to find the invisible fence on both ends of the distribution.  Draw a dotted line at the invisible fence to show how the outliers were found.

$$\text{Lower Fence: values} \le \text{Q}1 - 1.5\text{x}\text{IQR}$$

$$\text{Upper Fence: values} \ge \text{Q}3 + 1.5\text{x}\text{IQR}$$
\vspace{1.5in}

#### Robust Statistics {-}

Let's examine how the presence of outliers affect the values of center and spread. 

8.  Report the two measures of center (mean and median) for retention given in the R output.

\vspace{0.8in}

9.  Report the two measures of spread (standard deviation and IQR) for retention given in the R output.

\vspace{0.8in}

\newpage

To show the effect of outliers on the measures of center and spread, the smallest values of retention rate in the data set were increased by 30%. Highlight and run lines 30--38.  


```r
IPEDS %>% # Data set piped into...
  summarise(favstats(Retention_Inc))
```


```r
IPEDS %>% # Data set piped into...
  ggplot(aes(x = Retention_Inc)) +   # Name variable to plot
  geom_boxplot() +  # Create boxplot
  labs(title = "Boxplot of Adjusted Revenue of Movies in 2016", # Title for plot
       x = "Revenue (in Millions)", # Label for x axis
       y = "Frequency") # Label for y axis
```

10. Report the two measures of center for this new data set.

\vspace{0.8in}

11. Report the two measures of spread for this new data set.

\vspace{0.8in}

12. **Which measure of center is robust to (not affected by) outliers? Explain your answer.**

\vspace{0.5in}

13.  Which measure of spread is robust to outliers?  Explain your answer.

\vspace{0.5in}

#### Summarizing a single categorical and single quantitative variable {-}

Is there a difference in retention rates for public and private 4-year institutions? In the next part of the activity we will compare retention rates for public and private 4-year institutions.  Note that this variable (public or private) is labelled `Control` in the data set.

14.  **Based on the research question, which variable will we treat as the explanatory variable?  Response variable?**

\vspace{0.8in}

Enter the name of the explanatory variable and the name of the response variable in lines 42 and 45 of the R script file.  Remember that the variable name must be typed in EXACTLY as it is written in the data set. Highlight and run lines 41 -- 49 to find the summary statistics and create side by side boxplots of the data.


```r
IPEDS %>%  # Data set piped into...
  summarise(favstats(response~explanatory)) # Summary statistics for retention rates by sector
```


```r
IPEDS %>%  # Data set piped into...
  ggplot(aes(y = response, x = explanatory))+  # Identify variables
  geom_boxplot()+  # Create box plot
  labs(title = "Side by side box plot of retention rates by control",  # Title
       x = "Control",    # x-axis label
       y = "Retention Rates")  # y-axis label
```

15.  **Compare the two boxplots.**
    
     Which type of university has the highest center?
     \vspace{0.3in}
     
     Largest spread?
     \vspace{0.3in}
     
     What is the shape of each distribution?
     \vspace{0.3in}
     
     Does either distribution have outliers?
     \vspace{0.3in}
     
16. Report the difference in mean retention rates for private and public universities.  Use private minus public as the order of subtraction.  Use the appropriate notation.

\vspace{0.8in}

17.  Does there appear to be an association between retention rates and type of university?  Explain your answer.

\newpage

### Take-home messages

1.	Histograms, box plots, and dot plots can all be used to graphically display a single quantitative variable.  

2.  The box plot is created using the five number summary: minimum value, quartile 1, median, quartile 3, and maximum value.  Values in the data set that are less than $\text{Q}_1 - 1.5\text{xIQR}$ and greater than $\text{Q}_3 + 1.5\text{xIQR}$ are considered outliers and are graphically represented by a dot outside of the whiskers on the box plot.

3.  Data should be summarized numerically and displayed graphically to give us information about the study.

4.  When comparing distributions of quantitative variables we look at the shape, center, spread, and for outliers.  There are two measures of center: mean and the median and two measures of spread: standard deviation and the interquartile range, IQR = Q3 - Q1. 

5. The median and the interquartile range are robust statistics, meaning that they are not affected by very large or very small values.  When we have a skewed distribution the best measure of center is the median and the best measure of spread is the IQR.

\newpage
