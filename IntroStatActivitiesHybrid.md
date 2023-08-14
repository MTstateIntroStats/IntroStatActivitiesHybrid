--- 
title: |
    | **STAT 216 Coursepack**
    | 
    | ![](images/msu-campus.jpg){width=5in}
author: |
    | Melinda Yager
    | Jade Schmidt
    | Stacey Hancock
subtitle: |
    | Fall 2023
    | Montana State University
output: 
    pdf_document:
        citation_package: biblatex
bibliography: references.bib
biblio-style: apalike
nocite: '@*'
site: bookdown::bookdown_site
documentclass: report
description: This is the coursepack of in-class activities for STAT 216 Fall 2023.
location: Montana State University
---

# Preface {-}

Placeholder



<!--chapter:end:index.Rmd-->


# Fall 2023 Calendar of In-Class Activities {-}

Placeholder



<!--chapter:end:00-calendar.Rmd-->


# Basics of Data

Placeholder


## Reading Guides
## Week 1 Reading Guide: Basics of Data
### Textbook Sections 1.1: Case study and 1.2: Data basics {-}
#### Vocabulary {-}
#### Notes {-}
#### Example: Section 1.1 --- Case study: Using stents to prevent strokes {-}

<!--chapter:end:01-RG-basics-of-data.Rmd-->



## Activity 1:  Intro to Data
### Learning outcomes
### Terminology review
### General information on the Coursepack
### Steps of the statistical investigation process 
### Take-home messages
### Additional notes

<!--chapter:end:01-A01-data-intro.Rmd-->

---
output:
  pdf_document: default
  html_document: default
---
## Lecture Notes Week 1: Intro to data

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

\rgi Ordinal:  levels of the variable have a _________________________ ordering 
    
\rgi \rgi Examples: ‘Scale’ questions, Years of schooling completed

\rgi Nominal:levels of the variable do _______________ have a natural ordering

\rgi \rgi Examples: hair color, eye color, zipcode
    
* Quantitative variable: 

\vspace{0.5in}

\rgi Continuous variables: value can be any ____________________ within a range.
    
\rgi \rgi Examples: percentage of students who are nursing majors, average hours of exercise per week; distance or time (measured with enough precision)

\rgi Discrete variables: can only be ___________________________ values, with jumps between
    
\rgi \rgi Examples: years of schooling completed; SAT score, number of car accidents
    
Example:  The Bureau of Transportation Statistics collects data on all forms of public transportation. The data set seen here includes several variables collect on flights departing on a random sample of 150 US airports in December of 2019.


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

* Summary statistic and type of plot used depends on the type of variable(s)!  

### Roles of variables: Sections 1.2.3 -- 1.2.5 {-}

Explanatory variable: predictor variable

* The variable researchers think *may be* _____________ 
the other variable.
    
* In an experiment, what the researchers _____________ or ________________.
    
* The groups that we are comparing from the data set.

Response variable: 

* The variable researchers think *may be* ___________________ by the other variable.

* Always simply ________________ or __________________; never controlled by researchers.

Examples:

Can you predict a criminal’s height based on the footprint left at the scene of a crime?

* Identify the explanatory variable:

\vspace{0.3in}

* Identify the response variable:

\vspace{0.3in}

Does marking an item on sale (even without changing the price) increase the number of units sold per day, on average?

* Identify the explanatory variable:

\vspace{0.3in}

* Identify the response variable:

\vspace{0.3in}

In the Physician's Health Study, male physicians participated in a study to determine whether taking a daily low-dose aspirin reduced the risk of heart attacks. The male physicians were randomly assigned to the treatment groups. After five years, 104 of the 11,037 male physicians taking a daily low-dose aspirin had experienced a heart attack while 189 of the 11,034 male physicians taking a placebo had experienced a heart attack. 

* Identify the explanatory variable:

\vspace{0.3in}

* Identify the response variable:

\vspace{0.3in}

#### Relationships between variables {-}

\setstretch{1.5}

* Association: the _____________ between variables create a pattern; knowing something about one variable tells us about the other.

    * Positive association: as one variable _____________, the other tends to _______________ also.
    
    * Negative association: as one variable _____________, the other tends to _____________.

