## Guided Activity 4: Summarizing Categorical Data

\setstretch{1}

### Learning outcomes

* Identify and create appropriate summary statistics and plots given a data set or research question involving categorical variables.
  
### Terminology review

In today's activity, we will review summary measures and plots for categorical variables.  Some terms covered in this activity are:

* Categorical variable summary measure: proportion 

* Plots of categorical variables: bar plots, segmented bar plots, mosaic plots

To review these concepts, see Chapter 4 in the textbook.  

### The Integrated Postsecondary Education Data System (IPEDS)

These data were collected on a subset of institutions that met the following selection criteria [@ipeds]:

* Degree granting 

* United States only

* Title IV participating

* Not for profit

* 2-year or 4-year or above

* Has full-time first-time undergraduates

Some of the variables collected and their descriptions are below. Note that several variables have missing values for some institutions (denoted by “NA”).

| **Variable** 	| **Description** |
|----	|-------------	|
| `UnitID` | Unique institution identifier |
| `Name` | Institution name |
| `State` | State abbreviation |
| `Sector` | whether public or private |
| `LandGrant` | Is this a land-grant institution (Yes/No) |
| `Size` | Institution size category based on total student enrolled for credit, Fall 2018: Under 1,000, 1,000 - 4,999, 5,000 - 9,999, 10,000 - 19,999, 20,000 and above |
| `Cost_OutofState` | Cost of attendance for full-time out-of-state undergraduate students |
| `Cost_InState` | Cost of attendance for full-time in-state undergraduate students |
| `Retention` | Retention rate is the percent of the undergraduate students that re-enroll in the next year |
| `Graduation_Rate` | 6-year graduation rate for undergraduate students |
| `SATMath_75` | 75th percentile Math SAT score |
| `ACT_75` | 75th percentile ACT score |

\newpage

#### Identifing Variables in a data set {-}

Look through the provided chart showing the description of variables measured.  The UnitID and Name are identifiers for each observational unit, *US degree granting institutions in 2018*.  

1. Identify in the chart which variables collected on the US institutions are categorical (C) and which variables are quantitative (Q).

#### R code {-}

For almost all activities and labs it will be necessary to upload the provided R script file from D2L for that day.  Your instructor will highlight a few steps in uploading files to and using RStudio.  We encourage you to complete the R script file posted on D2L prior to the next class.

The following are the steps to upload the necessary R script file for this activity: 

* Download the IPEDS Activity R script file from D2L.
* Click "Upload" in the "Files" tab in the bottom right window of RStudio. In the pop-up window, click "Choose File", and navigate to the folder where the IPEDS Activity R script file is saved (most likely in your downloads folder). Click "Open"; then click "Ok". 
* You should see the uploaded file appear in the list of files in the bottom right window. Click on the file name to open the file in the Editor window (upper left window).

Notice that the first four lines of code contain a prompt called, `library`.  Packages needed to run functions in R are stored in directories called libraries.  When using the MSU RStudio server, all the packages needed for the class are already installed.  We simply must tell R which packages we need for each R script file.  We use the prompt `library` to load each **package** (or library) needed for each activity. Note, these `library` lines MUST be run each time you open a R script file in order for the functions in R to work. 

* Highlight and run lines 1--4 to load the packages needed for this activity. Notice the use of the \# symbol in the R script file.  This symbol is not part of the R code. It is used by these authors to add comments to the R code and explain what each call is telling the program to do.
R will ignore everything after a \# symbol when executing the code. Refer to the instructions following the \# symbol to understand what you need to enter in the code.


```r
library(tidyverse)
library(ggplot2)
library(mosaic)
library(ggmosaic)
```
Throughout activities, we will often include the R code you would use in order to produce output or plots. These "code chunks" appear in gray. In the code chunk below, we demonstrate how to read the data set into R using the `read.csv()` function.  The line of code shown below (line 7 in the R script file) reads in the data set and names the data set `IPEDS`.  

* Highlight and run line 7 in the R script file to load the data from the Stat 216 webpage.  


```r
# This will read in the data set
IPEDS <- read.csv("https://www.math.montana.edu/courses/s216/data/IPEDS_2018.csv") 
```

* Click on the data set name (`IPEDS`) in the Environment tab (upper right window).  This will open the data set in a 2nd tab in the Editor window (upper left window).  R is case sensitive, which means that you must always type the name of a variable EXACTLY as it is written in the data set including upper and lower case letters and without misspellings!  

2. Write down the number of observational units and the number of variables collected in the data set.

\vspace{0.3in}
\newpage

Since we are only interested in assessing 4-year institutions we will filter out the 2-year institutions from the data set. 

