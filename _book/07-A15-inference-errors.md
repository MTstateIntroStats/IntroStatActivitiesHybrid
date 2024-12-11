## Activity 15:  Errors and Power

\setstretch{1}

### Learning outcomes

* Explain Type I and Type 2 errors in the context of a study.

* Explain the power of a test in the context of a study.

* Understand how changes in sample size, significance level, and the difference between the null value and the parameter value impact the power of a test.

* Understand how significance level impacts the probability of a Type 1 error.

* Understand the relationship between the probability of a Type 2 error and power.

* Be able to distinguish between practical importance and statistical significance.

### Terminology review

In this activity, we will examine the possible errors that can be made based on the decision in a hypothesis test as well as factors influencing the power of the test. Some terms covered in this activity are:

* Significance level

* Type 1 error

* Type 2 error

* Power

To review these concepts, see Chapter 12 in the textbook.  

### College textbook cost

A college student spends, on average, \$280 on textbooks per year.  Many universities have started using open-source resources to help defray the cost of textbooks. One such university is hoping to show they have successfully reduced costs by \$100 per year, on average. 

1. Write the parameter of interest ($\mu$) in words, in the context of this problem.
\vspace{0.5in}

2. Use proper notation to write the null and alternative hypotheses the university would need to test in order to check their claim.
\vspace{0.5in}

After determining hypotheses and prior to collecting data, researchers should set a **significance level** for a hypothesis test.  The significance level, represented by $\alpha$ and most commonly 0.01, 0.05, or 0.10, is a cut-off for determining whether a p-value is small or not.  The *smaller* the p-value, the *stronger* the evidence against the null hypothesis, so a p-value that is smaller than or equal to the significance level is strong enough evidence to *reject the null hypothesis*.  Similarly, the *larger* the p-value, the *weaker* the evidence against the null hypothesis, so a p-value that is larger than the significance level does not provide enough evidence against the null hypothesis and the researcher would *fail to reject the null hypothesis*.  Rejecting the null hypothesis or failing to reject the null hypothesis are the two **decisions** that can be made based on the data collected.

As you have already learned in this course, sample size of a study is extremely important.  Often times, researchers will conduct what is called a power analysis to determine the appropriate sample size based on the goals of their research, including a desired **power** of their test.  Power is the probability of correctly rejecting the null hypothesis, or the probability of the data providing strong evidence against the null hypothesis *when the null hypothesis is false*.

The remainder of this activity will be spent investigating how different factors influence the power of a test, after which you will complete a power analysis for this physical therapy company.

* Navigate to https://istats.shinyapps.io/power/.  

* Choose the tab `Population Mean`

* Use the scale under "Null Hypothesis value $\mu_0$" to change the value to your null value from question 2. *Note we will convert this to a scale \$100 dollars. In other words, use the null value of 2.8.

* Change the "Alternative Hypothesis" to the direction you wrote in question 2.

* Leave all boxes un-checked.  

* Set the "True value of $\mu$" to 2.8 as well

* Do not change the scales for "Sample size n" or "Type I Error $\alpha$"

The red distribution you see is the scaled-Normal distribution representing the null distribution for this hypothesis test, if the sample size was 30 and the significance level was 0.05.  This means the red distribution is showing the probability of each possible sample mean of college students who spent \$280 on textbooks per year ($\bar{x}$) if we assume the null hypothesis is true.

3.  Based off this distribution and your alternative hypothesis, give one possible sample mean which you think would lead to rejecting the null hypothesis.  Explain how you decided on your value.
\vspace{0.25in}

4. Check the box for "Show Critical Value(s) and Rejection Region(s)".  You will now see a vertical line on the plot indicating the *minimum* sample mean which would lead to reject the null hypothesis.  What is this value?  
\vspace{0.25in}

5. Notice that there are some sample means under the red line (when the null hypothesis is true) which would lead us to reject the null hypothesis.  Give the range of sample means which would lead to rejecting the null hypothesis when the null hypothesis is true?  What is the statistical name for this mistake?
\vspace{0.4in}

Check the "Type I Error" box under **Display**.  This should verify (or correct) your answer to question 5!  The area shaded in red represents the probability of making a **Type 1 Error** in our hypothesis test.  Recall that a Type 1 Error is when we reject the null hypothesis even though the null hypothesis is true.  To reject the null hypothesis, the p-value, which was found assuming the null hypothesis is true, must be less than or equal to the significance level.  Therefore the significance level is the maximum probability of rejecting the null hypothesis when the null hypothesis is true, so the significance level IS the probability of making a Type 1 Error in a hypothesis test!

6.  Based on the current applet settings, What percent of the null distribution is shaded red (what is the probability of making a Type 1 Error)?
\vspace{0.25in}

