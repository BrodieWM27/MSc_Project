##### Timeliness Ratio

### Loading data
rm(list= ls())
gc()
options(scipen = 999)

getwd()
setwd("C:/Users/watsob/Desktop/Project")
dataset <- read.csv("accounts_data.csv", stringsAsFactors = FALSE, na.strings = c("", "NA", "NULL"))

### Calculation
cutoff <- Sys.Date() - 90
recent_dataset <- dataset[dataset$Last.Substantive.Interaction.Date >= cutoff, ]
recent_count <- nrow(recent_dataset)
total_count <- nrow(dataset)
timeliness_pct <- recent_count / total_count * 100
cat("Timeliness Ratio:", round(timeliness_pct, 1), "%\n")