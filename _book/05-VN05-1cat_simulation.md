# Inference for a Single Categorical Variable: Simulation-based Methods

## Video Notes: Inference for One Categorical Variable using Simulation-based Methods

Read Chapters 9 and 10 and Sections 14.1 and 14.2 in the course textbook.  Use the following videos to complete the video notes for Module 5.

### Course Videos

* Chapter9

* 14.1

* Chapter10

* 14.2

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
        
\vspace{0.2in}

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

\newpage

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

    * Repeat 1000 times (simulations) to create the null distribution

    * Find the proportion of simulations at least as extreme as $\hat{p}$


```r
set.seed(216)
one_proportion_test(probability_success = 0.333, # Null hypothesis value
          sample_size = 114, # Enter sample size
          number_repetitions = 1000, # Enter number of simulations
          as_extreme_as = 0.447, # Observed statistic
          direction = "greater", # Specify direction of alternative hypothesis
          summary_measure = "proportion") # Reporting proportion or number of successes?
```



\begin{center}\includegraphics[width=0.7\linewidth]{05-VN05-1cat_simulation_files/figure-latex/unnamed-chunk-2-1} \end{center}

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

* Repeat 1000 times (simulations) to create the bootstrap distribution

* Find the cut-offs for the middle X% (confidence level) in a bootstrap distribution.

What is bootstrapping?

* Assume the “population” is many, many copies of the original sample.  

* Randomly sample with replacement from the original sample $n$ times. 

#### Video 14.2 {-}

Let's revisit the blue-eyed male study to estimate the *proportion of ALL heterosexual blue-eyed males who tend to find blue-eyed women the most attractive* by creating a 90\% confidence interval. 

Bootstrap distribution:
   

```r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 114, # Sample size
                    number_successes = 51, # Observed number of successes
                    number_repetitions = 1000, # Number of bootstrap samples to use
                    confidence_level = 0.90) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{05-VN05-1cat_simulation_files/figure-latex/unnamed-chunk-3-1} \end{center}

Confidence interval interpretation:

* How confident you are (e.g., 90%, 95%, 98%, 99%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}


\newpage

How does changing the confidence level impact the width of the confidence interval?


95\% Confidence Interval:


```r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 114, # Sample size
                    number_successes = 51, # Observed number of successes
                    number_repetitions = 1000, # Number of bootstrap samples to use
                    confidence_level = 0.95) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{05-VN05-1cat_simulation_files/figure-latex/unnamed-chunk-4-1} \end{center}

99\% Confidence Interval:


```r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 114, # Sample size
                    number_successes = 51, # Observed number of successes
                    number_repetitions = 1000, # Number of bootstrap samples to use
                    confidence_level = 0.99) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{05-VN05-1cat_simulation_files/figure-latex/unnamed-chunk-5-1} \end{center}

### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1.  What was the null value for the study discussed? 

\vspace{0.3in}

2.  Write the alternative hypothesis for this study in notation?  How was the direction of the alternative hypothesis determined?

\vspace{0.4in}

3. Do the results of the confidence interval *match* the results based on the p-value?

\vspace{0.5in}

\newpage
