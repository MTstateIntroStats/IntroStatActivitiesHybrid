## Module 3 Review - Simulation Methods


``` r
hearing <- read.csv("data/hearing_loss.csv")
```

A recent study examined hearing loss data for 1753 U.S. teenagers. In this sample, 328 were found to have some level of hearing loss. News of this study spread quickly, with many news articles blaming the prevalence of hearing loss on the higher use of ear buds by teens. At MSNBC.com (8/17/2010), Carla Johnson summarized the study with the headline: “1 in 5 U.S. teens has hearing loss, study says.”  Is this an appropriate or a misleading headline?

1.	Write the parameter of interest in context of the study.

\vspace{0.8in}


2.	Write the null hypothesis in words and notation in context of the problem.

\vspace{1in}

3.	Based on the research questions, choose the direction for the alternative hypothesis.

\vspace{0.3in}

4.	Write the alternative hypothesis in words and notation in context of the problem.

\vspace{1in}

5.  Calculate the summary statistic.  Use proper notation.

\vspace{0.3in}
\newpage

6. What values should be entered for each of the following into the one proportion test to create 1000 simulations?

* Probability of success:

\vspace{0.2in}

* Sample size:

\vspace{0.2in}

* Number of repetitions:

\vspace{0.2in}

* As extreme as:

\vspace{0.2in}

* Direction ("greater", "less", or "two-sided"):

\vspace{0.2in}


\begin{center}\includegraphics[width=0.7\linewidth]{05-UR-module3_review_files/figure-latex/unnamed-chunk-2-1} \end{center}

7.  Interpret the p-value in context of the problem.

\vspace{1in}

8.	How much evidence does the data provide against the null hypothesis?




\begin{center}\includegraphics[width=0.9\linewidth]{images/soe_gradient_gray} \end{center}

\vspace{0.2in}

9.  Write a conclusion to the study in context of the problem.

\vspace{0.8in}

10. Would a 95\% confidence interval contain the null value of 0.2?  Explain.

\vspace{0.8in}

11. What values should be entered for each of the following into the simulation to create the bootstrap distribution of sample proportions to find a 95\% confidence interval?
\vspace{1mm}

* Sample size:

\vspace{.1in}
 
* Number of successes:
    
\vspace{.1in}
* Number of repetitions:
    
\vspace{.1in}
* Confidence level (as a decimal):
    
\vspace{.1in}

\newpage

``` r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 1753, # Sample size
                    number_successes = 328, # Observed number of successes
                    number_repetitions = 1000, # Number of bootstrap samples to use
                    confidence_level = 0.95) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{05-UR-module3_review_files/figure-latex/unnamed-chunk-4-1} \end{center}

12.  Explain how to use cards to create one bootstrap sample.

\vspace{1in}

13. Report the 95\% confidence interval in interval notation.

\vspace{0.2in}

14. Interpret the 95\% confidence interval in context of the problem.

\vspace{0.8in}

\newpage
