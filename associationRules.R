# required packages:
install.packages("arules") 
install.packages("arulesViz")
install.packages("igraph")
install.packages("visNetwork")
# load libraries:
library(arules) # no package error
library(arulesViz) # need
library(igraph)
library(visNetwork)
# read dataset
data <- read.csv('pathname/Rules/GroceriesData.csv', stringsAsFactors = FALSE)
#transcation format: group by ID
transactions_list <- split(data$itemDescription, data$Member_number)
transactions <- as(transactions_list, "transactions")
#summary 
summary(transactions)
itemFrequencyPlot(transactions, topN = 10, type = "absolute", col = "steelblue", main = "Top 10 Items")

# apriory algorithm for association rules
rules <- apriori(transactions, parameter = list(supp = 0.001, conf = 0.3))
# dispaly genrated rules
cat("Number of rules generated:", length(rules), "\n")

if (length(rules) > 0) {
  inspect(rules[1:min(10, length(rules))])
} else {
  cat("No rules were generated. Try lowering support or confidence.\n")
}
# details of generated rules
if (length(rules) > 0) {
  top_lift_rules <- sort(rules, by = "lift", decreasing = TRUE)
  inspect(top_lift_rules[1:min(10, length(top_lift_rules))])
}