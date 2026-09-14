-- Business Sales Analytics
-- Oracle SQL / SQL*Plus
-- Dataset: Superstore.csv
--
-- Create the table, import the Superstore data into it, then run
-- the analysis queries below.

SET LINESIZE 180
SET PAGESIZE 100

-- ============================================================
-- 1. CREATE TABLE
-- ============================================================

CREATE TABLE sales (
    row_id          NUMBER,
    order_id        VARCHAR2(30),
    order_date      DATE,
    ship_date       DATE,
    ship_mode       VARCHAR2(30),
    customer_id     VARCHAR2(30),
    customer_name   VARCHAR2(100),
    segment         VARCHAR2(30),
    country         VARCHAR2(50),
    city            VARCHAR2(100),
    state           VARCHAR2(100),
    postal_code     VARCHAR2(20),
    region          VARCHAR2(30),
    product_id      VARCHAR2(30),
    category        VARCHAR2(50),
    sub_category    VARCHAR2(50),
    product_name    VARCHAR2(255),
    sales           NUMBER(12,4),
    quantity        NUMBER,
    discount        NUMBER(6,4),
    profit          NUMBER(12,4)
);

-- ============================================================
-- 2. BASIC DATA CHECKS
-- ============================================================

SELECT COUNT(*) AS total_records
FROM sales;

SELECT *
FROM sales
FETCH FIRST 10 ROWS ONLY;

SELECT DISTINCT category
FROM sales
ORDER BY category;

SELECT DISTINCT region
FROM sales
ORDER BY region;

-- ============================================================
-- 3. OVERALL BUSINESS METRICS
-- ============================================================

SELECT ROUND(SUM(sales), 2) AS total_sales
FROM sales;

SELECT ROUND(SUM(profit), 2) AS total_profit
FROM sales;

SELECT SUM(quantity) AS total_quantity_sold
FROM sales;

SELECT ROUND(AVG(discount), 4) AS average_discount
FROM sales;

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM sales;

-- ============================================================
-- 4. SALES ANALYSIS
-- ============================================================

SELECT category,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

SELECT sub_category,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY sub_category
ORDER BY total_sales DESC;

SELECT region,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

SELECT segment,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY segment
ORDER BY total_sales DESC;

SELECT state,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY state
ORDER BY total_sales DESC;

-- ============================================================
-- 5. PROFIT ANALYSIS
-- ============================================================

SELECT category,
       ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

SELECT sub_category,
       ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY sub_category
ORDER BY total_profit DESC;

SELECT region,
       ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_profit DESC;

SELECT segment,
       ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY segment
ORDER BY total_profit DESC;

-- ============================================================
-- 6. TOP PRODUCTS
-- ============================================================

SELECT *
FROM (
    SELECT product_name,
           ROUND(SUM(sales), 2) AS total_sales
    FROM sales
    GROUP BY product_name
    ORDER BY total_sales DESC
)
WHERE ROWNUM <= 10;

SELECT *
FROM (
    SELECT product_name,
           ROUND(SUM(profit), 2) AS total_profit
    FROM sales
    GROUP BY product_name
    ORDER BY total_profit DESC
)
WHERE ROWNUM <= 10;

SELECT *
FROM (
    SELECT product_name,
           ROUND(SUM(profit), 2) AS total_profit
    FROM sales
    GROUP BY product_name
    ORDER BY total_profit ASC
)
WHERE ROWNUM <= 10;

-- ============================================================
-- 7. DISCOUNT ANALYSIS
-- ============================================================

SELECT discount,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY discount
ORDER BY discount;

SELECT discount,
       ROUND(AVG(profit), 2) AS average_profit
FROM sales
GROUP BY discount
ORDER BY discount;

-- ============================================================
-- 8. TIME-BASED ANALYSIS
-- ============================================================

SELECT EXTRACT(YEAR FROM order_date) AS order_year,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY order_year;

SELECT EXTRACT(YEAR FROM order_date) AS order_year,
       ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY order_year;

SELECT EXTRACT(YEAR FROM order_date) AS order_year,
       EXTRACT(MONTH FROM order_date) AS order_month,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY EXTRACT(YEAR FROM order_date),
         EXTRACT(MONTH FROM order_date)
ORDER BY order_year, order_month;

-- ============================================================
-- 9. BUSINESS QUESTIONS
-- ============================================================

SELECT *
FROM (
    SELECT category,
           ROUND(SUM(sales), 2) AS total_sales
    FROM sales
    GROUP BY category
    ORDER BY total_sales DESC
)
WHERE ROWNUM = 1;

SELECT *
FROM (
    SELECT region,
           ROUND(SUM(profit), 2) AS total_profit
    FROM sales
    GROUP BY region
    ORDER BY total_profit DESC
)
WHERE ROWNUM = 1;

SELECT sub_category,
       ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit;

SELECT category,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(sales) > 700000
ORDER BY total_sales DESC;

-- ============================================================
-- 10. OPTIONAL CLEANUP
-- ============================================================
-- DROP TABLE sales;