Let's say this university believes their program can reduce the cost of textbooks for college students by \$100 per year. In the applet, set the scale under "True value of $\mu$" to 1.8.

7.  Where is the blue distribution centered?
\vspace{0.25in}

The blue distribution that appears represents what the university believes, that \$180 (not \$280) is the true mean textbook cost for college students at this university.  This blue distribution represents the idea that the **null hypothesis is false**.

8.  Consider the definition of power provided earlier in this lab.  Do you believe the power of the test will be an area within the blue distribution or red distribution? How do you know?  What about the probability of making a Type 2 Error?
\vspace{1in}

* Check the "Type II Error" and "Power" boxes under **Display**.  This should verify (or correct) your answers to question 8!  The area shaded in blue represents the probability of making a **Type 2 Error** in our hypothesis test (failing to reject the null hypothesis even though the null hypothesis is false).  The area shaded in green represents the power of the test.  Notice that the Type 1 and Type 2 Error rates and the power of the test are provided above the distribution.

9.  Complete the following equation: Power + Type 2 Error Rate =  .  Explain why that equation makes sense. *Hint: Consider what power and Type 2 Error are conditional on.*
\vspace{0.6in}

Now let's investigate how changes in different factors influence the power of a test.

10. Using the same sample size and significance level, change the “True value of $\mu$” to see the effect on Power.
\setlength\tabcolsep{0.5cm}
\begin{longtable}{|l|c|c|c|c|}
\hline
\textbf{True value of $p$}& 2.0 & 1.5 & 1.0 & 0.05\\ \hline
\textbf{Power} & & & &  \\ \hline
\end{longtable}

11. What is changing about the simulated distributions pictured as you change the “True value of $\mu$”?
\vspace{0.5in}


12. How does increasing the distance between the null and believed true mean affect the power of the test?
\vspace{0.5in}

13. Using the same significance level, set the “True value of $mu$” to 1.8 and change the sample size to see the effect on Power.

\setlength\tabcolsep{0.6cm}
\begin{longtable}{|l|c|c|c|c|c|}
\hline
\textbf{Sample Size}& 20 & 40 & 50 & 60 & 80 \\ \hline
\textbf{Power} & & & & &  \\ \hline
\end{longtable}

14. What is changing about the simulated distributions pictured as you change the sample size?
\vspace{0.5in}


15. How does increasing the sample size affect the power of the test?
\vspace{0.5in}

16. Using the same “True value of $\mu$”, set the sample size to 30 and change the "Type I Error $\alpha$" to see the effect on Power.

\setlength\tabcolsep{0.5cm}
\begin{longtable}{|l|c|c|c|c|c|}
\hline
\textbf{Type I Error $\alpha$}& 0.01 & 0.03 & 0.05 & 0.10 & 0.15 \\ \hline
\textbf{Power} & & & & &  \\ \hline
\end{longtable}

17. What is changing about the simulated distributions pictured as you change the significance level?
\vspace{0.5in}


18. How does increasing the significance level affect the power of the test?
\vspace{0.5in}


19.  Complete the power analysis for this university.  The university believes they can reduce the cost of textbooks for their students by \$100.  They want to limit the probability of a type 1 error to 10% and the probability of a type 2 error to 15%.  What is the minimum number of students the university will need to collect data from in order to meet these goals?  Use the applet to answer this question, then download your image created and upload the file to Gradescope.
\vspace{0.4in}

20.  Based on the goals outlined in question 19, which mistake below is the university more concerned about?  In other words, which error were the researchers trying to minimize.  Explain your answer.

* Not being able to show their textbook cost is lower, on average, when their textbook cost really is lower.

* Advertising their textbook cost is lower, on average, even though it is not.

\vspace{0.8in}

### Take-home messages

1. There is a possibility of Type 1 error when we make the decision to reject the null hypothesis.  Type 1 error: reject the null hypothesis when the null hypothesis is true. The probability of a Type 1 error when the null hypothesis is true is equal to the significance level, $\alpha$.

2. There is a possibility of Type 2 error when we make the decision to fail to reject the null hypothesis.  Type 2 error: fail to reject the null hypothesis when the null hypothesis is false.

3. Power of a test is the probability we reject the null when the null hypothesis is false. Power is equal to 1 minus the probability of a Type 2 error.

4. Changing the following will _increase_ the power of the test:

    * _Increase_ the sample size
    
    * _Increase_ the significance level
    
    * _Increase_ the distance between the null value and the parameter value (note that we don't have control over this!)

### Additional notes
Use this space to summarize your thoughts and take additional notes on today’s activity and material covered.

\newpage
