---
output:
  pdf_document: default
  html_document: default
---
## Video Notes: Intro to data and Sampling Methods

\setstretch{1}

Read through Sections 1.1 -- 1.3 and 2.1 in the course textbook and watch the course videos prior to coming to class.  Fill in the following questions to aid in your understanding of the material.   

### Course Videos

* 1.2.1and1.2.2

* 2.1

### Data basics: Video 1.2.1and1.2.2 {-}

Data:  _______________________________ used to answer research questions

Observational unit or case:  the people or things we _____________________ data from; represents the ___________ in each data set

Variable: characteristics measured on each _______________________________.

#### Types of variables {-}

* Categorical variable: 

\vspace{0.5in}

\setstretch{1.5}
    
* Quantitative variable: 

\vspace{0.5in}

\setstretch{1.5}

Example:  The Bureau of Transportation Statistics [@bts] collects data on all forms of public transportation. The data set seen here includes several variables collect on flights departing on a random sample of 150 US airports in December of 2019.

\vspace{1mm}


``` r
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

Summary statistic: a single number which _______________________ an entire data set

* Also called the point estimate.

\rgi Examples: 

\rgi \rgi proportion of people who had a stroke

\vspace{0.3in}
    
\rgi \rgi mean (or average) age
    
\vspace{0.3in}

* The summary statistic and type of plot used depends on the type (categorical or quantitative) of variable(s)!  


\setstretch{1}


### Sampling Methods: Video 2.1 {-}

\setstretch{1.5}

The method used to collect data will impact 

* Target population: all _______________ or ______________ of interest 

* Sample:________________ or ________________ from which data is collected

\setstretch{1}

Example: Many high schools moved to partial or fully online schooling in Spring of 2020. Did students who graduated in 2020 tend to have a lower GPA during freshman year of college than the previous class of college freshmen? A nationally representative sample of 1000 college students who were freshmen in AY19-20 and 1000 college students who were freshmen in AY20-21 was taken to answer this question.

* What is the target population?

\vspace{0.2in}

* What is the sample?

\vspace{0.2in}

#### Good vs. bad sampling {-}

\setstretch{1.5}

GOAL: to have a sample that is _______________ of the
______________ _______________ on the variable(s) of interest

\setstretch{1}

* Unbiased sample methods:

\vspace{0.5in}

\rgi \rgi Simple random sample

* Biased sampling method: 

\vspace{0.5in}

\newpage

### Types of Sampling Bias {-}

* Selection bias: 

\vspace{0.5in}

Example of Selection Bias: Newspaper article from 1936 reported that Landon won the presidential election over Roosevelt based on a poll of 10 million voters. Roosevelt was the actual winner.  What was wrong with this poll?  Poll was completed using a telephone survey and not all people in 1936 had a telephone.  Only a certain subset of the population owned a telephone so this subset was over-represented in the telephone survey. The results of the study, showing that Landon would win, did not represent the target population of all US voters.

* Non-response bias:  

\vspace{0.5in}

* To calculate the non-response rate: 
    
$$\frac{\text{number of people who do not respond}}{\text{total number of people selected for the sample}}\times 100\%$$
 
* For non-response bias to occur must first select people to participate and then they choose not to.
    

Example of Non-response bias:  A company randomly selects buyers to complete a review of an online purchase but some choose not to respond. 
    
* Response bias:

\vspace{0.5in}

Example of Response Bias: Police officer pulls you over and asks if you have been drinking.  Expect people to say no, whether they have been drinking or not.  
    
* Need to be able to predict how people will respond.
    
Words of caution:

* Convenience samples: gathering data for those who are easily
accessible; online polls

\setstretch{1.5}

\rgi \rgi Selection bias? 
    
\rgi \rgi Non-response bias?  
    
\rgi \rgi Response bias? 

* Random sampling reduces _________________ bias, but 
has no impact on ________________ or ______________ bias.

\setstretch{1}

\newpage

#### Optional Notes: Video Example {-}

A radio talk show asks people to phone in their views on whether the United States should pay off its debt to the United Nations.

* Selection?

\vspace{0.25in}

* Non-response?

\vspace{0.25in}

* Response?

\vspace{0.25in}

The Wall Street Journal plans to make a prediction for the US presidential election based on a survey of its readers and plans to follow-up to ensure everyone responds.

* Selection?

\vspace{0.25in}

* Non-response?

\vspace{0.25in}

* Response?

\vspace{0.25in}
    
A police detective interested in determining the extent of drug use by high school students, randomly selects a sample of high school students and interviews each one about any illegal drug use by the student during the past year.

* Selection?

\vspace{0.25in}

* Non-response?

\vspace{0.25in}

* Response?

\vspace{0.25in}
    

### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. What are the two types of variables?

\vspace{0.3in}

2. Purpose of random selection:
\vspace{0.6in}

3. Types of sampling bias:

\vspace{0.5in}

\newpage

