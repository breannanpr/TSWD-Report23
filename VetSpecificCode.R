# read in datasets
mcesdat = read.csv("mces_data20231122.csv")
destdat = read.csv("destination_data20231122.csv")
surveydat = read.csv("survey_data20231122.csv")
solutionfunddat = read.csv("solutions_fund20231122.csv")

#merge data
mergeddat = merge(mcesdat,destdat, by = "Client.ID", all.x = TRUE)

#Exploring housing destinations and rapidity of housing allocation for veterans. 
library(dplyr)
library(ggplot2)



