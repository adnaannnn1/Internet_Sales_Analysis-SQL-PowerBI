# 📊 Internet Sales Analysis Dashboard & SQL Project

## 📌 Project Overview
A comprehensive business intelligence solution combining **SQL-based data warehousing** with **interactive dashboard visualizations** to analyze internet sales performance, customer behavior, and product trends.

---
## 🛠️ Technical Stack

- **PostgreSQL** - Data storage and SQL analysis
- **Power BI** - Data visualization and dashboard creation

## 📁 Dataset Information

- **Rows:** 50,000+ fact records (Internet Sales transactional data)

### 📦 Columns Overview

#### **Fact_InternetSales**
- 7+ columns  
- Includes: `ProductKey`, `CustomerKey`, `OrderDateKey`, `SalesAmount`, etc.
#### DIM_Products
- 10+ product attributes  
- Covers details like product name, category, color, size, etc.
#### DIM_Customers
- 8+ customer attributes  
- Includes demographic and geographic details
#### DIM_Calendar
- 8+ date attributes  
- Supports time intelligence (Year, Month, Quarter, etc.)

The SQL file includes all **CREATE TABLE** statements and 18 analytical queries.

---
# 1. SQL Business Analysis

## 📊 Sales Performance (4 Queries)
- **Annual Sales Trend** – Yearly totals  
- **Monthly Sales Trend** – 2020 monthly breakdown  
- **Year-Month Aggregation** – Combined analysis  
- **Budget Comparison** – Performance vs target  
---
## 🧍‍♂️ Customer Analysis (6 Queries)
- **Top 10 Customers** – Highest spenders  
- **Customer AOV** – Average order value  
- **Repeat Customers** – Loyalty identification  
- **High-Value Customers** – Customers with > $10K spend  
- **Customer Demographics** – Gender distribution  
- **City Performance** – Geographic sales  
---
## 📦 Product Analysis (5 Queries)
- **Top 10 Products** – Revenue leaders  
- **Category Performance** – Sales by category  
- **Product Attributes** – Best colors & sizes  
- **Product Status** – Active vs discontinued  
- **Product Line Analysis** – Revenue by line  
---
## ⏳ Temporal Analysis (3 Queries)
- **Monthly Trends** – Seasonal patterns  
- **March Orders** – Specific month analysis  
- **Annual Order Count** – Volume trends

---
# 2. Data Visualization (Power BI)

## 📊 Dashboard Preview

![Dashboard Overview](/Images/Sales_Overview.png)

## 📊 Power BI Dashboard Pages

## 1️⃣ Sales Overview Dashboard
- **Total Sales vs Budget**
- **Category-wise Sales Donut**
- **Top 10 Customers**
- **Top 10 Products**
- **Sales Trend (Line Chart)**
- **World Map:** Sales by City
---
## 2️⃣ Customer Details Dashboard
- **Monthly Sales Trend**
- **City-wise Sales Map**
- **Top Customers (Bar Chart)**
- **Customer × Month Heatmap Table**
---
## 3️⃣ Product Details Dashboard
- **Monthly Sales Trend**
- **City-wise Distribution**
- **Top Products (Bar Chart)**
- **Product × Month Heatmap Table**
---
## 📈 Key Insights from the Dashboards

- **Total Sales:** $16.35M, exceeding the **$15.3M** budget  
- **Top Product Line:** *Mountain-200* dominates overall revenue  
- **Customer Contribution:** A small group of customers drives the majority of sales  
- **Growth Trend:** Strong month-over-month growth in the second half of the year  
- **Geographic Strength:** North America and Europe lead in revenue

## Conclusion
This project provides a complete end-to-end analysis of Internet Sales using SQL and Power BI.
It highlights key patterns in sales performance, customer behavior, and product trends.
Top customers and high-performing products were clearly identified through detailed SQL insights.
The Power BI dashboard adds strong visual storytelling for faster decision-making.