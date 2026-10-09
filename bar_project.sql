-- ============================================================
-- BAR SALES ANALYSIS (SQL portfolio project)
-- Database: SQLite (sqliteonline.com)
-- Period: 2026-08-01 to 2026-10-07
-- Tables: menu, staff, bar_sales
-- How to run: paste the whole file into the editor and press Run.
-- ============================================================


-- ------------------------------------------------------------
-- 1. SETUP: create tables and load data
-- ------------------------------------------------------------
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS bar_sales;

CREATE TABLE menu (
  product_id INTEGER,
  product_name TEXT,
  category TEXT,
  price REAL,
  cost REAL
);

INSERT INTO menu VALUES
(1, 'Aperol Spritz', 'Drinks', 28, 10),
(2, 'Mojito', 'Drinks', 30, 11),
(3, 'Gin z tonikiem', 'Drinks', 26, 9),
(4, 'Margarita', 'Drinks', 32, 12),
(5, 'Piwo lane', 'Beer', 14, 5),
(6, 'Piwo butelkowe', 'Beer', 16, 7),
(7, 'Nachos', 'Food', 22, 9),
(8, 'Frytki', 'Food', 16, 5),
(9, 'Hot-dog', 'Food', 18, 7),
(10, 'Cola', 'Soft', 9, 3),
(11, 'Lemoniada', 'Soft', 10, 3);

CREATE TABLE staff (
  bartender_id INTEGER,
  name TEXT,
  hire_date TEXT
);

INSERT INTO staff VALUES
(1, 'Anna', '2025-03-01'),
(2, 'Kasia', '2025-06-15'),
(3, 'Marek', '2026-01-10'),
(4, 'Olek', '2026-08-20');

CREATE TABLE bar_sales (
  sale_id INTEGER,
  sale_date TEXT,
  product_id INTEGER,
  quantity INTEGER,
  bartender_id INTEGER,
  tip REAL
);

