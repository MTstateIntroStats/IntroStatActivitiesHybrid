# Exploring Categorical Data: Exploratory Data Analysis and Inference using Simulation-based Methods

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of a single categorical variable.

* **Summary statistic (point estimate)**: the summary statistic is the value calculated from the data 

    * For a single categorical variable a proportion is calculated

    * To interpret in context include:

        - Summary measure (in context)
    
        - Value of the statistic 
    
* **Parameter of interest**: what we are interested in about the population

    * To write in context:

        - Population word (true, long-run, population)

        - Summary measure (depends on the type of data)

        - Context

            - Observational units

            - Variable(s)

* **Frequency bar plot**: plots the count for each level of a categorical variable

* **Relative frequency bar plot**: plots the proportion of each level of a categorical variable

* **Hypothesis testing**:  a formal technique for evaluating two competing possibilities, the null and alternative

    * When we observe an effect in a sample, we would like to determine if this observed effect represents an actual effect in the population, or whether it was simply due to chance.

* **Null hypothesis**: represents either a skeptical perspective or a claim to be tested.  

* **Alternative hypothesis**: represents an alternative claim under consideration and is often represented by a range of possible values for the parameter of interest.

* **Simulation methods to create the null distribution**: a process of using a computer program (R) to simulate many copies of samples we would expect based on the null hypothesis.

* **Null Distribution**: a simulated distribution created under the assumption the null hypothesis is true

\newpage

* R code to use for simulation methods for one categorical variable to find the p-value, one_proportion_test, is shown below.  


``` r
one_proportion_test(probability_success = xx, # Null hypothesis value
          sample_size = xx, # Enter sample size
          number_repetitions = 1000, # Enter number of simulations
          as_extreme_as = xx, # Observed statistic
          direction = "xx", # Specify direction of alternative hypothesis
          summary_measure = "proportion") # Reporting proportion or number of successes?
```

* **P-value**: measures the probability of the sample statistic or more extreme if the null hypothesis is true

    * To write in context include:

        - Statement about probability or proportion of samples
    
        - Statistic (summary measure and value)
    
        - Direction of the alternative 
    
        - Null hypothesis (in context) 

* **Conclusion**: answers the research question.  How much evidence is there in support of the alternative hypothesis?

    * To write in context include:

        - Amount of evidence
    
        - Parameter of interest 
    
        - Direction of the alternative hypothesis
    
* **Strength of evidence**: the p-value indicates the amount of evidence there is against the null hypothesis.  The smaller the p-value the more evidence there is against the null hypothesis.



\begin{center}\includegraphics[width=0.9\linewidth]{images/soe_gradient_gray} \end{center}
    
* **Bootstrapping**: sampling with replacement from a given sample

* **Simulation methods to create the bootstrap distribution**: a process of using a computer program (R) to simulate many copies of samples by sampling with replacement from the original sample.

* R code to use for simulation methods for one categorical variable to find a confidence interval, one_proportion_bootstrap_CI, is shown below. 


``` r
one_proportion_bootstrap_CI(sample_size = xx, # Sample size
                    number_successes = xx, # Observed number of successes
                    number_repetitions = 1000, # Number of bootstrap samples to use
                    confidence_level = 0.95) # Confidence level as a decimal
```

\newpage

* **Percentile method**: process to find the confidence interval from the bootstrap distribution

    * A 90\% confidence interval will be found between the 5th and 95th percentiles

    * A 95\% confidence interval will be found between the 2.5th and 97.5th percentiles

    * A 99\% confidence interval will be found between the 0.5th and 99.5th percentiles

* **Confidence interval**: an interval estimate for the parameter of interest

    * To write in context include:

        - How confident you are (e.g., 90%, 95%, 98%, 99%)
    
        - Parameter of interest
    
        - Calculated interval

### Key topics

#### Exploratory data analysis {-}

At the end of this module, you should understand how to calculate a summary statistic and plot a single categorical variable.  

* Notation for a sample proportion: $\hat{p}$

* Notation for a population proportion: $\pi$

* Types of plots for a single categorical variable:

    * Frequency bar plot
    
    * Relative frequency bar plot

### Inference {-}

Additionally, we will use simulation methods **to find evidence of an effect by finding a p-value** and **estimating how large the effect is by creating a confidence interval**.

This is steps 4 and 5 from the steps of the statistical investigation process.

### Steps of the statistical investigation process {-}

As we move through the semester we will work through the six steps of the statistical investigation process.  

1. Ask a research question.

2. Design a study and collect data. 

3. Summarize and visualize the data. 

4. Use statistical analysis methods to draw inferences from the data. 

5. Communicate the results and answer the research question. 

6. Revisit and look forward.

* Null hypothesis notation for a single proportion:

    * $H_0: \pi = \pi_0$, where $\pi_0$ represents the null value for the study.

* Alternative hypothesis notation for a single proportion:

    * $H_A: \pi \{< \ne > \} \pi_0$
    
    * Use the research question to determine the direction of the alternative.

\newpage