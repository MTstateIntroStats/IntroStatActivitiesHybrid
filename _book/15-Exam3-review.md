# Semester Review

## Group Final Exam Review

\setstretch{1}

Use the provided data set from the Islands [@islands] (FinalExamReviewData.csv) and the appropriate Exam 1 Review R script file to answer the following questions. Each adult (>21) islander was selected at random from all adult islanders. Note that some islanders choose not to participate in the study.  These islanders that did not consent to be in the study are removed from the dataset before analysis.  Variables and their descriptions are listed below. Here is some more information about some of the variables collected.  Music type (classical or heavy metal) was randomly assigned to the Islanders. Time to complete the puzzle cube was measured after listening to music for each Islander. Heart rate and blood glucose levels were both measured before and then after drinking a caffeinated beverage.

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

\newpage

1. Use the appropriate Final Exam Review R script file to analyze the following research question, "Does drinking a caffeinated drink increase blood glucose levels, on average?" Use before $-$ after as the order of subtraction.

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
    
d. Use the R script file to get the summary statistics. Fill in the following table with the variable names, levels of each variable, and values from the R output.

\begingroup
\setlength{\tabcolsep}{14pt}
\renewcommand{\arraystretch}{2}
\begin{center}
\begin{tabular}{|c|p{1in}|}
\hline
 Summary value & Variable \\
 & \\ \hline
 Mean &  \\ \hline
 Standard deviation & \\ \hline
 Sample size & \\ \hline
\end{tabular}
\end{center}
\endgroup

e. Write the summary statistic to answer the research question with appropriate notation.
\vspace{0.3in}

f. Interpret the value of the summary statistic in context of the problem:
\vspace{0.3in}

g. Assess if the following conditions are met:

    Independence (needed for both simulation and theory-based methods):
\vspace{0.8in}

    Normality:

\vspace{0.8in}
    
h. Use the provided R script file to find the simulation p-value to assess the research question.  Report the p-value.
\vspace{0.3in}
       
i.  Interpret the p-value in the context of the problem.
\vspace{0.8in}
        
j.  Write a conclusion to the research question based on the p-value.
\vspace{0.8in}
        
k. Using a significance level of $\alpha = 0.1$, what statistical decision will you make about the null hypothesis?
\vspace{0.3in}
    
l. Use the provided R script file to find a 90\% confidence interval.
\vspace{0.3in}
        
m. Interpret the 90\% confidence interval in context of the problem.
\vspace{0.8in}

n. Regardless to your answer in part g, calculate the standardized statistic.
\vspace{0.4in}

o. Interpret the value of the standardized statistic in context of the problem.
\vspace{0.8in}

p. Use the provided R script file to find the theory-based p-value. 
\vspace{0.3in}

q. Use the provided R script file to find the appropriate t* multiplier and calculate the theory-based confidence interval. 
\vspace{0.5in}

r. Does the theory-based p-value and CI match those found using simulation methods?  Explain why or why not.
\vspace{0.8in}

s. What is the scope of inference for this study?
\vspace{0.8in}

2. Use the appropriate Final Exam Review R script file to analyze the following research question: "Do Islanders who listen to classical music take less time to complete the puzzle cube after listening to the music than for Islanders that listen to heavy metal music?" Use - classical - heavy metal as the order of subtraction.

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
    
d. Use the R script file to get the summary statistics for each level of the explanatory variable. Fill in the following table with the variable names, levels of each variable, and values from the R output.

\begingroup
\setlength{\tabcolsep}{14pt}
\renewcommand{\arraystretch}{2}
\begin{center}
\begin{tabular}{|c|p{1in}|p{1in}|}
\hline
 & \multicolumn{2}{|c|}{\textbf{Explanatory Variable}} \\
 & \multicolumn{2}{|c|}{ } \\ \hline
