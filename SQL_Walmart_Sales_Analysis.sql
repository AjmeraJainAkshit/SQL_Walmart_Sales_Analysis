create database walmart;
use walmart;
CREATE TABLE IF NOT EXISTS sales(
	invoice_id varchar(30) not null primary key,
    branch varchar(5) not null,
    city varchar(30) not null,
    customer_type varchar(30) not null,
    gender varchar(30) not null,
    product_line varchar(100) not null,
    unit_price decimal(10,2) not null,
    quantity int not null,
    tax_pct float(6,4) not null,
    total decimal(12, 4) not null,
    date datetime not null,
    time time not null,
    payment varchar(15) not null,
    cogs decimal(10,2) not null,
    gross_margin_pct float(11,9),
    gross_income decimal(12, 4),
    rating float(2, 1)
);

select * from sales;


select time from sales;

-- ---------Feature Engineering--------------------

-- Add the time_of_day column
select time,
			(case 
					when `time` between "00:00:00" and "12:00:00" then "Morning"
					when `time` between "12:01:00" and "16:00:00" then "Afternoon"
					else "Evening"
			End
			)as time_of_day
from sales;

alter table sales add column time_of_day varchar(20);

update sales
set time_of_day = 
			(case 
					when `time` between "00:00:00" and "12:00:00" then "Morning"
					when `time` between "12:01:00" and "16:00:00" then "Afternoon"
					else "Evening"
			End
			);
            
select * from sales;    

-- Add day_name column
select date,dayname(date) from sales;    

alter table sales add column day_name varchar(20);    

update sales
set day_name = dayname(date) ;    

select * from sales;    

-- Add month_name column
select date,monthname(date) from sales;    

alter table sales add column month_name varchar(20);    

update sales
set month_name = monthname(date) ;  

select * from sales;    

-- Exploratory Data Analysis (EDA)

-- Generic Question
-- 1. How many unique cities does the data have?
select distinct city from sales;
-- 2. In which city is each branch?
select distinct city,branch from sales;

-- ----------------------------------------------------------------------------------------------------------------------------
-- Product
-- 1. How many unique product lines does the data have?
select distinct product_line from sales;
select count(distinct product_line) as number_of_product_line from sales;

-- 2. What is the most common payment method?
select payment, count(payment) as number_of_payment from sales group by payment;

-- 3. What is the most selling product line?
select product_line,sum(quantity)as total_qty from sales group by product_line order by total_qty desc;

-- 4. What is the total revenue by month?
select month_name,sum(total) as total_revenue from sales group by month_name order by total_revenue desc;

-- 5. What month had the largest COGS?
select month_name, sum(COGS) as cogs from sales group by month_name order by COGS desc;

-- 6. What product line had the largest revenue?
select product_line,sum(total) as total_revenue from sales group by product_line order by total_revenue desc;

-- 7. What is the city with the largest revenue?
select branch,city,sum(total) as total_revenue from sales group by city,branch order by total_revenue desc;

-- 8. What product line had the largest VAT?
select product_line,avg(tax_pct) as avg_VAT from sales group by product_line order by avg_VAT desc;

-- 9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
select * from sales;

-- 10. Which branch sold more products than average product sold?
select branch, sum(quantity) as qty from sales group by branch having sum(quantity) > (select avg(quantity) from sales);

-- 11. What is the most common product line by gender?
select gender,product_line,count(gender) as total_person from sales group by gender,product_line order by total_person desc;

-- 12. What is the average rating of each product line?
select * from sales;
select product_line, round(avg(rating),2) as avg_rating from sales group by product_line order by avg_rating desc;

-- -------------------------------------------------------------------------------------------------------------------------------------
-- Sales

-- Number of sales made in each time of the day per weekday
select * from sales;
select time_of_day, count(*) as Total_sales from sales where day_name = "Sunday" group by time_of_day order by Total_sales desc;

-- Which of the customer types brings the most revenue?
select * from sales;
select customer_type,sum(total) as revenue from sales group by customer_type order by revenue desc;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
select * from sales;
select city ,round(avg(tax_pct),2) as avg_VAT from sales group by city order by avg_VAT desc;

-- Which customer type pays the most in VAT?
select * from sales;
select customer_type,round(avg(tax_pct),2) as Total_VAT from sales group by customer_type order by Total_VAT desc;

-- Customer
-- How many unique customer types does the data have?
select * from sales;
select distinct(customer_type) from sales;
-- How many unique payment methods does the data have?
select * from sales;
select distinct(payment) from sales;

-- What is the most common customer type?
select * from sales;
select customer_type, count(*) as count from sales group by customer_type order by count;

-- Which customer type buys the most?
select * from sales;
select customer_type, count(*) as count from sales group by customer_type ;

-- What is the gender of most of the customers?
select * from sales;
select gender,count(gender) as count_gender from sales group by gender order by count_gender;

-- What is the gender distribution per branch?
select * from sales;
select gender,count(gender) as count_gender from sales where branch = "C" group by gender order by count_gender;

-- Which time of the day do customers give most ratings?
select * from sales;
select time_of_day,round(avg(rating),2) as total_rating from sales group by time_of_day order by total_rating desc;

-- Which time of the day do customers give most ratings per branch?
select * from sales;
select time_of_day,round(avg(rating),2) as total_rating from sales where branch = "C" group by time_of_day order by total_rating desc;

-- Which day fo the week has the best avg ratings?
select * from sales;
select day_name,round(avg(rating),2) as total_rating from sales group by day_name order by total_rating desc;

-- Which day of the week has the best average ratings per branch?
select * from sales;
select day_name,round(avg(rating),2) as total_rating from sales where branch = "C" group by day_name order by total_rating desc;
