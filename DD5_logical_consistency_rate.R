##### Logical Consistency Rate

### Loading data
rm(list= ls())
gc()
options(scipen = 999)

getwd()
setwd("C:/Users/watsob/Desktop/Project")
dataset <- read.csv("accounts_data.csv", stringsAsFactors = FALSE, na.strings = c("", "NA", "NULL"))

### Calculation
total_rows <- nrow (dataset)
cat("Total rows:", total_rows, "\n")

# Inactivity
inactive_accounts <- dataset$Account.State == 'Inactive' | dataset$Account.Status == 'Inactive'
sum(inactive_accounts, na.rm = TRUE)

# International Trading
unexpected_trade_date <- 
  (dataset$Trading.Internationally %in% c("No", "Unspecified")) &
  !is.na(dataset$International.Trading.Start.Date)
sum(unexpected_trade_date, na.rm = TRUE)

# Incorporation and Trade Date
incorp_after_trade <- dataset$Incorporation.Date > dataset$Trading.Start.Date
sum(incorp_after_trade, na.rm = TRUE)

# Aggregation
aggregate_score <- sum(inactive_accounts, na.rm = TRUE) + sum(unexpected_trade_date, na.rm = TRUE) + sum(incorp_after_trade, na.rm = TRUE)
aggregate_score_pct <- (aggregate_score / total_rows) * 100
cat("Total logicial consistency errors:", aggregate_score_pct, "\n")
cat("Percentage of logical consistency errors:", round(aggregate_score_pct, 2), "%\n")