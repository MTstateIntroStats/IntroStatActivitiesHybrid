## Video Notes: Theoretical Inference for Two Categorical Variables 

Read Sections 15.3 and 15.4 in the course textbook.  Use the following videos to complete the video notes for Module 9.

### Course Videos


* Theoretical_Tests_Two_Categorical_Variables

* Theoretical_Intervals_Two_Categorical_Variables


\setstretch{1}

### Video: Theoretical Testing for Two Categorical Variables (sections 15.3.1 and 15.3.3) {-}

Conditions for inference using theory-based methods for two categorical variables:

- Independence: the response for one observational unit will not influence another observational unit

\vspace{0.2in}

- Large enough sample size:

\vspace{0.7in}

General steps of a hypothesis test

1.	Write a research question and hypotheses.

2.	Collect data and calculate a summary statistic.

3.	Model a sampling distribution which assumes the null hypothesis is true.

\rgi \rgi - If the conditions are met, the sampling distribution of a difference in sample proportions which assumes the null hypothesis is true is the standard Normal (N(0,1)) distribution

4.	Calculate a p-value.

\rgi \rgi - Calculate the standardized difference in sample proportions ($Z$) and compare that to the standard Normal (N(0,1)) distribution.

\rgi \rgi - P-value will be the area under the curve beyond $Z$ (in the direction of the alternative hypothesis)

5.	Draw conclusions based on a p-value.


Equation for the standard error of the difference in sample proportions, assuming the null hypothesis is true:

\vspace{0.8in}

\setstretch{1.5}

* This value measures how far each possible __________________________________ is from the __________, on average.

\setstretch{1}

Equation for the standardized difference in sample proportions (standardized statistic):

\vspace{0.8in}

\setstretch{1.5}

* This value measures how many ___________ _____________ the observed difference in sample proportions is above/below the __________ ___________.

\setstretch{1}


#### Optional Notes: Additional Example {-}

Example: Earlier in the semester, we investigated data on higher education institutions in the United States, collected by the Integrated Postsecondary Education Data System (IPEDS) for the National Center for Education Statistics (NCES) [@ipeds]. A random sample of 2900+ higher education institutions in the United States was collected in 2018.  Two variables measured on this data set is whether the institution is a land grant university and whether the institution offers tenure.  Does the proportion of universities that offer tenure differ between land grant and non-land-grant institutions?  Use land grant - non-land-grant as the order of subtraction.

What are the observational units in this study?

\vspace{0.3in}

Explanatory variable (include: what is group 1?): 

\vspace{0.2in}

Response variable (include: what is a "success"?):

\vspace{0.2in}

Define the parameter in words and write it using proper notation

\vspace{0.5in}

Write the null and alternative hypotheses in proper notation:

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}


``` r
IPED <-read.csv("https://math.montana.edu/courses/s216/data/IPEDS_2018.csv")

IPEDS <- IPED %>%
    drop_na(Tenure)

IPEDS %>% # Data set piped into...
    ggplot(aes(x = LandGrant, fill = Tenure)) +   # This specifies the variables
  geom_bar(stat = "count", position = "fill") +  # Tell it to make a stacked bar plot
  labs(title = "Segmented Bar Plot of Tenure Availability 
       by Type of Institution for Higher Ed Institutions",  
       # Make sure to title your plot 
       x = "Land Grant",   # Label the x axis
       y = "") + # Remove y axis label 
    scale_fill_grey()

IPEDS %>% group_by(LandGrant) %>% count(Tenure)
```

```
#> # A tibble: 4 x 3
#> # Groups:   LandGrant [2]
#>   LandGrant Tenure     n
#>   <chr>     <chr>  <int>
#> 1 No        No       976
#> 2 No        Yes     1829
#> 3 Yes       No        31
#> 4 Yes       Yes       72
```



\begin{center}\includegraphics[width=0.7\linewidth]{09-VN09-two-cat-theory_files/figure-latex/unnamed-chunk-1-1} \end{center}

Calculate the summary statistic and write it using proper notation:

\vspace{0.3in}

Interpretation of the summary statistic:

\vspace{0.4in}


Are the conditions met to analyze the university data using theory-based methods?

\vspace{0.8in}
 

