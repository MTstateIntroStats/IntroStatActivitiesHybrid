## Video Notes: Inference for Two Categorical Variables using Simulation-based Methods

Read Sections 2.2 - 2.4, 15.1, 15.2 and Chapter 16 in the course textbook.  Use the following videos to complete the video notes for Module 8.

### Course Videos

* 2.2to2.4

* 15.1

* 15.2

* RelativeRisk

### Observational studies, experiments, and scope of inference: Video 2.2to2.4 {-}

* Review

    - Explanatory variable: the variable researchers think *may be* affecting the other variable.
    
    - Response variable: the variable researchers think *may be* influenced by the other variable.

* Confounding variable: 
    - associated with both the explanatory and the response variable
    - explains the association shown by the data 

Example: 

\vspace{0.8in}

#### Study design {-}

* Observational study: 

\vspace{0.5in}

* Experiment: 

\vspace{0.5in}

Principles of experimental design

* Control: hold other differences constant across groups
\vspace{0.1in}

* Randomization: randomized experiment
\vspace{0.1in}

* Replication: large sample size or repeat of study
\vspace{0.1in}

* Blocking: group based on certain characteristics

\vspace{0.1in}
    
\newpage

Example: It is well known that humans have more difficulty differentiating between faces of people from different races than people within their own race. A 2018 study published in the Journal of Experimental Psychology [@levin2000]: Human Perception and Performance investigated a similar phenomenon with gender. In the study, volunteers were shown several pictures of strangers. Half the volunteers were randomly assigned to rate the attractiveness of the individuals pictured. The other half were told to rate the distinctiveness of the faces seen. Both groups were then shown a slideshow of faces (some that had been rated in the first part of the study, some that were new to the volunteer) and asked to determine if each face was old or new. Researchers found people were better able to recognize faces of their own gender when asked to rate the distinctiveness of the faces, compared to when asked to rate the attractiveness of the faces.

* What is the study design?
    
\vspace{0.5in}


Example: In the Physician's Health Study [@physhealth], male physicians participated in a study to determine whether taking a daily low-dose aspirin reduced the risk of heart attacks. The male physicians were randomly assigned to the treatment groups. After five years, 104 of the 11,037 male physicians taking a daily low-dose aspirin had experienced a heart attack while 189 of the 11,034 male physicians taking a placebo had experienced a heart attack. 

* What is the study design?
    
\vspace{0.5in}

* Assuming these data provide evidence that the low-dose aspirin group had a lower rate of heart attacks than the placebo group, is it valid for the researchers to conclude the lower rate of heart attacks was caused by the daily low-dose aspirin regimen?

\vspace{0.5in}
    
#### Scope of Inference {-}

1. How was the sample selected?

* Random sample with no sampling bias:

\vspace{0.35in}

* Non-random sample with sampling bias:

\vspace{0.35in}

2. What is the study design?

* Randomized experiment:
    
\vspace{0.35in}

* Observational study:
    
\vspace{0.35in}

\newpage

Scope of Inference Table:


\begin{center}\includegraphics[width=0.65\linewidth]{images/ScopeOfInferenceGreyscale} \end{center}

Example: It is well known that humans have more difficulty differentiating between faces of people from different races than people within their own race. A 2018 study published in the Journal of Experimental Psychology [@levin2000]: Human Perception and Performance investigated a similar phenomenon with gender. In the study, volunteers were shown several pictures of strangers. Half the volunteers were randomly assigned to rate the attractiveness of the individuals pictured. The other half were told to rate the distinctiveness of the faces seen. Both groups were then shown a slideshow of faces (some that had been rated in the first part of the study, some that were new to the volunteer) and asked to determine if each face was old or new. Researchers found people were better able to recognize faces of their own gender when asked to rate the distinctiveness of the faces, compared to when asked to rate the attractiveness of the faces.

* What is the scope of inference for this study?

\vspace{0.5in}

\setstretch{1}

\newpage

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




``` r
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


``` r
cocaine%>%
  ggplot(aes(x = drug, fill = outcome))+
  geom_bar(stat = "count", position = "fill") +
  labs(title = "Bar plot of Type of Drug, Segmented by 
       Outcome for Cocaine Addicts",
       y = "Relative Frequency",
       x = "Drug or Placebo") +
    scale_fill_grey()
