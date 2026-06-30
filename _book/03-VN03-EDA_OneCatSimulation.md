---
output:
  pdf_document: default
  html_document: default
---

## Video Notes: Analysis of One Categorical Variable

Read Chapter 3, 4, 9, 10 and Sections 14.1 and 14.2 in the course textbook.  Use the following videos to complete the video notes for Module 3.

### Course Videos

* One_Categorical_Variable_EDA

* Hypothesis_Testing

* Simulation_Tests_One_Categorical_Variable

* Confidence_Intervals

* Bootstrap_Intervals_One_Categorical_Variable


\setstretch{1}

### Video: One Categorical Variable EDA (sections 4.1 and 4.2 - summarizing and displaying one categorical variable) {-}

* A ______________ is calculated on data from a sample

* The ________________ is calculated on data from a population; it is typically unknown and therefore we will define it *in words*

* The parameter should include:

    * Population word (true, long-run, population)
    
    * Summary measure (depends on the type of data)
    
    * Context
    
        * Observational units
        
        * Variable(s)

Categorical data can be numerically summarized by calculating a _______________ from the data set.

Notation used for the population proportion:
       
\vspace{0.2in}
        

Notation used for the sample proportion:

\vspace{0.2in}

\setstretch{1.5}
Categorical data can be summarized in a ____________________ table, which reports counts or a ________________ ________________ table, which reports proportions.

\setstretch{1}

Types of plots for a single categorical variable:

\vspace{0.4in}

\vspace{2mm}

Example from section 4.1 using the `email` data set:

* Identify the observational units.

\vspace{0.2in}

* What type of variable is `number`?

\vspace{0.2in}

* Is Table 4.3 a frequency or relative frequency table?

\vspace{0.2in}

* What proportion of emails had no number in them?  Is this value a statistic or a parameter?  Write it using proper notation.

\vspace{0.3in}

\setstretch{1.5}

* Compare the two plots (frequency bar plot and relative frequency bar plot) of the variable `number` in Figure 4.1 in section 4.2 of the text.  Note that the x-axis is the _______________ in the two plots.  However, the ______________ differs.  The scale for the frequency bar plot goes from _______________________________ and the scale for the relative frequency bar plot is from ______________________________.

#### Optional Notes: Additional Example {-}

Gallatin Valley is the fastest growing county in Montana.  You’ll often hear Bozeman residents complaining about the ‘out-of-staters’ moving in.  A local real estate agent recorded data on a random sample of 100 home sales over the last year at her company and noted where the buyers were moving from as well as the age of the person or average age of a couple buying a home.  The variable age was binned into two categories, "Under30" and "Over30." Additionally, the variable, state the buyers were moving from, was created as a binary variable, "Out" for a location out of state and "In" for a location in state.  

The following code reads in the data set, `moving_to_mt` and names the object moving.


``` r
moving <- read.csv("data/moving_to_mt.csv")
```

The `R` function `glimpse` was used to give the following output.


``` r
glimpse(moving)
```

```
#> Rows: 100
#> Columns: 4
#> $ From      <chr> "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA", ~
#> $ Age_Group <chr> "Under30", "Under30", "Under30", "Under30", "Under30", "Unde~
#> $ Age       <int> 25, 26, 27, 27, 29, 29, 35, 37, 49, 63, 65, 77, 22, 24, 24, ~
#> $ InOut     <chr> "Out", "Out", "Out", "Out", "Out", "Out", "Out", "Out", "Out~
```

* What are the observational units in this study?

\vspace{0.3in}

* What type of variable is `Age`?

\vspace{0.3in}

* What type of variable is `Age_Group`?

To further analyze the categorical variable, `From`, we can create either a frequency table:


```
#>   From  n
#> 1   CA 12
#> 2   CO  8
#> 3   MT 61
#> 4   WA 19
```

Or a relative frequency table:


```
#>   From  n freq
#> 1   CA 12 0.12
#> 2   CO  8 0.08
#> 3   MT 61 0.61
#> 4   WA 19 0.19
```

* How many home sales have buyers from WA?  

\vspace{0.2in}

* What proportion of sampled home sales have buyers from WA?

\vspace{0.2in}

* What notation is used for the proportion of home sale buyers that that are from WA?

\vspace{0.2in}


The following code in `R` will create a frequency bar plot of the variable, `From`.


