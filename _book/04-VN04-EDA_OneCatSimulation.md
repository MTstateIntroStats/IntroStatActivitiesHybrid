---
output:
  pdf_document: default
  html_document: default
---

## Video Notes: Exploratory Data Analysis of Categorical Variables

Read Chapter 3, 4, 9, 10 and Sections 14.1 and 14.2 in the course textbook.  Use the following videos to complete the video notes for Module 4.

### Course Videos

* 4.1

* 4.2

* Chapter9

* 14.1

* Chapter10

* 14.2

<!-- * 5.2to5.4 -->

<!-- * 5.5to5.6 -->

<!-- * 5.7 -->

\setstretch{1}

### Summarizing categorical data - Video 4.1 {-}

* A ______________ is calculated on data from a sample

* The parameter of interest is what we want to know from the population.

* Includes:

    * Population word (true, long-run, population)
    
    * Summary measure (depends on the type of data)
    
    * Context
    
        * Observational units
        
        * Variable(s)

Categorical data can be numerically summarized by calculating a _______________ from the data set.

Notation used for the population proportion:
    
* Single categorical variable:
       
\vspace{0.2in}
        
* Two categorical variables:
    
\vspace{0.2in}

\rgi \rgi - Subscripts represent the ___________ variable groups
    
Notation used for the sample proportion:
    
* Single categorical variable:

\vspace{0.2in}

* Two categorical variables
    
\vspace{0.2in}

\setstretch{1.5}
Categorical data can be reported in a ____________table, 
which plots counts or a ______________ 
frequency table, which plots the proportion.

When we have two categorical variables we report the data in a  _______________ or two-way table with the _______________ variable on the columns and the ____________ variable on the rows.

\setstretch{1}

\vspace{2mm}

Example from the Video:  Gallatin Valley is the fastest growing county in Montana.  You’ll often hear Bozeman residents complaining about the ‘out-of-staters’ moving in.  A local real estate agent recorded data on a random sample of 100 home sales over the last year at her company and noted where the buyers were moving from as well as the age of the person or average age of a couple buying a home.  The variable age was binned into two categories, "Under30" and "Over30." Additionally, the variable, state the buyers were moving from, was created as a binary variable, "Out" for a location out of state and "In" for a location in state.  

The following code reads in the data set, `moving_to_mt` and names the object moving.


```r
moving <- read.csv("data/moving_to_mt.csv")
```

The `R` function `glimpse` was used to give the following output.


```r
glimpse(moving)
```

```
#> Rows: 100
#> Columns: 4
#> $ From      <chr> "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA", ~
#> $ Age_Group <chr> "Under30", "Under30", "Under30", "Under30", "Under30", "Unde~
#> $ Age       <int> 25, 26, 27, 27, 29, 29, 35, 37, 49, 63, 65, 77, 22, 24, 24, ~
#> $ InOut     <chr> "Out", "Out", "Out", "Out", "Out", "Out", "Out", "Out", "Out~
```

* What are the observational units in this study?

\vspace{0.3in}

* What type of variable is `Age`?

\vspace{0.3in}

* What type of variable is `Age_Group`?

To further analyze the categorical variable, `From`, we can create either a frequency table:


```
#>   From  n
#> 1   CA 12
#> 2   CO  8
#> 3   MT 61
#> 4   WA 19
```

Or a relative frequency table:


```
#>   From  n freq
#> 1   CA 12 0.12
#> 2   CO  8 0.08
#> 3   MT 61 0.61
#> 4   WA 19 0.19
```

* How many home sales have buyers from WA?  

\vspace{0.2in}

* What proportion of sampled home sales have buyers from WA?

\vspace{0.2in}

* What notation is used for the proportion of home sale buyers that that are from WA?

\vspace{0.2in}

<!-- \newpage -->

<!-- To look at the relationship between the variable, `Age_Group` and the variable, `From` create the following two-way table using the `R` output below.  Note, we are using `From` as the explanatory variable to predict whether a home sale has a buyer that is over or under the age of 30. -->

