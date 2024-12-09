---
output:
  word_document: default
  html_document: default
---
# Exploring Multivariable Data

## Reading Guide: Two Quantitative Variables and Multivariable Concepts

### Textbook Chapter 6: Correlation and regression {-}

### Section 6.1 (Fitting a line, residuals, and correlation) {-}

<!-- \setstretch{1} -->

<!-- **Videos**   -->

<!-- * 6.1 -->

\setstretch{1.25}

#### Reminders from Section 5.1 {-}

Scatterplot: displays two quantitative variables; one dot = two measurements ($x$, $y$) on one observational unit.

Four characteristics of a scatterplot:
\setstretch{1}

* *Form*: pattern of the dots plotted.  Is the trend generally linear (you can fit a straight line to the data) or non-linear?  
* *Strength*: how closely do the points follow a trend?  Very closely (strong)? No pattern (weak)?  
* *Direction*: as the $x$ values increase, do the $y$-values tend to increase (positive) or decrease (negative)?  
* Unusual observations or *outliers*: points that do not fit the overall pattern of the data. 

\setstretch{1.25}

#### Vocabulary {-}

Predictor:
\rgs

Residual: 
\rgs

\rgi Formula: 
\rgs

Residual plot: 
\rgs

Correlation:
\rgs

#### Notes {-}

General equation of a linear model for a *population*: $y= \beta_0+ \beta_1 x+\epsilon$, where
	
\rgi $x$ represents 
\rgs

\rgi $y$ represents 
\rgs

\rgi $\beta_0$  represents 
\rgs

\rgi $\beta_1$  represents 
\rgs

\rgi $\epsilon$ represents 
\rgs

General equation of a linear regression model from *sample* data:  $\hat{y}= b_0+ b_1 x$, where
	
\rgi $x$ represents
\rgs

\rgi $\hat{y}$ represents
\rgs

\rgi $b_0$  represents 
\rgs

\rgi $b_1$  represents 
\rgs

Fill in the following table with the appropriate notation for each summary measure. 
\begin{center}
\begin{tabular}{|l|p{2in}|p{2in}|} \hline
Summary Measure & Parameter & Statistic \\ \hline
Correlation & & \\ 
& & \\ \hline
Slope & & \\ 
& & \\ \hline
$y$-intercept & & \\ 
& & \\ \hline
\end{tabular}
\end{center}

Fill in the blanks below to define some of the properties of correlation:

\rgi The value of correlation must be between ___________. (Includes the endpoints of the interval)

\rgi The sign of correlation gives the ______________ of the linear relationship.

\rgi The magnitude of correlation gives the ____________ of the linear relationship.

True or false: A scatterplot that shows random scatter would be considered non-linear.

True or false: If the correlation between two quantitative variables is equal to zero, then the two variables are not associated.

True or false: To calculate a predicted $y$-value from a given $x$-value, just look at the scatterplot and estimate the $y$-value.

True or false: A positive residual indicates the data point is above the regression line.

#### Example: Brushtail possums {-}

1.	What are the observational units?  
\rgs

2.	Look at the scatterplot in Figure 6.5.

\rgi a)	What is the explanatory variable?  The response variable?  What type is each?
\rgs

\rgi b)	What is the form of the scatterplot?
\rgs

\rgi c)	What is the direction of the scatterplot? 
\rgs

\rgi d)	What is the strength of the scatterplot? 
\rgs

\rgi e)	Are there any outliers on the scatterplot?
\rgs

3.	Write the equation of the regression line, in context (do not use $x$ and $y$, use variable names instead).
\rgs

4.	Calculate the predicted head length for a possum with a 76.0 cm total length.
\rgs

5.	One of the possums in the data set has a total length of 76.0 cm and a head length of 85.1 mm.  Calculate the residual for this possum.  Does this possum lie above or below the regression line?
\rgs

###  Section 6.2: Least squares regression {-}

\setstretch{1}

You may skip the special topic sections (6.2.7)

<!-- **Videos**   -->

<!-- * 6.2 -->

\setstretch{1.25}

#### Vocabulary {-}

Least squares criterion:
\rgs

Least squares line: 
\rgs

`lm()` R function: 
\rgi `name_of_model <- lm(response ~ explanatory, data = data_set_name)`

\rgs

slope: 
\vspace{0.1in}

$y$-intercept:  
\vspace{0.1in}

Extrapolation: 
\vspace{0.1in}

Coefficient of determination: 

\rgi $s_y^2$ (or SST) represents 
\vspace{0.1in}

\rgi $s_{RES}^2$ (or SSE) represents 
\vspace{0.1in}

#### Notes {-}

Two methods for determining the best line:

\rgi 1.
\rgs

\rgi 2.
\rgs

Notation for the coefficient of determination: 
\rgs

Formulas for calculating the coefficient of determination:
\rgs

True or false: A correlation between two quantitative variables implies a causal relationship exists between the variables.

True or false: The slope of the line tells us how much to expect the $y$ variable to increase or decrease when the $x$ variable increases by 1 unit.

True or false: The coefficient of determination is just the square of the correlation.

