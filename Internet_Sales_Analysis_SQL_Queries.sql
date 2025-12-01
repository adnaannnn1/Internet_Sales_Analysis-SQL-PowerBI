-- Create table DIM_calender
CREATE TABLE DIM_Calendar (
DateKey INTEGER PRIMARY KEY,
Date DATE NOT NULL,
Day VARCHAR(10),
Month VARCHAR(20),
MonthShort VARCHAR(10),
MonthNo INTEGER,
Quarter INTEGER,
Year INTEGER
);

-- Create table DIM_Customers
CREATE TABLE DIM_Customers (
CustomerKey INTEGER PRIMARY KEY,
First_Name VARCHAR(100),
Last_Name VARCHAR(100),
Full_Name VARCHAR(200),
Gender VARCHAR(20),
DateFirstPurchase DATE,
Customer_City VARCHAR(200)
);

-- Create table Dim_Products
CREATE TABLE DIM_Products (
ProductKey INTEGER PRIMARY KEY,
ProductItemCode VARCHAR(100),
Product_Name VARCHAR(100),
Sub_Category VARCHAR(100),
Product_Category VARCHAR(100),
Product_Color VARCHAR(50),
Product_Size VARCHAR(50),
Product_Line VARCHAR(50),
Product_Model_Name VARCHAR(50),
Product_Description TEXT,
Product_Status VARCHAR(50)
);

-- Create table Facts Internet Sales
CREATE TABLE FACT_InternetSales (
ProductKey INTEGER,
OrderDateKey INTEGER,
DueDateKey INTEGER,
ShipDateKey INTEGER,
CustomerKey INTEGER,
SalesOrderNumber VARCHAR(50),
SalesAmount NUMERIC(12,2)
);


-- 1. Write a query to calculate the total SalesAmount for each Year 
-- using the OrderDateKey and the DIM_Calendar table.
Select c.year, sum(f.salesamount) as total_sales
from fact_internetsales f
join dim_calendar c
on f.orderdatekey = c.datekey
group by c.year
order by c.year;

-- 2. Retrieve the monthly SalesAmount trend for the year 2020,
-- displaying MonthNo and total SalesAmount.
select c.year, c.monthno, sum(f.salesamount) as total_sales
from fact_internetsales f
join dim_calendar c
on f.orderdatekey = c.datekey
where c.year = 2020
group by c.year, c.monthno
order by c.monthno desc;

-- 3. Find the top 10 products by total SalesAmount, showing ProductItemCode,
-- Product Name, and total revenue.
select p.productitemcode, p.product_name, sum(f.salesamount) as Total_revenue
from fact_internetsales f
join dim_products p
on f.productkey = p.productkey
group by p.productitemcode, p.product_name
order by Total_revenue DESC
limit 10;

-- 4. Identify the top 10 customers by total SalesAmount,
-- including CustomerKey and Full Name.
select c.customerkey, c.full_name, sum(f.salesamount) as Total_revenue
from fact_internetsales f
join dim_customers c
on f.customerkey = c.customerkey
group by c.customerkey, c.full_name
order by Total_revenue desc
limit 10;

-- 5. For each customer, calculate the average SalesAmount per order and
-- sort the result in descending order.
select c.customerkey, c.full_name, round(avg(f.salesamount),2) as AVG_Sales_Amount
from fact_internetsales f
join dim_customers c
on f.customerkey = c.customerkey
group by c.customerkey, c.full_name
order by AVG_Sales_Amount desc;

-- 6. Retrieve the list of repeat customers who have placed more than
-- one SalesOrderNumber, along with total SalesAmount.
select f.CustomerKey, c.Full_Name,
count(distinct f.SalesOrderNumber) AS order_count,
sum(f.SalesAmount) AS total_spent
from FACT_InternetSales f
join DIM_Customers c
on f.CustomerKey = c.CustomerKey
group by f.CustomerKey, c.Full_Name
having count(distinct f.SalesOrderNumber) > 1
order by total_spent desc;

