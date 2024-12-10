# Exploring Categorical Data: Exploratory Data Analysis and Inference using Simulation-based Methods

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of a single categorical variable.

* **Summary statistic (point estimate)**: the value of a numerical summary measure computed from _sample_ data 

    * Summary measures covered in STAT 216 include: single proportion, difference in proportions, single mean, paired mean difference, difference in means, correlation, and slope of a regression line

    * For a single categorical variable, a proportion is calculated

    * To interpret in context include:

        - Summary measure (in context)
    
        - Value of the statistic 
    
* **Parameter of interest**: a numerical summary measure of the entire _population_ in which we are interested

    * The value of the parameter of interest is unknown (unless we have access to the entire population)

    * To write in context:

        - Population word (true, long-run, population)

        - Summary measure (depends on the type of data)

        - Context

            - Observational units

            - Variable(s)

* **Frequency bar plot**: plots the count (frequency) of observational units in each level of a categorical variable

* **Relative frequency bar plot**: plots the proportion (relative frequency) of observational units in each level of a categorical variable

* **Hypothesis testing**:  a formal statistical technique for evaluating two competing possibilities about a population: the null hypothesis and alternative hypothesis

    * When we observe an effect in a sample, we would like to determine if this observed effect represents an actual effect in the population, or whether it was simply due to random chance.
    
    * A hypothesis test helps us answer the following question about the population: How strong is the _evidence_ of an effect?

* **Null hypothesis**: typically represents a statement of "no difference", "no effect", or the status quo

    * The null hypothesis is what we assume is true when calculating the p-value. Thus, we can never have evidence _for_ the null hypothesis---we cannot "accept" a null hypothesis---we can only find evidence _against_ the null hypothesis if the observed data is very unlikely to have occurred under the assumption that the null hypothesis is true.

* **Alternative hypothesis**: represents an alternative claim under consideration and is often represented by a range of possible values for the parameter of interest.

    * The alternative hypothesis is determined by the research question.
    
* **Hypotheses in notation for a single proportion**: In the hypotheses below, $\pi_0$ is the **null value**.

$$H_0: \pi = \pi_0$$
$$H_A: \pi \left\{
\begin{array}{ll}
< \\
\ne \\
< \\
\end{array}
\right\}
\pi_0 $$

* **Null Distribution**: a distribution of simulated sample statistics created under the assumption that the null hypothesis is true

* **Simulation methods to create the null distribution**: a process of using a computer program (e.g., R) to simulate many samples that we would expect based on the null hypothesis.

    R code to use simulation methods for one categorical variable to find the p-value, `one_proportion_test`, is shown below.  

    
    ``` r
    one_proportion_test(probability_success = xx, # Null hypothesis value
          sample_size = xx, # Enter sample size
          number_repetitions = 1000, # Enter number of simulations
          as_extreme_as = xx, # Observed statistic
          direction = "xx", # Specify direction of alternative hypothesis
          summary_measure = "proportion") # Reporting proportion or number of successes?
    ```

* **P-value**: the probability of the value of the observed sample statistic or a value more extreme, if the null hypothesis were true

    * To write in context include:

        - Statement about probability or proportion of samples
    
        - Statistic (summary measure and value)
    
        - Direction of the alternative 
    
        - Null hypothesis (in context) 

* **Strength of evidence**: the p-value indicates the amount of evidence there is against the null hypothesis.  The smaller the p-value the more evidence there is against the null hypothesis.



\begin{center}\includegraphics[width=0.9\linewidth]{images/soe_gradient_gray} \end{center}
    
* **Conclusion** (to a hypothesis test): answers the research question.  How much evidence is there in support of the alternative hypothesis?

    * To write in context include:

        - Amount of evidence
    
        - Parameter of interest 
    
        - Direction of the alternative hypothesis
    
* **Confidence interval**: an interval estimate for the parameter of interest

    * A confidence interval helps us answer the following question about the population: How _large_ is the effect?

    * To write in context include:

        - How confident you are (e.g., 90%, 95%, 98%, 99%)
    
        - Parameter of interest
    
        - Calculated interval

* **Bootstrapping**: creating a simulated sample of the same size as the original sample by sampling with replacement from the original sample

* **Simulation methods to create the bootstrap distribution**: a process of using a computer program to simulate many bootstrapped samples.

    R code to use simulation methods for one categorical variable to find a confidence interval, `one_proportion_bootstrap_CI`, is shown below. 

    
    ``` r
    one_proportion_bootstrap_CI(sample_size = xx, # Sample size
                    number_successes = xx, # Observed number of successes
                    number_repetitions = 1000, # Number of bootstrap samples to use
                    confidence_level = 0.95) # Confidence level as a decimal
    ```


* **Percentile method**: process to find the confidence interval from the bootstrap distribution

    * A 90\% confidence interval will be found between the 5th and 95th percentiles

    * A 95\% confidence interval will be found between the 2.5th and 97.5th percentiles

    * A 99\% confidence interval will be found between the 0.5th and 99.5th percentiles


### Key topics

#### Steps of the statistical investigation process {-}

As we move through the semester we will work through the six steps of the statistical investigation process.  

1. Ask a research question.

2. Design a study and collect data. 

3. Summarize and visualize the data. 

4. Use statistical analysis methods to draw inferences from the data. 

5. Communicate the results and answer the research question. 

6. Revisit and look forward.

#### Exploratory data analysis {-}

At the end of this module, you should understand how to calculate a summary statistic and plot a single categorical variable.  

* Notation for a sample proportion: $\hat{p}$

* Notation for a population proportion: $\pi$

* Types of plots for a single categorical variable:

    * Frequency bar plot
    
    * Relative frequency bar plot

#### Inference {-}

We will use simulation methods **to find evidence of an effect by finding a p-value** and **estimating how large the effect is by creating a confidence interval** in the one proportion (one categorical variable) scenario.

These are steps 4 and 5 from the steps of the statistical investigation process.



\newpage