* Independent: no clear pattern can be seen between the __________.

\setstretch{1}
\newpage

<!--chapter:end:01-LN01-Intro-to-data.Rmd-->


# Study Design

Placeholder


## Week 2 Reading Guide: Sampling, Study Design, and Scope of Inference
### Textbook Chapter 2: Study Design {-}
### Section 2.1: Sampling principles and strategies {-}
#### Vocabulary {-}
#### Notes {-}
##### Notes on types of sampling bias {-}
### Section 2.2 \& 2.3: Study Design {-}
#### Reminders from Section 1.2 {-}
#### Vocabulary {-}
#### Notes {-}
### Section 2.4: Scope of inference {-}

<!--chapter:end:02-RG-study-design.Rmd-->



## Lecture Notes Week 2: Study Design
### Sampling Methods: Section 2.1 in the course textbook {-}
#### Good vs. bad sampling {-}
### Types of Sampling Bias {-}
#### Examples {-}
### Observational studies, experiments, and scope of inference: Sections 2.2 -- 2.4 in the course textbook {-}
#### Study design {-}
#### Scope of Inference {-}

<!--chapter:end:02-LN02-studydesign.Rmd-->



## Out-of-Class Activity Week 2: American Indian Address
### Learning outcomes
### Terminology review
### American Indian Address
#### By eye selection {-}
#### Types of bias {-}
### Take-home messages
### Additional notes

<!--chapter:end:02-OCA01-bias.Rmd-->



## Activity 2: American Indian Address (continued)
### Learning outcomes
### Terminology review
#### Random selection {-}
### Effect of sample size {-}
### Take-home messages
### Additional notes

<!--chapter:end:02-A02-sampling.Rmd-->



## Week 2 Lab: Study Design
### Learning outcomes
### Terminology review
### General information labs
### Atrial fibrillation 
### Study design
### Take-home messages
### Additional notes

<!--chapter:end:02-L01-random-assignment.Rmd-->


# Exploring Categorical and Quantitative Data

Placeholder


## Week 3 Reading Guide: Introduction to R, Categorical Variables, and a Single Quantitative Variable
### Textbook Chapter 3 Applications: Data {-}
#### Notes {-}
#### Functions {-}
### Textbook Chapter 4: Exploring categorical data {-}
#### Vocabulary {-}
#### Notes {-}
#### Review of Simpson’s Paradox {-}
### Textbook Chapter 5: Exploring quantitative data {-}
#### Type of Plots {-}
#### Vocabulary {-}
#### Notes {-}
### Summarizing Chapters 4 and 5 {-}
#### Notes {-}
#### Data visualization summary {-}

<!--chapter:end:03-RG-categorical-quantitative-data.Rmd-->



## Lecture Notes Week 3: Exploratory Data Analysis 
### Summarizing categorical data {-}
#### Displaying categorical variables {-}
#### Simpson's paradox {-}
### Summarizing quantitative data {-}
#### Types of plots{-}
#### Four characteristics of plots for quantitative variables {-}
#### Robust statistics {-}

<!--chapter:end:03-LN03-EDA.Rmd-->



## Out-of-Class Activity Week 3: Summarizing Categorical Variables
### Learning outcomes
### Terminology review
### Graphing categorical variables
### Nightlight use and myopia {-}
#### R code {-}
#### Displaying a single categorical variable {-}
#### Displaying two categorical variables {-}
### Take-home messages
### Additional notes

<!--chapter:end:03-OCA02-EDA.Rmd-->



## Week 3 Lab:  IPEDs
### Learning outcomes
### Terminology review
### The Integrated Postsecondary Education Data System (IPEDS)
#### Summary statistics for a single quantitative variable {-}
#### Displaying a single quantitative variable {-}
#### Robust Statistics {-}
#### Summarizing a single categorical and single quantitative variable {-}
#### Summarizing two categorical variables {-}
### Take-home messages

<!--chapter:end:03-L02-EDA-wrap-up.Rmd-->


# Exploring Multivariable Data

Placeholder


