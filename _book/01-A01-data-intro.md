## Activity 1:  Intro to Data

\setstretch{1}

### Learning outcomes

* Identify observational units, variables, and variable types in a statistical study.

* Identify biased sampling methods.

### Terminology review
Statistics is the study of how best to collect, analyze, and draw conclusions from data.  Today in class you will be introduced to the following terms:

* Observational units or cases

* Variables: categorical or quantitative 

* Types of sampling bias 

For more on these concepts, read Chapter 1 and Section 2.1 in the textbook.

### General information on labs

On Friday of each week you will complete a lab. Questions are selected from each lab to be turned in on Gradescope.  The questions to be submitted on Gradescope are bolded in the lab.  As you work through the lab have the Gradescope lab assignment open so that you can answer those questions as you go.  Today's activity is Lab 0 in Gradescope for practice submitting as a group.

#### Steps of the statistical investigation process {-}

As we move through the semester we will work through the six steps of the statistical investigation process.  

1. Ask a research question.

2. Design a study and collect data.

3. Summarize and visualize the data. *Weeks 3--4*

4. Use statistical analysis methods to draw inferences from the data. *Weeks 6--13*

5. Communicate the results and answer the research question. *Weeks 6--13*

6. Revisit and look forward.

Today we will focus on the first two steps.

**Step 1**: The first step of any statistical investigation is to *ask a research question*.  As stated in the textbook, "with the rise of data science, however, we might not start with a research question, and instead start with a data set."  Today we will create a data set by collecting responses on students in class.

**Step 2**: To answer any research question, we must *design a study and collect data*. Our study will consist of answers from each student.  Your responses will become our observed data that we will explore.  

**Observational units** or **cases** are the subjects data are collected on. In a spreadsheet of the data set, each row will represent a single observational unit.  

1. **What are the observational units or cases for today's study? ** 

\vspace{0.2in}

2. How many students are in class today? This is the **sample size**.

\vspace{0.2in}

A **variable** is information collected or measured on each observational unit or case. Each column in a data set will represent a different variable. 

One person from each group at each table, open the Google sheet linked in D2L and fill in the responses for the following questions for each group member.  When creating a data set for use in R it is important to use single words or an underscore between words.  Each outcome must be written the same way each time.  Make sure to use all lowercase letters to create this data set to have consistency between responses.  Do not give units of measure with the numerical values for the length of forearm.  For `Residency` use in_state or out_state as the two outcomes.

* Major: what is your declared major?
* Residency: do you have in-state or out-of-state residency?
* Forearm_Length:  what is the length of your forearm in inches from the end of your elbow to the end of your index finger?
* Num_Credits: how many credits are you taking this semester?

We will look at two types of variables: **quantitative** and **categorical** (see Figure \@ref(fig:types-of-variables)). 

Quantitative variables are numerical measurements that can be discrete (whole, non-negative numbers) or continuous (any value within an interval).  The number of pets one owns would be a discrete variable as you can not have a partial pet.  GPA would be a continuous variable ranging from 0 to 4.0. 

The outcome of a categorical variable is a group or category such as eye color, state of residency, or whether or not a student lives on campus. Categorical variables with a natural ordering are considered ordinal variables while those without a natural ordering are considered nominal variables.  All categorical variables will be treated as nominal for analysis in this course. 

\begin{figure}

{\centering \includegraphics[width=0.5\linewidth]{images/variables} 

}

\caption{Types of variables.}(\#fig:types-of-variables)
\end{figure}

\newpage

3. For each column of data, fill in the following table to write out the variable we are collecting on each observational unit in this study and the type of each variable.

\begin{center}
\begin{tabular}{|l|p{2in}|p{2in}|} \hline
Column & Variable & Type of Variable  \\ \hline
Major & & \\ 
& & \\ \hline
Residency & & \\ 
& & \\ \hline
Forearm Length & & \\ 
& & \\ \hline
Num Credits & & \\ 
& & \\ \hline
\end{tabular}
\end{center}

In the next few weeks we will look at how to summarize data both numerically and graphically.  For now we will focus on sampling methods and the type of sampling bias that may be present.  

* Sampling bias: a part of the target population is not included or underrepresented in the sample

* Non-response or non-participation bias: part of the already selected population does not respond or chooses not to participate

* Response bias: survey participant gives an untruthful or misleading response

To help determine the type of bias present, it is helpful to think about the observational units, the sample and the target population represented by the problem.  The **target population** is the group of cases that makes up the population the researcher is interested in. If sampling bias is present, than the sample taken will not be representative of the actual target population.  In these next questions, identify the target population, the sample selected, the variable collected and its type (categorical or quantitative), and the type of bias present.

4. **To determine if the proportion of out-of-state undergraduate students at Montana State University has increased in the last 10 years, a statistics instructor sent an email survey to 500 randomly selected current undergraduate students.  One of the questions on the survey asked whether they had in-state or out-of-state residency.  She only received 378 responses.**
\vspace{0.25in}

    Observational units or cases:
\vspace{0.3in}

    Target population:
\vspace{0.3in}

    Sample size:
\vspace{0.3in}

    Sample taken:
\vspace{0.3in}

    Variable:
\vspace{0.3in}

    Type of Variable: \hspace{1mm}  categorical \hspace{0.2in} quantitative
\vspace{1mm}


    Type(s) of bias:
\vspace{0.3in}

5.  A television station is interested in predicting whether or not a local referendum to legalize marijuana for adult use will pass. It asks its viewers to phone in and indicate whether they are in favor or opposed to the referendum. Of the 2241 viewers who phoned in, forty-five percent were opposed to legalizing marijuana.
\vspace{0.1in}

    Observational units or cases:
\vspace{0.3in}

    Target population:
\vspace{0.3in}

    Sample size:
\vspace{0.3in}

    Sample taken:
\vspace{0.3in}

    Variable:
\vspace{0.3in}

    Type of Variable: \hspace{1mm}  categorical \hspace{0.2in} quantitative
\vspace{1mm}


    Type(s) of bias:
\vspace{0.3in}

6. To gauge the interest in a new swimming pool, a local organization stood outside of the Bogart Pool in Bozeman, MT, during open hours.  One of the questions they asked was, "Since the Bogart Pool is in such bad repair, don't you agree that the city should fund a new pool?"
\vspace{0.1in}

    Observational units or cases:
\vspace{0.3in}

    Target population:
\vspace{0.3in}

    Sample size:
\vspace{0.3in}

    Sample taken:
\vspace{0.3in}

    Variable:
\vspace{0.3in}

    Type of Variable: \hspace{1mm}  categorical \hspace{0.2in} quantitative
\vspace{1mm}

    Type(s) of bias:
\vspace{0.3in}

\newpage

7. **The Bozeman school district was interested in surveying parents of students about their opinions on returning to in-person classes following the COVID-19 pandemic.  They divided the school district into 10 divisions based on location and randomly surveyed 20 households within each division.  Explain why selection bias would be present in this study design.**
\vspace{1in}


### Take-home messages

1. When creating a data set, each row will represent a single observational unit or case. Each column represents a variable collected. It is important to write each variable as a single word or use an underscore between words.

2. There are two types of variables: categorical (groups) and quantitative (numerical measures).

3. There are three types of bias to be aware of when designing a sampling method: selection bias, non-response bias, and response bias.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered, and to write down the names and contact information of your teammates.

\newpage
