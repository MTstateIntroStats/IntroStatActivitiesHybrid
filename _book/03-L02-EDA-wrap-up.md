---
output:
  pdf_document: default
  html_document: default
---
## Module 3 Lab:  IPEDs

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


\begin{center}\includegraphics[width=0.77\linewidth]{images/IPEDS_Description} \end{center}

#### Summary statistics for a single quantitative variable {-}

Look through the provided chart above showing the description of variables measured.  The UnitID and Name are identifiers for each observational unit, *US degree granting institutions in 2018*.  

1. Identify in the chart above which variables collected on the US institutions are categorical (C) and which variables are quantitative (Q).

\newpage

In the previous activities this week, the code was provided to import the data set needed directly from the Stat 216 website.  Follow these steps to upload and import the data set for today's lab.

* Download the provided data set `IPED_Data_2018` from D2L

* Upload the data set `IPEDS_Data_2018` to the RStudio server using the same steps to upload the R script file.  

* Click on "Import Dataset" in the Environment tab in the upper right hand corner.  

* Choose "From Text(base)" in the drop-down menu and select the correct csv file.  

* Be sure that "Yes" is selected next to "Heading" in the pop-up screen.  Click "Import".  

* To view the data set, click on the data set name (`IPEDS_Data_2018`).  Verify that that column names match the first column in the chart on the previous page.  If the columns are named V1, V2, V3...etc, you did not select "Yes" for "Heading".

Teams will also need the R script file for this week's lab. 

* Download the provided R script file from D2L

* Upload the R script file to the RStudio server

* Enter the name of the data set (see the environment tab) for `datasetname` in the R script file in line 9.  

* We will look at the retention rates for the 4-year institutions only.  Enter the variable name `Retention` for `variable` in line 15.  

* Highlight and run lines 1 -- 15.  **Note that the two lines of code (lines 10 and 12) are filtering to remove the 2-year institutions so we are only assessing Public 4-year and Private 4-year institutions.**  

The `favstats()` function from the `mosaic` package gives the summary statistics for a quantitative variable. The summary statistics give the two measures of center and two measures of spread for retention rates for 4-year institutions.


```r
IPEDS <- datasetname #Creates the object IPEDS 
IPEDS <- IPEDS %>%
  filter(Sector != "Public 2-year") #Filters the data set to remove Public 2-year
IPEDS <- IPEDS %>%
  filter(Sector != "Private 2-year") #Filters the data set to remove Private 2-year
IPEDS %>%
  summarise(favstats(variable)) #Gives the summary statistics
```

2. Identify the observational units for this study after removing the 2-year institutions.

\vspace{0.3in}

3. **Report the value for quartile 3 and interpret this value in context of the study.**

\vspace{0.8in}

4. Report and interpret the value of the standard deviation.

\vspace{0.8in}

5.  How many missing values are there?  What does this indicate?

\vspace{0.3in}


#### Robust Statistics {-}

Let's examine how the presence of outliers affect the values of center and spread. 

6.  Report the two measures of center (mean and median) for retention rates given in the R output.

\vspace{0.4in}

7.  Report the value of the standard deviation and calculate the value of the IQR (two measures of spread) for retention rates from the R output.

\vspace{0.4in}

To show the effect of outliers on the measures of center and spread, the smallest values of retention rate in the data set were increased by 30%. 

* Highlight and run lines 19--20 in the R script file. 


```r
IPEDS %>% # Data set piped into...
  summarise(favstats(Retention_Inc))
```

8. Report the two measures of center for this new data set.

\vspace{0.4in}

9. Report the two measures of spread for this new data set.

\vspace{0.4in}

10. **Which measure of center is robust to (not affected by) outliers? Explain your answer.**

\vspace{0.5in}

11.  Which measure of spread is robust to outliers?  Explain your answer.

\vspace{0.5in}

#### Summarizing a single categorical and single quantitative variable {-}

