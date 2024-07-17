library(tidyverse)
library(ggplot2)

#For questions 1 - 3
#Enter budget_mil for explanatory and revenue_mil for response in line 9 
#Highlight and run lines 1 - 14
movies <- read.csv("https://math.montana.edu/courses/s216/data/Movies2016.csv") #Reads in data set
movies %>% #Data set pipes into...
  ggplot(aes(x = explanatory, y = response))+  #Specify variables
  geom_point(alpha=0.5) +  #Add scatterplot of points
  labs(x = "Budget in Millions ($)",  #Label x-axis
       y = "Revenue in Millions ($)",  #Label y-axis
       title = "Scatterplot of Revenue vs. Budget for Movies Released in 2016") +  # Enter the title for the plot between the quotations
  geom_smooth(method = "lm", se = FALSE)  #Add regression line

#For questions 4 - 10
#Fit linear model: y ~ x; highlight and run lines 18 - 19
revenueLM <- lm(revenue_mil ~ budget_mil, data=movies)
summary(revenueLM)$coefficients # Display coefficient summary

#For questions 11 - 12
movies %>% #Data set pipes into...
    filter(content_rating != "Not Rated") %>% # Remove Not Rated movies
    ggplot(aes(x = budget_mil, y = revenue_mil, color = content_rating)) +  #Specify variables
    geom_point(aes(shape = content_rating), size = 2, alpha=0.5) +  #Add scatterplot of points
    labs(x = "Budget in Millions ($)",  #Label x-axis
         y = "Revenue in Millions ($)",  #Label y-axis
         color = "Content Rating",  #Label legend
         shape = "Content Rating",
         title = "Scatterplot of Revenue vs. Budget by Content Rating for Movies Released in 2016") + # Enter the title for the plot between the quotations
  scale_color_viridis_d(end=0.8) +
  geom_smooth(method = "lm", se = FALSE, lwd = 2) + #Add regression lines
  theme_bw()
    

