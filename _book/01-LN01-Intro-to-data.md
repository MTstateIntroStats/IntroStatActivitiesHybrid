---
output:
  pdf_document: default
  html_document: default
---
## Lecture Notes Module 1: Intro to data

\setstretch{1}

Read through Sections 1.2.1 -- 1.2.5 in the course textbook prior to coming to class on Friday using the reading guides at the beginning of week 1 material.

### Data basics: Sections 1.2.1 -- 1.2.2 {-}

Data:  _______________________________ used to answer research questions

Observational unit or case:  the people or things we _____________________ data from

Variable: what is measured on each _________________ or
__________________.

#### Types of variables {-}

* Categorical variable: 

\vspace{0.5in}

\setstretch{1.5}

\rgi - Ordinal:  levels of the variable have a natural ordering 
    
\rgi \rgi Examples: ‘Scale’ questions, years of schooling completed

\rgi - Nominal:levels of the variable do not have a natural ordering

\rgi \rgi Examples: hair color, eye color, zipcode

\setstretch{1}
    
* Quantitative variable: 

\vspace{0.5in}

\setstretch{1.5}

\rgi - Continuous variables: value can be any value within a range.
    
\rgi \rgi Examples: percentage of students who are nursing majors

\rgi \rgi \rgi - average hours of exercise per week

\rgi \rgi \rgi - distance or time (measured with enough precision)

\rgi - Discrete variables: can only be specific values, with jumps between
    
\rgi \rgi Examples: SAT score

\rgi \rgi \rgi - number of car accidents

\setstretch{1}
\newpage

Example for class discussion:  The Bureau of Transportation Statistics [@bts] collects data on all forms of public transportation. The data set seen here includes several variables collect on flights departing on a random sample of 150 US airports in December of 2019.

\vspace{1mm}


```r
airport <- read.csv("data/airport_delay.csv")
glimpse(airport)
#> Rows: 150
#> Columns: 19
#> $ airport             <chr> "ABI", "ABY", "ACV", "ACY", "ADQ", "AEX", "ALB", "~
#> $ city                <chr> "Abilene", "Albany", "Arcata/Eureka", "Atlantic Ci~
#> $ state               <chr> " TX", " GA", " CA", " NJ", " AK", " LA", " NY", "~
#> $ airport_name        <chr> " Abilene Regional", " Southwest Georgia Regional"~
#> $ hub                 <chr> "no", "no", "no", "no", "no", "no", "no", "no", "n~
#> $ international       <chr> "no", "no", "no", "yes", "no", "yes", "yes", "yes"~
#> $ elevation_1000      <dbl> 1.7906, 0.1932, 0.2223, 0.0748, 0.0787, 0.0881, 0.~
#> $ latitude            <dbl> 32.4, 31.5, 41.0, 39.5, 57.7, 31.3, 42.7, 35.2, 45~
#> $ longitude           <dbl> -99.7, -81.2, -124.1, -74.6, -152.5, -92.5, -73.8,~
#> $ arr_flights         <int> 195, 81, 215, 293, 54, 282, 943, 410, 53, 32314, 6~
#> $ perc_delay15        <dbl> 16.410256, 13.580247, 23.255814, 15.358362, 12.962~
#> $ perc_cancelled      <dbl> 0.5128205, 0.0000000, 4.1860465, 0.6825939, 14.814~
#> $ perc_diverted       <dbl> 0.00000000, 0.00000000, 2.32558139, 0.68259386, 0.~
#> $ arr_delay           <int> 1563, 1244, 4763, 2905, 329, 1293, 15127, 9705, 25~
#> $ carrier_delay       <int> 459, 890, 1613, 476, 180, 302, 5627, 2253, 439, 10~
#> $ weather_delay       <int> 21, 43, 549, 124, 1, 58, 2346, 168, 1236, 13331, 2~
#> $ nas_delay           <int> 257, 39, 154, 771, 51, 112, 2096, 616, 746, 45674,~
#> $ security_delay      <int> 0, 0, 0, 25, 0, 0, 44, 0, 0, 375, 0, 83, 0, 23, 0,~
#> $ late_aircraft_delay <int> 826, 272, 2447, 1509, 97, 821, 5014, 6668, 108, 10~
```

