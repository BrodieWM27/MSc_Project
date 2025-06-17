##### 

### Loading data
rm(list= ls())
gc()
options(scipen = 999)

getwd()
setwd("C:/Users/watsob/Desktop/Project")
dataset <- read.csv("accounts_data.csv", stringsAsFactors = FALSE, na.strings = c("", "NA", "NULL"))

### Caclulation
cols <- c(
  "Service.Level",
  "Segmentation",
  "Key.Sector",
  "Trading.Internationally",
  "International.Trading.Start.Date",
  "Company.Information.Estimated.Turnover",
  "Company.Information.Estimated.Employees",
  "Account.Description"
)

n <- nrow(dataset)

rich_counts <- apply(dataset[cols], 1, function(x) {
  sum(!is.na(x) & x != "Unspecified")
})

threshold = 6
rich_flag <- rich_counts >= threshold
rich_n <- sum(rich_flag)

rich_rate <- mean(rich_flag) * 100
cat(sprintf("Record Richness Rate: %.1f%%\n", rich_rate))