<!-- ```{r, echo=TRUE, collapse=FALSE} -->
<!-- moving %>% -->
<!--     group_by(Age_Group) %>% count(From) %>% print(n=8) -->
<!-- ``` -->

<!-- \begin{center} -->
<!-- \begingroup -->
<!-- \setlength{\tabcolsep}{14pt} % Default value: 6pt -->
<!-- \renewcommand{\arraystretch}{2} % Default value: 1 -->
<!-- \begin{tabular}{|c|c|c|c|c|c|} -->
<!-- \hline -->
<!--  & \multicolumn{4}{|c|}{\textbf{State}} & \\ \hline -->
<!-- \textbf{Age Group} & CA & CO & MT & WA & Total \\ \hline -->
<!--  Over30 & 6 & 2 & 47 & 10 & 65 \\ \hline -->
<!--  Under30 & 6 & 6 & 14 & 9 & 35 \\ \hline -->
<!--  Total & 12 & 8 & 61 & 19 & 100\\ \hline   -->
<!-- \end{tabular} -->
<!-- \endgroup -->
<!-- \end{center} -->

<!-- * Using the table above, how many of the sampled home sales have buyers who were under 30 years old and from Montana? -->

<!-- \vspace{0.2in} -->

<!-- \setstretch{1.5} -->

<!-- If we want to know what proportion of each age group is from each state, we would calculate the proportion of home sales with buyers from each state within each age group. In other words, divide the number of home sales from each state with buyers that are over 30 by the total for row 1, the total number of home sales with buyers over 30. -->

<!-- \setstretch{1} -->

<!-- * What proportion of sampled home sales with buyers under 30-years-old were from California? -->

<!-- \vspace{0.3in} -->

<!-- * What notation should be used for this value? -->

<!-- \vspace{0.2in} -->

<!-- \setstretch{1.5} -->

<!-- Additionally, we could find the proportion of home sales with buyers in each state for each age group.  Here we would calculate the proportion of home sales with buyers in each age group within each state.  Divide the number of home sales with buyers in each age group from CA by the total for column 1, the total number of home sales with buyers from CA.  -->

<!-- \setstretch{1} -->

<!-- \begin{center} -->
<!-- \begingroup -->
<!-- \setlength{\tabcolsep}{14pt} % Default value: 6pt -->
<!-- \renewcommand{\arraystretch}{2} % Default value: 1 -->
<!-- \begin{tabular}{|c|c|c|c|c|c|} -->
<!-- \hline -->
<!--  & \multicolumn{4}{|c|}{\textbf{State}} & \\ \hline -->
<!-- \textbf{Age Group} & CA & CO & MT & WA & Total \\ \hline -->
<!--  Over30 & 6 & 2 & 47 & 10 & 65 \\ \hline -->
<!--  Under30 & 6 & 6 & 14 & 9 & 35 \\ \hline -->
<!--  Total & 12 & 8 & 61 & 19 & 100\\ \hline   -->
<!-- \end{tabular} -->
<!-- \endgroup -->
<!-- \end{center} -->

<!-- * Using the table, calculate the proportion of home sales in Gallatin County with in-state buyers who are over 30 years old?  Use appropriate notation with informative subscripts. -->

<!-- \vspace{0.4in} -->

<!-- * Using the table, calculate the proportion of home sales in Gallatin County with California buyers who are over 30 years old?  Use appropriate notation with informative subscripts. -->

<!-- \vspace{0.4in} -->

<!-- * Calculate the difference in proportion of home sales in Gallatin County over 30 years old from other parts of Montana and from California. Use MT - CA as the order of subtraction.  Give appropriate notation. -->

<!-- \vspace{0.4in} -->

<!-- * Interpret the difference in proportion in context of the study. -->

<!-- \vspace{0.5in} -->

#### Displaying categorical variables - Video 4.2 {-}

* Types of plots for a single categorical variable

\vspace{0.4in}

<!-- * Types of plots for two categorical variables -->

<!-- \vspace{0.4in} -->

