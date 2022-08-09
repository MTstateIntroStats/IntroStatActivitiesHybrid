--- 
title: |
    | **STAT 216 Coursepack**
    | 
    | ![](images/msu-campus.jpg){width=5in}
author: |
    | Melinda Yager
    | Jade Schmidt
    | Stacey Hancock
subtitle: |
    | Fall 2022
    | Montana State University
output: 
    pdf_document:
        citation_package: biblatex
bibliography: references.bib
biblio-style: apalike
nocite: '@*'
site: bookdown::bookdown_site
documentclass: report
description: This is the coursepack of in-class activities for STAT 216 Fall 2022.
location: Montana State University
---

<!-- Notes for authors on formatting: -->

<!-- For each chapter, main title, reading guide section title, and activity section title are in title case; remaining section headers capitalize the first word only. -->
<!-- Reading guides use 1.25 line spacing; activities use 1 line spacing. -->
<!-- When referring to R, use `R`. When referring to RStudio, do not use quotes. -->
<!-- Reading guides do not have section numbers (use {-} after each header). -->
<!-- Comments in displayed code: # Capitalize phrase. -->
<!-- For displaying a range of numbers, e.g., 3-5, use an en dash: 3--5. -->
<!-- When cross-referencing activities, capitalize "Activity", e.g., "In Activity 3, we..." -->
<!-- When referring to a function in R, use: `function_name()` -->
<!-- Z-score and T-score -->
<!-- $t$-distribution -->
<!-- use "data set" (with a space) rather than "dataset" -->
<!-- $x$ and $y$ for x-axis and y-axis -->

\newpage
\thispagestyle{empty}

This resource was developed by Melinda Yager, Jade Schmidt, and Stacey Hancock in 2021 to accompany the online textbook: Carnegie, N., Hancock, S., Meyer, E., Schmidt, J., and Yager, M. (2021). _Montana State Introductory Statistics with R_. Montana State University. [https://mtstateintrostats.github.io/IntroStatTextbook/](https://mtstateintrostats.github.io/IntroStatTextbook/).

This resource is released under a [Creative Commons BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) license unless otherwise noted.

\setcounter{tocdepth}{1}
\addtocontents{toc}{\protect\thispagestyle{empty}}
\tableofcontents
\thispagestyle{empty}

\newpage
\setcounter{page}{1}

# Preface {-}

This coursepack accompanies the textbook for STAT 216: Introduction to Statistics at Montana State University, which can be found at [https://mtstateintrostats.github.io/IntroStatTextbook/](https://mtstateintrostats.github.io/IntroStatTextbook/). The syllabus for the course (including the course calendar), data sets, and links to D2L Brightspace, Gradescope, and the MSU RStudio server can be found on the course webpage: [https://math.montana.edu/courses/s216/](https://math.montana.edu/courses/s216/).
Videos assigned in the course calendar and other notes and review materials are linked in D2L.

Each of the activities in this workbook is designed to target specific learning outcomes of the course, giving you practice with important statistical concepts in a group setting with instructor guidance. In addition to the in-class activities for the course, the coursepack includes reading guides to aid in taking notes while you complete the required readings and videos. Bring this workbook with you to class each class period, and take notes in the workbook as you would your own notes. A well-written completed workbook will provide an optimal study guide for exams!  

The activities and labs in this coursepack will be completed during class time.  Parts of each lab will be turned in on Gradescope. To aid in your understanding, read through the introduction for each activity before attending class each day.  

STAT 216 is a 3-credit in-person course.  In our experience, it takes six to nine hours per week outside of class to achieve a good grade in this class.  By “good” we mean at least a C because a grade of D or below does not count toward fulfilling degree requirements. Many of you set your goals higher than just getting a C, and we fully support that. You need roughly nine hours per week to review past activities, read feedback on previous assignments, complete current assignments, and prepare for the next day's class. A typical week in the life of a STAT 216 student looks like:

* _Prior to class meeting_:
    - Read assigned sections of the textbook, using the provided reading guides to take notes on the material.
    - Watch assigned videos on that week's content, pausing to take notes and answer video quiz questions.
    - Read through the introduction to the day's in-class activity 
    - Read through the week's homework assignment and note any questions you may have on the content.
* _During class meeting_:
    - Work through the in-class activity or weekly lab with your classmates and instructor, taking detailed notes on your answers to each question in the activity.
* _After class meeting_:
    - Complete any parts of the activity you did not complete in class.
    - Review the activity solutions in the Math and Stat Center, and take notes on key points.
    - Finish watching any remaining assigned videos or readings for the week.
    - Complete the week's homework assignment.

\nocite{*}
