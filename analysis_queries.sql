/*
Retail Sales & Business Performance Analysis
SQL Server
*/

-- 1. Total sales
SELECT ROUND(SUM(sales_amount),2) AS total_sales
FROM retail_sales;

-- 2. Monthly sales trend
SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    ROUND(SUM(sales_amount),2) AS total_sales
FROM retail_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY sales_year, sales_month;

-- 3. Top 5 stores by sales
SELECT TOP 5
    store_id, store_name, city,
    ROUND(SUM(sales_amount),2) AS total_sales
FROM retail_sales
GROUP BY store_id, store_name, city
ORDER BY total_sales DESC;

-- 4. Bottom 5 stores by sales
SELECT TOP 5
    store_id, store_name, city,
    ROUND(SUM(sales_amount),2) AS total_sales
FROM retail_sales
GROUP BY store_id, store_name, city
ORDER BY total_sales ASC;

-- 5. Product performance
SELECT
    product_id, product_name, category,
    SUM(quantity) AS units_sold,
    ROUND(SUM(sales_amount),2) AS total_sales
FROM retail_sales
GROUP BY product_id, product_name, category
ORDER BY total_sales DESC;

-- 6. Category performance
SELECT
    category,
    SUM(quantity) AS units_sold,
    ROUND(SUM(sales_amount),2) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC;

-- 7. Store + product relationship
SELECT
    store_name,
    product_name,
    ROUND(SUM(sales_amount),2) AS total_sales
FROM retail_sales
GROUP BY store_name, product_name
ORDER BY total_sales DESC;

-- 8. Average inventory by store
SELECT
    store_name,
    ROUND(AVG(CAST(inventory_units AS DECIMAL(10,2))),2) AS avg_inventory
FROM retail_sales
GROUP BY store_name
ORDER BY avg_inventory DESC;

-- 9. Year-over-year sales
WITH yearly AS (
    SELECT YEAR(order_date) AS sales_year,
           SUM(sales_amount) AS total_sales
    FROM retail_sales
    GROUP BY YEAR(order_date)
)
SELECT
    sales_year,
    ROUND(total_sales,2) AS total_sales,
    ROUND(
        (total_sales - LAG(total_sales) OVER (ORDER BY sales_year))
        * 100.0 / NULLIF(LAG(total_sales) OVER (ORDER BY sales_year),0), 2
    ) AS yoy_growth_pct
FROM yearly
ORDER BY sales_year;

-- 10. Rank stores within each city
SELECT
    city, store_name,
    ROUND(SUM(sales_amount),2) AS total_sales,
    DENSE_RANK() OVER (
        PARTITION BY city ORDER BY SUM(sales_amount) DESC
    ) AS store_rank
FROM retail_sales
GROUP BY city, store_name;