The following code in `R` will create a frequency bar plot of the variable, `From`.


```r
moving %>%
    ggplot(aes(x = From))+ #Enter the variable to plot
    geom_bar(stat = "count") + 
    labs(title = "Frequency Bar Plot of State of Origin for
         Gallatin County Home Sales", 
         #Title your plot (type of plot, observational units, variable)
       y = "Frequency", #y-axis label
       x = "State of Origin") #x-axis label
```



\begin{center}\includegraphics[width=0.65\linewidth]{04-VN04-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-5-1} \end{center}

* What can we see from this plot?

\vspace{0.3in}

Additionally, we can create a relative frequency bar plot.


```r
moving %>%
  ggplot(aes(x = From))+ #Enter the variable to plot
  geom_bar(aes(y = after_stat(prop), group = 1)) +
  labs(title = "Relative Frequency Bar Plot of State of Origin 
       for Gallatin County Home Sales", 
       #Title your plot
       y = "Relative Frequency", #y-axis label
       x = "State of Origin") #x-axis label
```



\begin{center}\includegraphics[width=0.65\linewidth]{04-VN04-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-6-1} \end{center}

\setstretch{1.5}

* Note: the x-axis is the _______________ between the frequency bar plot and the relative frequency bar plot.  However, the ______________ differs.  The scale for the frequency bar plot goes from _______________________________ and the scale for the relative frequency bar plot is from ______________________________.

\setstretch{1}

<!-- In a segmented bar plot, the bar for each category will sum to 1.  In this first plot, we are plotting the row proportions calculated conditional on the age group. -->

<!-- ```{r, echo=TRUE, out.width="55%"} -->
<!-- moving %>% -->
<!--   ggplot(aes(x = Age_Group, fill = From))+ #Enter the variables to plot -->
<!--   geom_bar(stat = "count", position = "fill") + -->
<!--   labs(title = "Segmented bar plot of Age Group of Buyers by State of  -->
<!--        Origin for Gallatin County Home Sales",  -->
<!--        #Title your plot -->
<!--        y = "Relative Frequency", #y-axis label -->
<!--        x = "Age Group") + #x-axis label -->
<!--   scale_fill_grey() -->
<!-- ``` -->

<!-- In this second plot, we are plotting the column proportions calculated conditional on the state of origin for the buyer. -->

<!-- ```{r, echo=TRUE, out.width="55%"} -->
<!-- moving %>% -->
<!--   ggplot(aes(x = From , fill = Age_Group))+ #Enter variables to plot -->
<!--   geom_bar(stat = "count", position = "fill") + -->
<!--   labs(title = "Segmented bar plot of State of Origin of Buyers by Age  -->
<!--        Group for Gallatin County Home Sales",  -->
<!--        #Title your plot -->
<!--        y = "Relative Frequency", #y-axis label -->
<!--        x = "State of Origin") + #x-axis label -->
<!--   scale_fill_grey() -->
<!-- ``` -->

<!-- Mosaic plot:  -->
<!-- ```{r, echo=TRUE, warning=FALSE, out.width="75%"} -->
<!-- moving$Age_Group <- factor(moving$Age_Group, levels = c("Under30", "Over30")) -->
<!-- moving %>% # Data set piped into... -->
<!--   ggplot() +   # This specifies the variables -->
<!--   geom_mosaic(aes(x=product(From), fill = Age_Group)) +   -->
<!--     # Tell it to make a mosaic plot -->
<!--   labs(title = "Mosaic plot of State of Origin Segmented by  -->
<!--   Age Group for Gallatin County Home Sales",   -->
<!--        # Title your plot  -->
<!--        x = "State of Origin",   # Label the x axis -->
<!--        y = "") +  # Remove y axis label -->
<!--     scale_fill_grey(guide = guide_legend(reverse = TRUE)) # Make figure color -->
<!-- ``` -->

<!-- * Why is the bar for MT the widest on the mosaic plot? -->

<!-- \vspace{0.2in} -->

<!-- \newpage -->

