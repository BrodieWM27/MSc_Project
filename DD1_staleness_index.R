##### Staleness Index

### Loading data
rm(list= ls())
gc()
options(scipen = 999)

getwd()
setwd("C:/Users/watsob/Desktop/Project")
dataset <- read.csv("accounts_data.csv", stringsAsFactors = FALSE, na.strings = c("", "NA", "NULL"))

### Calculation
threshold_date <- Sys.Date() - 180
stale_count <- dataset[dataset$Last.Substantive.Interaction.Date <= threshold_date, ]
stale_rows <- nrow(stale_count)
total_count <- nrow(dataset)
staleness_pct <- stale_rows / total_count * 100
cat("Staleness Ratio:", round(staleness_pct, 1), "%\n")