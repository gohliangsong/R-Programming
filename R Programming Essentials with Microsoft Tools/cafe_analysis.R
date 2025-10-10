# ================================================
# CafeHub Loyalty Program Analysis
# Module 5 - Final Project
# ================================================

# ================================================
# Graded Challenge 1: Data Import & Cleaning
# (20 points)
# ================================================

# TODO: Import and clean data
# Requirements:
# 1. Import both CSV files
# 2. Print the data and view

### GRADED CHALLENGE 1 ###
# Import and prepare data
# Store in: customer_data, loyalty_data

# Recall that read.csv(file_name) is the function to import csv files into our programming environment.


# Import data files
customer_data <- read.csv("customer_data.csv")
loyalty_data <- read.csv("loyalty_data.csv")

# Print Customer Data
print(head(customer_data, n = 10))

# Print Loyalty Data
print(head(loyalty_data, n = 10))

# Check Customer Data Structure:
print(str(customer_data))  # Check structure

# ================================================
# Graded Challenge 2: Customer Analysis
# (40 points)
# ================================================

# TODO: Filter and Select Customer Data
# Requirements:
# Filter and Select Customer data:
# - Filter Customer Data for Age > 30. Store in variable Above_30
# - Select for Female customers who bought Smoothies in df_filtered

### GRADED CHALLENGE 2 ###

library(dplyr)
# Filter Customer Data for Ages > 30
# Store results in: Above_30

Above_30 <- customer_data %>% filter(Age > 30)
print(Above_30)

# Filter Data for Female customers who bought Smoothies. Save in df_filtered
df_filtered <- customer_data %>% filter(Product == "Smoothie"  & Gender == "Female")
print(df_filtered)


# ================================================
# Graded Challenge 3: Loyalty Program Analysis
# (20 points)
# ================================================

# TODO: Analyze loyalty tiers
# Requirements:
# 1. Categorize customers into tiers

### GRADED CHALLENGE 3 ###
# Create loyalty tier analysis based on the below point values:
# Gold >= 500 points
# Silver >= 200 points
# Bronze under 200 points
# Add "Tier" column to loyalty_data

loyalty_data <- loyalty_data %>%
    mutate(Tier = case_when(
        LoyaltyPoints < 200 ~ "Bronze",
        LoyaltyPoints < 500 ~ "Silver",
        TRUE ~ "Gold"
    )
)


# ================================================
# Graded Challenge 4: Report Generation
# (20 points)
# ================================================

# TODO: Generate comprehensive report
# Requirements:
# 1. Generate a report.

### GRADED CHALLENGE 4 ###
# Generate and save report
# Save to df_selected to 'revised_customer_data.csv' and loyalty_data to revised_loyalty_data.csv

write.csv(df_filtered, "revised_customer_data.csv" , row.names = FALSE)
write.csv(loyalty_data, "revised_loyalty_data.csv" , row.names = FALSE)


# ================================================
# Hints and Tips
# ================================================
# 1. Use as.Date() for date conversion
# 2. write() for saving reports