* What are the observational units?

\vspace{0.2in}

* Identify which variables are categorical.

\vspace{0.2in}

* Identify which variables are quantitative.

\vspace{0.2in}


#### Exploratory data analysis (EDA) {-}

Summary statistic: a number which _______________________ an entire data set

* Also called the ___________ ____________

\rgi Examples: 

\rgi \rgi proportion of people who had a stroke

\vspace{0.3in}
    
\rgi \rgi mean (or average) age
    
\vspace{0.3in}

* The summary statistic and type of plot used depends on the type (categorical or quantitative) of variable(s)!  

\newpage

### Roles of variables: Sections 1.2.3 -- 1.2.5 {-}

Explanatory variable: predictor variable

* The variable researchers think *may be* _____________ 
the other variable.
    
* In an experiment, what the researchers _____________ or ________________.
    
* The groups that we are comparing from the data set.

Response variable: 

* The variable researchers think *may be* ___________________ by the other variable.

* Always simply ________________ or __________________; never controlled by researchers.

Examples for class discussion:

Can you predict a criminal’s height based on the footprint left at the scene of a crime?

* Identify the explanatory variable:

\vspace{0.25in}

* Identify the response variable:

\vspace{0.25in}

Does marking an item on sale (even without changing the price) increase the number of units sold per day, on average?

* Identify the explanatory variable:

\vspace{0.25in}

* Identify the response variable:

\vspace{0.25in}

In the Physician's Health Study [@physhealth], male physicians participated in a study to determine whether taking a daily low-dose aspirin reduced the risk of heart attacks. The male physicians were randomly assigned to the treatment groups. After five years, 104 of the 11,037 male physicians taking a daily low-dose aspirin had experienced a heart attack while 189 of the 11,034 male physicians taking a placebo had experienced a heart attack. 

* Identify the explanatory variable:

\vspace{0.25in}

* Identify the response variable:

\vspace{0.25in}

#### Relationships between variables {-}

\setstretch{1.5}

* Association: the _____________ between variables create a pattern; knowing something about one variable tells us about the other.

    * Positive association: as one variable _____________, the other tends to _______________ also.
    
    * Negative association: as one variable _____________, the other tends to _____________.

* Independent: no clear pattern can be seen between the __________.

\setstretch{1}

#### Further analysis of class data set {-}

1. What are the observational units or cases for the data collected in class on day 1?

\vspace{0.3in}

2. How many observations are reported in the data set? This is the **sample size**.

\vspace{0.3in}

3. The header for each column in the data set describes each variable measured on the observational unit.For each column of data, fill in the following table identifying the type of each variable, and if the variable is categorical whether the variables is binary and if the variable is quantitative the units of measure used.

\begin{center}
\begin{tabular}{|l|p{1.5in}|p{0.5in}|p{0.5in}|} \hline
Column & Type of Variable & Binary? & Units? \\ \hline
Major & & &\\
& & & \\ \hline
Residency & & & \\
& & & \\ \hline
Num Credits & & & \\
& & & \\ \hline
Dominant hand & & & \\
& & & \\ \hline
Hand Span & & & \\
& & & \\ \hline
Grip strength dominant hand & & & \\
& & & \\ \hline
Grip strength non-dominant hand & & & \\
& & & \\ \hline
\end{tabular}
\end{center}

4. Review the completed data set with your table.  Remember that when creating a data set for use in R it is important to use single words or an underscore between words.  Each outcome must be written the same way each time to have consistency between responses.  Do not give units of measure for numerical values.  Write down some issues found with the created class data set.


\newpage