``` r
moving %>%
    ggplot(aes(x = From))+ #Enter the variable to plot
    geom_bar(stat = "count") + 
    labs(title = "Frequency Bar Plot of State of Origin for
         Gallatin County Home Sales", 
         #Title your plot (type of plot, observational units, variable)
       y = "Frequency", #y-axis label
       x = "State of Origin") #x-axis label
```



\begin{center}\includegraphics[width=0.65\linewidth]{03-VN03-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-5-1} \end{center}

* What can we see from this plot?

\vspace{0.3in}

Additionally, we can create a relative frequency bar plot.


``` r
moving %>%
  ggplot(aes(x = From))+ #Enter the variable to plot
  geom_bar(aes(y = after_stat(prop), group = 1)) +
  labs(title = "Relative Frequency Bar Plot of State of Origin 
       for Gallatin County Home Sales", 
       #Title your plot
       y = "Relative Frequency", #y-axis label
       x = "State of Origin") #x-axis label
```



\begin{center}\includegraphics[width=0.65\linewidth]{03-VN03-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-6-1} \end{center}


\setstretch{1}

### Video: Hypothesis Testing (chapter 9) {-}

Purpose of a hypothesis test:

* Use data collected on a sample to give information about the population.

* Determines __________________ of _____________________ of an effect

General steps of a hypothesis test

1.	Write a research question and hypotheses.

2.	Collect data and calculate a summary statistic.

3.	Model a sampling distribution which assumes the null hypothesis is true.

4.	Calculate a p-value.

5.	Draw conclusions based on a p-value.


### Hypotheses {-}

\setstretch{1.5}

* Always hypothesize about the __________________, so will always be written in terms of __________________.

* Both null and alternative hypotheses will compare the parameter to the same value, only the *sign* will change.

\setstretch{1}

#### Null hypothesis {-}

* Skeptical perspective, no difference, no effect, random chance

* What the researcher hopes is _______________.

* Will always use the __________________ sign.

Notation:

\vspace{0.2in}

#### Alternative hypothesis {-}

* New perspective, a chance, a difference, an effect

* What the researcher hopes is ________________.

* The sign of the alternative hypothesis reflects the _________________ __________________.

Notation *(write all three options)*:

\vspace{0.6in}

### Simulation vs. Theory-based Methods {-}

#### Simulation-based method {-}

\setstretch{1.5}

Creation of the null distribution

* Simulate many samples assuming 

\vspace{0.2in}

* Find the proportion of ___________________ at least as extreme as the observed sample ____________

* The null distribution estimates the sample to sample variability expected in the population

\setstretch{1}


#### Theory-based method {-}

* Use a mathematical model to determine a distribution under the null hypothesis

* Compare the observed sample statistic to the model to calculate a probability 

* *Theory-based methods will be discussed in the next module*

#### P-value {-}

\setstretch{1.5}

* What does the p-value measure?

    * Probability of observing the sample ___________________ or more __________ 
assuming the ________ hypothesis is __________.
    
* How much evidence does the p-value provide against the null hypothesis?


\begin{center}\includegraphics[width=0.75\linewidth]{images/soe_gradient_gray} \end{center}

\rgi \rgi - The __________________ the p-value, the ___________________ the evidence against the null hypothesis.


* Write a conclusion based on the p-value.

\rgi \rgi - Answers the ________________ question.
    
\rgi \rgi - Amount of _________________ in support of the _________________ hypothesis.
    
* Decision: can we reject or fail to reject the null hypothesis?

\rgi - Significance level: cut-off of “small” vs “large” p-value

\rgi \rgi - $\text{p-value} \le \alpha$

\rgi \rgi \rgi - Strong enough evidence against the null hypothesis
        
\rgi \rgi \rgi - Decision:
        
\vspace{0.2in}

        
\rgi \rgi \rgi - Results are _______________________ significant.
        
\rgi \rgi - $\text{p-value} > \alpha$

\rgi \rgi \rgi - Not enough evidence against the null hypothesis
        
\rgi \rgi \rgi - Decision:
        
\vspace{0.17in}

\rgi \rgi \rgi - Results are not _____________________ significant.

\setstretch{1}

### Hypothesis Testing/Justice System {-}

\setstretch{1.5}

* Null hypothesis: The defendant is _____________________

* Alternative hypothesis: The defendant is _______________________

* Prosecution collects evidence (data) and presents that evidence to a jury

* Two possible outcomes:

    - Strong evidence against ________________ -> jury finds the defendant _________________
    
    - Not enough evidence against ___________________ -> jury finds the defendant ___________________
    