#### Example: Elmhurst College {-}

1.	What are the observational units?  
\rgs

2.	Look at the scatterplot in Figure 6.13.

\rgi a)	What is the explanatory variable?  The response variable?  
\rgs

\rgi b)	What is the form of the scatterplot?  
\rgs

\rgi c)	What is the direction of the scatterplot? 
\rgs

\rgi d)	What is the strength of the scatterplot? 
\rgs

\rgi e)	Are there any outliers on the scatterplot?  
\rgs

3.	Write the equation of the regression line, in context (do not use $x$ and $y$, use variable names instead).
\rgs

4.	Interpret the slope of the line, in the context of the problem.  Remember that both family income and gift aid from the university are measured in $1000s.
\rgs
\rgs

5.	Interpret the $y$-intercept of the line, in the context of the problem.  Remember that both family income and gift aid from the university are measured in $1000s.
\rgs
\rgs

6.	Is your interpretation in question 5 an example of extrapolation?  Justify your answer.
\rgs

7.	Give and interpret, in context, the value of the coefficient of determination.
\rgs
\rgs


###  Section 6.3: Outliers in linear regression {-}

<!-- \setstretch{1} -->

<!-- **Videos**   -->

<!-- * 6.3 -->

\setstretch{1.25}

#### Vocabulary {-}

Outlier: 
\rgs

Leverage: 
\rgs

Influential point: 
\rgs

#### Notes {-}

Investigate, but do not remove, outliers. Unless you find there was an actual error in the data collection, ignoring outliers can make models poor predictors!

True or false: All high leverage outliers are influential.

True or false: An outlier is considered high leverage if it is extreme in its $x$-value.

### Section 6.4: Chapter 6 review {-}

\setstretch{1}

Look at the table of vocabulary terms in the final section of each chapter.  If there are any you do not know, be sure to review the appropriate section of your text.

#### Notes {-}

Statistics summarize: 
\rgs

Parameters summarize: 
\rgs


Determine whether each of the following statements about the correlation coefficient are true or false:

1.	The correlation coefficient must be a positive number.

2.	Stronger linear relationships are indicated by correlation coefficients far from 0. 

3.	The correlation coefficient is a robust statistic.  

4.	When two variables are highly correlated, that indicates a causal relationship exists between the variables.  

5.	The sign of the correlation coefficient will be the same as the sign of the regression line slope, though the values are typically different. 

Fill in the blanks to correctly interpret:

*	Slope:

    For every ____________________________, we expect _________________ to increase (if slope is _____________) or decrease (if slope is ____________) by the absolute value of the _________.

* $y$-intercept:

    If _______________, we predict the __________________________ to equal __________.

Decision tree for determining an appropriate plot given a number of variables and their types from Chapter  review:


\begin{center}\includegraphics[width=0.7\linewidth]{04-RG-multivariate_files/figure-latex/decision-tree-plots-1} \end{center}

### Section 7.1: Gapminder world {-}

<!-- \setstretch{1} -->

<!-- **Videos**   -->

<!-- * Chapter7 -->

\setstretch{1.25}

#### Vocabulary {-} 

Interaction: 
\rgs

Aesthetic: 
\rgs

#### Notes {-}


Use color and a legend to add a third variable to a scatterplot. E.g., Color the dots to represent different levels of a categorical variable or use shading of the dots to represent different values of a quantitative variable.

If the response and one predictor are quantitative and the other predictor is categorical, we fit a regression line for each level of the categorical predictor.  

* Parallel slopes would indicate that that the two predictors ___________________ in explaining the response.

* Non-parallel slopes would indicate that the two predictors ___________________ in explaining the response.

True or false: Scatterplots can only display two variables at a time.

### Section 7.2: Simpson’s Paradox, revisited {-}

<!-- \setstretch{1} -->

<!-- **Videos**   -->

<!-- * Chapter7 -->

\setstretch{1.25}

#### Reminder from Section 4.4 {-}

Simpson’s Paradox: when the relationship between the explanatory and response variable is reversed when looking at the relationship within different levels of a confounding variable.

#### Notes {-}

True or false: Simpson’s Paradox can only occur when the explanatory, response, and confounding variables are all categorical.

#### Example: SAT scores {-}

1.	What are the observational units?  
\vspace{0.1in}

2.	Look at the scatterplot in Figure 7.5.

\rgi a)	What is the explanatory variable?  The response variable?
\vspace{0.1in}

\rgi b)	What is the form of the scatterplot? 
\vspace{0.1in}

\rgi c)	What is the direction of the scatterplot? 
\vspace{0.1in}

\rgi d)	What is the strength of the scatterplot? 
\vspace{0.1in}

\rgi e)	Are there any outliers on the scatterplot?
\\vspace{0.1in}

3.	What would need to be done to the study design in order to eliminate the confounding variable: percent of eligible students taking the SAT?
\rgs

4.	What features of the scatterplots in Figure 7.6 demonstrate that the percent of eligible students taking the SAT is a confounding variable?
\rgs

5.	How does Figure 7.7 demonstrate Simpson’s Paradox?
\rgs

\newpage