```



\begin{center}\includegraphics[width=0.6\linewidth]{07-VN07-two-cat-simulation_files/figure-latex/unnamed-chunk-4-1} \end{center}

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
    

``` r
set.seed(216)
two_proportion_test(formula = outcome~drug, # response ~ explanatory
    data = cocaine, # Name of data set
    first_in_subtraction = "desipramine", # Order of subtraction: enter the name of Group 1
    number_repetitions = 1000, # Always use a minimum of 1000 repetitions
    response_value_numerator = "clean", # Define which outcome is a success
    as_extreme_as = 0.417, # Calculated observed statistic (difference in sample proportions)
    direction="greater") # Alternative hypothesis direction ("greater","less","two-sided")
```



\begin{center}\includegraphics[width=0.7\linewidth]{07-VN07-two-cat-simulation_files/figure-latex/unnamed-chunk-5-1} \end{center}

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


``` r
set.seed(216)
two_proportion_bootstrap_CI(formula = outcome ~ drug, 
        data=cocaine, # Name of data set
        first_in_subtraction = "desipramine", # Order of subtraction: enter the name of Group 1
        response_value_numerator = "clean", # Define which outcome is a success 
        number_repetitions = 1000, # Always use a minimum of 1000 repetitions
        confidence_level = 0.99) # Enter the level of confidence as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{07-VN07-two-cat-simulation_files/figure-latex/unnamed-chunk-6-1} \end{center}

Confidence interval interpretation:

* How confident you are (e.g., 90%, 95%, 98%, 99%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}

### Relative Risk - Video RelativeRisk {-}

* Relative risk is the ratio of the risks in two different categories of an explanatory variable.

Relative Risk:

\vspace{0.3in}

Example: In a study reported in the New England Journal of Medicine [@doit2015], one-hundred fifty (150) children who had shown sensitivity to peanuts were randomized to receive a flour containing a peanut protein or a placebo flour for 2.5 years. At age 5 years, children were tested with a standard skin prick to see if they had an allergic reaction to peanut protein (yes or no). 71% of those in the peanut flour group no longer demonstrated a peanut allergy compared to 2% of those in the placebo group.

* Calculate the relative risk of desensitization comparing the peanut flour group to the placebo group.

\vspace{0.8in}

\setstretch{1.5}

* Interpretation:

    * The proportion of successes in group 1 is the $RR$ ________________ the proportion of successes in group 2.

Increase in risk:

\vspace{0.3in}

* Interpretation:

    * The proportion of successes in group 1 is the $(RR-1)$ ______________
higher/lower than the proportion of successes in group 2.

Percent increase in risk:

\vspace{0.3in}

* Interpretation:

    * The proportion of successes in group 1 is the $(RR-1)\times 100$ __________ higher/lower than the proportion of successes in group 2.

\setstretch{1}

* Interpret the value of relative risk from the peanut study in context of the problem.

\vspace{0.6in}

* Find the increase (or decrease) in risk of desensitization and interpret this value in context of the problem.

\vspace{1in}

* Find the percent increase (or decrease) in risk of desensitization and interpret this value in context of the problem.

\vspace{1in}

Within the peanut flour group, the percent desensitized within each age group (at start of study) is as follows:

1-year-olds: 71\%; 2-year-olds: 35\%; 3-year-olds: 19\%

* Calculate the relative risk of desensitization comparing the 3 year olds to the 2 year olds within the peanut flour group.

\vspace{0.8in}

* Interpret the percent increase (or decrease) in risk of desensitization comparing the 3 year olds to the 2 year olds within the peanut flour group.

\vspace{0.8in}

#### Relative risk in the news {-}

People 50 and older who have had a mild case of covid-19 are 15\% more likely to develop shingles (herpes zoster) within six months than are those who have not been infected by the coronavirus, according to research published in the journal Open Forum Infectious Diseases [@bhavsar2022].

* What was the calculated relative risk of developing shingles when comparing those who has mild COVID-19 to those who had not had COVID-19, among the 50 and older population?

\vspace{0.8in}

#### Testing Relative Risk {-}

In Unit 2, we tested for a difference in proportion.  We could also test for relative risk.

\setstretch{1.5}

Null Hypothesis:

$H_0:$

\vspace{0.2in}

Alternative Hypothesis:

$H_A:$

\vspace{0.2in}

\setstretch{1}


### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. Explain why the null distribution is centered at the value of zero.

\vspace{0.5in}

2. Does the confidence interval agree with the p-value?

\vspace{0.5in}
\newpage