## Week 4 Reading Guide: Two Quantitative Variables and Multivariable Concepts
### Textbook Chapter 6: Correlation and regression {-}
### Section 6.1 (Fitting a line, residuals, and correlation) {-}
#### Reminders from Section 5.1 {-}
#### Vocabulary {-}
#### Notes {-}
#### Example: Brushtail possums {-}
###  Section 6.2: Least squares regression {-}
#### Vocabulary {-}
#### Notes {-}
#### Example: Elmhurst College {-}
###  Section 6.3: Outliers in linear regression {-}
#### Vocabulary {-}
#### Notes {-}
### Section 6.4: Chapter 6 review {-}
#### Notes {-}
### Section 7.1: Gapminder world {-}
#### Vocabulary {-} 
#### Notes {-}
### Section 7.2: Simpson’s Paradox, revisited {-}
#### Reminder from Section 4.4 {-}
#### Notes {-}
#### Example: SAT scores {-}

<!--chapter:end:04-RG-multivariate.Rmd-->



## Lecture Notes Week 4: Regression and Correlation
### Summary measures and plots for two quantitative variables {-}
#### Multivariable plots {-}

<!--chapter:end:04-LN04-two-quantitativeEDA.Rmd-->



## Out-of-Class Activity Week 4:  Movie Profits --- Correlation and Coefficient of Determination
### Learning outcomes
### Terminology review
### Movies released in 2016
#### Correlation  {-}
#### Coefficient of determination (squared correlation) {-}
### Take-home messages
### Additional notes

<!--chapter:end:04-OCA03-EDA-two-quantitative-corr.Rmd-->



## Activity 4:  Movie Profits --- Linear Regression
### Learning outcomes
### Terminology review
### Movies released in 2016
#### Vocabulary review {-}
#### Slope {-}
#### Residuals {-}
#### Multivariable plots {-}
### Take-home messages
### Additional notes

<!--chapter:end:04-A04-EDA-two-quantitative-LR.Rmd-->



## Week 4 Lab:  Penguins
### Learning outcomes
### Penguins {-}

<!--chapter:end:04-L04-EDA-two-quantitative-wrapup.Rmd-->


# Group Exam 1 Review

Placeholder



<!--chapter:end:05-Exam1-Review.Rmd-->


# Inference for a Single Categorical Variable: Simulation-based Methods

Placeholder


## Week 6 Reading Guide: Categorical Inference
### Textbook Chapter 9: Hypothesis testing with randomization {-}
#### Reminders from previous sections {-}
#### Vocabulary {-}
#### Notes {-}
#### Example from section 9.1: Martian alphabet {-} 
#### Example from section 9.2: Sex discrimination {-} 
### Chapter 10: Confidence intervals with bootstrapping {-}
#### Reminders from previous sections {-}
#### Vocabulary {-}
#### Notes {-}
#### Example: Medical consultant {-}
### Section 14.1: Simulation-based test for $H_0:\pi = \pi_0$ {-}
#### Reminders from previous sections {-}
#### Vocabulary {-}
#### Notes {-}
#### Example: Medical consultant {-}
### Section 14.2: Bootstrap confidence interval for $\pi$ {-}
#### Reminders from previous sections {-}
#### Notes {-}
#### Example: Medical consultant {-}

<!--chapter:end:06-RG-1cat_simulation.Rmd-->



## Lecture Notes Week 6: Inference for One Categorical Variable using Simulation-based Methods
### Hypothesis Testing {-}
### Hypotheses {-}
#### Null hypothesis {-}
#### Alternative hypothesis {-}
### Simulation vs. Theory-based Methods {-}
#### Simulation-based method {-}
#### Theory-based method {-}
#### P-value {-}
### One proportion test {-}
#### Hypothesis testing {-}
#### Simulation-based method {-}
### Confidence interval {-}
#### Sampling distribution {-}
#### Simulation-based methods {-}

<!--chapter:end:06-LN06-1cat_simulation.Rmd-->



## Out-of-Class Activity Week 6:  Helper-Hinderer --- Simulation-based Hypothesis Test
### Learning outcomes
### Terminology review
### Steps of the statistical investigation process
### Helper-Hinderer
#### Ask a research question {-}
#### Design a study and collect data {-}
#### Summarize and visualize the data {-}
#### Use statistical analysis methods to draw inferences from the data {-}
### Take-home messages
### Additional notes

