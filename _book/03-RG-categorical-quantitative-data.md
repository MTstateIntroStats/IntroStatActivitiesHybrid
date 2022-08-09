# Exploring Categorical and Quantitative Data

## Module 3 Reading Guide: Introduction to `R`, Categorical Variables, and a Single Quantitative Variable

### Section 1.7 (Data in `R`) {-}

**Videos**  

* Starting_with_R

\setstretch{1.25}

#### Notes {-}

`R` is case sensitive, meaning it reads `data` differently from `Data`.  If you get an error message, check that your capitalization is correct.

`R` does not like spaces or special characters  This means the column and row headers in the data set should not have spaces, periods, commas, etc.  Instead of titling the variable `column header`, use `column_header` or `ColumnHeader`.

**Tidy data**:  Data frames with

\rgi 1 row per ________________, 

\rgi 1 column per ____________.

We highly recommend completing Tutorial 1 at the end of Chapter 1 (all four lessons) to give you practice with R/RStudio AND to help reflect on the content of Chapter 1: basics of data, sampling, study design, and scope of inference.  These tutorials have some content questions and some places for you to practice using R online with some guidance.

\rgi __ indicate spots you need to type in functions, data sets, or variable names.

\rgi There are Hint and Solution buttons on the R code box to help you.

We would not expect you to know the coding right now, especially for things like mutations or creating new variables in the data set.  But seeing some initial coding for these more difficult functions will only make you more comfortable using the functions needed for this course!
	
#### Functions {-}

State what these introductory functions do in `R`:

`glimpse(data_set_name)`

`head(data_set_name)`

`data_set_name$variable_name`

`%>%`

`<-`

### Section 2.1 (Exploring categorical data) {-}

\setstretch{1}

**Videos**  

* 2.1
* MosaicPlots

\setstretch{1.25}

#### Vocabulary {-}

Frequency table:
\rgs

Relative frequency table:
\rgs

Contingency or two-way table:
\rgs

Unconditional proportion:
\rgs

Conditional proportion:
\rgs

\rgi Row proportions:
\rgs

\rgi Column proportions:
\rgs

Statistic:
\rgs

\rgi Sample proportion:
\rgs

\rgi \rgi Notation:
\rgs

Parameter:
\rgs

\rgi Population proportion:
\rgs

\rgi \rgi Notation:
\rgs

Bar plot:
\rgs

Segmented bar plot:
\rgs

Simpson’s Paradox:
\rgs


#### Notes {-}

In a contingency table, which variable (explanatory or response) generally will make the columns of the table?  Which variable will make the rows of the table?
\rgs

In a segmented bar plot, the bars represent the levels of which variable?  The segments represent the levels of which variable?
\rgs

What type of plot(s) are appropriate to display a single categorical variable?
\rgs


What type of plot(s) are appropriate to display two categorical variables?
\rgs


What is the difference between a standardized segmented bar plot and a mosaic plot?
\rgs

True or false: Pie charts are generally highly recommended ways to graphically display categorical data.

True or false: Two categorical variables are associated if the conditional proportions of a particular outcome (typically of the response variable) differ across levels of the other variable (typically the explanatory variable).

True or false: When a segmented bar plot has segments that sum to 1 (or 100%), the segment heights correspond to the proportions conditioned on the **segment**.

#### Review of Simpson’s Paradox {-}

Based on the segmented bar plot in Figure 2.6, which race of defendant was more likely to have the death penalty invoked?
\rgs

Based on the segmented bar plot in Figure 2.7 and Table 2.9, which race of defendant was more likely to have the death penalty invoked when the victim was Caucasian?
\rgs

Based on the segmented bar plot in Figure 2.7 and Table 2.9, which race of defendant was more likely to have the death penalty invoked when the victim was African American?
\rgs

The direction of the relationship between the ______________
and ______________ variables is **reversed** when accounting for
a ______________ variable.
\rgs



### Section 2.3 (Exploring quantitative data) {-}

**Videos**  

* 2.3

#### Type of Plots {-}

Scatterplot:
\rgs

