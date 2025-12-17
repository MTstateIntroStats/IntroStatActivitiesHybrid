---
output:
  pdf_document: default
  html_document: default
---
## Activity 20:  Penguins

\setstretch{1}

### Learning outcomes

* Identify and create appropriate summary statistics and plots
  given a data set with two quantitative variables.
  
* Find the estimated line of regression using summary statistics and `R` linear model (`lm()`) output.

* Interpret the slope coefficient in context of the problem.

* Calculate and interpret $r^2$, the coefficient of determination, in context of the problem.

* Find the correlation coefficient from `R` output or from $r^2$ and the sign of the slope.

### Terminology review

In today's activity, we will review summary measures and plots for two quantitative variables.  Some terms covered in this activity are:

* Least-squares line of regression

* Slope and $y$-intercept

* Residuals

* Correlation ($r$)

* Coefficient of determination ($r$-squared)

To review these concepts, see Chapter 6 in the textbook.  

### Penguins

The Palmer Station Long Term Ecological Research Program sampled three penguin species on islands in the Palmer Archipelago in Antarctica. Researchers took various body measurements on the penguins, including flipper length and body mass. The researchers were interested in the relationship between flipper length and body mass and wondered if flipper length could be used to accurately predict the body mass of these three penguin species. 

* Upload and import the `Antarctica_Penguins` csv file and the provided R script file for this activity. Enter the name of the data set for `datasetname` in the R script file in line 4....

First we will create a scatterplot of the flipper length and body mass.  Notice that we are using flipper length to predict body mass.  This makes flipper length the explanatory variable. **Make sure to give your plot a descriptive title.** Highlight and run lines 1--13 in the R script file.  **Upload a copy of your scatterplot to Gradescope.**


``` r
penguins <- read.csv("data/Antarctica_Penguins.csv") #Creates the object penguins
penguins <- na.omit(penguins)
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g))+  # Specify variables
  geom_point() +  # Add scatterplot of points
  labs(x = "flipper length (mm)",  # Label x-axis
       y = "body mass (g)",  # Label y-axis
       title = "Scatterplot of Body Mass by Flipper Length for 
       Antarctica Penguins") + # Be sure to title your plots
  geom_smooth(method = "lm", se = FALSE)  # Add regression line
```



\begin{center}\includegraphics[width=0.6\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-1-1} \end{center}


1. Describe the relationship, using the four characteristics of scatterplots, between 75th percentile SAT Math score and retention rate.

\vspace{1in}

#### Slope of the Least Squares Linear Regression Line {-}

There are three summary measures calculated from two quantitative variables: slope, correlation, and the coefficient of determination.  We will again start with an assessment of the regression slope.

* Enter `body_mass_g` for response and `flipper_length_mm` for explanatory in line ...

* Highlight and run lines ... to fit the linear model.


``` r
# Fit linear model: y ~ x
PenguinsLM <- lm(body_mass_g~flipper_length_mm, data=penguins)
round(summary(PenguinsLM)$coefficients,5) # Display coefficient summary
```

```
#>                      Estimate Std. Error   t value Pr(>|t|)
#> (Intercept)       -5865.81792  309.34034 -18.96234        0
#> flipper_length_mm    50.12002    1.53517  32.64781        0
```

2.  Write out the least squares regression line using the summary statistics from the R output in context of the problem.

\vspace{0.7in}

3. Interpret the value of slope in context of the problem.

\vspace{0.8in}

\newpage

4. Predict the body mass of a penguin with a flipper length of 230mm.

\vspace{0.6in}

5. Calculate the residual for a penguin with a flipper length of 230mm and a body mass of 6050g.

\vspace{0.6in}

#### Correlation  {-}

Additionally, we can find the value of correlation.

The following output creates a correlation matrix between several pairs of quantitative variables.  


``` r
penguins %>%  # Data set pipes into
  select(c("bill_length_mm", "bill_depth_mm", 
           "flipper_length_mm", "body_mass_g")) %>%
  cor(use="pairwise.complete.obs") %>%
  round(3)
```

```
#>                   bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
#> bill_length_mm             1.000        -0.229             0.652       0.589
#> bill_depth_mm             -0.229         1.000            -0.579      -0.473
#> flipper_length_mm          0.652        -0.579             1.000       0.873
#> body_mass_g                0.589        -0.473             0.873       1.000
```

6.  What is the value of correlation between flipper length and body mass?

\vspace{0.3in}

#### Coefficient of determination (squared correlation) {-}

Another summary measure used to explain the linear relationship between two quantitative variables is the coefficient of determination ($r^2$). The coefficient of determination, $r^2$, can also be used to describe the strength of the linear relationship between two quantitative variables. The value of $r^2$ (a value between 0 and 1) represents the **proportion of variation in the response that is explained by the least squares line with the explanatory variable**.  There are two ways to calculate the coefficient of determination: 

|    Square the correlation coefficient:  $r^2 = (r)^2$

|    Use the variances of the response and the residuals:  $r^2 = \dfrac{s_y^2 - s_{RES}^2}{s_y^2} = \dfrac{SST - SSE}{SST}$


7.  Use the correlation, $r$, found in question 6, to calculate the coefficient of determination between flipper length and body mass, $r^2$.

\vspace{.4in}