INSERT INTO bar_sales VALUES
(1, '2026-08-01', 7, 2, 2, 2),
(2, '2026-08-01', 1, 1, 3, NULL),
(3, '2026-08-02', 2, 4, 1, 2),
(4, '2026-08-02', 4, 2, 2, NULL),
(5, '2026-08-03', 5, 1, 3, 0),
(6, '2026-08-04', 4, 1, 1, 2),
(7, '2026-08-05', 7, 1, 1, 5),
(8, '2026-08-05', 1, 1, 2, NULL),
(9, '2026-08-06', 6, 1, 3, NULL),
(10, '2026-08-06', 10, 2, 3, 2),
(11, '2026-08-07', 2, 2, 1, NULL),
(12, '2026-08-08', 3, 4, 3, 0),
(13, '2026-08-09', 10, 1, 2, 8),
(14, '2026-08-09', 5, 2, 1, NULL),
(15, '2026-08-10', 2, 1, 3, 0),
(16, '2026-08-11', 8, 1, 1, NULL),
(17, '2026-08-11', 2, 2, 1, 3),
(18, '2026-08-12', 4, 2, 1, 3),
(19, '2026-08-12', 5, 2, 2, NULL),
(20, '2026-08-13', 6, 1, 1, 8),
(21, '2026-08-14', 5, 2, 1, 5),
(22, '2026-08-15', 6, 2, 3, 2),
(23, '2026-08-15', 9, 2, 2, NULL),
(24, '2026-08-16', 1, 1, 2, NULL),
(25, '2026-08-16', 7, 1, 2, 8),
(26, '2026-08-17', 9, 2, 3, NULL),
(27, '2026-08-18', 9, 4, 1, NULL),
(28, '2026-08-19', 5, 2, 3, 3),
(29, '2026-08-19', 1, 1, 1, 5),
(30, '2026-08-20', 1, 1, 4, NULL),
(31, '2026-08-20', 1, 1, 3, 3),
(32, '2026-08-21', 5, 1, 3, NULL),
(33, '2026-08-21', 9, 4, 2, 3),
(34, '2026-08-22', 1, 1, 3, 5),
(35, '2026-08-23', 3, 1, 1, 2),
(36, '2026-08-23', 1, 1, 2, NULL),
(37, '2026-08-24', 1, 2, 1, 5),
(38, '2026-08-25', 7, 1, 3, 0),
(39, '2026-08-26', 1, 2, 1, 8),
(40, '2026-08-26', 8, 4, 1, 8),
(41, '2026-08-27', 5, 1, 4, 2),
(42, '2026-08-27', 5, 2, 1, NULL),
(43, '2026-08-28', 6, 4, 4, 5),
(44, '2026-08-28', 4, 4, 4, 2),
(45, '2026-08-29', 5, 2, 1, 0),
(46, '2026-08-29', 5, 2, 2, 5),
(47, '2026-08-30', 2, 3, 4, 0),
(48, '2026-08-31', 9, 1, 2, 5),
(49, '2026-08-31', 5, 2, 3, 5),
(50, '2026-09-01', 9, 2, 2, 0),
(51, '2026-09-02', 5, 1, 4, 8),
(52, '2026-09-02', 8, 4, 2, 2),
(53, '2026-09-03', 2, 4, 2, NULL),
(54, '2026-09-04', 2, 1, 1, 5),
(55, '2026-09-05', 1, 4, 2, NULL),
(56, '2026-09-06', 5, 1, 2, 8),
(57, '2026-09-07', 5, 2, 4, 5),
(58, '2026-09-08', 3, 3, 4, 0),
(59, '2026-09-08', 1, 1, 1, 5),
(60, '2026-09-09', 7, 2, 3, 5),
(61, '2026-09-10', 7, 1, 2, 2),
(62, '2026-09-11', 5, 1, 3, NULL),
(63, '2026-09-11', 7, 3, 1, 2),
(64, '2026-09-12', 1, 2, 3, NULL),
(65, '2026-09-12', 6, 1, 4, 0),
(66, '2026-09-13', 2, 1, 4, 3),
(67, '2026-09-13', 7, 1, 3, 8),
(68, '2026-09-14', 4, 2, 2, 2),
(69, '2026-09-15', 8, 2, 2, NULL),
(70, '2026-09-15', 5, 3, 4, NULL),
(71, '2026-09-16', 5, 1, 1, 2),
(72, '2026-09-17', 5, 2, 3, 2),
(73, '2026-09-17', 3, 4, 1, 5),
(74, '2026-09-18', 8, 3, 1, NULL),
(75, '2026-09-18', 2, 1, 1, 0),
(76, '2026-09-19', 5, 3, 3, 0),
(77, '2026-09-19', 9, 3, 3, 3),
(78, '2026-09-20', 1, 2, 4, 8),
(79, '2026-09-21', 3, 4, 2, 8),
(80, '2026-09-21', 8, 2, 1, NULL),
(81, '2026-09-22', 5, 2, 2, 2),
(82, '2026-09-23', 2, 2, 4, 2),
(83, '2026-09-24', 5, 2, 2, 2),
(84, '2026-09-24', 5, 1, 2, 3),
(85, '2026-09-25', 5, 4, 3, 0),
(86, '2026-09-25', 6, 4, 2, 0),
(87, '2026-09-26', 8, 4, 3, 3),
(88, '2026-09-26', 5, 2, 1, 3),
(89, '2026-09-27', 1, 1, 1, 3),
(90, '2026-09-27', 9, 2, 1, 2),
(91, '2026-09-28', 1, 1, 4, 2),
(92, '2026-09-29', 9, 3, 4, 0),
(93, '2026-09-29', 2, 2, 3, 2),
(94, '2026-09-30', 9, 4, 4, 3),
(95, '2026-10-01', 3, 1, 1, 0),
(96, '2026-10-02', 2, 3, 1, NULL),
(97, '2026-10-03', 2, 1, 3, 0),
(98, '2026-10-03', 7, 1, 4, NULL),
(99, '2026-10-04', 5, 2, 3, 5),
(100, '2026-10-04', 2, 2, 4, NULL),
(101, '2026-10-05', 4, 2, 2, 3),
(102, '2026-10-06', 2, 2, 2, 3),
(103, '2026-10-07', 2, 2, 2, NULL),
(104, '2026-10-07', 9, 2, 3, NULL),
(21, '2026-08-14', 5, 2, 1, 5),
(62, '2026-09-11', 5, 1, 3, NULL);


-- ------------------------------------------------------------
-- 2. DATA QUALITY CHECKS
-- ------------------------------------------------------------

-- 2.1 Overview: rows, rows with tip, unique sales, date range
SELECT COUNT(*) AS total_rows,
       COUNT(tip) AS rows_with_tip,
       COUNT(DISTINCT sale_id) AS unique_sales,
       MIN(sale_date) AS first_date,
       MAX(sale_date) AS last_date
FROM bar_sales;

-- 2.2 Missing tips (NULL)
SELECT COUNT(*) AS null_tips
FROM bar_sales
WHERE tip IS NULL;

-- 2.3 Duplicate sales
SELECT sale_id, COUNT(*) AS cnt
FROM bar_sales
GROUP BY sale_id
HAVING COUNT(*) > 1;

-- 2.4 Clean copy without duplicates (raw table stays untouched)
DROP TABLE IF EXISTS bar_sales_clean;

CREATE TABLE bar_sales_clean AS
SELECT DISTINCT *
FROM bar_sales;

-- 2.5 Check the clean table
SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT sale_id) AS unique_sales
FROM bar_sales_clean;