<!-- #### Simpson's paradox - Video 4.4 {-} -->

<!-- \setstretch{1.5} -->

<!-- * When an apparent _____________ between explanatory and response variables reverses when accounting for ______________ variable. -->

<!-- \setstretch{1} -->

<!-- Example: The "Berkeley Dataset" contains all 12,763 applicants to UC-Berkeley's graduate programs in Fall 1973. This dataset was published by UC Berkeley researchers in an analysis to understand the possible gender bias in admissions and has now become a classic example of Simpson's Paradox.   -->

<!-- ```{r, echo=TRUE, out.width="85%"} -->
<!-- discrim <- read.csv ("data/berkeley.csv") -->

<!-- discrim %>% -->
<!--   ggplot(aes(x =Gender, fill = Admission))+ -->
<!--   geom_bar(stat = "count", position = "fill") + -->
<!--   labs(title = "Segmented bar plot of Sex of Berkley Applicants by  -->
<!--        Admission Status", -->
<!--        y = "Relative Frequency", -->
<!--        x = "Sex") + -->
<!--   scale_fill_grey() -->
<!-- ``` -->

<!-- The data showed that 44\% of male applicants were accepted and 35\% of female applicants were accepted.  Does it appear that the female students are discriminated against? -->

<!-- \vspace{0.1in} -->

<!-- We can break down the data by major.  A major code (either A, B, C, D, E, F, or Other) was used. -->

<!-- \newpage -->

<!-- Here we look at the relationship between admission status and sex for Program A and for Program B. -->

<!-- ```{r, out.width="85%"} -->
<!-- include_graphics("images/SimPara_AB.png") -->
<!-- ``` -->

<!-- Showing Program C and Program D. -->

<!-- ```{r, out.width="85%"} -->
<!-- include_graphics("images/SimPara_cD.png") -->
<!-- ``` -->

<!-- And finally, Program E and F. -->

<!-- ```{r, out.width="85%"} -->
<!-- include_graphics("images/SimPara_EF.png") -->
<!-- ``` -->

<!-- We can see in several programs the acceptance rate is higher for females than for males.  -->

<!-- \vspace{1in} -->

<!-- \newpage -->

<!-- ### Summarizing quantitative data - Videos 5.2to5.4 and 5.5to5.6 {-} -->

<!-- #### Types of plots {-} -->

<!-- We will revisit the moving to Montana data set and plot the age of the buyers. -->

<!-- Dotplot: -->

<!-- \vspace{0.5in} -->

<!-- ```{r, echo=TRUE, out.width="75%"} -->
<!-- moving %>% -->
<!--   ggplot(aes(x = Age))+ #Enter variable to plot -->
<!--   geom_dotplot() +  -->
<!--   labs(title = "Dotplot of Age of Buyers from Gallatin  -->
<!--        County Home Sales", #Title your plot -->
<!--        x = "Age", #x-axis label -->
<!--        y = "Proportion") #y-axis label -->
<!-- ``` -->

<!-- \newpage -->

<!-- Histogram: -->

<!-- \vspace{0.2in} -->

<!-- ```{r, echo=TRUE, out.width="70%"} -->
<!-- moving %>% -->
<!--   ggplot(aes(x = Age))+ -->
<!--   geom_histogram(binwidth = 7) +  -->
<!--   labs(title = "Histogram of Age of Buyers from Gallatin  -->
<!--        County Home Sales", -->
<!--        #Title your plot -->
<!--        x = "Age", -->
<!--        y = "Count") -->
<!-- ``` -->

<!-- \setstretch{1.5} -->

<!-- Quantitative data can be numerically summarized by finding: -->

<!-- Two measures of center:  -->

<!-- * Mean: ____________ of all the _____________ in the data set. -->

<!--     - Sum the values in the data set and divide -->
<!--     the sum by the sample size -->

<!-- * Notation used for the population mean: -->

<!--     - Single quantitative variable: -->

<!-- \vspace{0.1in} -->

<!-- \rgi \rgi - One categorical and one quantitative variable: -->

