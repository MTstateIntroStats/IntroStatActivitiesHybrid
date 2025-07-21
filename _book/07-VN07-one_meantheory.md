## Video Notes: Theory-based Inference for a single quantitative variable 

Read Chapters 5, 17, and 12 in the course textbook.  Use the following videos to complete the video notes for Module 7.

### Course Videos

* 17.3TheoryTests

* 17.3TheoryIntervals

* Chapter12

\setstretch{1}

### Theory-based Testing for a Single Mean - Video 17.3TheoryTests {-}

Conditions for inference using theory-based methods:

- Independence:

\vspace{0.2in}

- Large enough sample size:

\vspace{0.2in}

#### $t$-distribution {-}

In the theoretical approach, we use the Central Limit Theorem (CLT) to tell us that---under certain conditions---the distribution of sample means will be approximately normal, centered at the assumed true mean under $H_0$, and with standard deviation $\frac{\sigma}{\sqrt{n}}$.

$$\bar{x} \sim N\left(\mu_0, \frac{\sigma}{\sqrt{n}}\right)$$
\setstretch{1.5}

* Estimate the population standard deviation, $\sigma$, with the
___________________________ standard deviation, ________.

* For a single quantitative variable we use the ____ - distribution
with _______________
degrees of freedom to approximate the sampling distribution.

\setstretch{1}

Equation for the standard error of the sample mean:

\vspace{0.5in}

Equation for the standardized sample mean:

\vspace{0.5in}

### Optional Notes: Video Example (Video 17.3TheoryTests) {-}


``` r
pb <- read.csv("https://math.montana.edu/courses/s216/data/polarbear.csv")
```

\newpage

Summary Statistics:


``` r
pb %>%
  summarise(favstats(Weight)) #Gives the summary statistics
#>     min    Q1 median     Q3   max     mean       sd  n missing
#> 1 104.1 276.3  339.4 382.45 543.6 324.5988 88.32615 83       0
```

Calculate the standardized sample mean weight of adult male polar bears:

\vspace{0.4in}


\begin{center}\includegraphics[width=0.7\linewidth]{07-VN07-one_meantheory_files/figure-latex/pvaluepb-1} \end{center}

Interpret the standardized sample mean weight:

\vspace{0.8in}

To find the theory-based p-value:


``` r
pt(-4.683, df=82, lower.tail=TRUE)
#> [1] 5.531605e-06
```

\newpage

### Theory-based Confidence Interval for a Single Mean - Video 17.3TheoryIntervals {-}

* Calculate the interval centered at the sample statistic

\rgi $\text{statistic} \pm \text{margin of error}$

\vspace{0.5in}

The $t^*$ multiplier is the value at the given percentile of the t-distribution with $n - 1$ degrees of freedom.


\begin{center}\includegraphics[width=0.7\linewidth]{07-VN07-one_meantheory_files/figure-latex/tstarpb2-1} \end{center}

To find the $t^*$ multiplier for a 95\% confidence interval:


``` r
qt(0.975, df = 82)
#> [1] 1.989319
```
Calculation of the confidence interval for the true mean weight of polar bears from the Southern Beaufort Sea:

\vspace{0.8in}

### Decisions, Errors, and Power - Video Chapter12 {-}

\setstretch{1.25}

Significance level: arbitrary cut-off set by the researcher for deciding if a p-value is ___________ or _____________.

* Notation:

\vspace{0.2in}

Decision: To either _______________ or _____________________________ the null hypothesis.

* 	If p-value _____ $\alpha$, the p-value is considered “small”

    * 	____________________________________ evidence against the null hypothesis.

    * Decision: ______________ the null hypothesis.
	 
    *	We say the results _______________ statistically significant.
    
* If p-value _____ $\alpha$, the p-value is considered “large”

    * ____________________________________ evidence against the null hypothesis.
    
    * Decision: ________________________________ the null hypothesis.
    
    * We say the results _______________ statistically significant.
    
Errors: 

* Type I error: __________________________ the null hypothesis even though the null hypothesis is __________________.

    * Conclude the ________________ hypothesis is true when really the _______________
    hypothesis is true.
    
    * Anytime we __________________________ the null hypothesis, we could be making a type I error!
    
* Type II error: _____________________________ the null hypothesis even though the null hypothesis is __________________.

    * Conclude the _________________ hypothesis is true when really the ______________
    hypothesis is true.

    * Anytime we _____________________________ the null hypothesis, we could be making a type II error!

* Probability of a type I error = 

Confirmation bias: selecting the sign in the alternative hypothesis based off ______________________.

*	This increases the chance of making a type _________ error.

\setstretch{1}

Example: Polar bears

* $H_0:\mu=370; H_A:\mu <370$; where $\mu$ represents the true mean weight of adult male polar bears in the Southern Beaufort Sea region.

\setstretch{1.25}

* P-value was less than 0.0001

*	Decision at a 5% significance level?  ____________________ the null hypothesis.

    * Possible type ________ error

    * Interpretation of that error: We conclude ________________________________ when really _______________________________________________________.
    
    * Probability that this is a type ______ error? __________

Statistical significance versus practical importance:

* Statistically significant results: If p-value ___________ $\alpha$ 

* Practically important results: If the difference seen is __________________.

*	Small sample sizes tend to have ____________ p-values, so the results may be _______________ but not ______________.

* Large sample sizes tend to have ____________ p-values, so the results may be _______________ but not_______________.


Power

*	Probability of ______________ the null hypothesis IF the null hypothesis is _______________.

*	Impacts on power:

    *	Larger significance level = ______________ power
    
    *	Larger sample size = _____________ power
    
    *	One-sided alternative hypothesis = ______________ power
    
    *	Smaller sample standard deviation = ______________ power
    
    * True value being farther from the null value = ______________ power

\setstretch{1}

### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. Are the conditions met to analyze the polar bear data using theory-based methods?

\vspace{0.7in}

2. Interpret the confidence interval found with theory-based methods.

\vspace{0.2in}

3. What is the power of the test?

\vspace{0.6in}

\newpage
