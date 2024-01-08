# Group Exam 2 Review

Use the provided data set from the Islands [@islands] (Exam2ReviewData.csv) and the appropriate Exam 2 Review R script file to answer the following questions. Each adult (>21) islander was selected at random from all adult islanders. Note that some islanders choose not to participate in the study.  These islanders that did not consent to be in the study are removed from the dataset before analysis.  Variables and their descriptions are listed below. 

| **Variable** 	| **Description** |
|----	|-------------	|
| `Island` | Name of Island that the Islander resides on |
| `City` | Name of City in which the Islander resides |
| `Population` | Population of the City |
| `Name` | Name of Islander |
| `Consent` | Whether the Islander consented to be in the study (`Declined`, `Consented`)|
| `Gender` | Gender of Islander (`M` = male, `F` = Female) |
| `Age` | Age of Islander |
| `Married` | Marital status of Islander (`yes`, `no`) |
| `Smoking_Status` | Whether the Islander is a current smoker (`nonsmoker`, `smoker`) |
| `Children` | Whether the Islander has children (`yes`, `no`) |
| `weight_kg` | Weight measured in kg |
| `height_cm` | Height measured in cm |
| `respiratory_rate` | Breaths per minute |
| `Type_of_Music` | Music type Islander was randomly assigned to listen to (`Classical`, `Heavy Metal`)|
| `After_PuzzleCube` | Time to complete puzzle cube (minutes) after listening to assigned music |
| `Education_Level` | Highest level of education completed (`highschool`, `university`)|
| `Balance_Test` | Time balanced measured in seconds with eyes closed |
| `Blood_Glucose_before` | Level of blood glucose (mg/dL) before consuming assigned drink |
| `Heart_Rate_before` | Heart rate (bpm) before consuming assigned drink |
| `Blood_Glucose_after` | Level of blood glucose (mg/dL) after consuming assigned drink |
| `Heart_Rate_after` | Heart rate (bpm) after consuming assigned drink |
| `Diff_Heart_Rate` | Difference in heart rate (bpm) for Before - After consuming assigned drink |
| `Diff_Blood_Glucose` | Difference in blood glucose (mg/dL) for Before - After consuming assigned drink |

1. Use the appropriate Exam 2 Review R script file and analyze the following research question: "Is there evidence that those with a higher education level are less likely to smoke?"

a. Parameter of Interest:
\vspace{0.3in}
    
b. Null Hypothesis:
        
    Notation:
\vspace{0.3in}
    
    Words:
\vspace{0.5in}
    
c. Alternative Hypothesis:
    
    Notation:
\vspace{0.3in}
    
    Words:
\vspace{0.5in}
   
d. Use the R script file to get the counts for each level and combination of variables. Fill in the following table with the variable names, levels of each variable, and counts using the values from the R output.

\begingroup
\setlength{\tabcolsep}{14pt}
\renewcommand{\arraystretch}{2}
\begin{center}
\begin{tabular}{|c|p{1in}|p{1in}|p{1in}|}
\hline
 & \multicolumn{2}{|c|}{\textbf{Explanatory Variable}} & \\ 
 & \multicolumn{2}{|c|}{ } & \\ \hline
\textbf{Response variable} & Group 1 & Group 2 & Total \\
 & & & \\ \hline
 Success & & & \\
 & & & \\ \hline
 Failure & & & \\
 & & & \\ \hline
 Total & & & \\
 & & & \\ \hline
\end{tabular}
\end{center}
\endgroup

e. Calculate the value of the summary statistic to answer the research question. Give appropriate notation.

\vspace{0.4in}

f. Interpret the value of the summary statistic in context of the problem:
    
\vspace{0.3in}
    
g. Assess if the following conditions are met:

    Independence (needed for both simulation and theory-based methods):
\vspace{0.5in}

    Success-Failure (must be met to use theory-based methods):
\vspace{0.6in}
    
h. Use the provided R script file to find the simulation p-value to assess the research question.  Report the p-value.
\vspace{0.2in}
       
i.  Interpret the p-value in the context of the problem.
\vspace{0.7in}
        
j.  Write a conclusion to the research question based on the p-value.
\vspace{0.7in}
        
k. Using a significance level of $\alpha = 0.05$, what statistical decision will you make about the null hypothesis?
\vspace{0.3in}
    
