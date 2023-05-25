# Group Exam 1 Review

Use the provided data set from the Islands (ExamReviewData.csv) and the appropriate Exam 1 Review R script file to answer the following questions. Each adult (>21) islander was selected at random from all adult islanders. Note that some islanders choose not to participate in the study.  These islanders that did not consent to be in the study are removed from the dataset before analysis.  Variables and their descriptions are listed below. Here is some more information about some of the variables collected.  Music type (classical or heavy metal) was randomly assigned to the Islanders. Time to complete the puzzle cube was measured after listening to music for each Islander. Heart rate and blood glucose levels were both measured before and then after drinking a caffeinated beverage.

| **Variable** 	| **Description** |
|----	|-------------	|
| `Island` | Name of Island that the Islander resides on |
| `City` | Name of City in which the Islander resides |
| `Population` | Population of the City |
| `Name` | Name of Islander |
| `Consent` | Whether the Islander consented to be in the study |
| `Gender` | Gender of Islander (M = male, F = Female) |
| `Age` | Age of Islander |
| `Married` | Marital status of Islander |
| `Smoking_Status` | Whether the Islander is a current smoker |
| `Children` | Whether the Islander has children |
| `weight_kg` | Weight measured in kg |
| `height_cm` | Height measured in cm |
| `respiratory_rate` | Breaths per minute |
| `Type_of_Music` | Music type (Classical or Heavy Medal) Islander was randomly assigned to listen to |
| `After_PuzzleCube` | Time to complete puzzle cube (minutes) after listening to assigned music |
| `Education_Level` | Highest level of education completed |
| `Balance_Test` | Time balanced measured in seconds with eyes closed |
| `Blood_Glucose_before` | Level of blood glucose (mg/dL) before consuming assigned drink |
| `Heart_Rate_before` | Heart rate (bpm) before consuming assigned drink |
| `Blood_Glucose_after` | Level of blood glucose (mg/dL) after consuming assigned drink |
| `Heart_Rate_after` | Heart rate (bpm) after consuming assigned drink |
| `Diff_Heart_Rate` | Difference in heart rate (bpm) for Before - After consuming assigned drink |
| `Diff_Blood_Glucose` | Difference in blood glucose (mg/dL) for Before - After consuming assigned drink |


1. What are the observational units?

\vspace{0.1in}

2. In the table above, indicate which variables are categorical (C) and which variables are quantitative (Q).

\vspace{0.1in}

3. What type of bias may be present in this study? Explain.

\vspace{0.5in}

4.  Use the appropriate Exam 1 Review R script file to find the appropriate summary statistic and graphical display of the data to assess the following research question, "Is there a difference in proportion of Islanders who have children for those who completed high school and those that completed university?" Use high school $-$ university as the order of subtraction.

a. What is the name of the explanatory variable to be assessed in this research question?
\vspace{0.3in}

    What type of variable (categorical or quantitative) is the variable you identified?
\vspace{0.3in}

b. What is the name of the response variable to be assessed in this research question?
\vspace{0.3in}

    What type of variable (categorical or quantitative) is the variable you identified?
\vspace{0.3in}

c. Use the R script file to get the counts for each level and combination of variables. Fill in the following table with the variable names, levels of each variable, and counts using the values from the R output.

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

d. Calculate the value of the summary statistic to answer the research question. Give appropriate notation.

\newpage

e. Interpret the value of the summary statistic in context of the problem:
\vspace{0.5in}


f. What type of graph(s) would be appropriate for this research question?

\vspace{0.2in}

g. Using the provided R file create a graph of the data. Sketch the graph below:

\vspace{2in}

h. Based on the graph, does there appear to be an association between the two variables? Explain your answer.

\vspace{0.5in}

i. Is this an observational study or a randomized experiment? Explain your answer.

\vspace{0.5in}

j. What is the scope of inference for this study?

\newpage


5. Use the appropriate Exam 1 Review R script file to find the appropriate summary statistic and graphical display of the data to assess the following research question: "Do Islanders who listen to classical music take less time to complete the puzzle cube after listening to the music than for Islanders that listen to heavy metal music?" Use classical $-$ heavy metal as the order of subtraction.

a. What is the name of the explanatory variable to be assessed in this research question?
\vspace{0.3in}

    What type of variable (categorical or quantitative) is the variable you identified?
\vspace{0.3in}

b. What is the name of the response variable to be assessed in this research question?
\vspace{0.3in}

    What type of variable (categorical or quantitative) is the variable you identified?
\vspace{0.3in}

c. Use the R script file to get the summary statistics for each level of the explanatory variable. Fill in the following table with the variable name, levels of the variable, and the summary statistics from the R output.

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


d. Calculate the value of the summary statistic to answer the research question. Give appropriate notation.

\newpage

e. Interpret the value of the summary statistic in context of the problem:

\vspace{0.4in}

f. What type of graph(s) would be appropriate for this research question?

\vspace{0.2in}

g. Using the provided R file create a graph of the data. Sketch the graph below:

\vspace{2in}

h. Based on the graph, does there appear to be an association between the two variables? Explain your answer.

\vspace{0.8in}

i. Compare the two plots using the four characteristics to describe plots of quantitative variables.
\vspace{0.1in}

    Shape:
\vspace{0.2in}

    Center:
\vspace{0.2in}

    Spread:
\vspace{0.2in}

    Outliers:
\vspace{0.2in}

j. Is this an observational study or a randomized experiment?  Explain your answer.

\vspace{0.5in}

k. What is the scope of inference for this study?

\newpage


6. Use the appropriate Exam 1 Review R script file to find the appropriate summary statistic and graphical display of the data to assess the following research question: "Do Islanders who are heavier tend to take more breaths per minute?"

a. What is the name of the explanatory variable to be assessed in this research question?
\vspace{0.3in}

    What type of variable (categorical or quantitative) is the variable you identified?
\vspace{0.3in}

b. What is the name of the response variable to be assessed in this research question?
\vspace{0.3in}

    What type of variable (categorical or quantitative) is the variable you identified?
\vspace{0.3in}

c. Use the R script file to get the summary statistics for this data. Fill in the following table using the values from the R output:

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


d. Interpret the value of slope in context of the problem.

\vspace{0.3in}

e. Calculate the value of the coefficient of determination.

\vspace{0.2in}

f. Interpret the coefficient of determination in context of the problem.

\vspace{0.3in}

g. What type of graph(s) would be appropriate for this research question?

\newpage

h. Using the provided R file create a graph of the data. Sketch the graph below:

\vspace{2in}

i Based on the graph, does there appear to be an association between the two variables? Explain your answer.

\vspace{0.8in}

j. Describe the plot using the four characteristics to describe scatterplots.
\vspace{0.1in}

    Form:
\vspace{0.2in}

    Direction:
\vspace{0.2in}

    Strength:
\vspace{0.2in}

    Outliers:
\vspace{0.2in}

k. Is this an observational study or a randomized experiment? Explain your answer.

\vspace{0.5in}

l. What is the scope of inference for this study?

\newpage

