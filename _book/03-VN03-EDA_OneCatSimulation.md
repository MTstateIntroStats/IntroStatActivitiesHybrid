---
output:
  pdf_document: default
  html_document: default
---

## Video Notes: Exploratory Data Analysis of Categorical Variables

Read Chapter 3, 4, 9, 10 and Sections 14.1 and 14.2 in the course textbook.  Use the following videos to complete the video notes for Module 4.

### Course Videos

* 4.1_OneProp

* 4.2_OneProp

* Chapter9

* 14.1

* Chapter10

* 14.2

<!-- * 5.2to5.4 -->

<!-- * 5.5to5.6 -->

<!-- * 5.7 -->

\setstretch{1}

### Summarizing categorical data - Video 4.1_OneProp {-}

* A ______________ is calculated on data from a sample

* The parameter of interest is what we want to know from the population.

* Includes:

    * Population word (true, long-run, population)
    
    * Summary measure (depends on the type of data)
    
    * Context
    
        * Observational units
        
        * Variable(s)

Categorical data can be numerically summarized by calculating a _______________ from the data set.

Notation used for the population proportion:
    
* Single categorical variable:
       
\vspace{0.2in}
        

Notation used for the sample proportion:
    
* Single categorical variable:

\vspace{0.2in}

\setstretch{1.5}
Categorical data can be reported in a ____________table, 
which plots counts or a ______________ 
frequency table, which plots the proportion.

\setstretch{1}

\vspace{2mm}

Example from the Video:  Gallatin Valley is the fastest growing county in Montana.  You’ll often hear Bozeman residents complaining about the ‘out-of-staters’ moving in.  A local real estate agent recorded data on a random sample of 100 home sales over the last year at her company and noted where the buyers were moving from as well as the age of the person or average age of a couple buying a home.  The variable age was binned into two categories, "Under30" and "Over30." Additionally, the variable, state the buyers were moving from, was created as a binary variable, "Out" for a location out of state and "In" for a location in state.  

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


#### Displaying categorical variables - Video 4.2_OneProp {-}

* Types of plots for a single categorical variable

\vspace{0.4in}

<!-- * Types of plots for two categorical variables -->

<!-- \vspace{0.4in} -->

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

\setstretch{1.5}

* Note: the x-axis is the _______________ between the frequency bar plot and the relative frequency bar plot.  However, the ______________ differs.  The scale for the frequency bar plot goes from _______________________________ and the scale for the relative frequency bar plot is from ______________________________.

\setstretch{1}

### Hypothesis Testing - Video Chapter9 {-}

Purpose of a hypothesis test:

* Use data collected on a sample to give information about the population.

* Determines __________________ of _____________________ of an effect

General steps of a hypothesis test

1.	Write a research question and hypotheses.

2.	Collect data and calculate a summary statistic.

3.	Model a sampling distribution which assumes the null hypothesis is true.

4.	Calculate a p-value.

5.	Draw conclusions based on a p-value.

### Hypothesis Testing/Justice System {-}

\setstretch{1.5}

* Two possible outcomes if the observed statistic is unusual:

    - Strong evidence against __________________ -> ____________________
    
    - Not enough evidence against _____________________ -> ______________________

* Always written about the __________________ (population)

\setstretch{1}

#### Null hypothesis {-}

* Skeptical perspective, no difference, no effect, random chance

* What the researcher hopes is _______________.

Notation:

\vspace{0.2in}

#### Alternative hypothesis {-}

* New perspective, a chance, a difference, an effect

* What the researcher hopes is ________________.

Notation:

\vspace{0.2in}

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

\rgi \rgi - The __________________the p-value, the ___________________ the evidence against the null hypothesis.
    
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
    
### One proportion test {-}

* Reminder: review summary measures and plots discussed in the Week 3 material and Chapter 4 of the textbook.

* The summary measure for a single categorical variable is a ______________.

Notation:

- Population proportion: 

- Sample proportion:

Parameter of Interest:  

* Include:
 
    * Reference of the population (true, long-run, population, all)
	
	* Summary measure

	* Context
	   
	    * Observational units/cases
	   
	    * Response variable (and explanatory variable if present)
	       
	        * If the response variable is categorical, define a ‘success’ in context

#### Hypothesis testing {-}