-- 7. Display total SalesAmount grouped by Product Category and Sub Category.
select p.product_category, p.sub_category,
sum(f.salesamount) as Total_Sales_Amount
from fact_internetsales f
join dim_products p
on f.productkey = p.productkey
group by p.product_Category, p.sub_category
order by Total_Sales_Amount desc;

-- 8. Show the total SalesAmount for each Year and MonthNo.
select c.year, c.monthno, sum(f.salesamount) as Sales_Amount
from fact_internetsales f
join dim_calendar c
on f.orderdatekey = c.datekey
group by c.year, c.monthno
order by c.year, c.monthno;

-- 9. Retrieve the top-selling product attributes by finding the
-- highest revenue combinations of Product Color and Product Size.
select p.product_color, p.product_size,
sum(f.salesamount) as Revenue
from fact_internetsales f
join dim_products p
on f.productkey = p.productkey
group by p.product_color, p.product_size
order by Revenue desc
limit 20;

-- 10. Calculate total SalesAmount grouped by Product Status to compare active vs
-- discontinued products.
select p.product_status, sum(f.salesamount) as Total_Revenue
from fact_internetsales f
join dim_products p
on f.productkey = p.productkey
group by p.product_status
order by Total_Revenue desc;

-- 11. List all customers whose DateFirstPurchase falls in the year 2021,
-- along with their lifetime total SalesAmount.
select c.customerkey, c.full_name, c.datefirstpurchase as First_purchase,
sum(f.salesamount) as Total_Sales
from fact_internetsales f
join dim_customers c
on f.customerkey = c.customerkey
where extract(year from (c.datefirstpurchase)) = 2021
group by c.customerkey, c.full_name, c.datefirstpurchase
order by Total_Sales desc;

-- 12. List the number of customers in each Gender category.
select gender, count(*) as Customer_count
from dim_customers
group by gender
order by Customer_count desc;

-- 13. Show total SalesAmount per Customer City.
select c.customer_city, sum(f.salesamount) as Total_Sales
from fact_internetsales f
join dim_customers c
on f.customerkey = c.customerkey
group by c.customer_city
order by Total_Sales desc;

-- 14. Retrieve all orders placed in a specific month (e.g., March) of any year.
select f.salesordernumber, c.date as Order_Date, f.customerkey, f.productkey, f.salesamount
from fact_internetsales f
join dim_calendar c
on f.orderdatekey = c.datekey
where c.month = 'March'
order by Order_Date;

-- 15. Show the total number of orders placed each year.
select c.year, count(distinct f.salesordernumber) as Order_Count
from fact_internetsales f
join dim_calendar c
on f.orderdatekey = c.datekey
group by c.year
order by c.year;

-- 16. List all products in each Product Line along with the total sales for that line.
select p.product_line, p.productitemcode, p.product_name,
sum(f.salesamount) as Product_Revenue
from fact_internetsales f
join dim_products p
on f.productkey = p.productkey
group by p.product_line, p.productitemcode, p.product_name
order by p.product_line, Product_Revenue desc;

-- 17. Show all customers who made purchases worth more than 10,000 in total.
select c.customerkey, c.full_name, sum(f.salesamount) as Total_Spend
from fact_internetsales f
join dim_customers c
on f.customerkey = c.customerkey
group by c.customerkey, c.full_name
having sum(f.salesamount) > 10000
order by Total_Spend desc;

-- 18. Identify orphan keys by listing ProductKey values in FACT_InternetSales that
-- do not exist in DIM_Products and CustomerKey values missing from DIM_Customers.
select p.productkey, c.customerkey
from fact_internetsales f
left join dim_products p
on f.productkey = p.productkey
left join dim_customers c
on f.customerkey = c.customerkey
where p.productkey is null and c.customerkey is null;
