## Activity 21:  Paired vs. Independent Samples

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

* Standard deviation

* Quartiles

* 

To review these concepts, see Chapter 5 and 18 in the textbook.

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

The popularity of tattoos has increased tremendously in the last 10 years particularly among athletes and military personnel. A study reported in *Medicine & Science in Sports & Exercise* [@luetkemeier2017] looked at whether skin tattoos altered a person's sweat rate.  The study participants were 10 healthy men with a tattoo.  According to the article, sweat was stimulated by iontophoresis using agar gel disks impregnated with 0.5% pilocarpine nitrate.  The sweat rate was determined by weighing the disk before and after sweat collection. Sweat rate was measured on both the tattooed skin and untattooed skin from the same participant.  We will use these data to assess the difference in sweat rate between the tattooed and untattooed skin (tat - notat).


### Exploring Paired Data

5. Explain why this is a paired study design and not independent groups.

\vspace{1in}

* Download the R script file and the data file for this activity from D2L

* Upload the R script file and data set to the RStudio server

* Open the R script file and enter the name of the dataset for datasetname.csv

* Run lines 1--9 to create the paired plot


``` r
tats <- read.csv("data/tattoos.csv")
paired_observed_plot(tats) 
```

6. What is the value of the mean difference?  Give the appropriate notation.

\vspace{0.2in}

7. What is the value of the standard deviation of the differences.  Give the appropriate notation.

\vspace{0.2in}

8.  You may notice that the difference in the means ($0.178 - 0.345 = -0.167$) is equal to the mean difference you reported in Q6.  That is not true for the standard deviations.  Explain why?

\vspace{0.8in}

9. Interpret the value of the standard deviation of the differences

\vspace{0.6in}

10.  What is the shape of the distribution of the differences?

\vspace{0.3in}

To find the differences to continue to assess this data and create a boxplot of the differences...

* Enter Tattoo for measurement_1 and No_Tattoo for measurement_2 in line 15

* Highlight and run lines 13 - 21


``` r
tat_diff <- tats %>% 
    mutate(differences = Tattoo - No_Tattoo) 
tat_diff %>% 
    summarise(favstats(differences))
tat_diff %>% 
    ggplot(aes(x = differences)) +
    geom_boxplot()+
    labs(title="Boxplot of the difference in Sweat Rate (mg·cm^2) per min for Adult Men 
         with Tattoos comparing Tattooed and Untattooed Skin (tat-notat)") 

```
11. What four characteristics do we use to describe the plot of a quantitative variable?

\vspace{0.6in}


12. Identify the value of $Q_3$.  Interpret this value in context of the study.

\vspace{0.8in}

13. Interpret the mean from the five number summary in context of the study. Identify where this value is found in the paired plot.

\vspace{0.6in}

14. What other measure of center could we use to describe the distribution of differences in sweat rates between tattooed and untattooed skin?  

\vspace{0.2in}

15. Based on the plots, which measure of center would be more appropriate to describe the distribution of the differences in sweat rates between tattooed and untattooed skin?  Explain why.

\vspace{0.5in}

16. If we wanted to test that there is evidence that the sweat rate is lower for the tattooed skin than for the untattooed skin, on average, what null value would be used for this study?  What direction of the alternative would be used?

\vspace{0.4in}

17. Using the Golden Ticket, write the null hypothesis for this study in notation.

\vspace{0.3in}

18. The authors reported that the confidence interval for the mean difference was −0.17 ± 0.11 $\frac{mg*cm^2}{min}$.  Does this interval provided evidence in support of the alternative hypothesis? Explain why.

\vspace{0.8in}

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
