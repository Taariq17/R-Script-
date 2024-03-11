df <- read.csv("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/1_intro/movies.csv")
View(df)
head(df)
df[3,] # Calling one row by using index value
df[c(1,3,5,7),] # Calling  multiple row by using index value
df[3:9,]# Calling row by range using index value

df[df$industry=="Hollywood",]

df_h = df[df$industry=="Hollywood",]
df_b = df[df$industry=="Bollywood",]
View(df_h)
View(df_b)

#Find min, max and mean value of imbd_rating
cat("All Movies:","Minimum Imbd Rating For All Movies",min(df$imdb_rating),"Maximum Imbd Rating For All Movies:",max(as.numeric(df$imdb_rating),na.rm = TRUE),"Average Imbd Rating For All Movies:",mean(as.numeric(df$imdb_rating),na.rm = TRUE))
cat("Hollywood Movies:","Minimum Imbd Rating For Hollywood:",min(df_h$imdb_rating),"Maximum Imbd Rating For Hollywood:",max(df_h$imdb_rating),"Average Imbd Rating For Hollywood:",mean(as.numeric(df_h$imdb_rating),na.rm = TRUE))
cat("Bollyood Movies:","Minimum Imbd Rating For Bollyood",min(df_b$imdb_rating),"Maximum Imbd Rating For Bollyood:",max(as.numeric(df_b$imdb_rating),na.rm = TRUE),"Average Imbd Rating For Bollyood:",mean(as.numeric(df_b$imdb_rating),na.rm = TRUE))

dim(df) # This dim will get us the shape of the dataset such as how many rows and columns
unique(df$industry) # This unique code will give us the understand how many values are unique
table(df$industry) #This table code will give us exact understanding about how many bollywood and hollywood values are there in form counts.
table(df$language)


print(names(df)) #To get the column names

#Column filterings
#To create a new columns
df_new <- df[,c("title","imdb_rating","industry")]
View(df_new)
#Row filterings 
df[df$release_year>2000,]  #I'm just filtering to get value which are greater than 2000 in release year.

df[(df$release_year>=2000) & (df$release_year<=2010),] #In this, I'm just filtering the value which are higher than or equal to 2000 and lesser than or equal to 2010.
#Alternate method
subset(df,release_year>=2000 & release_year<=2010)
table(df$studio)
df[df$studio=="Marvel Studios",]#get only Marvel movies
#Alternate method
subset(df,studio=="Marvel Studios")

#Summary
summary(df)
max(as.numeric(df$imdb_rating),na.rm = TRUE)
df[df$imdb_rating==max(as.numeric(df$imdb_rating),na.rm = TRUE),]
df[df$imdb_rating==min(df$imdb_rating),]
df[(df$imdb_rating==max(as.numeric(df$imdb_rating),na.rm = TRUE)) | df$imdb_rating==min(df$imdb_rating),]

head(df,4)#Heading 4 rows
tail(df,4)#Tailing 4 rows
df$age <- 2023 - df$release_year #Creating a new variable to understand age of movies 
head(df,4)
df$profit <- df$revenue - df$budget # Creating a new variable to understand the profit of the movie
head(df,4)
row.names(df) <- df$title #Converting the title name into index value
head(df,4)
df["Thor: Love and Thunder",,drop=FALSE] #Accessing index value by movie names
summary(df["Thor: Love and Thunder",,drop=FALSE])#Summary of the movie by using index

df[c("Thor: Love and Thunder","The Shawshank Redemption"),,drop=FALSE] #Multiple index value
df[1,,drop=FALSE]# Accessing movie by using index number method
df[1:5,,drop=FALSE]# Accessing range of movies by using number method
#Returnin back to row numbers instead of movie names
row.names(df) <- NULL
head(df,4)