Dot plot:
\rgs

Histogram:
\rgs

Density plot:
\rgs

Box plot:
\rgs


#### Vocabulary {-}

Four characteristics of a scatterplot:

\rgi Form:
\rgs

\rgi Strength:
\rgs

\rgi Direction:
\rgs

\rgi Unusual observations or outliers:
\rgs

Data density:
\rgs

Tail:
\rgs

Skew:
\rgs

Symmetric:
\rgs

Modality:
\rgs

Distribution (of a variable):
\rgs

\rgi Four characteristics of the distribution of one quantitative variable:
	
\rgi Center:
\rgs

\rgi Variability:
\rgs

\rgi Shape:
\rgs

\rgi Outliers:
\rgs

Point estimate:
\rgs

Deviation:
\rgs

Five number summary:
\rgs

$X^{th}$ percentile:
\rgs

Interquartile range (IQR):
\rgs

Robust statistics:
\rgs

#### Notes {-}

What type of plot(s) are appropriate for displaying one quantitative variable?
\rgs

What type of plot(s) are appropriate for displaying two quantitative variables?
\rgs

What type of plot(s) are appropriate for displaying one quantitative variable and one categorical variable?
\rgs

What are the two ways to measure the ‘center’ of a distribution?  Which one is considered robust to skew/outliers?
\rgs

What are the three ways to measure the ‘variability’ of a distribution?  Which one is considered robust to skew/outliers?
\rgs

How are variance and standard deviation related?
\rgs

Fill in the following table with the appropriate notation.
\begin{center}
\begin{tabular}{|l|p{2in}|p{2in}|} \hline
Summary Measure & Parameter & Statistic \\ \hline
Mean & & \\ 
& & \\ \hline
Variance & & \\ 
& & \\ \hline
Standard deviation & & \\ 
& & \\ \hline
\end{tabular}
\end{center}

How are outliers denoted on a box plot?  How can you mathematically determine if a data set has outliers?
\rgs


### Section 2.4 (`R`: Exploratory data analysis) and Section 2.5 (Chapter 2 review) {-}

Section 2.4 presents four tutorials on analyzing quantitative data in `R`.  We recommend you complete all four.

#### Notes {-}

Statistics summarize _____________ .  
Parameters summarize _____________.

Fill in the following table with the appropriate notation for each summary measure.

\begin{center}
\begin{tabular}{|l|p{2in}|p{2in}|}\hline
Summary measure & Statistic & Parameter \\ \hline
Sample size & & \\ 
& & \\ 
& & \\ \hline
Proportion & & \\ 
(used to summarize & & \\ 
one categorical variable) & & \\ \hline
Mean & & \\ 
(used to summarize & & \\ 
one quantitative variable)& & \\ \hline
Correlation & & \\ 
(used to summarize & & \\ 
two quantitative variables)& & \\ \hline
Regression line slope & & \\ 
(used to summarize & & \\ 
two quantitative variables)& & \\ \hline
\end{tabular}
\end{center}

Look at the table of vocabulary terms.  If there are any you do not know, be sure to review the appropriate section of your text.

#### Data visualization summary {-}

Fill in the following table to help associate type of plot for each of several scenarios.

\begin{center}
\begin{tabular}{|l|p{3in}|} \hline
 & Appropriate plot(s) \\ \hline
One categorical variable & \\
(categorical response, no explanatory) & \\ \hline
One quantitative variable  & \\
(quantitative response, no explanatory) & \\ \hline
Two categorical variables  & \\
(categorical response, categorical explanatory) & \\ \hline
One of each  & \\
(quantitative response, categorical explanatory) & \\ \hline
Two quantitative variables  & \\
(quantitative response, quantitative explanatory) & \\ \hline
\end{tabular}
\end{center}

\rgs
\newpage 

Decision tree for determining an appropriate plot  given a number of variables and their types from Chapter 2 review:


\begin{center}\includegraphics[width=0.7\linewidth]{03-RG-categorical-quantitative-data_files/figure-latex/decision-tree-plots-1} \end{center}

\newpage

