---
output:
  pdf_document: default
  html_document: default
---
## Activity 5:  Helper-Hinderer (continued)



\setstretch{1}

### Learning outcomes

* Describe and perform a simulation-based hypothesis test for a single proportion.

* Interpret and evaluate a p-value for a simulation-based hypothesis test for a single proportion.

* Explore what a p-value represents

### Steps of the statistical investigation process

In today's activity we will continue with steps 4 and 5 in the statistical investigation process.  We will continue to assess the Helper-Hinderer study from last class.

* **Ask a research question** that can be addressed by collecting data. What are the researchers trying to show?

* **Design a study and collect data**. This step involves selecting the people or objects to be studied and how to gather relevant data on them.

* **Summarize and visualize the data**. Calculate summary statistics and create graphical plots that best represent the research question.

* **Use statistical analysis methods to draw inferences from the data**. Choose a statistical inference method appropriate for the data and identify the p-value and/or confidence interval after checking assumptions. In this study, we will focus on using randomization to generate a simulated p-value.

* **Communicate the results and answer the research question**. Using the p-value and confidence interval from the analysis, determine whether the data provide statistical evidence against the null hypothesis. Write a conclusion that addresses the research question.

### Helper-Hinderer

In class today, we will revisit the study on infants as described below.

A study by Hamblin, Wynn, and Bloom reported in Nature [@hamblin2007] was intended to check young kids' feelings about helpful and non-helpful behavior. Non-verbal infants ages 6 to 10 months were shown short videos with different shapes either helping or hindering the climber. As a class we will watch this short video to see how the experiment was run: https://youtu.be/anCaGBsBOxM. Researchers were hoping to assess: Are non-verbal infants more likely to choose the helper toy? In the study, of the 16 infants age 6 to 10 months, 14 chose the *helper* toy and 2 chose the *hinderer* toy.

#### Sampling distribution of the sample proportion. {-}

The sampling distribution is a distribution of a statistic from all possible samples of size $n$ from the population.  The mean of the sampling distribution should be close to the parameter value and the standard deviation of the sampling distribution will estimate the variability of statistics from sample to sample.  

To create a sampling distribution of the statistic, we would take infinite samples of size $n$ from the population and plot the statistic from each sample.  To illustrate this idea we will revisit the Becenti address looking at the mean word length.  


```
#>   min Q1 median Q3 max     mean       sd   n missing
#> 1   1  2      3  5  14 3.952646 2.300228 359       0
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-A05-inference-1cat_simulation-continued_files/figure-latex/unnamed-chunk-2-1} \end{center}
Note that the mean of this small population ($N=359$) is 3.9526.  Typically, we don't have such small population sizes so we need a way to simulate the sampling distribution of the statistic to estimate the sample to sample variability.  Repeat samples of size 10 are taken from the population of words and the sample mean of each sample is plotted below.


```
#>   min  Q1 median  Q3 max     mean        sd   n missing
#> 1 2.1 3.3    3.9 4.4 6.7 3.934557 0.7954711 305       0
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-A05-inference-1cat_simulation-continued_files/figure-latex/unnamed-chunk-3-1} \end{center}

The mean of this simulated distribution is 3.934557, which is close to the true mean from the population. The standard deviation is 0.7954711 - this measures how far each statistic is from the true mean word length, on average.  Later in the semester, we will learn how this variability is affected by the sample size.


Today, we will use the computer to simulate the sampling distribution of the sample proportion by creating a null distribution of 10000 different samples of 16 infants, plotting the proportion who will choose the helper in each sample, based on the assumption that the true proportion of infants who choose the helper is 0.5 (or that the null hypothesis is true).  

\newpage

To use the computer simulation, we will need to enter the 

* assumed "probability of success" ($\pi_0$), 
* "sample size" (the number of observational units or cases in the sample),
* "number of repetitions" (the number of samples to be generated - typically we use 10000), 
* "as extreme as" (the observed statistic), and 
* the "direction" (matches the direction of the alternative hypothesis).


1.  What values should be entered for each of the following into the one proportion test to create 10000 simulations?

\vspace{1mm}
* Probability of success (null value):

\vspace{.2in}
* Sample size (n):
    