Conditions:

* Independence:

\vspace{0.3in}

Null hypothesis assumes “no effect”, “no difference”, “nothing interesting happening”, etc.

\rgi Always of form:  “parameter” = null value

$H_0:$

\vspace{0.5in}

$H_A:$

\vspace{0.5in}

* Research question determines the direction of the alternative hypothesis.

Video 14.1 Example: A 2007 study published in the Behavioral Ecology and Sociobiology Journal was titled “Why do blue-eyed men prefer blue-eyed women?” [@laeng2007] In this study, conducted in Norway, 114 volunteer heterosexual blue-eyed males rated the attractiveness of 120 pictures of females.  The researchers recorded which eye-color (blue, green, or brown) was rated the highest, on average.  In the sample, 51 of the volunteers rated the blue-eyed women the most attractive.  Do blue-eyed heterosexual men tend to find blue-eyed women the most attractive?

Parameter of interest:

\vspace{0.5in}

Write the null and alternative hypotheses for the blue-eyed study:

<!-- In words:  -->

<!-- $H_0:$ -->

<!-- \vspace{0.45in} -->

<!-- $H_A:$ -->

<!-- \vspace{0.45in} -->

In notation:

\vspace{1mm}

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}

Statistic: 

\vspace{0.4in}

Is the independence condition met to analyze these data using a simulation-based approach? 

\vspace{0.2in}

\newpage

#### Simulation-based method {-}

* Simulate many samples assuming $H_0: \pi = \pi_0$

    * Create a spinner with that represents the null value

    * Spin the spinner $n$ times

    * Calculate and plot the simulated sample proportion from each simulation

    * Repeat 10000 times (simulations) to create the null distribution

    * Find the proportion of simulations at least as extreme as $\hat{p}$


``` r
set.seed(216)
one_proportion_test(probability_success = 0.333, # Null hypothesis value
          sample_size = 114, # Enter sample size
          number_repetitions = 10000, # Enter number of simulations
          as_extreme_as = 0.447, # Observed statistic
          direction = "greater", # Specify direction of alternative hypothesis
          summary_measure = "proportion") # Reporting proportion or number of successes?
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-VN03-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-8-1} \end{center}

Explain why the null distribution is centered at the value of approximately 0.333:

\vspace{0.5in}

Interpretation of the p-value:

* Statement about probability or proportion of samples

* Statistic (summary measure and value)
    
* Direction of the alternative 
    
* Null hypothesis (in context) 

\vspace{0.8in}

\newpage

Conclusion: 

* Amount of evidence
    
* Parameter of interest 
    
* Direction of the alternative hypothesis

\vspace{0.6in}

Generalization:

* Can the results of the study be generalized to the target population?

\vspace{0.4in}

### Confidence interval - Video Chapter10 {-}

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

#### Video 14.2 {-}

Let's revisit the blue-eyed male study to estimate the *proportion of ALL heterosexual blue-eyed males who tend to find blue-eyed women the most attractive* by creating a 90\% confidence interval. 

Bootstrap distribution:
   

``` r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 114, # Sample size
                    number_successes = 51, # Observed number of successes
                    number_repetitions = 10000, # Number of bootstrap samples to use
                    confidence_level = 0.90) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-VN03-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-9-1} \end{center}

Confidence interval interpretation:

* How confident you are (e.g., 90%, 95%, 98%, 99%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}


\newpage

How does changing the confidence level impact the width of the confidence interval?


95\% Confidence Interval:


``` r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 114, # Sample size
                    number_successes = 51, # Observed number of successes
                    number_repetitions = 10000, # Number of bootstrap samples to use
                    confidence_level = 0.95) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-VN03-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-10-1} \end{center}

99\% Confidence Interval:


``` r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 114, # Sample size
                    number_successes = 51, # Observed number of successes
                    number_repetitions = 10000, # Number of bootstrap samples to use
                    confidence_level = 0.99) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-VN03-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-11-1} \end{center}

### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. What is the summary measure calculated from a single categorical variable?

\vspace{0.3in}


2.  Write the alternative hypothesis for this study in notation?  How was the direction of the alternative hypothesis determined?

\vspace{0.4in}

3. Do the results of the confidence interval *match* the results based on the p-value?

\vspace{0.5in}



\newpage
