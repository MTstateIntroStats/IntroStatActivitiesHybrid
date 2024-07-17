---
output:
  pdf_document: default
  html_document: default
---
## Activity 14:  What's the probability?

\setstretch{1}

### Learning outcomes

* Recognize and simulate probabilities as long-run frequencies.

* Construct two-way tables to evaluate conditional probabilities.

### Terminology review

In today's activity, we will cover two-way tables and probability.  Some terms covered in this activity are:

* Proportions 

* Probability

* Conditional probability

* Two-way tables

To review these concepts, see Chapter 23 in the textbook.  


### Probability 

1. A dataset was collected on all NBA basketball players from inception of the league.  The probability that an NBA player is above average height is 59.7%.  Of NBA players that are above average height, 46.4% averaged at least four rebounds a game. The probability that an NBA player averages less than four rebounds in a game given they are below average height is 13.3%. 
\vspace{1mm}

    Let $A$ = player is above average height, and $B$ = player averages at least four rebounds a game.
\vspace{0.1in}

\begin{center}
\begin{tabular}{|c|c|c|c|} \hline
\hspace{0.8in} & \hspace{0.25in} $A$ \hspace{.25in} & \hspace{0.25in} $A^c$ \hspace{0.25in} & \hspace{0.25in} Total \hspace{0.25in} \\ \hline $B$ & 27700.8 & 34940.1 & 62640.9 \\ \hline
 $B^c$ & 31999.2 & 5359.9 & 37359.1 \\ \hline
Total & 59700 & 40300 & 100000 \\ \hline
\end{tabular}
\end{center}
\vspace{.1in}

a. What is the probability that a randomly selected NBA player averages at least 4 rebounds a game?  Use appropriate probability notation.

\vspace{0.5in}

b. What is the probability that a randomly selected NBA player is both above average height and averages at least 4 rebounds a game.  Use appropriate probability notation.

\vspace{0.5in}

c. What is the probability that a randomly selected NBA player is not above average height given they do not average at least 4 rebounds a game.  Use appropriate probability notation.

\vspace{0.55in}

\newpage

2. Since the early 1980s, the rapid antigen detection test (RADT) of group A *streptococci* has been used to detect strep throat. A recent study of the accuracy of this test shows that the **sensitivity**, the probability of a positive RADT given the person has strep throat, is 86% in children, while the **specificity**, the probability of a negative RADT given the person does not have strep throat, is 92% in children.  The **prevalence**, the probability of having group A strep, is 37% in children. [@stewart2014]
\vspace{1mm}

    Let $A$ = the event the child has strep throat, and $B$ = the event the child has a positive RADT.
\vspace{0.1in}

    a. Identify what each numerical value given in the problem represents in probability notation.
\vspace{.1in}

        0.86 =  
\vspace{.1in}
 
        0.92 =  
\vspace{.1in}

        0.37 =  
\vspace{.1in}

    b. Create a hypothetical two-way table to represent the situation.  
    
\begin{center}
\begin{tabular}{|c|c|c|c|} \hline
\hspace{0.8in} & \hspace{0.35in} $A$ \hspace{.35in} & \hspace{0.35in} $A^c$  \hspace{0.35in} & \hspace{0.3in} Total \hspace{0.3in} \\ 
& & & \\ \hline
$B$& & & \\ 
& & & \\ \hline
$B^c$& & & \\ 
& & & \\ \hline
Total & & & 100,000 \\ 
& & & \\ \hline
\end{tabular}
\end{center}
\vspace{.1in}

   c. Find $P(A \mbox{ and } B)$. What does this probability represent in the context of the problem?
\vspace{.8in}

   d. Find the probability that a child with a positive RADT actually has strep throat. What is the notation used for this probability?
\vspace{.8in}

   e.  What is the probability that a child does not have strep given that they have a positive RADT?  What is the notation used for this probability?

\newpage

<!-- 2. In a computer store, 30% of the computers in stock are laptops and 70% are desktops.  Five percent of the laptops are on sale, while 10% of the desktops are on sale. -->
<!-- \vspace{1mm} -->

<!--     Let $L$ = the event the computer is a laptop, and $S$ = the event the computer is on sale. -->
<!-- \vspace{0.1in} -->

<!--     a. Identify what each numerical value given in the problem represents in probability notation. -->
<!-- \vspace{.1in} -->

<!--         0.30 =   -->
<!--  \vspace{.1in} -->

<!--         0.70 =   -->
<!-- \vspace{.1in} -->

<!--         0.05 =   -->
<!-- \vspace{.1in} -->

<!--         0.10 =   -->
<!-- \vspace{.1in} -->

<!--     b. Create a hypothetical two-way table to represent the situation.   -->

<!-- \begin{center} -->
<!-- \begin{tabular}{|c|c|c|c|} \hline -->
<!-- \hspace{0.8in} & \hspace{0.35in} $L$ \hspace{0.35in} & \hspace{0.35in} $L^c$ \hspace{0.35in} & \hspace{0.3in} Total \hspace{0.3in} \\  -->
<!-- & & & \\ \hline -->
<!-- $S$ & & & \\  -->
<!-- & & & \\ \hline -->
<!-- $S^c$ & & & \\ -->
<!-- & & & \\ \hline -->
<!-- Total & & & 100,000 \\  -->
<!-- & & & \\ \hline -->
<!-- \end{tabular} -->
<!-- \end{center} -->
<!-- \vspace{.1in} -->

<!--    c. Calculate the probability that a randomly selected computer will be a desktop, given that the computer is on sale. What is the notation used for this probability? -->
<!-- \vspace{.8in} -->


<!--    d. Find $P(S^C | L^C)$. What does this probability represent in context of the problem? -->
<!-- \vspace{1in} -->

<!--    e. What is the probability a randomly selected computer is both a laptop and on sale?  Give the appropriate probability notation. -->


\newpage 

### Take home messages

1.  Conditional probabilities are calculated dependent on a second variable.  In probability notation, the variable following `|` is the variable on which we are conditioning.  The denominator used to calculate the probability will be the total for the variable on which we are conditioning.  


2. When creating a two-way table we typically want to put the explanatory variable on the columns of the table and the response variable on the rows.


3. To fill in the two-way table, always start with the unconditional variable in the total row or column and then use the conditional probabilities to fill in the interior cells.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
