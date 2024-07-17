## Video Notes: Inference for Two Categorical Variables using Simulation-based Methods

Read Sections 15.1 and 15.2 in the course textbook.  Use the following videos to complete the video notes for Module 7.

### Course Videos

* 15.1

* 15.2

\setstretch{1}

### Two categorical variables - Video 15.1 {-}

\setstretch{1.5}

* In this module, we will study inference for a ______________________ explanatory variable and a _________________________ response.

* The summary measure for two categorical variables is the ______________________ in _____________________________.

\setstretch{1}

Example: In a double-blind experiment [@Weiss1988] on 48 cocaine addicts hoping to overcome their addiction, half were randomly assigned to a drug called desipramine and the other half a placebo.  The addicts were followed for 6 weeks to see whether they were still clean.  Is desipramine more effective at helping cocaine addicts overcome their addiction than the placebo?

Observational units: 

\vspace{0.15in}

Explanatory variable:

\vspace{0.15in}

Response variable:

\vspace{0.15in}

\setstretch{1.5}

Notation:

* Population proportion for group 1:

* Population proportion for group 2:

* Sample proportion for group 1:

* Sample proportion for group 2:

* Sample difference in proportions: 

* Sample size for group 1:

* Sample size for group 2:

\setstretch{1}

\newpage

### Hypothesis Testing {-}

Conditions:

* Independence: the response for one observational unit will not influence another observational unit

Null hypothesis assumes “no effect”, “no difference”, “nothing interesting happening”, etc.

\rgi Always of form:  “parameter” = null value

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}

* Research question determines the direction of the alternative hypothesis.

Write the null and alternative hypotheses for the cocaine study:

In notation:

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}

#### Summary statistics and plot {-}




```r
cocaine %>% group_by(drug) %>% count(outcome)
```

```
#> # A tibble: 4 x 3
#> # Groups:   drug [2]
#>   drug        outcome      n
#>   <chr>       <chr>    <int>
#> 1 desipramine clean       14
#> 2 desipramine relapsed    10
#> 3 placebo     clean        4
#> 4 placebo     relapsed    20
```
Summary statistic:

\vspace{0.3in}

Interpretation:

\vspace{0.4in}


```r
cocaine%>%
  ggplot(aes(x = drug, fill = outcome))+
  geom_bar(stat = "count", position = "fill") +
  labs(title = "Bar plot of Type of Drug, Segmented by 
       Outcome for Cocaine Addicts",
       y = "Relative Frequency",
       x = "Drug or Placebo") +
    scale_fill_grey()
```



\begin{center}\includegraphics[width=0.6\linewidth]{07-VN07-two-cat-simulation_files/figure-latex/unnamed-chunk-3-1} \end{center}

Is the independence condition met for simulation inference?

\vspace{0.4in}

#### Simulation-based method {-}

* Simulate many samples assuming $H_0: \pi_1 = \pi_2$

    * Write the response variable values on cards

    * Mix the explanatory variable groups together
    
    * Shuffle cards into two explanatory variable groups to represent the sample size in each group ($n_1$ and $n_2$)

    * Calculate and plot the simulated difference in sample proportions from each simulation

    * Repeat 1000 times (simulations) to create the null distribution

    * Find the proportion of simulations at least as extreme as $\hat{p}_1 - \hat{p}_2$
    

```r
set.seed(216)
two_proportion_test(formula = outcome~drug, # response ~ explanatory
    data = cocaine, # Name of data set
    first_in_subtraction = "desipramine", # Order of subtraction: enter the name of Group 1
    number_repetitions = 1000, # Always use a minimum of 1000 repetitions
    response_value_numerator = "clean", # Define which outcome is a success
    as_extreme_as = 0.417, # Calculated observed statistic (difference in sample proportions)
    direction="greater") # Alternative hypothesis direction ("greater","less","two-sided")
```



\begin{center}\includegraphics[width=0.7\linewidth]{07-VN07-two-cat-simulation_files/figure-latex/unnamed-chunk-4-1} \end{center}

Explain why the null distribution is centered at the value of zero:

\vspace{1in}

Interpretation of the p-value:

* Statement about probability or proportion of samples

* Statistic (summary measure and value)
    
* Direction of the alternative 
    
* Null hypothesis (in context) 

\vspace{0.8in}

Conclusion with scope of inference: 

* Amount of evidence
    
* Parameter of interest 
    
* Direction of the alternative hypothesis

* Generalization

* Causation

\vspace{0.8in}

\newpage

### Confidence interval - Video 15.2 {-}

To estimate the difference in true proportion we will create a confidence interval.

#### Simulation-based method {-}

* Write the response variable values on cards

* Keep explanatory variable groups separate
    
* Sample with replacement $n_1$ times in explanatory variable group 1 and $n_2$ times in explanatory variable group 2

* Calculate and plot the simulated difference in sample proportions from each simulation

* Repeat 1000 times (simulations) to create the bootstrap distribution

* Find the cut-offs for the middle X\% (confidence level) in a bootstrap distribution.

Returning to the cocaine example, we will estimate the difference in true proportion of cocaine addicts that stay clean for those on the desipramine and those on the placebo.


```r
set.seed(216)
two_proportion_bootstrap_CI(formula = outcome ~ drug, 
        data=cocaine, # Name of data set
        first_in_subtraction = "desipramine", # Order of subtraction: enter the name of Group 1
        response_value_numerator = "clean", # Define which outcome is a success 
        number_repetitions = 1000, # Always use a minimum of 1000 repetitions
        confidence_level = 0.99) # Enter the level of confidence as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{07-VN07-two-cat-simulation_files/figure-latex/unnamed-chunk-5-1} \end{center}

Confidence interval interpretation:

* How confident you are (e.g., 90%, 95%, 98%, 99%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}



### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. Explain why the null distribution is centered at the value of zero.

\vspace{0.5in}

2. Does the confidence interval agree with the p-value?

\vspace{0.5in}
\newpage
