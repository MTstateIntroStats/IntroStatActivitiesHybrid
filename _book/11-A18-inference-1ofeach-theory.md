## Activity 18: Moon Phases and Virtual Reality

\setstretch{1}

### Learning outcomes

* Given a research question involving one categorical explanatory variable and one quantitative response variable, construct the null and alternative hypotheses
  in words and using appropriate statistical symbols.

* Describe and perform a theory-based hypothesis test for a difference in means.

* Interpret and evaluate a p-value for a theory-based hypothesis test for a difference in means.

* Use theory-based methods to find a confidence interval for a difference in means.

* Interpret a confidence interval for a difference in means.

* Use a confidence interval to determine the conclusion of a hypothesis test.

### Terminology review

In today's activity, we will use theory-based methods to analyze the association between one categorical explanatory variable and one quantitative response variable, where the groups formed by the categorical variable are independent. Some terms covered in this activity are:

* Difference in means

* Independence within and between groups

* Normality

To review these concepts, see Chapter 19 in the textbook.


### Moon Phases and Virtual Reality 

In a study comparing immersive virtual reality (VR) to traditional hands-on methods, researchers recruited 115 undergraduate students to assess the effectiveness of these approaches in teaching complex scientific concepts like Moon phases [@madden2020]. Participants were randomly assigned to experience either a VR simulation replicating the Sun-Earth-Moon system or a hands-on activity where they physically manipulated models to observe Moon phases. The students were given a 14 multiple choice question quiz about Moon phases and the Moon’s motion relative to the Earth to evaluate their understanding of Moon phases and the Moon's motion. Each question had only one correct answer, and the participant’s score was the sum of the number of correct answers, with all questions weighted equally (with a maximum score of 14).  Is there evidence of a difference, on average, in student learning comparing those using VR methods to those using the traditional method? Use order of subtraction VR – Hands-on. 

* Observational units:

* Explanatory variable:

    * Group 1:

* Response variable:

#### R instructions{-}

* Download the RScript file and dataset from Canvas and upload to the RStudio server

* Open the RScript file

* Enter the name of the data set for datasetname in line 8

* Highlight and run lines 1--8


``` r
moon <- read.csv("https://www.math.montana.edu/courses/s216/data/VR_Moon.csv")
```

1. Write out the parameter of interest in words in context of the study.

\vspace{1in}

2.  Write out the null hypothesis in notation for this study.  Be sure to clearly identify the subscripts.

\vspace{0.4in}

3. Write out the alternative hypothesis in words for this study.

\vspace{0.8in}

The sampling distribution for $\bar{x}_1-\bar{x}_2$ can be modeled using a normal distribution when certain conditions are met.

**Conditions for the sampling distribution of $\bar{x}_1 - \bar{x}_2$ to follow an approximate normal distribution**:

* **Independence**: the sample’s observations are independent, e.g., are from a simple random sample and there is independence between groups. (*Remember*: This also must be true to use simulation methods!)

* **Normality Condition**: either the sample observations come from a normally distributed population or we have a large enough sample size.  _When we have two samples, we need to check this condition for each group!_ To check this condition, use the following rules of thumb (for both $n_1$ and $n_2$):

    - $n < 30$: If the sample size $n$ is less than 30 and there are no clear outliers in the data, then we typically assume the data come from a nearly normal distribution to satisfy the condition.

    - $30 \le n < 100$: If the sample size $n$ is between 30 and 100 and there are no particularly extreme outliers, then we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.
    
     - $n \geq 100$: If the sample size $n$ is at least 100 (regardless of the presence of skew or outliers), we typically assume the sampling distribution of $\bar{x}$ is nearly normal, even if the underlying distribution of individual observations is not.

To create the plots of the data:

* Enter a title in line 15 for the plot between the quotations

* Highlight and run lines 12 - 17


``` r
moon %>%  # Data set piped into...
  ggplot(aes(y = TestScore, x = Method))+  # Identify variables
  geom_boxplot()+  # Tell it to make a box plot
  labs(title = "Don't forget to title your plot!",  # Title
       x = "Methods",    # x-axis label
       y = "Test Score (points)")  # y-axis label
```

To find the summary statistic:

* Enter the response and explanatory variable names in line 22

* Highlight and run lines 21--22


``` r
moon %>%
  reframe(favstats(TestScore~Method))
```

4.  Can theory-based methods be used to analyze these data?

\vspace{1.2in}

5. Calculate the summary statistic (difference in means) for this study.  Use appropriate notation with clearly defined subscripts.

\vspace{1in}

#### Use statistical inferential methods to draw inferences from the data {-}

To find the standardized statistic for the difference in means we will calculate:

$$T = \frac{\bar{x}_1-\bar{x}_2 -0}{SE(\bar{x}_1-\bar{x}_2)},$$

where the standard error of the difference in means is calculated using:

$$SE(\bar{x}_1 -\bar{x}_2)=\sqrt{\frac{s_1^2}{n_1}+\frac{s_2^2}{n_2}}.$$

**Calculate the standard error for the difference in sample means.**

\vspace{0.8in}

**Calculate the standardized statistic for the difference in sample means.**

\vspace{0.8in}

To find the degrees of freedom to use for the t-distribution, we need to use the group with the smallest sample size and subtract 1.  (`df` = minimum of $n_1 - 1$ or  $n_2 - 1$).  

\vspace{0.2in}

* Enter the value of the standardized statistic for xx

* Enter the df for yy

* Highlight and run line 27


``` r
2*pt(xx, df=yy, lower.tail=FALSE)
```
\vspace{0.3in}

6. Report the p-value for the study.  Why did we multiply by two to find the p-value?

\vspace{0.5in}

To calculate a theory-based 95\% confidence interval for a difference in means, in the questions on the next page, we will use the formula:

$$\bar{x}_1- \bar{x}_2\pm t^* \times SE(\bar{x}_1- \bar{x}_2)$$

First, we will need to find the $t^*$ multiplier using the function `qt()`.  

To find the $t^*$ multiplier

* Enter the percentile to find the multiplier for a 95\% confidence level

* Enter the degrees of freedom for yy

* Highlight and run line 32


``` r
qt(0.975, df = 55, lower.tail=TRUE)
```

```
#> [1] 2.004045
```
**Calculate the margin of error for a 95\% confidence interval.**

\vspace{0.5in}

**Calculate the 95\% confidence interval.**

\vspace{0.6in}

7. Write a conclusion to the test including scope of inference.
\vspace{0.7in}

### Take-home messages

1.  In order to use theory-based methods for independent groups, the normality condition must be met for each sample.  

2.  A T-score is compared to a $t$-distribution with the minimum $n - 1$ df in order to calculate a one-sided p-value. To find a two-sided p-value using theory-based methods we need to multiply the one-sided p-value by 2.  

3.  A $t^*$ multiplier is found by obtaining the bounds of the middle X% (X being the desired confidence level) of a $t$-distribution with the minimum $n - 1$ df.


### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered

\vspace{3in}
\newpage



