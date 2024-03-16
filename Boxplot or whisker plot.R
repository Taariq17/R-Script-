library(dplyr)
library(ggplot2)
library(openxlsx)
library(zoo)
library(tidyr)
df <- read.xlsx("D:/R Programing Scripts Practice/R-Script-/chapter4_assets/chapter4_assets/6_box_plot/scores_multiple_subjects.xlsx")
View(df)
head(df,5)

#Box plot consist of min value , max value , quartiel1, quartile2,,quartile3,
#Min Maths Score
min(df$MathScore)
#Min English score
min(df$EnglishScore)
#Min History Score 
min(df$HistoryScore)

#Max Maths Score
max(df$MathScore)
#Max English score
max(df$EnglishScore)
#Max History Score 
max(df$HistoryScore)


#Quartile 1 ,2 3 for maths score

quantile(df$MathScore,c(0.25,0.50,0.75))

#Quartile 1 ,2 3 for English score

quantile(df$EnglishScore,c(0.25,0.50,0.75))

#Quartile 1 ,2 3 for History score

quantile(df$HistoryScore,c(0.25,0.50,0.75))

#By comparing all subject , I can understand that students are performing less in history subject.

summary(df)

#Measures of dispersion 
data <- data.frame(Subject1 = df$MathScore, Subject2 = df$EnglishScore, Subject3 = df$HistoryScore)

# Reshape data into long format
data_long <- gather(data, key = "Subject", value = "Value")
head(data_long,4)
`# Create box-plot using ggplot2
ggplot(data_long, aes(x = Subject, y = Value, fill = Subject)) +
  geom_boxplot() +
  labs(title = "Boxplot of Multiple Variables", x = "Subejct", y = "Values") +
  theme_minimal()