<!--chapter:end:06-OCA04-inference-1cat_test-simulation.Rmd-->



## Activity 6:  Helper-Hinderer (continued)
### Learning outcomes
### Steps of the statistical investigation process
### Helper-Hinderer
#### Interpret the p-value {-}
#### Communicate the results and answer the research question {-}
### Take-home messages
### Additional notes

<!--chapter:end:06-A05-inference-1cat_simulation-continued.Rmd-->



## Week 6 Lab:  Helper-Hinderer --- Simulation-based Confidence Interval
### Learning outcomes
### Terminology review
### Helper-Hinderer
#### Activity intro {-}
#### Use statistical analysis methods to draw inferences from the data {-}
#### Communicate the results and answer the research question {-}
#### Effect of confidence level {-}
### Take-home messages
### Additional notes

<!--chapter:end:06-L04-inference-1cat_CI-simulation.Rmd-->


# Inference for a Single Categorical Variable: Theory-based Methods + Errors and Power

Placeholder


## Week 7 Reading Guide: Categorical Inference
### Textbook Chapter 11: Inference with mathematical models {-}
#### Reminders from previous sections {-}
#### Vocabulary {-}
#### Notes {-}
#### Formulas {-}
### R coding {-}
##### Calculating normal probabilities {-}
##### Displaying normal probabilities {-} 
##### Calculating normal percentiles {-}
### Section 14.3: Theory-based inferential methods for $\pi$ {-}
#### Vocabulary {-}
#### Reminders from previous sections {-}
#### Vocabulary {-}
#### Notes {-}
#### Formulas {-}
#### Example: Payday loans {-}
### Chapter 12: Errors, power, and practical importance {-}
#### Reminders from previous sections {-}
#### Vocabulary {-}
#### Notes {-}
#### Examples: {-} 

<!--chapter:end:07-RG-1cat_theory.Rmd-->



## Lecture Notes Week 7: Inference for One Categorical Variable using Theory-based Methods
### Theory-based methods {-}
#### Central limit theorem {-}
### 68-95-99.7 Rule {-}
#### Theory-based methods for a single categorical variable {-}
### Confidence interval {-}
#### Theory-based method for a single categorical variable {-}
#### Interpreting confidence level {-}
### Errors, power, and practical importance {-}
#### Practical importance {-}

<!--chapter:end:07-LN07-1cat_theory.Rmd-->



## Out-of-Class Activity Week 7:  Handedness of Male Boxers 
### Learning outcomes
### Terminology review
### Handedness of male boxers
### Review of summary statistics {-}
### Theory-based methods {-}
### Take-home messages
### Additional notes

<!--chapter:end:07-OCA05-inference-1cat_test-theory.Rmd-->



## Activity 7:  Handedness of Male Boxers --- Theory CI
### Learning objectives
### Terminology review
### Handedness of Male Boxers
#### Theory-based confidence interval {-}
#### Simulation Methods {-}
### What does *confidence* mean? {-}
### Take-home messages
### Additional notes

<!--chapter:end:07-A06-inference-1cat_CI-theory.Rmd-->



## Week 7 Lab:  Errors and Power
### Learning outcomes
### Terminology review
### ACL recovery

<!--chapter:end:07-L05-inference-1cat-theory-wrapup.Rmd-->


# Inference for Two Categorical Variables: Simulation-based Methods

Placeholder


## Week 8 Reading Guide: Hypothesis Testing for a Difference in Proportions
### Textbook Chapter 15: Inference for comparing two proportions {-}
### Section 15.1: Randomization test for $H_0: \pi_1 - \pi_2 = 0$) and Section 15.2: Bootstrap confidence interval for $\pi_1 - \pi_2$ {-}
#### Reminders from previous sections {-}
#### Vocabulary {-}
#### Notes {-}
#### Notation {-}
#### Example: Gender discrimination {-}
#### Example: Opportunity cost {-}
#### Example: CPR and blood thinners {-}

<!--chapter:end:08-RG-2cat-simulation.Rmd-->



