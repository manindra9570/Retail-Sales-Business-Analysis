# Retail Sales & Business Performance Analysis

## Business Objective
Analyze retail sales performance across stores, products, categories, locations, and inventory levels to help management identify growth opportunities and underperforming areas.

## Tools
- SQL Server
- Power BI
- Excel
- DAX / Power Query

## Dataset
The project contains 1,200 simulated retail transactions covering **2022–2023**.

Key fields:
- Order Date
- Store / City
- Product / Category
- Quantity
- Unit Price
- Discount
- Sales Amount
- Inventory Units

## Business Questions
1. What is the monthly sales trend?
2. Which stores generate the highest and lowest sales?
3. Which products and categories contribute most to revenue?
4. How does product performance vary by store?
5. Which locations perform strongly or weakly?
6. What is the average inventory level by store?
7. How did sales change year over year?
8. Which stores rank highest within each city?

## SQL Analysis
The `analysis_queries.sql` file contains SQL Server queries using:
- GROUP BY
- CTEs
- Window functions
- LAG()
- DENSE_RANK()
- Aggregations
- TOP
- Business KPI calculations

## Power BI Dashboard
Recommended dashboard pages:

### 1. Executive Overview
KPIs:
- Total Sales
- Units Sold
- Average Order Value
- YoY Sales Growth
- Average Inventory

Visuals:
- Monthly sales trend
- Sales by category
- Sales by city
- Top 5 stores

### 2. Store Performance
- Store ranking
- Top / bottom stores
- City-wise performance
- Store sales trend

### 3. Product Performance
- Product sales ranking
- Category contribution
- Units sold
- Product × Store matrix

### 4. Inventory Health
- Average inventory by store
- Average inventory by product
- High-inventory products
- Sales vs inventory comparison

## Key DAX Measures

```DAX
Total Sales = SUM(retail_sales[sales_amount])

Units Sold = SUM(retail_sales[quantity])

Average Order Value =
DIVIDE([Total Sales], DISTINCTCOUNT(retail_sales[order_id]))

Average Inventory =
AVERAGE(retail_sales[inventory_units])
```

## Business Insights
Use the dashboard to identify:
- High-performing stores that can be used as benchmarks.
- Products/categories responsible for the largest revenue contribution.
- Locations requiring additional investigation.
- Products with high inventory but comparatively weak sales.
- Monthly periods showing meaningful sales changes.

## Project Structure

```text
retail-sales-portfolio/
│
├── retail_sales_data.csv
├── analysis_queries.sql
└── README.md
```

## Resume / Naukri Project Description
**Retail Sales & Business Performance Analysis | SQL Server + Power BI**
Analyzed 1,200+ retail transactions across 2022–2023 to evaluate sales trends, store performance, product/category contribution, and inventory health. Developed SQL-based KPIs and Power BI dashboard views using aggregations, CTEs, window functions, DAX, and Power Query to identify business performance patterns and support data-driven decision making.

## Author
Manindra Prasad Gupta
