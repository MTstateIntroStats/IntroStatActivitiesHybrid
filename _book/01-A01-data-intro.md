## Activity 1:  Intro to Data

\setstretch{1}

### Learning outcomes

<!-- * Identify observational units, variables, and variable types in a statistical study. -->

<!-- * Identify biased sampling methods. -->

* Creating a data set

### Terminology review
Statistics is the study of how best to collect, analyze, and draw conclusions from data.  This week in class you will be introduced to the following terms:

* Observational units or cases

* Variables: categorical or quantitative 

For more on these concepts, read Chapter 1 in the textbook.

### General information on the Coursepack

Information is provided throughout each activity and lab to guide students through that day's activity or lab. Be sure to read ALL the material provided at the beginning of the activity and between each question. At the end of each activity is a section called *Take-home messages* that contains key points from the day's activity. Use these to review the day's activity and make sure you have a full understanding of that material.

<!-- ### General information on labs -->

<!-- On Friday of each week you will complete a lab. Questions are selected from each lab to be turned in on Gradescope.  The questions to be submitted on Gradescope are bolded in the lab.  As you work through the lab have the Gradescope lab assignment open so that you can answer those questions as you go.  Today's activity is Lab 1 in Gradescope for practice submitting as a group. -->

### Steps of the statistical investigation process 

As we move through the semester we will work through the six steps of the statistical investigation process.  

1. Ask a research question.

2. Design a study and collect data. 

3. Summarize and visualize the data. 

4. Use statistical analysis methods to draw inferences from the data. 

5. Communicate the results and answer the research question. 

6. Revisit and look forward.

Today we will focus on the first two steps.

**Step 1**: The first step of any statistical investigation is to *ask a research question*.  As stated in the textbook, "with the rise of data science, however, we might not start with a research question, and instead start with a data set."  Today we will create a data set by collecting responses on students in class.

**Step 2**: To answer any research question, we must *design a study and collect data*. Our study will consist of answers from each student.  Your responses will become our observed data that we will explore.  

**Observational units** or **cases** are the subjects data are collected on. In a spreadsheet of the data set, each row will represent a single observational unit.  

<!-- 1. What are the observational units or cases for today's study?  -->

<!-- \vspace{0.2in} -->

<!-- 2. How many students are in class today? This is the **sample size**. -->

<!-- \vspace{0.2in} -->

<!-- A **variable** is information collected or measured on each observational unit or case. Each column in a data set will represent a different variable. The rows in a data set represent the observational units.  -->

<!-- We will look at two types of variables: **quantitative** and **categorical** (see Figure \@ref(fig:types-of-variables)).  -->

<!-- Quantitative variables are numerical measurements that can be discrete (whole, non-negative numbers) or continuous (any value within an interval).  The number of pets one owns would be a discrete variable as you can not have a partial pet.  GPA would be a continuous variable ranging from 0 to 4.0.  -->

<!-- The outcome of a categorical variable is a group or category such as eye color, state of residency, class ranking, or whether or not a student lives on campus. Categorical variables with a natural ordering are considered ordinal variables while those without a natural ordering are considered nominal variables.  All categorical variables will be treated as nominal for analysis in this course.  -->

<!-- ```{r types-of-variables, fig.align = "center", out.width="50%", fig.cap="Types of variables."} -->
<!-- include_graphics("images/variables.png") -->
<!-- ``` -->

\newpage

1. Open the Google Form linked in D2L and fill in the responses for the following questions.  When creating a data set for use in R it is important to use single words or an underscore between words. Each outcome must be written the same way each time.  Make sure to use all lowercase letters to create this data set to have consistency between responses.  Do not give units of measure for numerical values within the data set.  For `Residency` use in_state or out_state as the two outcomes.

* Major: what is your declared major?

\vspace{0.2in}

* Residency: do you have in-state or out-of-state residency?

\vspace{0.2in}

* Num_Credits: how many credits are you taking this semester?

\vspace{0.2in}

* Dominant_hand: are you left or right-handed?

\vspace{0.2in}

* Hand_span:  what is the width of your dominant hand from the tip of your thumb to the tip of your pinky with your hand spread out measured in cm?

\vspace{0.2in}

* Grip_dominant: what is the grip strength measured in lbs for your dominant hand?

\vspace{0.2in}

* Grip_nondominant: what is the grip strength measured in lbs for your non-dominant hand?

\vspace{0.2in}

<!-- 4. The header for each column describes each variable measured on the observational unit. When writing a variable we need to specify what we are measuring.  For example, the column header `Residency` in our data set represents the variable *whether a student has in-state or out-of-state residency* not *what state a student is from*.  For each column of data, fill in the following table to write out the variable we are collecting on each observational unit in this study and the type of each variable. -->

<!-- \begin{center} -->
<!-- \begin{tabular}{|l|p{2.5in}|p{1.5in}|} \hline -->
<!-- Column & Variable & Type of Variable  \\ \hline -->
<!-- Major & & \\  -->
<!-- & & \\ \hline -->
<!-- Residency & & \\  -->
<!-- & & \\ \hline -->
<!-- Forearm Length & & \\  -->
<!-- & & \\ \hline -->
<!-- Num Credits & & \\  -->
<!-- & & \\ \hline -->
<!-- \end{tabular} -->
<!-- \end{center} -->

<!-- 5. Review the completed data set with your table.  Remember that when creating a data set for use in R it is important to use single words or an underscore between words.  Each outcome must be written the same way each time to have consistency between responses.  Do not give units of measure for numerical values.  Write down some issues found with the created class data set. -->

### Take-home messages

<!-- 1. There are two types of variables: categorical (groups) and quantitative (numerical measures). -->


1. When creating a data set, each row will represent a single observational unit or case. Each column represents a variable collected. It is important to write each variable as a single word or use an underscore between words.

2. Make sure to be consistent with writing each outcome in the data set as R is case sensitive.  All outcomes must be written exactly the same way.

### Additional notes

Use this space to summarize your thoughts and take additional notes on today's activity and material covered, and to write down the names and contact information of your teammates.

\newpage
