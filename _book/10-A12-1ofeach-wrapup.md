## Activity 13: Dinosaurs

\setstretch{1}


### Learning outcomes

* Identify whether a study is a paired design or independent groups

* Given a research question involving one categorical explanatory variable and one quantitative response variable, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.

* Describe and perform a hypothesis test for a difference in means.

* Interpret and evaluate a p-value for a hypothesis test for a difference in means.

* Find a confidence interval for a difference in means.

* Interpret a confidence interval for a difference in means.

### Dinosaurs

The backbone of heavy, two-legged, carnivorous dinosaurs, such as the *T. rex*, is subject to stress. Intriguingly, these dinosaurs have protrusions (rugosity) at the top and sides of their spinal vertebrae, potentially for extra support. These protrusions do not seem to be present in smaller carnivorous dinosaurs. MSU paleontologists hypothesize that the presence of the protrusions is associated with the size of the two-legged carnivorous dinosaurs, potentially allowing them to grow big [@wilson2016]. To test this hypothesis, the researchers collected multiple scientific papers describing the fossil bones of 57 two-legged carnivorous dinosaur species. Then, they checked for the presence or absence of these rugose protrusions from photographs published in the papers and collected measurements of the length in centimeters of the femur (or thigh) bone. Femur length is a proxy for dinosaur size. Is there evidence that the presence of the protusions result in larger dinosaurs?  Use present $-$ absent as the order of subtraction.

1.  Write out the null hypothesis in proper notation for this study.  

\vspace{0.4in}

2.  What sign ($<$, $>$, or $\neq$) would you use in the alternative hypothesis for this study?  Explain your choice.

\vspace{0.4in}

* Upload and open the R script file for Week 12 lab. 

* Upload the csv file, `dinosaur`. 

* Enter the name of the data set for datasetname in the R script file in line 10 and the name of the explanatory and response variable in line 12. 

* Highlight and run lines 1--16 to load the data and create a plot of the data. 


```r
dinos <- read.csv("datasetname")
dinos %>%
  ggplot(aes(y = response, x = explanatory)) +
  geom_boxplot() +
  labs(title = "Side-by-side Box Plots of Femur Length by Rugosity
       for Carnivorous Dinosaur",
       x = "Rugose structures on the backbone",
       y = "Femur length (cm)")
```

3. Based on the plots, does there appear to be some evidence in favor of the alternative hypothesis?  How do you know?
\vspace{0.4in}

* Enter the name of the explanatory variable for `explanatory` and the response variable for `response` in line 23.  

* Run lines 22--23 to find the summary statistics.


```r
dinos %>% 
    reframe(favstats(response~explanatory))
```


4.  Calculate the summary statistic for the research question. Use proper notation.
\vspace{0.4in}

5. How far, on average, is each difference in mean femur length from the difference in true mean femur length?  What is the appropriate notation for this value?

\vspace{0.4in}

### Use statistical inferential methods to draw inferences from the data {-}

6.  Using the provided graphs and summary statistics, determine if both theory-based methods and simulation methods could be used to analyze the data.  Explain your reasoning.

\vspace{0.8in}

### Hypothesis test {-}

Remember that the null distribution is created based on the assumption the null hypothesis is true.  In this study, the null hypothesis states that there is no difference in true mean femur length for dinosaurs with protrusions and dinosaurs without protrusions.

We will use the `two_mean_test()` function in R (in the `catstats` package) to simulate the null distribution of differences in sample means and compute a p-value. 

7.  Simulate a null distribution and compute the p-value. 

* Using the R script file for this lab, enter the correct values in place of the `xx`'s to produce the null distribution with 1000 simulations.  

* Highlight and run lines 28--33.  


```r
two_mean_test(response~explanatory, #Enter the names of the variables
              data = dinos,  # Enter the name of the dataset
              first_in_subtraction = "xx", # First outcome in order of subtraction
              number_repetitions = 1000,  # Number of simulations
              as_extreme_as = xx,  # Observed statistic
              direction = "xx")  # Direction of alternative: "greater", "less", or "two-sided"
```
|        Sketch the null distribution created using the `two_mean_test` code.

\vspace{1.5in}

### Communicate the results and answer the research question {-}

8.  Report the p-value. Based off of this p-value and a 1% significance level, what decision would you make about the null hypothesis?  What potential error might you be making based on that decision?

\vspace{0.5in}

9. Do you expect the 98\% confidence interval to contain the null value of zero?  Explain.

\vspace{0.8in}

### Confidence interval {-}

We will use the `two_mean_bootstrap_CI()` function in R (in the `catstats` package) to simulate the bootstrap distribution of sample differences in means and calculate a confidence interval. 

10. Using bootstrapping and the provided R script file, find a 98\% confidence interval. 

* Fill in the missing values/numbers in the `two_mean_bootstrap_CI()` function to create the 98\% confidence interval.  

* Highlight and run lines 38--42. 


```r
two_mean_bootstrap_CI(response ~ explanatory, #Enter the name of the variables
                      data = dinos,  # Enter the name of the data set
                      first_in_subtraction = "xx", # First value in order of subtraction
                      number_repetitions = 1000,  # Number of simulations
                      confidence_level = xx)
```

|        Report the 98\% confidence interval in interval notation.

\vspace{0.2in}

11.  Write a paragraph summarizing the results of this study as if you were describing the results to your roommate.  Be sure to describe:

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

\newpage