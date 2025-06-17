##### Duplication Rate

### Loading data
rm(list= ls())
gc()
options(scipen = 999)

getwd()
setwd("C:/Users/watsob/Desktop/Project")
dataset <- read.csv("accounts_data.csv", stringsAsFactors = FALSE, na.strings = c("", "NA", "NULL"))

### Calculation
total_rows <- nrow(dataset)
colnames(dataset)
key_cols <- c(
  "ï..accountid",
  "Account.Number",
  "Companies.House.Registration.Number",
  "Charity.Number",
  "UTR.Number"
)

dup_count <- sum(duplicated(dataset[key_cols]))
dup_rate_pct <- dup_count / total_rows * 100

cat("Total rows:", total_rows, "\n")
cat("Duplicate rows:", dup_count, "\n")
cat(sprintf("Duplication rate: %.2f%%\n", dup_rate_pct))