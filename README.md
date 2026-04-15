# Superstore Sales Analysis (SQL Project)

📌 Overview

This project analyzes a retail dataset to uncover insights into sales performance, customer behavior, and regional trends using SQL.
The goal was to simulate real world business analysis by answering key questions using structured queries.

📁 Dataset

Superstore dataset from Kaggle.
Contains sales transactions including customers, regions, products, and profits.

🛠 Tools Used

MySQL

SQL (Aggregations, Grouping, Subqueries)


❓ Business Questions

What is the total sales of the business?

Which regions generate the most revenue?

Who are the top customers?

What are the monthly sales trends?

Which categories perform best?

What is the average sales per order?

Which customers are most loyal?


📈 Key Insights

🔹The top 5 customers contribute a significant portion of total revenue

🔹Certain regions outperform others, indicating stronger market demand

🔹Sales show monthly trends, suggesting possible seasonality

🔹A small number of customers place frequent orders, showing loyalty

🔹Some categories generate higher total sales than others


🧠 SQL Analysis

🔹 Total Sales

SELECT ROUND(SUM(sales),2) AS Total_Sales

FROM storedata;


🔹 Profit by Region

SELECT region, ROUND(SUM(sales),2) AS Profit_by_Region

FROM storedata

GROUP BY region

ORDER BY Profit_by_Region DESC;


🔹 Top Customers

select `Customer name` as Top_Customers, ROUND(SUM(sales),2) as total_Spent

from storedata

Group by Top_Customers

order by total_Spent desc

limit 5;


🔹Monthly Sales Trend

SELECT DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS month, ROUND(SUM(`Sales`),2) AS total_sales

FROM storedata

GROUP BY month

ORDER BY month;


🔹Most selling category

select category, sum(sales) as total_Sales

from storedata

group by category

order by total_Sales desc;


🔹 Average Sales per Order

SELECT ROUND(AVG(order_total),2) AS average_sales_per_order

FROM (

SELECT `Order ID`, SUM(`Sales`) AS order_total
    
FROM storedata
    
GROUP BY `Order ID`

) AS order_totals;


🔹 Loyal Customers (5+ Orders)

SELECT `Customer name`, COUNT(`Order ID`) AS total_orders

FROM storedata

GROUP BY `Customer name`

HAVING total_orders >= 5

ORDER BY total_orders DESC;


📌 Conclusion

This project demonstrates my ability to:

🔹Write SQL queries to solve business problems

🔹Analyze and interpret data

🔹Extract meaningful insights from raw datasets