* Highlight and run lines 9--12 to filter out the 2-year institutions.


```r
IPEDS <- IPEDS %>%
  filter(Sector != "Public 2-year") #Filters the data set to remove Public 2-year
IPEDS <- IPEDS %>%
  filter(Sector != "Private 2-year") #Filters the data set to remove Private 2-year
```

3. Write down the number of 4-year institutions in the data set.

\vspace{0.1in}

#### Summarizing categorical variables {-}

An important part of understanding data is to create visual pictures of what the data represent.  In this activity, we will create graphical representations of categorical data.  

There are four categorical variables in this data set. `Sector`, `Size`, `LandGrant`, and `Tenure`.

#### Displaying a single categorical variable {-}

If we wanted to know how many 4-year institutions in our data set were in each category of size, we could create a frequency bar plot of the variable `Size`.  

* In the R code below (and the provided R script file), we will enter the variable name, `Size` (*note the capital S*), for `variable` into the `ggplot` code. This is in line 18 in the R script file.  

* Highlight and run lines 16--22 to create the plot. Note: this is a **frequency** bar plot plotting counts (the number of institutions within each level of `Size` is displayed on the $y$-axis).  


```r
IPEDS$Size <- factor(IPEDS$Size, levels = c("< 1000", "1,000-4,999",
                                            "5,000-9,999", "10,000-19,999", "20,000 and above"))
IPEDS %>% # Data set piped into...
ggplot(aes(x = Size)) +   # This specifies the variable
  geom_bar(stat = "count") +  # Tell it to make a bar plot
  labs(title = "Frequency Bar Plot of Size of 4-year US Institutions",  
       # Give your plot a title
       x = "Student Population Size",   # Label the x axis
       y = "Frequency")  # Label the y axis
```



\begin{center}\includegraphics[width=0.5\linewidth]{03-GA03-EDA_files/figure-latex/unnamed-chunk-4-1} \end{center}

4. Using the bar chart created, estimate how many institutions have more than 10,000 students.

\vspace{0.2in}
\newpage 

We could also choose to display the data as a proportion in a **relative frequency** bar plot. To find the relative frequency, the count in each level of `Size` is divided by the sample size.  This calculation is the sample proportion for each level of size. Notice that in this code we told R to create a bar plot with proportions.  

* In the R script file, enter the variable name `Size` for `variable` in line 27.

* Highlight and run lines 26 - 31 to create the relative frequency bar plot.


```r
IPEDS %>% # Data set piped into...
ggplot(aes(x = Size)) +   # This specifies the variable
  geom_bar(aes(y = after_stat(prop), group = 1)) +  # Tell it to make a bar plot with proportions
  labs(title = "Relative Frequency Bar Plot of Size for 4-year 
       US Institutions",  
       # Give your plot a title
       x = "Student Population Size",   # Label the x axis
       y = "Relative Frequency")  # Label the y axis
```



\begin{center}\includegraphics[width=0.5\linewidth]{03-GA03-EDA_files/figure-latex/unnamed-chunk-5-1} \end{center}

5.  Which features in the relative frequency bar plot are the same as the frequency bar plot?  Which are different?

\vspace{0.3in}

In R, to get the counts for each level of a variable use the function `count`.

* In the R script file, enter the variable name `Size` for `variable` in line 35.

* Highlight and run line 35.


```r
IPEDS %>% count(Size)
```

```
#>               Size   n
#> 1           < 1000 490
#> 2      1,000-4,999 842
#> 3      5,000-9,999 259
#> 4    10,000-19,999 210
#> 5 20,000 and above 166
```
6. Calculate the proportion of 4-year Institutions that have a student population size of between 1,000-4,999?  Use appropriate notation.

\vspace{0.4in}
\newpage

#### Displaying two categorical variables {-}

Is there an association between the student population size of an institution and whether it is public or private institution?  In this instance we will treat the variable `Sector` as the explanatory variable and `Size` as the response variable. 

*  Fill in the name of the explanatory variable, `Sector` for explanatory and name of the response variable, `Size` in line 39 in the R script file.  

* Highlight and run line 39 to get the counts for each combination of levels of variables. 


```r
IPEDS %>% group_by(Sector) %>% count(Size) %>% print(n=10)
```

```
#> # A tibble: 10 x 3
#> # Groups:   Sector [2]
#>    Sector                  Size                 n
#>    <chr>                   <fct>            <int>
#>  1 Private 4-year or above < 1000             457
#>  2 Private 4-year or above 1,000-4,999        639
#>  3 Private 4-year or above 5,000-9,999         95
#>  4 Private 4-year or above 10,000-19,999       54
#>  5 Private 4-year or above 20,000 and above    21
#>  6 Public 4-year or above  < 1000              33
#>  7 Public 4-year or above  1,000-4,999        203
#>  8 Public 4-year or above  5,000-9,999        164
#>  9 Public 4-year or above  10,000-19,999      156
#> 10 Public 4-year or above  20,000 and above   145
```
Below is a contingency table of the data.