## Lecture Notes Week 8: Inference for Two Categorical Variables using Simulation-based Methods
### Two categorical variables {-}
### Hypothesis Testing {-}
#### Simulation-based method {-}
### Confidence interval {-}
#### Simulation-based method {-}

<!--chapter:end:08-LN09-two-cat-simulation.Rmd-->



## Out-of-Class Activity Week 8:  The Good Samaritan --- Intro
### Learning outcomes
### Terminology review
### The Good Samaritan
#### Vocabulary review {-}
#### Ask a research question {-}
#### Summarize and visualize the data {-}
### Take-home messages
### Additional notes

<!--chapter:end:08-OCA06-inference-2cat-simulation.Rmd-->



## Activity 8:  The Good Samaritan (continued) --- Simulation-based Hypothesis Test & Confidence Interval
### Learning outcomes
### Terminology review
### The Good Samaritan
#### Use statistical analysis methods to draw inferences from the data {-}
### Take-home messages
### Additional notes

<!--chapter:end:08-A07-inference-2cat_CI-Simulation.Rmd-->



## Week 8 Lab:  Poisonous Mushrooms 
### Learning outcomes
### Poisonous Mushrooms

<!--chapter:end:08-L06-inference-2cat-simulation-wrapup.Rmd-->


# Inference for Two Categorical Variables: Theory-based Methods

Placeholder


## Week 9 Reading Guide: Theory-based Inference for a Difference in Proportions
### Textbook Chapter 15: Inference for comparing two proportions {-}
### Section 15.3: Theory-based inferential methods for $\pi_1 - \pi_2$ {-}
#### Reminders from previous sections {-}
#### Notes {-}
#### Formulas {-}
#### Notation {-}
#### Example: CPR and blood thinners {-}
#### Example: Mammograms {-}

<!--chapter:end:09-RG-2cat-theory.Rmd-->



## Lecture Notes Week 9: Theoretical Inference for Two Categorical Variables 
### Hypothesis testing using theory-based methods {-}
### Confidence interval {-}
#### Theory-based method for a two categorical variables {-}

<!--chapter:end:09-LN010-two-cat-theory.Rmd-->



## Out-of-Class Activity Week 9:  Winter Sports Helmet Use and Head Injuries --- Theory-based Confidence Interval
### Learning outcomes
### Terminology review
### Winter sports helmet use and head injury 
### Effect of sample size 
### Take-home messages
### Additional notes

<!--chapter:end:09-OCA08-inference-2cat_CI-theory.Rmd-->



## Activity Week 9:  Winter Sports Helmet Use and Head Injuries --- Theory-based Hypothesis Test
### Learning outcomes
### Terminology review
### Helmet use and head injuries
#### Use statistical analysis methods to draw inferences from the data {-}
### Impacts on the p-value {-}
### Take-home messages
### Additional notes

<!--chapter:end:09-A08-inference-2cat_test-theory.Rmd-->



## Week 9 Lab:  Diabetes
### Learning outcomes
### Glycemic control in diabetic adolescents

<!--chapter:end:09-L07-inference-2cat-theory-wrapup.Rmd-->


# Group Exam 2 Review

Placeholder



<!--chapter:end:10-Exam2-Review.Rmd-->


# Inference for a Quantitative Response with Paired Samples

Placeholder


## Week 11 Reading Guide: Inference for a Single Mean or Paired Mean Difference 
### Textbook Chapter 17: Inference for a single mean {-}
#### Reminders from previous sections {-}
#### Vocabulary {-}
#### Notes {-}
#### Formulas{-}
#### Notation {-}
#### Example from section 17.1: Edinburgh rentals {-}
#### Example from section 17.2: Sleep times of MSU students {-}
#### Example from section 17.3: Mercury content of dolphin muscle {-}
#### Example from section 17.3: Cherry Blossom Race {-}
### Textbook Chapter 18: Inference for paired mean difference  {-}
#### Vocabulary {-}
#### Notes {-}
#### Formulas{-}
#### Notation {-}
#### Example from section 18.1: Tires {-}
#### Example from sections 18.2 and 18.3: UCLA textbook prices {-}

