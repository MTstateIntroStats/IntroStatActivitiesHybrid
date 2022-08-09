SAT <- read.csv("http://www.math.montana.edu/courses/s216/data/sats95.csv")
attach(SAT)

plot(sat~expend,xlab="Expenditure per Pupil (in thousands of dollars)",ylab="Average SAT Score",main="Average SAT vs. Expenditure",ylim=c(800,1150))
abline(lm(sat~expend))
# States mentioned by George Will: ND = 34, SD = 41, TN = 42, UT = 44, WI = 49, NJ = 30
text((expend[c(34, 41, 42, 44, 49, 30)]),(sat[c(34, 41, 42, 44, 49, 30)]+10),state.abrev[c(34, 41, 42, 44, 49, 30)])
points(expend[c(34, 41, 42, 44, 49, 30)],sat[c(34, 41, 42, 44, 49, 30)],pch=16)

cor(sat,expend)
lm(sat~expend)

plot(sat~expend,type="n",xlab="Expenditure per Pupil (in thousands of dollars)",ylab="Average SAT Score",main="SAT vs. Expenditure by Percent, Taking SAT")
points(expend[frac40=="Yes"],sat[frac40=="Yes"],pch=15,col="darkgreen")
points(expend[frac40=="No"],sat[frac40=="No"],pch=17,col="orange3")
abline(lm(sat[frac40=="Yes"]~expend[frac40=="Yes"]),col="darkgreen")
abline(lm(sat[frac40=="No"]~expend[frac40=="No"]),col="orange3")
legend(locator(1),c("Percent < 40%","Percent > 40%"),pch=c(15,17),col=c("darkgreen","orange3"))

cor(sat[frac40=="Yes"],expend[frac40=="Yes"])
cor(sat[frac40=="No"],expend[frac40=="No"])
lm(sat[frac40=="Yes"]~expend[frac40=="Yes"])
lm(sat[frac40=="No"]~expend[frac40=="No"])