<!-- \vspace{0.1in} -->

<!-- \rgi \rgi \rgi - Subscripts represent the ___________ variable groups -->

<!-- * Notation used for the sample mean: -->

<!-- \rgi \rgi - Single quantitative variable: -->

<!-- \vspace{0.1in} -->

<!-- \rgi \rgi - One categorical and one quantitative variable: -->

<!-- \vspace{0.1in} -->

<!-- * Median: Value at the _____________ percentile -->

<!--     - __________ % of values are at and ___________ and at and ___________ the value of the ______________. -->

<!--     - Middle value in a list of ordered values -->

<!-- Two measures of spread: -->

<!-- * Standard deviation:  Average ___________________ each data point is from the ______________ of the data set. -->

<!-- \vspace{1mm} -->

<!-- \rgi \rgi - Notation used for the population standard deviation -->

<!-- \vspace{0.2in} -->

<!-- \rgi \rgi - Notation used for the sample standard deviation -->

<!-- \vspace{0.2in} -->

<!-- * Interquartile range: middle 50% of data values -->

<!-- \rgi Formula: -->

<!-- \rgi \rgi Quartile 3 (Q3) - value at the 75th percentile -->

<!-- \rgi \rgi - ____________ % of values are at and _____________ the value of Q3 -->

<!-- \rgi \rgi Quartile 1 (Q1) - value at the 25th percentile -->

<!-- \rgi \rgi - _____________ % of values are at and _____________ the value of Q1 -->

<!-- \vspace{1mm} -->

<!-- \setstretch{1} -->

<!-- \newpage -->

<!-- Boxplot (3rd type of plot for quantitative variables) -->

<!--     - Five number summary: minimum, Q1, median, Q3, maximum -->

<!-- \vspace{0.3in} -->

<!-- ```{r, echo=TRUE, out.width="70%"} -->
<!-- moving %>% -->
<!--   ggplot(aes(x = Age))+ #Enter variable to plot -->
<!--   geom_boxplot() +  -->
<!--   labs(title = "Boxplot of Age of Buyers from Gallatin  -->
<!--        County Home Sales", #Title your plot -->
<!--        x = "Age", #x-axis label -->
<!--        y = "") #y-axis label -->

<!-- ``` -->

<!-- ```{r, echo=TRUE, collapse=FALSE} -->
<!-- favstats(moving$Age) -->
<!-- ``` -->


<!-- Interpret the value of $Q_3$ for the age of buyers. -->

<!-- \vspace{0.5in} -->

<!-- Interpret the value of s for the age of buyers. -->

<!-- \vspace{0.5in} -->

<!-- \newpage -->

<!-- #### Four characteristics of plots for quantitative variables {-} -->

<!-- * Shape: overall pattern of the data -->

<!-- ```{r, out.width="80%"} -->
<!-- include_graphics("images/shape.png") -->
<!-- ``` -->

<!-- \rgi \rgi - What is the shape of the distribution of age of buyers for Gallatin County home sales? -->

<!-- \vspace{0.3in} -->

<!-- * Center:   -->

<!-- \rgi Mean or Median -->

<!-- \rgi \rgi - Report the measure of center for the boxplot of age of buyers for Gallatin County home sales. -->

<!-- \vspace{0.3in} -->

<!-- * Spread (or variability): -->

<!-- \rgi Standard deviation or IQR -->

<!-- \rgi \rgi - Report the IQR for the distribution of age of buyers from Gallatin County home sales. -->

<!-- \vspace{0.3in} -->

<!-- * Outliers? -->

<!-- \rgi values < $Q_1 - 1.5 \times IQR$ -->

<!-- \rgi values > $Q_3 + 1.5 \times IQR$ -->

<!-- \rgi \rgi - Use these formulas to show that there are no outliers in the distribution of age of buyers from Gallatin County home sales. -->

<!-- \vspace{0.8in} -->
<!-- \newpage -->

<!-- Let's look at side-by-side boxplot of the variable age by state of origin moved from. -->