\textbf{Summary value} & Group 1 & Group 2 \\
 & & \\ \hline
 Mean & & \\ \hline
 Standard deviation & & \\ \hline
 Sample size & & \\ \hline
\end{tabular}
\end{center}
\endgroup

e. Calculate the value of summary statistic to answer the research question. Give appropriate notation.
\vspace{0.3in}

f. Interpret the value of the summary statistic in context of the problem:
\vspace{0.3in}

g. Assess if the following conditions are met:

    Independence (needed for both simulation and theory-based methods):
\vspace{0.8in}

    Normality:

\vspace{0.8in}
    
h. Use the provided R script file to find the simulation p-value to assess the research question.  Report the p-value.
\vspace{0.3in}
       
i.  Interpret the p-value in the context of the problem.
\vspace{0.8in}
        
j.  Write a conclusion to the research question based on the p-value.
\vspace{0.8in}
        
k. Using a significance level of $\alpha = 0.05$, what statistical decision will you make about the null hypothesis?
\vspace{0.3in}
    
l. Use the provided R script file to find a 95\% confidence interval.
\vspace{0.3in}
        
m. Interpret the 95\% confidence interval in context of the problem.
\vspace{0.8in}

n. Regardless to your answer in part g, calculate the standardized statistic.
\vspace{0.4in}

o. Interpret the value of the standardized statistic in context of the problem.
\vspace{0.8in}

p. Use the provided R script file to find the theory-based p-value. 
\vspace{0.3in}

q. Use the provided R script file to find the appropriate t* multiplier and calculate the theory-based confidence interval. 
\vspace{0.5in}

r. Does the theory-based p-value and CI match those found using simulation methods?  Explain why or why not.
\vspace{0.8in}

s. What is the scope of inference for this study?
\vspace{0.8in}

3. Use the appropriate Final Exam Review R script file to analyze the following research question: "Can height be used to predict the balance time for Islanders?"

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
   
d. Use the R script file to get the summary statistics for this data. Fill in the following table using the values from the R output:

\begingroup
\setlength{\tabcolsep}{14pt}
\renewcommand{\arraystretch}{2}
\begin{center}
\begin{tabular}{|c|p{1in}|p{1in}|p{1in}|}
\hline
 & y-intercept & slope & correlation \\ \hline
 \textbf{Summary value} & & & \\ \hline
\end{tabular}
\end{center}
\endgroup


e. Interpret the value of slope in context of the problem.

\vspace{0.3in}

f. Assess if the following conditions are met:

    Independence (needed for both simulation and theory-based methods):
\vspace{0.8in}

    Linearity (needed for both simulation and theory-based methods):
\vspace{0.8in}

    Constant Variance:
\vspace{0.8in}

    Normality of Residuals:
\vspace{0.8in}
    
g. Use the provided R script file to find the simulation p-value to assess the research question.  Report the p-value.
\vspace{0.3in}
       
h.  Interpret the p-value in the context of the problem.
\vspace{0.8in}
        
i.  Write a conclusion to the research question based on the p-value.
\vspace{0.8in}
        
k. Using a significance level of $\alpha = 0.01$, what statistical decision will you make about the null hypothesis?
\vspace{0.3in}
    
k. Use the provided R script file to find a 99\% confidence interval.
\vspace{0.3in}
        
l. Interpret the 99\% confidence interval in context of the problem.
\vspace{0.8in}

m. Regardless to your answer in part g, calculate the standardized statistic.
\vspace{0.4in}

n. Interpret the value of the standardized statistic in context of the problem.
\vspace{0.8in}

o. Use the provided R script file to find the theory-based p-value. 
\vspace{0.3in}

p. Use the provided R script file to find the appropriate t* multiplier and calculate the theory-based confidence interval. 
\vspace{0.5in}

q. Does the theory-based p-value and CI match those found using simulation methods?  Explain why or why not.
\vspace{0.8in}

r. What is the scope of inference for this study?
\vspace{0.8in}

\newpage
