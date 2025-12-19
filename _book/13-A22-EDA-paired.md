## Activity 22:  Paired vs. Independent Samples

\setstretch{1}

### Learning outcomes

* Determine if a data set is paired or two independent samples

* Identify and create appropriate summary statistics and plots
  given a data set or research question for quantitative data.

* Interpret the following summary statistics in context:
  median, lower quartile, upper quartile, 
  standard deviation, interquartile range.

### Terminology review

In today's activity, we will review summary measures and plots for paired data.  Some terms covered in this activity are:

* Mean difference

* Median difference

* Standard deviation

* Quartiles

To review these concepts, see Chapter 5 and 18 in the textbook.

### Notes on paired data {-}

\vspace{2in}

### Paired vs. Independent Samples

For each of the following scenarios, determine whether the samples are paired or independent.

1. Researchers interested in studying the effect of a medical treatment on insulin rate measured insulin rates of 30 patients before and after the medical treatment.
\vspace{0.3in}

2.  A university is planning to bring emotional support animals to campus during finals week and wants to determine which type of animals are more effective at calming students.  Anxiety levels will be measured before and after each student interacts with either a dog or a cat.  The university will then compare change in anxiety levels between the 'dog' people and the 'cat' people.
\vspace{0.3in}

3.  An industry leader is investigating a possible wage gap between male and non-male employees.  Twenty companies within the industry are randomly selected and the average salary for all males and non-males in mid-management positions is recorded for each company.
\vspace{0.3in}

4. Researchers conducted a study to evaluate the effectiveness of a brief yoga intervention on working memory improvement. A sample of 43 undergraduate students at Texas State University was recruited for the study. Participants completed six yoga sessions. Working memory was assessed before and after the intervention using the Digit Span Forward task, which involves recalling a sequence of numbers in the same order they were presented. The maximum number of digits correctly recalled in the proper order served as the measure of working memory. Is there evidence that working memory is higher, on average, after completing six yoga sessions than before six yoga sessions?  
\vspace{0.3in}


### Tattoo Effect on Sweat Rate 

The popularity of tattoos has increased tremendously in the last 10 years particularly among athletes and military personnel. A study reported in *Medicine & Science in Sports & Exercise* [@luetkemeier2017] looked at whether skin tattoos altered a person's sweat rate.  The study participants were 10 healthy men with a tattoo.  According to the article, sweat was stimulated by iontophoresis using agar gel disks impregnated with 0.5% pilocarpine nitrate.  The sweat rate ($\frac{mg}{cm^2 \times min}$) was determined by weighing the disk before and after sweat collection. Sweat rate was measured on both the tattooed skin and untattooed skin from the same participant.  We will use these data to assess the difference in sweat rate between the tattooed and untattooed skin (tat - notat).

\vspace{2mm}
* Observational units:

\vspace{2mm}
* Explanatory variable:

\vspace{2mm}
* Response variable:

    * Units?:

\vspace{2mm}
### Exploring Paired Data

5. Explain why this is a paired study design and not independent groups.

\vspace{1in}

#### R Instructions {-}

* Download the R script file and the data file for this activity from Canvas

* Upload the R script file and data set to the RStudio server

* Open the R script file and enter the name of the dataset for datasetname.csv

* Run lines 1--9 to create the paired plot


``` r
tats <- read.csv("data/tattoos.csv")
paired_observed_plot(tats) 
```



\begin{center}\includegraphics[width=0.7\linewidth]{13-A22-EDA-paired_files/figure-latex/unnamed-chunk-1-1} \end{center}

**What is the value of the mean difference?**

\vspace{0.2in}

**What is the value of the standard deviation of the differences.**

\vspace{0.2in}

To find the differences to continue to assess this data and create a boxplot of the differences...

* Enter Tattoo for measurement_1 and No_Tattoo for measurement_2 in line 15

* Highlight and run lines 13--21


``` r
tat_diff <- tats %>% 
    mutate(differences = Tattoo - No_Tattoo) 
tat_diff %>% 
    summarise(favstats(differences))
#>       min     Q1  median     Q3     max     mean       sd  n missing
#> 1 -0.4032 -0.232 -0.1296 -0.104 -0.0416 -0.16704 0.110962 10       0
tat_diff %>% 
    ggplot(aes(x = differences)) +
    geom_boxplot()+
    labs(title="Boxplot of the difference in Sweat Rate 
    (mg per (cm^2*min)) for Adult Men with Tattoos comparing
    Tattooed and Untattooed Skin (tat-notat)", 
    x="difference in sweat rate (mg per (cm^2*min))", y="") +
        theme(axis.text.y = element_blank(), 
          axis.ticks.y = element_blank()) # Removes y-axis ticks

```



\begin{center}\includegraphics[width=0.65\linewidth]{13-A22-EDA-paired_files/figure-latex/unnamed-chunk-2-1} \end{center}
6. What four characteristics do we use to describe the plot of a quantitative variable?

\vspace{0.6in}


7. Identify the value of $Q_3$.  Interpret this value in context of the study.

\vspace{0.8in}


8. What other measure of center could we use to describe the distribution of differences in sweat rates between tattooed and untattooed skin?  

\vspace{0.2in}

9. Based on the plots, which measure of center would be more appropriate to describe the distribution of the differences in sweat rates between tattooed and untattooed skin?  Explain why.

\vspace{0.5in}

10. If we wanted to test that there is evidence that the sweat rate is lower for the tattooed skin than for the untattooed skin, on average, what null value would be used for this study?  What direction of the alternative would be used?

\vspace{0.4in}

11. Using the Golden Ticket, write the null hypothesis for this study in notation.

\vspace{0.3in}

12. The authors reported that the confidence interval for the mean difference was −0.17 ± 0.11 $\frac{mg}{cm^2\times min}$.  Does this interval provide evidence in support of the alternative hypothesis? Explain why.

\vspace{0.8in}

### Take home messages

1.	The differences in a paired data set are treated like a single quantitative variable when performing a statistical analysis.  Paired data (or paired samples) occur when pairs of measurements are collected. We are only interested in the population (and sample) of differences, and not in the original data. 

2.  Plots and interpretations of summary statistics are very similar to that for a single mean. 

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