<!-- ```{r, echo=TRUE, out.width="85%"} -->
<!-- moving %>%  # Data set piped into... -->
<!--   ggplot(aes(y = Age, x = From))+  # Identify variables -->
<!--   geom_boxplot()+  # Tell it to make a box plot -->
<!--   labs(title = "Side by side box plot of Age by State of Origin  -->
<!--   of Buyers from Gallatin County Home Sales",  # Title -->
<!--        x = "State of Origin",    # x-axis label -->
<!--        y = "Age")  # y-axis label -->
<!-- ``` -->

<!-- * Which state of origin had the oldest median age of buyers from sampled home sales? -->

<!-- \vspace{0.4in} -->

<!-- * Which state of origin had the most variability in age of buyers from sampled home sales? -->

<!-- \vspace{0.4in} -->

<!-- * Which state of origin had the most symmetric distribution of ages of buyers from sampled home sales? -->

<!-- \vspace{0.4in} -->

<!-- * Which state of origin had outliers for the age of buyers from sampled home sales? -->

<!-- \vspace{0.4in} -->

<!-- \newpage -->

<!-- #### Robust statistics - Video 5.7 {-} -->

<!-- Let's review the summary statistics and histogram of age of buyers from sampled home sales. -->

<!-- ```{r, echo=FALSE, out.width="85%"} -->
<!-- moving %>% -->
<!--   ggplot(aes(x = Age))+ -->
<!--   geom_histogram(binwidth = 7) +  -->
<!--   labs(title = "Histogram of Age of Buyers from Gallatin  -->
<!--        County Home Sales",  -->
<!--        x = "Age", -->
<!--        y = "Count") -->
<!-- ``` -->

<!-- ```{r, echo=FALSE, collapse=FALSE} -->
<!-- favstats(moving$Age) -->
<!-- ``` -->

<!-- \setstretch{1.5} -->

<!-- Notice that the _____________ has been pulled in the direction of the _______________.   -->

<!-- * The ___________ is a robust measure of center. -->

<!-- * The ___________ is a robust measure of spread. -->

<!-- * Robust means not _________________ by outliers. -->

<!-- When the distribution is symmetric use the ____________ as the measure of center and the ___________ as the measure of spread. -->

<!-- When the distribution is skewed with outliers use the _____________ as the measure of center and the ____________ as the measure of spread. -->

<!-- \setstretch{1} -->

<!-- \newpage -->

### Hypothesis Testing - Video Chapter9 {-}

Purpose of a hypothesis test:

* Use data collected on a sample to give information about the population.

* Determines __________________ of _____________________ of an effect

General steps of a hypothesis test

1.	Write a research question and hypotheses.

2.	Collect data and calculate a summary statistic.

3.	Model a sampling distribution which assumes the null hypothesis is true.

4.	Calculate a p-value.

5.	Draw conclusions based on a p-value.

### Hypothesis Testing/Justice System {-}

\setstretch{1.5}

* Two possible outcomes if the observed statistic is unusual:

    - Strong evidence against __________________ -> ____________________
    
    - Not enough evidence against _____________________ -> ______________________

* Always written about the __________________ (population)

\setstretch{1}

#### Null hypothesis {-}

* Skeptical perspective, no difference, no effect, random chance

* What the researcher hopes is _______________.

Notation:

\vspace{0.2in}

#### Alternative hypothesis {-}

* New perspective, a chance, a difference, an effect

* What the researcher hopes is ________________.

Notation:

\vspace{0.2in}

### Simulation vs. Theory-based Methods {-}

#### Simulation-based method {-}

\setstretch{1.5}

Creation of the null distribution

* Simulate many samples assuming 

\vspace{0.2in}

* Find the proportion of ___________________ at least as extreme as the observed sample ____________

* The null distribution estimates the sample to sample variability expected in the population

\setstretch{1}


#### Theory-based method {-}

* Use a mathematical model to determine a distribution under the null hypothesis

* Compare the observed sample statistic to the model to calculate a probability 