<!-- ### One proportion test {-} -->

<!-- * Reminder: review summary measures and plots discussed in the Week 3 material and Chapter 4 of the textbook. -->

<!-- * The summary measure for a single categorical variable is a ______________. -->

<!-- Notation: -->

<!-- - Population proportion:  -->

<!-- - Sample proportion: -->

<!-- Parameter of Interest:   -->

<!-- * Include: -->

<!--     * Reference of the population (true, long-run, population, all) -->

<!-- 	* Summary measure -->

<!-- 	* Context -->

<!-- 	    * Observational units/cases -->

<!-- 	    * Response variable (and explanatory variable if present) -->

<!-- 	        * If the response variable is categorical, define a ‘success’ in context -->

#### Example: Martian Alphabet {-}

Review the Martian Alphabet example from sections 9.1 and 9.3.2

* Write the null hypothesis in words and in notation:

  \rgi \rgi In words: $H_0:$
  
\vspace{0.4in}
  
  \rgi \rgi In notation:  $H_0:\pi=$ _____, where $\pi$ represents the ___________ proportion of humans that would ____________________________. 
  
* Write the alternative hypothesis in words and in notation:

  \rgi \rgi In words: $H_A:$

\vspace{0.4in}
  
  \rgi \rgi In notation:  $H_A:\pi$ _________ (a ________ sign represents the research question - that humans have a ___________________ for choosing Bumba on the left)
  
* What is the value of the statistic?  Write it using proper notation.
  
\vspace{0.2in}
  
* Review Figure 9.2.  Why is the plot centered around 0.5?  What does each "dot" on the plot represent?
  
\vspace{0.4in}
  
* Does the statistic seem likely or unlikely to occur if humans are picking a shape randomly?  What about Figure 9.2 helps us to answer this question?
  
\vspace{0.4in}
 
\setstretch{1.5}
 
  * The p-value of the test is ________________.  This p-value provides ________________ evidence against the ___________________ hypothesis and for the ___________________ hypothesis.  The results from this study ___________________ be considered statistically significant.

\vspace{0.1in}


### Video: Simulation Tests for One Categorical Variable (section 14.1) {-}

Review the Medical Consultant example from section 14.1.

Identify the observational units.

\vspace{0.3in}

Identify the variable collected. 

\vspace{0.3in}

Is the variable categorical or quantitative? If categorical, define a "success"; if quantitative, state the units of measure.

\vspace{0.3in}

Define the parameter in words and write it using proper notation

\vspace{0.5in}

Write the null and alternative hypotheses in words and in proper notation:

  \rgi In words:

  \rgi \rgi $H_0:$

\vspace{0.45in}

  \rgi \rgi $H_A:$

\vspace{0.45in}

\newpage

  \rgi In notation:
  
\vspace{1mm}

  \rgi \rgi $H_0:$

\vspace{0.2in}

  \rgi \rgi $H_A:$

\vspace{0.2in}

Calculate the value of the statistic and write it using proper notation: 

\vspace{0.2in}

#### Simulation-based method {-}

* Simulate many samples assuming $H_0: \pi = \pi_0$

    * Create a spinner with that represents the null value

    * Spin the spinner $n$ times

    * Calculate and plot the simulated sample proportion from each simulation

    * Repeat 10000 times (simulations) to create the null distribution

    * Find the proportion of simulations at least as extreme as $\hat{p}$


``` r
set.seed(216)
one_proportion_test(probability_success = 0.10, # Null hypothesis value
          sample_size = 62, # Enter sample size
          number_repetitions = 10000, # Enter number of simulations
          as_extreme_as = 0.0484, # Observed statistic
          direction = "less", # Specify direction of alternative hypothesis
          summary_measure = "proportion") # Reporting proportion or number of successes?
```



\begin{center}\includegraphics[width=0.65\linewidth]{03-VN03-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-8-1} \end{center}

Explain why the null distribution is centered at the value of approximately 0.10:

\vspace{0.5in}

Where is the red line plotted on the null distribution?  Why is that value important?

\vspace{0.3in}

Why is the area left of the red line shaded on the null distribution?

\vspace{0.3in}

Interpretation of the p-value:

* Statement about probability or proportion of samples

* Statistic (summary measure and value) and Direction of the alternative 
    
* Null hypothesis (population reference, summary measure, equal to null value)

