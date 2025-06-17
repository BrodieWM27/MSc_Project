##### Anomaly Rate

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

total_unspecified <- sum(dataset == "Unspecified", na.rm = TRUE)
us_pct <- (total_unspecified / total_values) * 100
cat("Unspecified entries:", total_unspecified, "\n")
cat("Percentage unspecified:", round(us_pct, 2), "%\n")