* *Theory-based methods will be discussed in the next module*

#### P-value {-}

\setstretch{1.5}

* What does the p-value measure?

    * Probability of observing the sample ___________________ or more __________ 
assuming the ________ hypothesis is __________.
    
* How much evidence does the p-value provide against the null hypothesis?


\begin{center}\includegraphics[width=0.75\linewidth]{images/soe_gradient_gray} \end{center}

\rgi \rgi - The __________________the p-value, the ___________________ the evidence against the null hypothesis.
    
* Write a conclusion based on the p-value.

\rgi \rgi - Answers the ________________ question.
    
\rgi \rgi - Amount of _________________ in support of the _________________ hypothesis.
    
* Decision: can we reject or fail to reject the null hypothesis?

\rgi - Significance level: cut-off of “small” vs “large” p-value

\rgi \rgi - $\text{p-value} \le \alpha$

\rgi \rgi \rgi - Strong enough evidence against the null hypothesis
        
\rgi \rgi \rgi - Decision:
        
\vspace{0.2in}

        
\rgi \rgi \rgi - Results are _______________________ significant.
        
\rgi \rgi - $\text{p-value} > \alpha$

\rgi \rgi \rgi - Not enough evidence against the null hypothesis
        
\rgi \rgi \rgi - Decision:
        
\vspace{0.17in}

\rgi \rgi \rgi - Results are not _____________________ significant.

\setstretch{1}
    
### One proportion test {-}

* Reminder: review summary measures and plots discussed in the Week 3 material and Chapter 4 of the textbook.

* The summary measure for a single categorical variable is a ______________.

Notation:

- Population proportion: 

- Sample proportion:

Parameter of Interest:  

* Include:
 
    * Reference of the population (true, long-run, population, all)
	
	* Summary measure

	* Context
	   
	    * Observational units/cases
	   
	    * Response variable (and explanatory variable if present)
	       
	        * If the response variable is categorical, define a ‘success’ in context

#### Hypothesis testing {-}

Conditions:

* Independence:

\vspace{0.3in}

Null hypothesis assumes “no effect”, “no difference”, “nothing interesting happening”, etc.

\rgi Always of form:  “parameter” = null value

$H_0:$

\vspace{0.5in}

$H_A:$

\vspace{0.5in}

* Research question determines the direction of the alternative hypothesis.

Video 14.1 Example: A 2007 study published in the Behavioral Ecology and Sociobiology Journal was titled “Why do blue-eyed men prefer blue-eyed women?” [@laeng2007] In this study, conducted in Norway, 114 volunteer heterosexual blue-eyed males rated the attractiveness of 120 pictures of females.  The researchers recorded which eye-color (blue, green, or brown) was rated the highest, on average.  In the sample, 51 of the volunteers rated the blue-eyed women the most attractive.  Do blue-eyed heterosexual men tend to find blue-eyed women the most attractive?

Parameter of interest:

\vspace{0.5in}

Write the null and alternative hypotheses for the blue-eyed study:

<!-- In words:  -->

<!-- $H_0:$ -->

<!-- \vspace{0.45in} -->

<!-- $H_A:$ -->

<!-- \vspace{0.45in} -->

In notation:

\vspace{1mm}

$H_0:$

\vspace{0.2in}

$H_A:$

\vspace{0.2in}

Statistic: 

\vspace{0.4in}

Is the independence condition met to analyze these data using a simulation-based approach? 

\vspace{0.2in}

\newpage

#### Simulation-based method {-}

* Simulate many samples assuming $H_0: \pi = \pi_0$

    * Create a spinner with that represents the null value

    * Spin the spinner $n$ times

    * Calculate and plot the simulated sample proportion from each simulation

    * Repeat 1000 times (simulations) to create the null distribution

    * Find the proportion of simulations at least as extreme as $\hat{p}$


```r
set.seed(216)
one_proportion_test(probability_success = 0.333, # Null hypothesis value
          sample_size = 114, # Enter sample size
          number_repetitions = 1000, # Enter number of simulations
          as_extreme_as = 0.447, # Observed statistic
          direction = "greater", # Specify direction of alternative hypothesis
          summary_measure = "proportion") # Reporting proportion or number of successes?
```