Calculate the standard error of the difference in sample proportions, assuming the null hypothesis is true

\vspace{0.4in}

Calculate the standardized difference in sample proportions ($Z$) of higher education institutions that offer tenure between land grant universities and non-land grant universities.

\vspace{0.4in}

Interpret the standardized statistic.

\vspace{0.5in}

Label the standardized difference in sample proportions (standardized statistic) on the standard Normal distribution below and shade the area representing the p-value.


\begin{center}\includegraphics[width=0.5\linewidth]{09-VN09-two-cat-theory_files/figure-latex/standNormald-1} \end{center}

To find the p-value, find the area under the standard Normal distribution at the standardized statistic and more extreme (in the direction of the alternative hypothesis).


``` r
pnorm(0.985, lower.tail = FALSE)*2
```

```
#> [1] 0.3246241
```

Interpretation of the p-value:

* Statement about probability or proportion of samples

* Statistic (summary measure and value) and Direction of the alternative 
    
* Null hypothesis (population reference, summary measure, equal to null value)

* Context of the problem (observational units, variables (for two categorical variables, include: both explanatory variable groups, define a "success" from the response variable, and include order of subtraction))


\vspace{0.8in}

Conclusion with scope of inference: 

* Amount of evidence
    
* For the alternative hypothesis (population reference, summary measure, direction, null value)

* Context of the problem (observational units, variables (for two categorical variables, include: both explanatory variable groups, define a "success" from the response variable, and include order of subtraction))

* Generalization

* Causation

\vspace{0.8in}

\newpage

### Theoretical Confidence Interval for Two Categorical Variables (section 15.3.2) {-}

General formula for a confidence interval is always:

\rgi \rgi $\text{statistic} \pm \text{margin of error}$

\rgi \rgi where $\text{margin of error} = \text{multiplier} \times \text{standard error of the statistic}$

For two categorical variables,

* $\text{statistic}$ = ___________________

* $\text{margin of error} = \text{multiplier} \times \text{standard error of the statistic}=$ ____________ $\times$ ______________

The $z^*$ multiplier is the value at the given percentile(s) of the standard Normal (N(0,1)) distribution.

Formula for the standard error of the difference in sample proportions, not assuming the null hypothesis is true:

\vspace{0.6in}

* Because we no longer assume the _____________ hypothesis is true, we need to keep the two groups *separate*. Use the sample proportions in group 1 and in group 2 to calculate the sample to sample variability, rather than $\hat{p}_{pooled}$.

\setstretch{1}
 

### Optional Notes: Video Example (Video 15.3TheoryIntervals) {-}  

Estimate the difference in true proportions of higher education institutions that offer tenure between land grant universities and non-land grant universities.

Find a 99\% confidence interval:

* 1st, use `R` find the $z^*$ multiplier 


``` r
qnorm(0.995, lower.tail=TRUE)
```

```
#> [1] 2.575829
```
\rgi \rgi - The above code used the 99.5th percentile to find $z^\star$.  What other percentile could have been used?

\vspace{0.2in}

Draw a line at the provided $z^\star$ on the standard Normal distribution shown below, and label the percentile of the $z^\star$ value.  


\begin{center}\includegraphics[width=0.5\linewidth]{09-VN09-two-cat-theory_files/figure-latex/standNormalc-1} \end{center}

* Next, calculate the standard error for the difference in proportions **NOT** assuming the null hypothesis is true

\vspace{0.6in}

* Calculate the margin of error

\vspace{0.6in}

* Calculate the endpoints of the 99\% confidence interval

\vspace{0.5in}

Confidence interval interpretation:

* How confident you are (e.g., 90%, 95%, 98%, 99%)
    
* Parameter of interest (including context: observational units, variables (for two categorical variables, include: both explanatory variable groups, define a "success" from the response variable, and include order of subtraction))
    
* Calculated interval

\vspace{0.8in}



### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. What conditions must be met to use the Normal Distribution to approximate the sampling distribution for the difference in sample proportions?

\vspace{0.6in}

2. Explain why a theory-based confidence interval for the Good Samaritan study from last module would NOT be similar to the bootstrap interval created.

\vspace{1in}

 
\newpage
