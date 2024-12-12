## Module 12 Lab: Trustworthiness 

\setstretch{1}

### Learning outcomes

* Given a research question involving one categorical explanatory variable and one quantitative response variable, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.

* Describe and perform a theory-based hypothesis test for a difference in means.

* Interpret and evaluate a p-value for a theory-based hypothesis test for a difference in means.

* Use theory-based methods to find a confidence interval for a difference in means.

* Interpret a confidence interval for a difference in means.

* Use a confidence interval to determine the conclusion of a hypothesis test.

### Trustworthiness

Researchers in India wanted to find out how trustworthy famous YouTubers are [@kalra2022]. They went through a process in which they collected data on many videos from famous YouTubers to determine a trustworthiness score. Scientists randomly selected videos from famous YouTubers (>1000 subscribers) to include in the study. There were many different factors that went into calculating the trustworthiness score. Researchers also recorded if YouTubers were a subject matter expert (SME) or not a subject matter expert (non-SME).  An example of an SME would be if one of your statistics professors made a YouTube video of how to do hypothesis testing. An example of someone who isn’t an SME would be if one of your friends who has never taken a civil engineering class in their life decided to make a YouTube video about how to build a bridge. There were 621 Youtubers who are SMEs in the sample and 1026 who aren’t SMEs. Is there evidence of a difference in mean trustworthiness score between subject matter experts (SME) YouTubers and non-SME YouTubers?  Use SME – Non -SME as the order of subtraction  

1. **Write out the parameter of interest in words in context of the study.**

\vspace{0.8in}

2.  Write out the null hypothesis in notation for this study.  Be sure to clearly identify the subscripts.

\vspace{0.5in}

3. Write out the alternative hypothesis in words for this study.

\vspace{0.8in}

The sampling distribution for $\bar{x}_1-\bar{x}_2$ can be modeled using a normal distribution when certain conditions are met.

* **Conditions for the sampling distribution of $\bar{x}_1 - \bar{x}_2$ to follow an approximate normal distribution**:

    * **Independence**: the sample’s observations are independent, e.g., are from a simple random sample and there is independence between groups. (*Remember*: This also must be true to use simulation methods!)

     * **Normality Condition**: either the sample observations come from a normally distributed population or we have a large enough sample size.  _When we have two samples, we need to check this condition for each group!_ To check this condition, use the following rules of thumb (for both $n_1$ and $n_2$):

    - $n < 30$: If the sample size $n$ is less than 30 and there are no clear outliers in the data, then we typically assume the data come from a nearly normal distribution to satisfy the condition.

    - $30 \le n < 100$: If the sample size $n$ is between 30 and 100 and there are no particularly extreme outliers, then we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
    
     - $n \geq 100$: If the sample size $n$ is at least 100 (regardless of the presence of skew or outliers), we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
    
* Upload and open the R script file for Module 10 lab. Upload the csv file, `Trustworthiness.csv`. 

* Enter the name of the data set for datasetname in the R script file in line 10. 

* Write a title for the boxplots in line 14. 

* Highlight and run lines 1--16 to load the data and create plots of the data.


``` r
trust <- read.csv("datasetname")
trust %>%  # Data set piped into...
  ggplot(aes(y = Trustworthiness_Video, x = Creator_SME))+  # Identify variables
  geom_boxplot()+  # Tell it to make a box plot
  labs(title = "Don't forget to include a title",  # Title: should include the type of plot,
       # observational units, variables
       x = "Whether the Creator is SME",    # x-axis label
       y = "Trustworthiness Score")  # y-axis label
```

4.  Is the independence condition met?  Explain your answer.
\vspace{0.8in}

5. Check that the normality condition is met to use theory-based methods to analyze these data.

\vspace{0.8in}


* Enter the name of the explanatory variable for `explanatory` and the name of the response variable for `response` in line 22.  

* Highlight and run lines 21--22 to get the summary statistics for the data.


``` r
trust %>%
  reframe(favstats(response~explantory))
```

6. **Calculate the summary measure (difference in means) for this study.  Use appropriate notation with clearly defined subscripts.**

\vspace{1in}

#### Use statistical inferential methods to draw inferences from the data {-}

To find the standardized statistic for the difference in means we will calculate:

$$T = \frac{\bar{x}_1-\bar{x}_2 -0}{SE(\bar{x}_1-\bar{x}_2)},$$

where the standard error of the difference in means is calculated using:

$$SE(\bar{x}_1 -\bar{x}_2)=\sqrt{\frac{s_1^2}{n_1}+\frac{s_2^2}{n_2}}.$$

7.  Calculate the standard error for the difference in sample means.

\vspace{0.5in}

8.  **Calculate the standardized statistic for the difference in sample means.**

\vspace{0.5in}

9.  When we are comparing two quantitative variables to find the degrees of freedom to use for the t-distribution, we need to use the group with the smallest sample size and subtract 1.  (`df` = minimum of $n_1 - 1$ or  $n_2 - 1$).  Calculate the `df` for this study.

\vspace{0.2in}

10. Using the provided R script file, enter the T-score (for `xx`) and the `df` calculated in question 9 for `yy` into the `pt()` function to find the p-value.  Highlight and run line 27.  Report the p-value calculated. 


``` r
2*pt(xx, df=yy, lower.tail=FALSE)
```
\vspace{0.2in}

11. **Explain why we multiplied by 2 in the code above.**
\vspace{0.3in}

12.  Do you expect the 95\% confidence interval to contain the null value of zero?  Explain your answer.
\vspace{0.8in}


To calculate a theory-based 95\% confidence interval for a difference in means, use the formula:

$$(\bar{x}_1- \bar{x}_2)\pm (t^* \times SE(\bar{x}_1- \bar{x}_2))$$

We will need to find the $t^*$ multiplier using the function `qt()`.  For a 95\% confidence level, we are finding the $t^*$ value at the 97.5th percentile with (`df` = minimum of $n_1 - 1$ or  $n_2 - 1$).

* Enter the appropriate percentile value degrees of freedom into the `qt()` function at line 32 to find the appropriate $t^*$ multiplier


``` r
qt(xx, df = yy, lower.tail=FALSE)
```
13. Report the $t^*$ multiplier for the 95\% confidence interval.

\vspace{0.3in}

14.  Calculate the 95\% confidence interval using theory-based methods.

\vspace{0.5in}

15.  Do the results of the CI agree with the p-value?  Explain your answer.

\vspace{0.5in}

16.  What type of error may be possible?
\vspace{0.2in}

17.  Write a paragraph summarizing the results of the study as if you are reporting the results to your supervisor.  **Upload a copy of your paragraph to Gradescope for your group.**  Be sure to describe:

* Summary statistic and interpretation

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

\newpage

Paragraph continued:

\newpage