<!--chapter:end:11-RG-paired.Rmd-->



## Lecture Notes Week 11: Inference for a Single Mean & Paired Data 
### Paired vs. Independent Samples {-}
### Confidence interval {-}
#### Simulation-based method{-}
#### Theory-based method {-}
### $t$-distribution {-}
### Hypothesis testing {-}
#### Simulation-based method {-}
#### Theory-based method {-}

<!--chapter:end:11-LN011-paired.Rmd-->



## Out-of-Class Activity Week 11:  Color Interference
### Learning outcomes
### Terminology review
### Color Interference
#### Identify the scenario {-}
#### Ask a research question {-}
#### Summarize and visualize the data {-}
#### Check theoretical conditions {-}
#### Use statistical inferential methods to draw inferences from the data {-}
### Take-home messages
### Additional notes

<!--chapter:end:11-OCA08-paired-theory.Rmd-->



## Activity 11:  COVID-19 and Air Pollution
### Learning outcomes
### Terminology review
### COVID-19 and air pollution
#### Vocabulary review.  {-}
#### Ask a research question {-}
#### Summarize and visualize the data  {-}
#### Use statistical inferential methods to draw inferences from the data {-}
##### Hypothesis test {-}
##### Confidence interval {-}
#### Communicate the results and answer the research question {-}
### Take-home messages
### Additional notes

<!--chapter:end:11-A09-paired-simulation.Rmd-->



## Week 11 Lab:  Swearing
### Learning outcomes
### Type of samples
### Swearing
### Use statistical inferential methods to draw inferences from the data {-}
### Hypothesis test {-}
### Communicate the results and answer the research question {-}
### Confidence interval {-}

<!--chapter:end:11-L08-paired-wrapup.Rmd-->


# Inference for a Quantitative Response with Independent Samples

Placeholder


## Week 12 Reading Guide: Inference for a Difference in Two Means
### Textbook Chapter 19 Inference for comparing two independent means {-}
#### Reminders from previous sections {-}
#### Notes {-}
#### Formulas {-}
#### Notation {-}
#### Example from section 19.1: Test scores {-}
#### Example from section 19.2: ESC and heart attacks {-}
#### Example from section 19.3: North Carolina births {-}

<!--chapter:end:12-RG-1ofeach.Rmd-->



## Lecture Notes Week 12: Inference for Independent Samples 
### Single categorical, single quantitative variable with independent samples {-}
### Hypothesis Testing {-}
#### Simulation-based method {-}
#### Theory-based method {-}
### Confidence interval {-}
#### Simulation-based method {-}
#### Theory-based method {-}

<!--chapter:end:12-LN012-1ofeach.Rmd-->



## Out-of-Class Activity Week 12:  Does behavior impact performance?
### Learning outcomes
### Terminology review
### Behavior and Performance
#### Quantitative variables review  {-}
#### Ask a research question {-}
#### Summarize and visualize the data {-}
#### Use statistical inferential methods to draw inferences from the data {-}
##### Hypothesis test {-}
##### Confidence interval {-}
### Take-home messages
### Additional notes

<!--chapter:end:12-OCA09-inference-1ofeach-simulation.Rmd-->



## Week 12 Lab:  The Triple Crown
### Learning outcomes
### Terminology review
### The triple crown 
#### Use statistical inferential methods to draw inferences from the data {-}

<!--chapter:end:12-L09-inference-1ofeach-theory.Rmd-->


# Inference for Two Quantitative Variables

Placeholder


## Week 13 Reading Guide: Inference for Slope and Correlation
### Textbook Chapter 21: Inference for regression and model conditions {-}
#### Reminders from previous sections {-}
#### Notes {-}
#### Formulas {-}
#### Example from sections 21.2 and 21.3: Crop yields {-}
#### Example from section 21.4: Midterm elections and unemployment {-}

<!--chapter:end:13-RG-regression.Rmd-->



## Lecture Notes Week 13: Inference for Two Quantitative Variables
### Summary measures and plots for two quantitative variables. {-}
### Hypothesis Testing {-}
#### Simulation-based method {-}
#### Theory-based method{-}
### Confidence interval {-}
#### Simulation-based method{-}
#### Theory-based method {-}

