CREATE DATABASE Superstore;
USE Superstore;

/* 1.Total Sales */
select ROUND(SUM(sales),2) as Total_Sales
from storedata;

/* 2.Profit by Region */
select region, ROUND(SUM(sales),2)  as Profit_by_Region
from storedata
group by region
order by Profit_by_Region desc;

/* 3.Top Customers */
select `Customer name` as Top_Customers, ROUND(SUM(sales),2) as total_Spent
from storedata
Group by Top_Customers
order by total_Spent desc
limit 5;

/* 4.Monthly Sales Trend */
SELECT DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS month,
       ROUND(SUM(`Sales`),2) AS total_sales
FROM storedata
GROUP BY month
ORDER BY month;

/* 5.Top selling category */
select category, sum(sales) as total_Sales
from storedata
group by category
order by total_Sales desc;


/* 6.Avg profit per Order */
SELECT ROUND(AVG(order_total),2) AS average_sales_per_order
FROM (
    SELECT `Order ID`, SUM(`Sales`) AS order_total
    FROM storedata
    GROUP BY `Order ID`
) AS order_totals;

/* 7.Top customers */
select `customer name` , count(`order id`) as Total_Orders
from storedata 
group by `customer name`
having Total_Orders >= 5
order by Total_Orders desc;







