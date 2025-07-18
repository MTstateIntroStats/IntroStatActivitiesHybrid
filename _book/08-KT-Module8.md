# Exploratory Data Analysis and Simulation-based Inference for Two Categorical Variables

## Vocabulary Review and Key Topics

Review the Golden Ticket posted in the resources at the end of the coursepack for a summary of two categorical variables.

### Key topics

Module 8 will introduce exploratory data analysis and simulation-based inference for two categorical variables. The **summary measure** for two categorical variables is a **difference in proportions**. We can also calculate a **relative risk** (ratio of proportions).

* Notation for a difference in sample proportions: $\hat{p}_1 - \hat{p}_2$, where 1 represents the 1st group of the explanatory variable and 2 represents the 2nd group

* Notation for a sample relative risk: $\dfrac{\hat{p}_1}{\hat{p}_2}$

* Notation for a difference in population proportions: $\pi_1 - \pi_2$

* Notation for a population relative risk: $\dfrac{\pi_1}{\pi_2}$

Types of plots for two categorical variables:

* Segmented bar plot

* Mosaic plot

We also explore study design and confounding variables.

### Vocabulary

#### Sample statistics for two categorical variables {-}

* **Difference in proportion**: $\hat{p}_1 - \hat{p}_2$
    
* **Relative risk**: the ratio of the conditional proportions:
$$\text{Relative Risk} = \frac{\hat{p}_1}{\hat{p}_2}$$
    
    * Interpretation of relative risk ($RR$):  The risk of success in group 1 is $RR$ times the risk of success in group 2.

* **Percent increase/decrease in risk**: an alternate way of interpreting the relative risk by first converting it into a percent increase or decrease in risk:
$$(RR-1) \times 100\%$$
    * If the quantity above is negative, the risk of success in group 1 is a decrease in risk compared to group 2; if positive, an increase.   
    * Interpretation of percent increase/decrease in risk: The risk of success in group 1 is xx\% higher/lower than the risk of success in group 2.

#### Plotting two categorical variables {-}

* **Segmented bar plot**: plots the conditional proportion of the response outcomes in each explanatory variable group. R code to create a segmented bar plot:
    
    ``` r
    object %>%
        ggplot(aes(x = explanatory, fill = response))+ #Enter the variables to plot
        geom_bar(stat = "count", position = "fill") + #Creates a segmented bar plot
        labs(title = "Don't forget to title a plot!", #Make sure to title your plot
             y = "y-axis label", #y-axis label
             x = "x-axis label")  #x-axis label
    ```

    * The plot shows no association between the variables if the height of each segment is approximately the same in each group.
    
* **Mosaic plot**: similar to the segmented bar plot but the sample size is reflected by the width of the bars. R code to create a mosaic plot:
    
    ``` r
    object %>% # Data set piped into...
        ggplot() +   # This specifies the variables
        geom_mosaic(aes(x=product(explanatory), fill = response)) +  #Creates a mosaic plot
        labs(title = "Don't forget to title a plot!",  # Make sure to title your plot
             y = "y-axis label", #y-axis label
             x = "x-axis label")  #x-axis label
    ```


#### Hypotheses {-}

* **Hypotheses in notation for a difference in proportions**: In the hypotheses below, the **null value** is equal to zero.

$$H_0: \pi_1-\pi_2 = 0 ~~~ \text{or}~~~ H_0: \pi_1 = \pi_2$$
$$H_A: \pi_1-\pi_2 \left\{
\begin{array}{ll}
< \\
\ne \\
< \\
\end{array}
\right\}
0 
~~~ \text{or}~~~
H_A: \pi_1 \left\{
\begin{array}{ll}
< \\
\ne \\
< \\
\end{array}
\right\}
\pi_2 $$

#### Simulation-based hypothesis testing for a difference in proportions {-}

* **Conditions necessary to use simulation-based methods for inference  for a two categorical variables**:

    * **Independence**: observational units must be independent of one another both within and between groups.
    

* **Simulation-based methods to create the null distribution**: R code to use simulation-based methods for two categorical variables to find the p-value, `two_proportion_test` (from the `catstats` package), is shown below.  

    
    ``` r
    two_proportion_test(formula = response~explanatory, # response ~ explanatory
        data = object, # Name of data set
        first_in_subtraction = "xx", # Order of subtraction: enter the name of Group 1
        number_repetitions = 10000, # Always use a minimum of 10000 repetitions
        response_value_numerator = "xx", # Define which outcome is a success
        as_extreme_as = xx, # Calculated observed statistic (difference in sample proportions)
        direction="xx") # Alternative hypothesis direction ("greater","less","two-sided")
    ```

* Conditions necessary to use simulation-based methods for inference for two categorical variables:

    * There must be independence of observational units within groups and between groups
    
#### Simulation-based confidence interval {-}

* R code to find the simulation-based confidence interval using the `two_proportion_bootstrap_CI` function from the `catstats` package.

    
    ``` r
    two_proportion_bootstrap_CI(formula = response~explanatory, 
        data=object, # Name of data set
        first_in_subtraction = "xx", # Order of subtraction: enter the name of Group 1
        response_value_numerator = "xx", # Define which outcome is a success 
        number_repetitions = 10000, # Always use a minimum of 10000 repetitions
        confidence_level = xx) # Enter the level of confidence as a decimal
    ```
    

#### Study design {-}

* **Explanatory variable**: the variable researchers think *may be* affecting the other variable. (Some other textbooks call this the "independent" variable.)
    
* **Response variable**: the variable researchers think *may be* influenced by the other variable. (Some other textbooks call this the "dependent" variable.)

* **Observational study**: a study design in which observational units are merely "observed"; no manipulation is done. Examples include surveys and opinion polls.

* **Randomized experiment**: a study design where researchers **randomly assign** observational units to treatment groups (the explanatory variable). Examples include clinical trials where subjects are randomly assigned to either a placebo or a drug.

* **Confounding variable**: a third variable that is both (1) associated with the explanatory variable, and (2) associated with the response variable.


#### Scope of inference {-}

* The **scope of inference** for a study answers two questions:

    1. To what population can my results be _generalized_?
    
    2. Does the study design allow us to assess whether changes in the explanatory variable _cause_ changes in the response variable?


\begin{center}\includegraphics[width=0.65\linewidth]{images/ScopeOfInferenceGreyscale} \end{center}

\newpage
