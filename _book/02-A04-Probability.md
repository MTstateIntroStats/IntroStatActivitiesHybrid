---
output:
  pdf_document: default
  html_document: default
---
## Activity 4:  Probability Studies

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

### Overview of probabiliy

The probability of an event is the long-run proportion of times the event would occur if the random process were repeated indefinitely (under identical conditions).

To calculate the probability of an event happening:

$$\text{probability} = \frac{\text{number of ways an event can happen}}{\text{total number of possible outcomes}}$$

For example, to calculate the probability of a coin flip landing on heads; there are only two outcomes (heads or tails) and only one possibility way to land on heads. 

$$P(heads) = \frac{1}{2} = 0.5$$
The figure below shows the long-run proportion of times a simulated coin flip lands on heads on the y-axis, and the number of tosses on the x-axis. Notice how the long-run proportion starts converging to 0.5 as the number of tosses increases.

\begin{figure}

{\centering \includegraphics[width=0.65\linewidth]{images/coinsim} 

}

\end{figure}

In today's activity we will discuss the probability of a single event, the probability of an "and" event, and the probability of a conditional event.  

#### Probability notation {-}

We will use the notation P(event) to represent the probability of an event and use letters to represent events.  The following are notations for different probabilities where we are discussing event A and event B:

* $P(A)$ represents the probability of event A

* $P(A^C)$ represents the probability of the complement of event A

    * $P(A^C) = 1 - P(A)$
    
* $P(A and B)$ represents the probability of events A and B

* $P(A|B)$ represents the probability of event A given event B

* $P(B|A)$ represents the probability of event B given event A

#### Probability questions

For the beginning of this activity we will start with discussing the probabilities associated with drawing a card from a standard card deck.  In a card deck there are:

* 52 cards

* Half are red, half are black

* Four suits: spades, hearts, diamonds, and clubs

* Each suit has 13 cards: cards 2$-$10, ace, jack, queen, and king

- Let A represent the event that a card is an ace

- Let B represent the event that a card is red

To find the probability of selecting an ace, first start with determining how many aces are possible (four) and how many cards will we select from (total of 52).

\vspace{1in}

Find the probability of selecting a card that is not an ace.  This is the complement of event A.

\vspace{1in}

Find the probability of selecting a red ace.  There are only two red aces and a total of 52 cards.

\vspace{1in}

Find the probability of selecting an ace given that the card is red.  There are two red aces but only $\frac{52}{2} = 26$ red cards

\vspace{1in}

If a card drawn is an ace, what is the probability the card drawn is red.  There are four aces but only two that are red.

\vspace{1in}

<!-- #### In your groups {-} -->

<!-- Rolling a six-sided die.   -->

<!-- * Let event A represent rolling an odd number -->

<!-- * Let event B represent rolling a prime number -->

<!-- 1. Calculate the probability of rolling an odd number.  Use appropriate probability notation. -->

<!-- \vspace{1in} -->

<!-- 2. If a dice roll is a prime number, what is the probability the dice roll is an odd number.  Use appropriate probability notation. -->

<!-- \vspace{1in} -->

<!-- 3. Calculate the probability a die roll results in both an even number and a prime number.  Use appropriate probability notation. -->

<!-- \vspace{1in} -->


### Calculating probabilities from a two-way table

1. In 2014, the website FiveThirtyEight examined the works of Bob Ross to see what trends could be found. They determined that of all the paintings he created, 95% of them contained at least one “happy tree.” Of those works with a happy tree, 43% contained at least one “almighty mountain.” Of the paintings that did not have at least one happy tree, only 10% contained at least one almighty mountain.
\vspace{1mm}

Let $A$ = Bob Ross painting contains a happy tree, and $B$ = Bob Ross painting contains an almighty mountain
\vspace{0.1in}

\begin{center}
\begin{tabular}{|c|c|c|c|} \hline
\hspace{0.8in} & \hspace{0.25in}  $A$ \hspace{.25in} & \hspace{0.25in} $A^C$ \hspace{0.25in} & \hspace{0.25in} Total \hspace{0.25in} \\ \hline
 $B$ & 40850 & 500 & 41350 \\ \hline
 $B^C$ & 54150 & 4500 & 58650 \\ \hline
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

    Let $A$ = the event a deer has CWD, and $B$ = the event the deer survives.
\vspace{0.1in}

    a. Identify what each numerical value given in the problem represents in probability notation.
\vspace{.1in}

        0.354 =  
\vspace{.1in}
 
        0.396 =  
\vspace{.1in}

        0.801 =  
\vspace{.1in}

    b. Create a hypothetical two-way table to represent the situation.  
    
\begin{center}
\begin{tabular}{|c|c|c|c|} \hline
\hspace{0.8in} & \hspace{0.35in} $A$ \hspace{.35in} & \hspace{0.35in} $A^C$  \hspace{0.35in} & \hspace{0.3in} Total \hspace{0.3in} \\ 
& & & \\ \hline
$B$& & & \\ 
& & & \\ \hline
$B^C$& & & \\ 
& & & \\ \hline
Total & & & 100,000 \\ 
& & & \\ \hline
\end{tabular}
\end{center}
\vspace{.1in}

   c. Find $P(A \mbox{ and } B)$. What does this probability represent in the context of the problem?
\vspace{.8in}

   d. Find the probability that a deer that has CWD does not survive. What is the notation used for this probability?
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