\vspace{.2in}
* Number of repetitions (typically use 10000 simulations):
    
\vspace{.2in}
* As extreme as (value of statistic):
    
\vspace{.2in}
* Direction (`"greater"`, `"less"`, or `"two-sided"`):

The following shows one possible distribution of simulated sample proportions assuming the null hypothesis, true proportion of non-verbal infants aged 6 to 10 months that will choose the helper toy is 0.5, is true.


``` r
set.seed(100)
one_proportion_test(probability_success = 0.5, # Null hypothesis value
          sample_size = 16, # Enter sample size
          number_repetitions = 10000, # Enter number of simulations
          as_extreme_as = 0.875, # Observed statistic
          direction = "greater", # Specify direction of alternative hypothesis
          summary_measure = "proportion") # Reporting proportion or number of successes?
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-A05-inference-1cat_simulation-continued_files/figure-latex/unnamed-chunk-4-1} \end{center}

### Notes on the null distribution {-}

\newpage

Using R, we will use the `one_proportion_test()` function (in the `catstats` package) to simulate another null distribution of sample proportions and compute a p-value. Using the provided `R` script file, fill in the values/words for each `xx` with your answers from question 1 in the one proportion test to create a null distribution with 10000 simulations. Then highlight and run lines 1--16.  *Note that the value for the mean, standard deviation, and p-value changed slightly.*


``` r
set.seed(216)
one_proportion_test(probability_success = 0.5, # Null hypothesis value
          sample_size = 16, # Enter sample size
          number_repetitions = 10000, # Enter number of simulations
          as_extreme_as = 0.875, # Observed statistic
          direction = "greater", # Specify direction of alternative hypothesis
          summary_measure = "proportion") # Reporting proportion or number of successes?
```



\begin{center}\includegraphics[width=0.7\linewidth]{03-A05-inference-1cat_simulation-continued_files/figure-latex/unnamed-chunk-5-1} \end{center}
For the remainder of the questions in this activity use this 2nd simulated null distribution.

2. Circle the observed statistic (value calculated in Activity 4) on the null distribution.  Where does this statistic fall in the null distribution: Is it near the center of the distribution (near 0.5) or in one of the tails of the distribution?  

\vspace{0.3in}

3. Is the observed statistic likely to happen or unlikely to happen if the true proportion of infants who choose the helper is 0.5?  Explain your answer using the plot.

\vspace{0.5in}

4.  Using the simulation, what is the proportion of simulated samples that generated a sample proportion at the observed statistic or greater, if the true proportion of infants who choose the helper is 0.5? *Hint*: Look under the simulation.

\vspace{0.3in}

\newpage

### Notes on the p-value {-}

The value in question 4 is the **p-value**.  The smaller the p-value, the more evidence we have against the null hypothesis. 

\vspace{1.5in}



\begin{center}\includegraphics[width=0.9\linewidth]{images/soe_gradient_gray} \end{center}


#### Interpret the p-value {-}

The p-value measures the probability that we observe a sample proportion as extreme as what was seen in the data or more extreme (matching the direction of the $H_A$) IF the null hypothesis is true.  This is a conditional probability, calculated dependent on the null hypothesis being true.  Represented in probability notation:

$$P(\text{statistic or more extreme|the null hypothesis is true})$$

**p-value interpretation:**

\vspace{1in}

#### Communicate the results and answer the research question {-}

When we write a conclusion we answer the research question by stating how much evidence there is in support of the alternative hypothesis.

**Conclusion:**

\vspace{1in}

#### Generalization {-}

5. To what group of observational units can the results be generalized to?

\vspace{0.5in}

### Take-home messages

1. The null distribution is created based on the assumption the null hypothesis is true. We compare the sample statistic to the distribution to find the likelihood of observing this statistic.

2. The p-value measures the probability of observing the sample statistic or more extreme (in direction of the alternative hypothesis) if the null hypothesis is true.

3. The smaller the p-value of the test, the more evidence there is **against** the null hypothesis.


### Additional notes

Activities 4--6 cover the material in Module 3.  For more practice with simulation hypothesis testing of a single categorical variable use the Module 3 Review worksheet in the Unit 1 Review Materials (pgs. 112--115).

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
