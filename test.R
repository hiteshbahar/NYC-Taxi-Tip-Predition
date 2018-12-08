library(stringr)
data = read.csv(file = "D:/ML/Project/570 project/training_data/jan_2017.csv")
data$tpep_pickup_datetime<- str_replace_all(data$tpep_pickup_datetime,"/","-")
View(data$tpep_pickup_datetime)