Is there a difference in retention rates for public and private 4-year institutions? In the next part of the activity we will compare retention rates for public and private 4-year institutions.  Note that this variable (public or private) is labelled `Sector` in the data set.

12.  **Based on the research question, which variable will we treat as the explanatory variable?  Response variable?**

\vspace{0.8in}

* To assess the research question described before question 12, enter the name of the explanatory variable and the name of the response variable in lines 28 and 31 of the R script file.  Remember that the variable name must be typed in EXACTLY as it is written in the data set. 

* Replace the word title (line 33) between the quotations with a descriptive title.  **A title should include: type of plot, variable or variables plotted, and observational units.**  

* Highlight and run lines 27 -- 35 to find the summary statistics and create side by side boxplots of the data.

* **Export and upload the side-by-side box plot to Gradescope for your group.**

    * To export the graph: in the bottom right corner in the Plots tab, click on `Export`

    * Choose `Save as Image.` Save the image as a png.  This will save your graph to the server.

    * In the `Files` tab, click on the box next to your saved image file, click `More` and choose `Export`. This will save your file to your downloads folder on your computer.


```r
IPEDS %>%  # Data set piped into...
  reframe(favstats(response~explanatory)) # Summary statistics for retention rates by sector
```


```r
IPEDS %>%  # Data set piped into...
  ggplot(aes(y = response, x = explanatory))+  # Identify variables
  geom_boxplot()+  # Create box plot
  labs(title = "title",  # Give your plot a title
       x = "Sector",    # x-axis label
       y = "Retention Rates")  # y-axis label
```

13.  **Compare the two boxplots.**
    
     Which type of university has the highest center?
     \vspace{0.3in}
     
     Largest spread?
     \vspace{0.3in}
     
     What is the shape of each distribution?
     \vspace{0.3in}
     
     Does either distribution have potential outliers?
     \vspace{0.3in}
     
14. Report the difference in mean retention rates for private and public universities.  Use private minus public as the order of subtraction.  Use the appropriate notation.

\vspace{0.8in}

15.  Does there appear to be an association between retention rates and type of university?  Explain your answer using the boxplots and summary statistic.

\vspace{0.3in}

#### Summarizing two categorical variables {-}

Are private 4-year institutions smaller than public one? The following set of code will create a segmented bar plot of size of the institution by sector. 

* Enter the variable `Sector` for explanatory and `Size` for response in line 41. 

* Highlight and run lines 40 - 46 in the R script file.


```r
IPEDS %>%
  ggplot(aes(x=explanatory, fill = response)) + # Enter the explanatory and response variables
  geom_bar(stat = "count", position = "fill") + # Create a segmented bar plot
  labs(title = "Segmented Bar Plot of Sector by Size for 
       4-year Institutions", # Title
       x = "Sector", # x-axis label
       y = "Relative Frequency") # y-axis label
```

16. Does there appear to be an association between sector and size of 4-year institutions? Explain your answer using the plot.

\vspace{0.5in}

<!-- ### Take-home messages -->

<!-- 1.	Histograms, box plots, and dot plots can all be used to graphically display a single quantitative variable.   -->

<!-- 2.  The box plot is created using the five number summary: minimum value, quartile 1, median, quartile 3, and maximum value.  Values in the data set that are less than $\text{Q}_1 - 1.5\text{xIQR}$ and greater than $\text{Q}_3 + 1.5\text{xIQR}$ are considered outliers and are graphically represented by a dot outside of the whiskers on the box plot. -->

<!-- 3.  Data should be summarized numerically and displayed graphically to give us information about the study. -->

<!-- 4.  When comparing distributions of quantitative variables we look at the shape, center, spread, and for outliers.  There are two measures of center: mean and the median and two measures of spread: standard deviation and the interquartile range, IQR = Q3 $-$ Q1.  -->

<!-- 5. The median and the interquartile range are robust statistics, meaning that they are not affected by very large or very small values.  When we have a skewed distribution the best measure of center is the median and the best measure of spread is the IQR. -->

\newpage