l. Use the provided R script file to find a 95\% confidence interval.
\vspace{0.3in}
        
m. Interpret the 95\% confidence interval in context of the problem.
\vspace{0.7in}

n. Regardless to your answer in part g, calculate the standardized statistic.
\vspace{0.4in}

o. Interpret the value of the standardized statistic in context of the problem.
\vspace{0.7in}

p. Use the provided R script file to find the theory-based p-value. 
\vspace{0.3in}

q. Use the provided R script file to find the appropriate z* multiplier and calculate the theory-based confidence interval. 
\vspace{0.5in}

r. Does the theory-based p-value and CI match those found using simulation methods?  Explain why or why not.
\vspace{0.7in}

s. What is the scope of inference for this study?
\vspace{0.8in}

<!-- 2. Use the appropriate Exam 2 Review R script file and analyze the following research question: The proportion of university graduates in the US is 42%.  "Is there evidence that the proportion of university graduates in the Islands differs from the proportion in the US?" -->

<!-- a. Parameter of Interest: -->
<!-- \vspace{0.3in} -->

<!-- b. Null Hypothesis: -->

<!--     Notation: -->
<!-- \vspace{0.3in} -->

<!--     Words: -->
<!-- \vspace{0.5in} -->

<!-- c. Alternative Hypothesis: -->

<!--     Notation: -->
<!-- \vspace{0.3in} -->

<!--     Words: -->
<!-- \vspace{0.5in} -->

<!-- d. Use the R script file to get the counts for each level of the variable. Fill in the following table with the success, failure, variable name, and counts using the values from the R output. -->

<!-- \begingroup -->
<!-- \begin{center} -->
<!-- \setlength{\tabcolsep}{14pt}  -->
<!-- \renewcommand{\arraystretch}{2}  -->
<!-- \begin{tabular}{|p{2in}|p{2in}|} -->
<!-- \hline -->
<!--  {\textbf{Variable}} & {\textbf{Counts}} \\  -->
<!--  & \\ \hline -->
<!--  Success & \\  -->
<!--  &  \\ \hline -->
<!--  Failure & \\  -->
<!--  &  \\ \hline -->
<!--  Total &  \\  -->
<!--  & \\ \hline   -->
<!-- \end{tabular} -->
<!-- \end{center} -->
<!-- \endgroup -->
<!-- e. Calculate the value of summary statistic to answer the research question. Give appropriate notation. -->
<!-- \vspace{0.3in} -->

<!-- f. Interpret the value of the summary statistic in context of the problem: -->
<!-- \vspace{0.3in} -->

<!-- g. Assess if the following conditions are met: -->

<!--     Independence (needed for both simulation and theory-based methods): -->
<!-- \vspace{0.8in} -->

<!--     Success-Failure (must be met to use theory-based methods): -->
<!-- \vspace{0.8in} -->

<!-- h. Use the provided R script file to find the simulation p-value to assess the research question.  Report the p-value. -->
<!-- \vspace{0.3in} -->

<!-- i.  Interpret the p-value in the context of the problem. -->
<!-- \vspace{0.8in} -->

<!-- j.  Write a conclusion to the research question based on the p-value. -->
<!-- \vspace{0.8in} -->

<!-- k. Using a significance level of $\alpha = 0.1$, what statistical decision will you make about the null hypothesis? -->
<!-- \vspace{0.3in} -->

<!-- l. Use the provided R script file to find a 90\% confidence interval. -->
<!-- \vspace{0.3in} -->

<!-- m. Interpret the 90\% confidence interval in context of the problem. -->
<!-- \vspace{0.8in} -->

<!-- n. Regardless to your answer in part g, calculate the standardized statistic. -->
<!-- \vspace{0.4in} -->

<!-- o. Interpret the value of the standardized statistic in context of the problem. -->
<!-- \vspace{0.8in} -->

<!-- p. Use the provided R script file to find the theory-based p-value.  -->
<!-- \vspace{0.3in} -->

<!-- q. Use the provided R script file to find the appropriate z* multiplier and calculate the theory-based confidence interval.  -->
<!-- \vspace{0.5in} -->

<!-- r. Does the theory-based p-value and CI match those found using simulation methods?  Explain why or why not. -->
<!-- \vspace{0.8in} -->

<!-- s. To what group can the results be generalized? -->
<!-- \vspace{0.8in} -->

        
\newpage