\begin{center}
\begingroup
\setlength{\tabcolsep}{14pt} % Default value: 6pt
\renewcommand{\arraystretch}{2} % Default value: 1
\begin{tabular}{|c|c|c|c|}
\hline
 & \multicolumn{2}{|c|}{\textbf{Sector}} & \\ \hline
\textbf{Size} & Public & Private & Total \\ \hline
 \text{<1000} & 33 & 457 & 490 \\ \hline
 \text{1000-4999} & 203 & 639 & 842 \\ \hline
 \text{5000-9999} & 164 & 95 & 259 \\ \hline
 \text{10000-19999} & 156 & 54 & 210 \\ \hline
 \text{20000 and above} & 145 & 21 & 166 \\ \hline
 Total & 701 & 1266 & 1967 \\ \hline  
\end{tabular}
\endgroup
\end{center}

In the following questions, use the table to calculate the described proportions.  Notation is important for each calculation. Since this is sample data, it is appropriate to use statistic notation for the proportion, $\hat{p}$. When calculating a proportion dependent on a single level of a variable, subscripts are needed when reporting the notation.

7.  Calculate the proportion of institutions that are public. Use appropriate notation.
\vspace{0.4in}

8.  Calculate the proportion of public institutions that have 1000 - 4999 students. Use appropriate notation.
\vspace{0.4in}

9.  Calculate the proportion of private institutions that have 1000 - 4999 students. Use appropriate notation.
\vspace{0.4in}

10.  Calculate the difference in proportion of institutions that have 1000 - 4999 students for those that are public minus those that are private. Give the appropriate notation. Use public minus private as the order of subtraction.
\vspace{0.5in}

11.  Interpret the difference in proportion calculated in question 9 in context of the study.

\vspace{0.6in}

Two types of plots can be created to display two categorical variables.  To examine the association between the student population size of an institution and whether it is public or private institution, we will first create a segmented bar plot of `Sector` segmented by `Size`.  

* To create the segmented bar plot enter the variable name, `Sector` for `explanatory` and the variable name, `Size` for `response` in line 44 in the R script file.

* Highlight and run lines 43--50.


```r
IPEDS %>% # Data set piped into...
ggplot(aes(x = Sector, fill = Size)) +   # This specifies the variables
  geom_bar(stat = "count", position = "fill") +  # Tell it to make a stacked bar plot
  labs(title = "Segmented Bar Plot of Student Population Size by 
       Sector for 4-year Institutions",  # Make sure to title your plot 
       x = "Sector",   # x axis label
       y = "Relative Frequency")  + # y axis label
  scale_fill_grey()  # Make figure color
```



\begin{center}\includegraphics[width=0.6\linewidth]{03-GA03-EDA_files/figure-latex/unnamed-chunk-8-1} \end{center}


12. From the segmented bar plot, which sector has the highest proportion of student population size of 1000 - 4999?

\vspace{0.5in}
\newpage

We could also create a mosaic plot of the data, shown below.  


```r
IPEDS %>% #Data set piped into...
  ggplot() +   #This specifies the variables
  geom_mosaic(aes(x=product(Sector), fill = Size)) +  #Tell it to make a mosaic plot
  labs(title = "Mosaic Plot of Student Population Size by 
       Sector for 4-year Institutions", #Make sure to title your plot 
       x = "Sector",   #Label the x axis
       y = "") + #Remove y axis label
scale_fill_grey()  # Make figure bw
```



\begin{center}\includegraphics[width=0.6\linewidth]{03-GA03-EDA_files/figure-latex/unnamed-chunk-9-1} \end{center}

13.  What is similar and what is different between the segmented bar chart and the mosaic bar chart?

\vspace{1in}


### Take-home messages

1.	Bar charts can be used to graphically display a single categorical variable either as counts or proportions.  Segmented bar charts and mosaic plots are used to display two categorical variables.

2. Segmented bar charts always have a scale from 0 -- 100\%. The bars represent the outcomes of the explanatory variable. Each bar is segmented by the response variable. If the heights of each segment are the same for each bar there is no association between variables.

3. Mosaic plots are similar to segmented bar charts but the widths of the bars also show the number of observations within each outcome. This allows assessment of the relative sizes of the levels of one variable in assessing changes in relative distributions of the levels of the other variable and the proportions of the totals in each combination of levels.

\newpage

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage

