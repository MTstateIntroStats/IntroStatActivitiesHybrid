---
output:
  pdf_document: default
  html_document: default
---
## Guided Activity 17:  Probability Studies

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


### Calculating probabilities from a two-way table

In 2014, the website FiveThirtyEight examined the works of Bob Ross to see what trends could be found. They determined that of all the paintings he created, 95% of them contained at least one “happy tree.” Of those works with a happy tree, 43% contained at least one “almighty mountain.” Of the paintings that did not have at least one happy tree, only 10% contained at least one almighty mountain.
\vspace{1mm}

Let $A$ = Bob Ross painting contains a happy tree, and $B$ = Bob Ross painting contains an almighty mountain
\vspace{0.1in}

\begin{center}
\begin{tabular}{|c|c|c|c|} \hline
\hspace{0.8in} & \hspace{0.25in}  $A$ \hspace{.25in} & \hspace{0.25in} $A^c$ \hspace{0.25in} & \hspace{0.25in} Total \hspace{0.25in} \\ \hline
 $B$ & 40850 & 500 & 41350 \\ \hline
 $B^c$ & 54150 & 4500 & 58650 \\ \hline
Total & 95000 & 5000 & 100000 \\ \hline
\end{tabular}
\end{center}
\vspace{.1in}

a. What is the probability that a randomly selected Bob Ross painting contains both a "happy tree" and an "almighty mountain"?  Use appropriate probability notation.

\vspace{0.5in}

b. What is the probability that a selected Bob Ross painting without an "almighty mountain" contains a "happy tree."  Use appropriate probability notation.

\vspace{0.5in}

c. What is the probability that a selected Bob Ross painting does not contain a "happy tree" given it does not contain an "almighty mountain".  Use appropriate probability notation.

\vspace{0.55in}

\newpage

2. A recent study of population decline of white-tailed deer in Wyoming due to chronic wasting disease [@edmunds2016] (CWD) reported the prevalence of CWD to be 35.4\%.  The survival rate of CWD positive deer was 39.6\% and the survival rate of CWD negative deer was 80.1\%.  
\vspace{1mm}

    Let $A$ = the event a deer is CWD positive, and $B$ = the event the deer survived.
\vspace{0.1in}

    a. Identify what each numerical value given in the problem represents in probability notation.
\vspace{.1in}

        0.342 =  
\vspace{.1in}
 
        0.396 =  
\vspace{.1in}

        0.801 =  
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

   d. Find the probability that a deer that is positive for CWD did not survive. What is the notation used for this probability?
\vspace{.8in}

   e.  What is the probability that a deer does not survive given they do not have CWD?  What is the notation used for this probability?

\newpage 

### Take home messages

1.  Conditional probabilities are calculated dependent on a second variable.  In probability notation, the variable following `|` is the variable on which we are conditioning.  The denominator used to calculate the probability will be the total for the variable on which we are conditioning.  


2. When creating a two-way table we typically want to put the explanatory variable on the columns of the table and the response variable on the rows.


3. To fill in the two-way table, always start with the unconditional variable in the total row or column and then use the conditional probabilities to fill in the interior cells.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered.

\newpage