* Context of the problem (observational units, variable(s))

Two example p-value interpretations are provided below.  Identify each of the components within the two examples:

* Example 1: There is a 12.36\% probability of observing three (3) or fewer complications out of sixty-two (63) liver donor surgeries in the US, if the true proportion of complications is 0.10.

* Example 2: If 10% of all liver donor surgeries in the US result in a complication, 1236/10000 samples would simulate a proportion of complications of 0.048 or less. 

\vspace{0.1in}

Conclusion: 

* Amount of evidence
    
* For the alternative hypothesis (population reference, summary measure, direction, null value)

* Context (observational units, variable(s))

An example conclusion is provided below.  Identify each of the components within the example:

* There is little to no that the proportion of all liver donor surgeries in the US that result in a complication is less than 0.10.

\vspace{0.1in}

Generalization:

* Can the results of the study be generalized to the target population?

\vspace{0.4in}

\newpage

### Video: Confidence intervals (chapter 10) {-}

\rgi $\text{statistic} \pm \text{margin of error}$

Vocabulary:

* Point estimate:

\vspace{0.3in}

* Margin of error:

\vspace{0.3in}

\setstretch{1.5}

Purpose of a confidence interval

* To give an ____________________ ___________________ for the parameter of interest

* Determines how ______________ an effect is

\setstretch{1}

#### Sampling distribution {-}

\setstretch{1.5}

* Ideally, we would take many samples of the same ___________ from the same population to create a sampling distribution

* But only have 1 sample, so we will _________________ with _________________ from the one sample.

* Need to estimate the sampling distribution to see the _________________ in the sample

\setstretch{1}

#### Simulation-based methods {-}

Bootstrap distribution:

* Write the response variable values on cards

* Sample with replacement $n$ times (bootstrapping)

* Calculate and plot the simulated difference in sample means from each simulation

* Repeat 10000 times (simulations) to create the bootstrap distribution

* Find the cut-offs for the middle X% (confidence level) in a bootstrap distribution.

What is bootstrapping?

* Assume the “population” is many, many copies of the original sample.  

* Randomly sample with replacement from the original sample $n$ times.

#### Example: Medical Consultant {-}

Review the Medical Consultant example in section 10.1.

* Is 0.048 the statistic or the parameter?  How do you know?
  
\vspace{0.4in}

* Review Figure 10.6 in section 10.1.2.  
  
  * Why is the plot centered near 0.048?  What does each "dot" on the plot represent?
  
  \vspace{0.4in}
  
  * Why are the 2.5th and 97.5th percentiles of the bootstrap distribution marked?  What are the values of these two percentiles?
  
  \vspace{0.3in}
  
\setstretch{1.5}
  
  * Interpret the confidence interval:  We are _______% _____________________ that, in the ________________, the true probability (or proportion) of complications is between ____________ and _________.
  
\vspace{0.3in}

\setstretch{1}

 
### Video: Bootstrap Confidence Intervals for One Categorical Variable (section 14.2) {-}

Review the Medical Consultant study from section 14.2.

Bootstrap distribution:
   

``` r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 62, # Sample size
                    number_successes = 3, # Observed number of successes
                    number_repetitions = 10000, # Number of bootstrap samples to use
                    confidence_level = 0.95) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-VN03-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-9-1} \end{center}

Confidence interval interpretation:

* How confident you are (e.g., 90%, 95%, 98%, 99%)
    
* Parameter of interest
    
* Calculated interval
    
\vspace{0.8in}

#### How does changing the confidence level impact the width of the confidence interval? {-}

90\% Confidence Interval:


``` r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 62, # Sample size
                    number_successes = 3, # Observed number of successes
                    number_repetitions = 10000, # Number of bootstrap samples to use
                    confidence_level = 0.90) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-VN03-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-10-1} \end{center}

99\% Confidence Interval:


``` r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 62, # Sample size
                    number_successes = 3, # Observed number of successes
                    number_repetitions = 10000, # Number of bootstrap samples to use
                    confidence_level = 0.99) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-VN03-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-11-1} \end{center}

### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. What is the summary measure calculated from a single categorical variable?

\vspace{0.3in}


2.  Write the alternative hypothesis for the Martian Alphabet study in notation?  How was the direction of the alternative hypothesis determined?

\vspace{0.4in}

3. Do the results of the confidence interval for the Medical Consultant study *match* the results based on the p-value?

\vspace{0.5in}



\newpage
