## Module 4 Review - Theory-based Methods for a Single Proportion

Statistician Jessica Utts has conducted an extensive analysis of Ganzfeld studies that have investigated psychic functioning. Ganzfeld studies involve a "sender" and a "receiver." Two people are placed in separate rooms.  The sender looks at a "target" image on a television screen and attempts to transmit information about the target to the receiver.  The receiver is then shown four possible choices or targets, one of which is the correct target and the other three are "decoys."  The receiver must choose the one he or she thinks best matches the description transmitted by the sender.  If the correct target is chosen by the receiver, the session is a "hit."  Otherwise, it is a miss.  Utts reported that her analysis considered a total of 2,124 sessions and found a total of 709 "hits" (Utts, 2010).  Is there evidence of psychic ability?

1.	Write the parameter of interest in context of the study.

\vspace{0.6in}


2.  Calculate the point estimate.  Use proper notation.

\vspace{0.3in}

3.  Write the null hypothesis in words.

\vspace{0.6in}

4.  Write the alternative hypothesis in notation.

\vspace{0.2in}

A single proportion can be mathematically modeled using the normal distribution if certain conditions are met.

Conditions for the sample distribution of $\hat{p}$.

* Independence: The sample’s observations are independent, e.g., are from a simple random sample

* Large enough sample size:  

    * Success-Failure Condition: There are at least 10 successes and 10 failures in the sample 

$$n \times \hat{p} \ge 10$$ and $$n \times (1-\hat{p}) \ge 10$$

\newpage

5. Are the conditions met to model the data with the Normal distribution?

\vspace{0.6in}

Standardized sample proportion. 

The standardized statistic for theory-based methods for one proportion is:

$$Z = \frac{\hat{p}-\pi_0}{SE_0(\hat{p})}$$

Where $$SE_0(\hat{p})=\sqrt\frac{\pi_0\times (1-\pi_0)}{n}$$


6. Calculate the null standard error of the sample proportion

\vspace{0.6in}

7. Calculate the standardized statistic for the sample proportion.

\vspace{0.4in}

\begin{figure}

{\centering \includegraphics[width=0.5\linewidth]{05-UR-module4_review_files/figure-latex/simpleNormalcurve-1} 

}

\caption{A standard normal curve.}(\#fig:simpleNormalcurve)
\end{figure}


\begin{center}\includegraphics[width=0.5\linewidth]{05-UR-module4_review_files/figure-latex/Normcurve-1} \end{center}

\newpage

8. Interpret the standardized statistic in context of the problem.

\vspace{1in}

We will use the `pnorm()` function in `R` to find the p-value. The value of the standardized statistic calculated in question 8 is entered into the `R` code.  We used `lower.tail = FALSE` to find the p-value so that `R` will calculate the p-value *greater* than the value of the standardized statistic.  

Notes:

* Use `lower.tail = TRUE` when doing a left-sided test.
* Use `lower.tail = FALSE` when doing a right-sided test.
* To find a two-sided p-value, use a left-sided test for negative Z or a right-sided test for positive Z, then multiply the value found by 2 to get the p-value.


``` r
pnorm(9.333, # Enter value of standardized statistic
      m=0, s=1, # Using the standard normal mean = 0, sd = 1
      lower.tail=FALSE) # Gives a p-value greater than the standardized statistic
#> [1] 5.145792e-21
```

9. Report the value of the p-value.

\vspace{0.1in}

Simulation Method:

\begin{center}\includegraphics[width=0.85\linewidth]{05-UR-module4_review_files/figure-latex/unnamed-chunk-2-1} \end{center}

10.  Interpret the p-value in context of the study.

\vspace{0.8in}

Next we will use theory-based methods to estimate the parameter of interest.  

To calculate a theory-based 95\% confidence interval for $\pi$, we will first find the **standard error** of $\hat{p}$ by plugging in the value of $\hat{p}$ for $\pi$ in $SD(\hat{p})$:

$$SE(\hat{p}) = \sqrt{\frac{\hat{p}\times(1-\hat{p})}{n}}.$$
Note that we do not include a "0" subscript, since we are not assuming a null hypothesis. 

11.  Calculate the standard error of the sample proportion to find a 95\% confidence interval.

\vspace{0.5in}

To find the confidence interval, we will add and subtract the **margin of error** to the point estimate:

$$\text{point estimate}\pm\text{margin of error}$$
$$\hat{p}\pm z^* SE(\hat{p})$$

The $z^*$ multiplier is the percentile of a standard normal distribution that corresponds to our confidence level. If our confidence level is 95\%, we find the Z values that encompass the middle 95\% of the standard normal distribution.  If 95\% of the standard normal distribution should be in the middle, that leaves 5\% in the tails, or 2.5\% in each tail.  The `qnorm()` function in `R` will tell us the $z^*$ value for the desired percentile (in this case, 95\% + 2.5\% = 97.5\% percentile). 

\begin{figure}

{\centering \includegraphics[width=0.5\linewidth]{05-UR-module4_review_files/figure-latex/Ncurve-1} 

}

\caption{A standard normal curve.}(\#fig:Ncurve)
\end{figure}


``` r
qnorm(0.975) # Multiplier for 95% confidence interval
```

```
#> [1] 1.959964
```
12.  Calculate the margin of error for a 95\% confidence interval for the true proportion of sessions that will result in a hit.

\vspace{0.6in}

13.  Calculate the 95\% confidence interval for the true proportion of sessions that will result in a hit. 

\vspace{1in}

\newpage

Simulation Methods:

\begin{center}\includegraphics[width=0.85\linewidth]{05-UR-module4_review_files/figure-latex/unnamed-chunk-4-1} \end{center}

14.  Interpret the 95\% confidence interval in context of the problem.
\vspace{0.6in}

15.  Write a conclusion based on the p-value and the 95\% confidence interval.

\vspace{0.6in}

\newpage
