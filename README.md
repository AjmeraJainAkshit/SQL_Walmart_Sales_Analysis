# SQL_Walmart_Sales_Analysis

The primary objective of this project is to gain insights into Walmart's Sales data in order to understand the various factors influencing the sales of its different branches.

## Data Normalization:
1. Build a database
2. Create table and insert the data.
3. Select columns with null values in them - There are no null values in our database as in creating the table we set NOT NULL for each field, hence null values are filtered out.
4. Add a new column named "time_of_day" to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
5. Add a new column named "day_name" that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
6. Add a new column named "month_name" that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar..). This helps to determine which month of the year has the most sales and profit.

## Data Analysis:

### Product:
1. How many unique product lines does the data have?
2. What is the most common payment method?
3. Which is the most selling product line?
4. What is the total revenue by month?
5. Which month had the largest COGS?
6. Which product line had the largest revenue?
7. City with the largest revenue?
8. Which product line had the largest VAT?
9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
10. Which branch sold more products than average product sold?
11. Which is the most common product line by gender?
12. What is the average rating of each product line?

### Customer:
1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. Which is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution for branch C?
7. Which time of the day do customers give most ratings?
8. Which time of the day do customers give most ratings for branch A?
9. Which day fo the week has the best avg ratings?
10. Which day of the week has the best average ratings for branch C?

### Sales:
1. Number of sales made in each time of the day day on Sunday?
2. Which of the customer types brings the most revenue?
3. Which city has the largest tax percent/ VAT (Value Added Tax)?
4. Which customer type pays the most in VAT?