-- 2.6 Sales with a product that is not in the menu
SELECT COUNT(*) AS orphan_products
FROM bar_sales_clean AS s
LEFT JOIN menu AS m ON s.product_id = m.product_id
WHERE m.product_id IS NULL;

-- 2.7 Sales with a bartender that is not in staff
SELECT COUNT(*) AS orphan_bartenders
FROM bar_sales_clean AS s
LEFT JOIN staff AS t ON s.bartender_id = t.bartender_id
WHERE t.bartender_id IS NULL;

-- 2.8 Wrong quantity
SELECT COUNT(*) AS bad_quantity
FROM bar_sales_clean
WHERE quantity <= 0;

-- 2.9 Menu items that were never sold
SELECT m.product_name
FROM menu AS m
LEFT JOIN bar_sales_clean AS s ON m.product_id = s.product_id
WHERE s.sale_id IS NULL;


-- ------------------------------------------------------------
-- 3. ANALYSIS VIEW: one convenient table for all questions
-- ------------------------------------------------------------
DROP VIEW IF EXISTS sales_full;

CREATE VIEW sales_full AS
SELECT s.sale_id,
       s.sale_date,
       s.quantity,
       s.tip,
       t.name AS bartender,
       m.product_name,
       m.category,
       s.quantity * m.price AS revenue,
       s.quantity * (m.price - m.cost) AS profit
FROM bar_sales_clean AS s
JOIN menu AS m ON s.product_id = m.product_id
JOIN staff AS t ON s.bartender_id = t.bartender_id;


-- ------------------------------------------------------------
-- 4. BUSINESS QUESTIONS
-- ------------------------------------------------------------

-- Q1. Overall picture: sales, revenue, profit, margin, average sale
SELECT COUNT(*) AS sales_count,
       SUM(revenue) AS revenue,
       SUM(profit) AS profit,
       ROUND(100.0 * SUM(profit) / SUM(revenue), 1) AS margin_pct,
       ROUND(AVG(revenue), 1) AS avg_sale
FROM sales_full;

-- Q2. How did the business change by month?
-- (October is incomplete, so we compare revenue per day)
SELECT strftime('%Y-%m', sale_date) AS month,
       COUNT(*) AS sales_count,
       SUM(revenue) AS revenue,
       SUM(profit) AS profit,
       COUNT(DISTINCT sale_date) AS days,
       ROUND(1.0 * SUM(revenue) / COUNT(DISTINCT sale_date), 1) AS revenue_per_day
FROM sales_full
GROUP BY month
ORDER BY month;

-- Q3. Which products bring the most profit?
SELECT product_name,
       SUM(quantity) AS units,
       SUM(revenue) AS revenue,
       SUM(profit) AS profit,
       ROUND(100.0 * SUM(profit) / SUM(revenue), 1) AS margin_pct
FROM sales_full
GROUP BY product_name
ORDER BY profit DESC, product_name;

-- Q4. Which categories bring the most revenue?
SELECT category,
       SUM(revenue) AS revenue,
       SUM(profit) AS profit,
       ROUND(100.0 * SUM(revenue) / (SELECT SUM(revenue) FROM sales_full), 1) AS revenue_pct
FROM sales_full
GROUP BY category
ORDER BY revenue DESC;

-- Q5. How do bartenders perform?
SELECT bartender,
       COUNT(*) AS sales_count,
       SUM(revenue) AS revenue,
       ROUND(AVG(revenue), 1) AS avg_sale,
       SUM(COALESCE(tip, 0)) AS tips
FROM sales_full
GROUP BY bartender
ORDER BY revenue DESC;

-- Q6. Which days of the week are the best?
SELECT CASE strftime('%w', sale_date)
         WHEN '1' THEN 'Mon'
         WHEN '2' THEN 'Tue'
         WHEN '3' THEN 'Wed'
         WHEN '4' THEN 'Thu'
         WHEN '5' THEN 'Fri'
         WHEN '6' THEN 'Sat'
         ELSE 'Sun'
       END AS weekday,
       COUNT(*) AS sales_count,
       SUM(revenue) AS revenue,
       COUNT(DISTINCT sale_date) AS days,
       ROUND(1.0 * SUM(revenue) / COUNT(DISTINCT sale_date), 1) AS revenue_per_day
FROM sales_full
GROUP BY strftime('%w', sale_date)
ORDER BY (CAST(strftime('%w', sale_date) AS INTEGER) + 6) % 7;

-- Q7. Best product in each category by profit (window function)
WITH ranked AS (
  SELECT category,
         product_name,
         SUM(profit) AS profit,
         ROW_NUMBER() OVER (
           PARTITION BY category
           ORDER BY SUM(profit) DESC
         ) AS rn
  FROM sales_full
  GROUP BY category, product_name
)
SELECT category, product_name, profit
FROM ranked
WHERE rn = 1
ORDER BY profit DESC;
