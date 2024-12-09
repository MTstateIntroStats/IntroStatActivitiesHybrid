## Activity 9:  Errors and Power

\setstretch{1}

### Learning outcomes

* Explain Type I and Type 2 Errors in the context of a study.

* Explain the power of a test in the context of a study.

* Understand how changes in sample size, significance level, and the difference between the null value and the parameter value impact the power of a test.

* Understand how significance level impacts the probability of a Type 1 Error.

* Understand the relationship between the probability of a Type 2 Error and power.

* Be able to distinguish between practical importance and statistical significance.

### Terminology review

In this activity, we will examine the possible errors that can be made based on the decision in a hypothesis test as well as factors influencing the power of the test. Some terms covered in this activity are:

* Significance level

* Type 1 Error

* Type 2 Error

* Power

To review these concepts, see Chapter 12 in the textbook.  

### ACL recovery

It is widely reported that the median recovery time for athletes who undergo surgery to repair a torn anterior cruciate ligament (ACL) is 8 months, indicating that 50% of athletes return to their sport within 8 months after an ACL surgery.  Suppose a local physical therapy company hopes to advertise that their rehabilitation program can increase this percentage.  

1. Write the parameter of interest ($\pi$) in words, in the context of this problem.
\vspace{0.5in}

2. Use proper notation to write the null and alternative hypothesis the company would need to test in order to check their advertisement claim.
\vspace{0.5in}

After determining hypotheses and prior to collecting data, researchers should set a **significance level** for a hypothesis test.  The significance level, represented by $\alpha$ and most commonly 0.01, 0.05, or 0.10, is a cut-off for determining whether a p-value is small or not.  The *smaller* the p-value, the *stronger* the evidence against the null hypothesis, so a p-value that is smaller than or equal to the significance level is strong enough evidence to *reject the null hypothesis*.  Similarly, the *larger* the p-value, the *weaker* the evidence against the null hypothesis, so a p-value that is larger than the significance level does not provide enough evidence against the null hypothesis and the researcher would *fail to reject the null hypothesis*.  Rejecting the null hypothesis or failing to reject the null hypothesis are the two **decisions** that can be made based on the data collected.

As you have already learned in this course, sample size of a study is extremely important.  Often times, researchers will conduct what is called a power analysis to determine the appropriate sample size based on the goals of their research, including a desired **power** of their test.  Power is the probability of correctly rejecting the null hypothesis, or the probability of the data providing strong evidence against the null hypothesis *when the null hypothesis is false*.

The remainder of this activity will be spent investigating how different factors influence the power of a test, after which you will complete a power analysis for this physical therapy company.

* Navigate to https://istats.shinyapps.io/power/.  *Please note that this applet uses $p_0$ to represent the null value rather than $\pi_0$.*

* Use the scale under "Null Hypothesis value $p_0$" to change the value to your null value from question 2.

* Change the "Alternative Hypothesis" to the direction you wrote in question 2.

* Leave all boxes un-checked.  Do not change the scales under "True value of $p_0$", "Sample size n", or "Type I Error $\alpha$"

The red distribution you see is the scaled-Normal distribution representing the null distribution for this hypothesis test, if the sample size was 50 and the significance level was 0.05.  This means the red distribution is showing the probability of each possible sample proportion of athletes who returned to their sport within 8 months ($\hat{p}$) if we assume the null hypothesis is true.

3.  Based off this distribution and your alternative hypothesis, give one possible sample proportion which you think would lead to rejecting the null hypothesis.  Explain how you decided on your value.
\vspace{0.25in}

4. Check the box for "Show Critical Value(s) and Rejection Region(s)".  You will now see a vertical line on the plot indicating the *minimum* sample proportion which would lead to reject the null hypothesis.  What is this value?  
\vspace{0.25in}

5. Notice that there are some sample proportions under the red line (when the null hypothesis is true) which would lead us to reject the null hypothesis.  Give the range of sample proportions which would lead to rejecting the null hypothesis when the null hypothesis is true?  What is the statistical name for this mistake?
\vspace{0.4in}

