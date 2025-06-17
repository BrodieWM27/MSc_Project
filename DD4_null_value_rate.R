##### Null-Value Rate

### Loading data
rm(list= ls())
gc()
options(scipen = 999)

getwd()
setwd("C:/Users/watsob/Desktop/Project")
dataset <- read.csv("accounts_data.csv", stringsAsFactors = FALSE, na.strings = c("", "NA", "NULL"))

### Calculation
total_values <- nrow (dataset) * ncol(dataset)
cat("Total values:", total_values, "\n")

total_na <- sum(is.na(dataset))
na_pct <- (total_na / total_values) * 100
cat("Total missing values:", total_na, "\n")
cat("Percentage null:", round(na_pct, 2), "%\n")