The variance of the response variable, body mass (g), is $s_{\text{body mass}}^2 = 647761.2$ $\%^2$, the variance of the explanatory variable, flipper length (mm), is $s_{\text{flipper length}}^2 = 196.6214$, and the variance in the residuals is $s_{RES}^2 = 154308.4$ \%$^2$.  Use these values to calculate the coefficient of determination.

\vspace{1in}

In the next part of the activity we will explore what the coefficient of determination measures. 

In the first scatterplot, we see the data plotted with a horizontal line. Note that the regression line in this plot has a slope of zero; this assumes there is no relationship between flipper length and body mass. The value of the y-intercept, 4209.057, is the mean of the response variable when there is no relationship between the two variables.  To find the sum of squares total (SST) we find the residual ($residual = y - \hat{y}$) for each response value from the horizontal line (from the value of 4209.057).  Each residual is squared and the sum of the squared values is calculated.  The SST gives the **total variability in the response variable, Retention**.  


\begin{center}\includegraphics[width=0.7\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-4-1} \end{center}

**The calculated value for the SST is 215704477.919.**

<!-- 6.  Write down the value of SSE given in this image.  Since this is the sum of squared errors (SSE) for the horizontal line we call this the total sum of squares (SST). -->
<!-- \vspace{3mm} -->

<!--     SST =  -->

This next scatterplot, shows the plotted data with the best fit regression line.  This is the line of best fit between flipper length and body mass and has the smallest sum of squares error (SSE).  The SSE is calculated by finding the residual from each response value to the regression line.  Each residual is squared and the sum of the squared values is calculated.


\begin{center}\includegraphics[width=0.7\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-5-1} \end{center}

**The calculated value for the SSE is 51230376.045.**

\newpage

<!-- * Go to the website www.rossmanchance.com/ISIapplets.html and click on Corr/Regresssion under Quantitative Response.   -->

<!-- * Click `Clear` below the box containing the sample data.  -->

<!-- * Download and open the csv file "Movie2016" from D2L.  Copy the two columns containing `budget_mil` and `revenue_mil` including the headers and paste into the sample data box.   -->

<!-- * Click 'Use Data`. -->

<!-- 8.  Click on `Show Moveable Line`.  Write down the equation of the line given.  Why is the slope zero for this line? -->

<!-- \vspace{0.8in} -->

<!-- 9.  Click on `Show Squared Residuals`.  Write down the value for SSE.  Since this is the sum of squared errors (SSE) for the horizontal line we call this the total sum of squares (SST). -->

<!-- \newpage -->

<!-- 10. Click on `Show Regression Line`.  Write down the equation of the line given.  Does this match the least squares line found in Activity 4A question 4? -->

<!-- \vspace{1in} -->

<!-- 11. Click on `Show Squared Residuals`.  Write down the value for SSE. -->

<!-- \vspace{0.5in} -->

**Calculate the value for $r^2$ using the values for SST and SSE provided below each of the previous graphs.**

\vspace{0.6in}

**Interpretation of the coefficient of determination in context of the problem.**

\vspace{0.8in}


#### Multivariable plots {-}

Another variable collected on the penguins was bill depth (mm).  The following scatterplot shows the relationship between bill depth and body mass.


\begin{center}\includegraphics[width=0.7\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-6-1} \end{center}
8.  Describe the relationship between bill depth and body mass.

\vspace{0.8in}


When adding another categorical predictor, we can add that variable as shape or color to the plot.  


``` r

penguins %>% # Data set pipes into...
    ggplot(aes(x = bill_depth_mm, y = body_mass_g, shape = species, color=species))+  # Specify variables
    geom_point(alpha=0.5) +  # Add scatterplot of points
    labs(x = "bill depth (mm)",  # Label x-axis
       y = "body mass (g)",  # Label y-axis
       title = "Scatterplot of Body Mass vs. Bill Depth for 
       Antarctica Penguins by Species") + # Be sure to title your plots
    geom_smooth(method = "lm", se = FALSE) + # Add regression line
    scale_color_grey()
```



\begin{center}\includegraphics[width=0.7\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-7-1} \end{center}
**Note that the relationship between bill depth and body mass is now positive based on the penguin species.  This is an example of what?**

\vspace{0.4in}

**Does the relationship between bill depth and body mass for Antarctica penguins change depending on the species?**

\vspace{0.8in}




\begin{center}\includegraphics[width=0.45\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-8-1} \includegraphics[width=0.45\linewidth]{12-A20-EDA-two-quantitative-corr_files/figure-latex/unnamed-chunk-8-2} \end{center}
**Is species of Antarctica penguins associated with body mass?  Is species of Antarctica penguins associated with bill depth?**

\vspace{1in}

### Take-home messages

1. The sign of correlation and the sign of the slope will always be the same.  The closer the value of correlation is to $-1$ or $+1$, the stronger the linear relationship between the explanatory and the response variable.  

2.  The coefficient of determination multiplied by 100 ($r^2 \times 100$) measures the percent of variation in the response variable that is explained by the relationship with the explanatory variable.  The closer the value of the coefficient of determination is to 100\%, the stronger the relationship.

3.  We can use the line of regression to predict values of the response variable for values of the explanatory variable. Do not use values of the explanatory variable that are outside of the range of values in the data set to predict values of the response variable (reflect on why this is true.).  This is called **extrapolation**. 

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