Check the "Type I Error" box under **Display**.  This should verify (or correct) your answer to question 5!  The area shaded in red represents the probability of making a **Type 1 Error** in our hypothesis test.  Recall that a Type 1 Error is when we reject the null hypothesis even though the null hypothesis is true.  To reject the null hypothesis, the p-value, which was found assuming the null hypothesis is true, must be less than or equal to the significance level.  Therefore the significance level is the maximum probability of rejecting the null hypothesis when the null hypothesis is true, so the significance level IS the probability of making a Type 1 Error in a hypothesis test!

6.  Based on the current applet settings, What percent of the null distribution is shaded red (what is the probability of making a Type 1 Error)?
\vspace{0.25in}

Let's say this physical therapist company believes their program can get 70% of athletes back to their sport within 8 months of an ACL surgery.  In the applet, set the scale under "True value of $p$" to 0.7.

7.  Where is the blue distribution centered?
\vspace{0.25in}

The blue distribution that appears represents what the company believes, that 0.7 (not 0.5) is the true proportion of its clients who return to their sport within 8 months of ACL surgery.  This blue distribution represents the idea that the **null hypothesis is false**.

8.  Consider the definition of power provided earlier in this lab.  Do you believe the power of the test will be an area within the blue distribution or red distribution? How do you know?  What about the probability of making a Type 2 Error?
\vspace{1in}

* Check the "Type II Error" and "Power" boxes under **Display**.  This should verify (or correct) your answers to question 8!  The area shaded in blue represents the probability of making a **Type 2 Error** in our hypothesis test (failing to reject the null hypothesis even though the null hypothesis is false).  The area shaded in green represents the power of the test.  Notice that the Type 1 and Type 2 Error rates and the power of the test are provided above the distribution.

9.  Complete the following equation: Power + Type 2 Error Rate =  .  Explain why that equation makes sense. *Hint: Consider what power and Type 2 Error are conditional on.*
\vspace{0.6in}

Now let's investigate how changes in different factors influence the power of a test.

10. Using the same sample size and significance level, change the “True value of $p$” to see the effect on Power.
\setlength\tabcolsep{0.5cm}
\begin{longtable}{|l|c|c|c|c|c|}
\hline
\textbf{True value of $p$}& 0.60 & 0.65 & 0.70 & 0.75 & 0.80 \\ \hline
\textbf{Power} & & & & &  \\ \hline
\end{longtable}

11. What is changing about the simulated distributions pictured as you change the “True value of $p$”?
\vspace{0.5in}


12. How does increasing the distance between the null and believed true probability of success affect the power of the test?
\vspace{0.5in}

13. Using the same significance level, set the “True value of $p$” to 0.7 and change the sample size to see the effect on Power.

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

16. Using the same “True value of $p$”, set the sample size to 50 and change the "Type I Error $\alpha$" to see the effect on Power.

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


19.  Complete the power analysis for this physical therapy company.  The company believes 70% of their patients will return to their sport within 8 months of ACL surgery.  They want to limit the probability of a type 1 error to 10% and the probability of a type 2 error to 15%.  What is the minimum number of athletes the company will need to collect data from in order to meet these goals?  Use the applet to answer this question, then download your image created and upload the file to Gradescope.
\vspace{0.4in}

20.  Based on the goals outlined in question 19, which mistake below is the company more concerned about?  In other words, which error were the researchers trying to minimize.  Explain your answer.

* Not being able to advertise their ACL recovery program is better than average when their program really is better.

* Advertising their ACL recovery program is better even though it is not.

\vspace{0.8in}

### Take-home messages

1. There is a possibility of Type I Error when we make the decision to reject the null hypothesis.  Type I Error - reject the null hypothesis when the null hypothesis is true.

2. There is a possibility of Type II Error when we make the decision to fail to reject the null hypothesis.  Type II Error - fail to reject the null hypothesis when the null hypothesis is false.

3. Increasing the sample size will increase the power of the test. 

### Additional notes
Use this space to summarize your thoughts and take additional notes on today’s activity and material covered.

\newpage