\begin{center}\includegraphics[width=0.7\linewidth]{04-VN04-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-8-1} \end{center}

Explain why the null distribution is centered at the value of approximately 0.333:

\vspace{0.5in}

Interpretation of the p-value:

* Statement about probability or proportion of samples

* Statistic (summary measure and value)
    
* Direction of the alternative 
    
* Null hypothesis (in context) 

\vspace{0.8in}

\newpage

Conclusion: 

* Amount of evidence
    
* Parameter of interest 
    
* Direction of the alternative hypothesis

\vspace{0.6in}

Generalization:

* Can the results of the study be generalized to the target population?

\vspace{0.4in}

### Confidence interval - Video Chapter10 {-}

\rgi $\text{statistic} \pm \text{margin of error}$

Vocabulary:

* Point estimate:

\vspace{0.3in}

* Margin of error:

\vspace{0.3in}

\setstretch{1.5}

Purpose of a confidence interval

* To give an ____________________ ___________________ for the parameter of interest

* Determines how ______________ an effect is

\setstretch{1}

#### Sampling distribution {-}

\setstretch{1.5}

* Ideally, we would take many samples of the same ___________ from the same population to create a sampling distribution

* But only have 1 sample, so we will _________________ with _________________ from the one sample.

* Need to estimate the sampling distribution to see the _________________ in the sample

\setstretch{1}

#### Simulation-based methods {-}

Bootstrap distribution:

* Write the response variable values on cards

* Sample with replacement $n$ times (bootstrapping)

* Calculate and plot the simulated difference in sample means from each simulation

* Repeat 1000 times (simulations) to create the bootstrap distribution

* Find the cut-offs for the middle X% (confidence level) in a bootstrap distribution.

What is bootstrapping?

* Assume the “population” is many, many copies of the original sample.  

* Randomly sample with replacement from the original sample $n$ times. 

#### Video 14.2 {-}

Let's revisit the blue-eyed male study to estimate the *proportion of ALL heterosexual blue-eyed males who tend to find blue-eyed women the most attractive* by creating a 90\% confidence interval. 

Bootstrap distribution:
   

```r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 114, # Sample size
                    number_successes = 51, # Observed number of successes
                    number_repetitions = 1000, # Number of bootstrap samples to use
                    confidence_level = 0.90) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{04-VN04-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-9-1} \end{center}

Confidence interval interpretation:

* How confident you are (e.g., 90%, 95%, 98%, 99%)
    
* Parameter of interest
    
* Calculated interval
    
* Order of subtraction when comparing two groups

\vspace{0.8in}


\newpage

How does changing the confidence level impact the width of the confidence interval?


95\% Confidence Interval:


```r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 114, # Sample size
                    number_successes = 51, # Observed number of successes
                    number_repetitions = 1000, # Number of bootstrap samples to use
                    confidence_level = 0.95) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{04-VN04-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-10-1} \end{center}

99\% Confidence Interval:


```r
set.seed(216)
one_proportion_bootstrap_CI(sample_size = 114, # Sample size
                    number_successes = 51, # Observed number of successes
                    number_repetitions = 1000, # Number of bootstrap samples to use
                    confidence_level = 0.99) # Confidence level as a decimal
```



\begin{center}\includegraphics[width=0.7\linewidth]{04-VN04-EDA_OneCatSimulation_files/figure-latex/unnamed-chunk-11-1} \end{center}

### Concept Check

Be prepared for group discussion in the next class. One member from the table should write the answers to the following on the whiteboard.

1. What is the summary measure calculated from a single categorical variable?

\vspace{0.3in}


2.  Write the alternative hypothesis for this study in notation?  How was the direction of the alternative hypothesis determined?

\vspace{0.4in}

3. Do the results of the confidence interval *match* the results based on the p-value?

\vspace{0.5in}



\newpage