<!--chapter:end:13-LN013-regression.Rmd-->



## Out-of-Class Activity Week 13:  Prediction of Crocodilian Body Size
### Learning outcomes
### Terminology review
### Crocodilian Body Size
#### Vocabulary review {-}
#### Ask a research question {-}
#### Summarize and visualize the data {-}
#### Use statistical inferential methods to draw inferences from the data {-}
#### Simulation-based hypothesis test {-}
#### Simulation-based confidence interval {-}
#### Communicate the results and answer the research question {-}
### Take-home messages
### Additional notes

<!--chapter:end:13-OCA10-regression-simulation.Rmd-->



## Activity 13:  Golf Driving Distance
### Learning outcomes
### Terminology review
### Golf driving distance
#### Plot review. {-}
#### Conditions for the least squares line {-}
#### Ask a research question {-}
#### Summarize and visualize the data {-}
#### Use statistical inferential methods to draw inferences from the data {-}
##### Hypothesis test {-}
##### Confidence interval {-}
#### Communicate the results and answer the research question {-}
### Multivariable plots {-}
### Take-home messages
### Additional notes

<!--chapter:end:13-A11-regression-theory.Rmd-->



## Week 13 Lab: Big Mac Index
### Learning outcomes
### Big Mac Index
#### Summarize and visualize the data {-} 
#### Conditions for the least squares line {-}
#### Ask a research question {-}
#### Use statistical inferential methods to draw inferences from the data {-}
#### Hypothesis test {-}
#### Simulation-based confidence interval {-}
#### Communicate the results and answer the research question {-}

<!--chapter:end:13-L10-regression-wrapup.Rmd-->


# Probability and Relative Risk

Placeholder


## Week 14 Reading Guide: Special Topics
### Textbook Chapter 23 Probability with tables {-}
#### Vocabulary {-}
#### Notes {-}
#### Example from section 23.4: Baby Jeff {-}
### Section 15.1.4 revisited: Simulation-based inference for a relative risk  {-}
#### Vocabulary {-}
#### Notes {-}
#### Formulas {-}
#### Example: Malaria Vaccine {-}

<!--chapter:end:14-RG-probability-RR.Rmd-->



## Lecture Notes Week 14: Probability and Relative Risk 
### Probability {-}
#### Finding probabilities from a table {-}
#### Creating a hypothetical two-way table {-}
#### Diagnostic tests {-}
### Relative Risk {-}
#### Relative risk in the news {-}
#### Testing Relative Risk {-}

<!--chapter:end:14-LN014-prob-RR.Rmd-->



## Out-of-Class Activity Week 14:  Titanic Survivors --- Relative Risk
### Learning outcomes
### Terminology review
### Titanic Survivors
#### Data Exploration {-}
#### Relative Risk {-}
### Risk in the News
### Take-home messages
### Additional notes

<!--chapter:end:14-OAC11-relative_risk.Rmd-->



## Activity 14:  What's the probability?
### Learning outcomes
### Terminology review
### Probability 
### Take home messages
### Additional notes

<!--chapter:end:14-A12-Probability.Rmd-->



## Week 14 Lab: Efficacy of the COVID Vaccination
### Learning outcomes
### Efficacy of the COVID vaccination

<!--chapter:end:14-L11-special_topic-wrapup.Rmd-->


# Semester Review

Placeholder


## Group Final Exam Review

<!--chapter:end:15-Exam3-review.Rmd-->

## Golden Ticket to Descriptive and Inferential Statistical Methods

In this course, we have covered descriptive (summary statistics and plots) and inferential (hypothesis tests and confidence intervals) methods for five different scenarios:

* one categorical response variable
* two categorical variables
* one quantitative response variable or paired differences in a quantitative variable
* two quantitative variables
* one quantitative response variable and one categorical explanatory variable

The "golden ticket" shown on the next page presents a visual summary of the similarities and differences across these five scenarios.

\includepdf[landscape=true]{GoldenTicket_F23.pdf}


<!--chapter:end:16-goldenticket.Rmd-->

### References {-}

<!--chapter:end:17-references.Rmd-->

