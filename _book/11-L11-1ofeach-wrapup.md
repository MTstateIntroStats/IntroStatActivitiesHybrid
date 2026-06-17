## Module 11 Lab: Dinosaurs

\setstretch{1}


### Learning outcomes

* Given a research question involving one categorical explanatory variable and one quantitative response variable, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.

* Describe and perform a hypothesis test for a difference in means.

* Interpret and evaluate a p-value for a hypothesis test for a difference in means.

* Find a confidence interval for a difference in means.

* Interpret a confidence interval for a difference in means.

### Dinosaurs

The backbone of heavy, two-legged, carnivorous dinosaurs, such as the *T. rex*, is subject to stress. Intriguingly, these dinosaurs have protrusions (rugosity) at the top and sides of their spinal vertebrae, potentially for extra support. These protrusions do not seem to be present in smaller carnivorous dinosaurs. MSU paleontologists hypothesize that the presence of the protrusions is associated with the size of the two-legged carnivorous dinosaurs, potentially allowing them to grow big [@wilson2016]. To test this hypothesis, the researchers collected multiple scientific papers describing the fossil bones of 57 two-legged carnivorous dinosaur species. Then, they checked for the presence or absence of these rugose protrusions from photographs published in the papers and collected measurements of the length in centimeters of the femur (or thigh) bone. Femur length is a proxy for dinosaur size. Is there evidence that the presence of the protrusions result in larger dinosaurs?  Use present $-$ absent as the order of subtraction.

\vspace{2mm}
* Observational units:

\vspace{2mm}
* Explanatory variable:

    * Group 1:

\vspace{2mm}
* Response variable:

    * Units?

\vspace{2mm}

1.  Write out the parameter of interest in context of the study.

\vspace{1in}

2.  Write the null and alternative hypotheses in proper notation.

\vspace{0.6in}

#### R instructions{-}

* Upload and open the R script file for Module 11 lab. 

* Upload the csv file, `dinosaur.csv`. 

* Enter the name of the data set (see the environment tab) for datasetname in the R script file in line 8 

* Highlight and run lines 1--8 to load the data.


``` r
dinos <- read.csv("datasetname.csv")
```

#### Plot of the data {-}

* To create a plot of the data, enter the name of the explanatory and response variable in line 14. 

* Add a title and axes labels

* Highlight and run lines 13--18


``` r
dinos %>%
  ggplot(aes(y = response, x = explanatory)) +
  geom_boxplot() +
  labs(title = "Don't forget to title your plot!", #Title should include type of plot, 
       #observational units, and variables plotted
       x = "Label the x-axis", #add an x-axis label
       y = "Label the y-axis (Don't forget units!)") #add a y-axis label
```


#### Summary statistics {-}

* Enter the name of the explanatory variable for `explanatory` and the response variable for `response` in line 23.  

* Run lines 22--23 to find the summary statistics.


``` r
dinos %>% 
    summarize(favstats(response~explanatory))
```


3.  Calculate the summary statistic for the research question. Use proper notation.
\vspace{0.3in}

### Use statistical inferential methods to draw inferences from the data {-}

4.  Using the provided graphs and summary statistics, determine if both theory-based methods and simulation methods could be used to analyze the data.  Explain your reasoning.

\vspace{0.8in}

### Hypothesis test {-}

Remember that the null distribution is created based on the assumption the null hypothesis is true.  In this study, the null hypothesis states that there is no difference in true mean femur length for dinosaurs with protrusions and dinosaurs without protrusions.

We will use the `two_mean_test()` function in R (in the `catstats` package) to simulate the null distribution of differences in sample means and compute a p-value. 

5.  Simulate a null distribution and compute the p-value. 

* Using the R script file for this lab, enter the correct values in place of the `xx`'s to produce the null distribution with 10000 simulations.  

* Highlight and run lines 28--33.  


``` r
two_mean_test(response~explanatory, #Enter the names of the variables
              data = dinos,  # Enter the name of the dataset
              first_in_subtraction = "xx", # First outcome in order of subtraction
              number_repetitions = 10000,  # Number of simulations
              as_extreme_as = xx,  # Observed statistic
              direction = "xx")  # Direction of alternative: "greater", "less", or "two-sided"
```

### Communicate the results and answer the research question {-}

6.  Report the p-value. Based off of this p-value and a 1% significance level, what decision would you make about the null hypothesis?  What potential error might you be making based on that decision?

\vspace{0.5in}

7. Do you expect the 98\% confidence interval to contain the null value of zero?  Explain.

\vspace{0.8in}

### Confidence interval {-}

We will use the `two_mean_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample differences in means and calculate a confidence interval. 

8. Using bootstrapping and the provided R script file, find a 98\% confidence interval. 

* Fill in the missing values/numbers in the `two_mean_bootstrap_CI()` function to create the 98\% confidence interval.  

* Highlight and run lines 37--41. 


``` r
two_mean_bootstrap_CI(response ~ explanatory, #Enter the name of the variables
                      data = dinos,  # Enter the name of the data set
                      first_in_subtraction = "xx", # First value in order of subtraction
                      number_repetitions = 10000,  # Number of simulations
                      confidence_level = xx)
```

|        Report the 98\% confidence interval in interval notation.

\vspace{0.2in}

9.  Write a paragraph summarizing the results of this study.  **Upload a copy of your group's paragraph to Gradescope.** Be sure to describe:

* Introduction statement

    * Research question
    
    * Observational units
    
    * Variables (roll & type)
    
    * Sampling method
    
    * Study Design
    
* Summary statistic and interpretation

    * Summary measure (in context)
    
    * Value of the statistic 
    
    * Order of subtraction when comparing two groups

* P-value and interpretation

    * Statement about probability or proportion of samples
    
    * Statistic (summary measure and value)
    
    * Direction of the alternative 
    
    * Null hypothesis (in context) 

* Confidence interval and interpretation

    * How confident you are (e.g., 90%, 95%, 98%, 99%)
    
    * Parameter of interest
    
    * Calculated interval
    
    * Order of subtraction when comparing two groups


* Conclusion (written to answer the research question)

    * Amount of evidence
    
    * Parameter of interest 
    
    * Direction of the alternative hypothesis

* Scope of inference

    * To what group of observational units do the results apply (target population or observational units similar to the sample)?
	
    * What type of inference is appropriate (causal or non-causal)?

\vspace{2.6in}

\newpage

Paragraph (continued):

\newpage
