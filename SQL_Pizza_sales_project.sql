CREATE TABLE pizza_sales (
    pizza_id INT,
    order_id INT,
    pizza_name_id VARCHAR(50),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    Pizza_size CHAR(10),
    pizza_category VARCHAR(20),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(255)
);

drop table pizza_sales;
SHOW CREATE TABLE pizza_sales;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pizza_sales_1.csv'
INTO TABLE pizza_sales
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(pizza_id, order_id, pizza_name_id, quantity, order_date, order_time, unit_price, total_price, Pizza_size, pizza_category, pizza_ingredients, pizza_name);

SELECT * FROM pizza_sales LIMIT 10;
SELECT SUM(total_price) AS total_revenue FROM pizza_sales;
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value 
FROM pizza_sales;

SELECT SUM(quantity) AS tot_pizza_sold FROM pizza_sales;
SELECT COUNT(DISTINCT order_id) AS tot_orders FROM pizza_sales;

SELECT 
  CAST(SUM(quantity) AS DECIMAL(10,2)) / 
  CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS avg_pizzas_per_order
FROM pizza_sales;

SELECT order_date
FROM pizza_sales
LIMIT 100;

SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day, 
    COUNT(DISTINCT order_id) AS tot_orders
FROM pizza_sales
GROUP BY order_day
LIMIT 0, 1000;

  
 SELECT 
    MONTHNAME(order_date) AS month_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    pizza_sales
GROUP BY 
    month_name;

  
  
SELECT 
  pizza_category, 
  SUM(total_price) AS total_sales, 
  SUM(total_price) * 100 / (
    SELECT SUM(total_price) 
    FROM pizza_sales 
    WHERE MONTH(STR_TO_DATE(order_date, '%Y-%m-%d')) = 1
  ) AS pct
FROM 
  pizza_sales 
WHERE 
  MONTH(STR_TO_DATE(order_date, '%Y-%m-%d')) = 1
GROUP BY 
    pizza_category;


  
SELECT 
    pizza_size, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_sales, 
    CAST(SUM(total_price) * 100 / 
         (SELECT SUM(total_price) 
          FROM pizza_sales 
          WHERE QUARTER(order_date) = 1) 
         AS DECIMAL(10,2)) AS pct
FROM 
    pizza_sales
WHERE 
    QUARTER(order_date) = 1
GROUP BY 
    pizza_size
ORDER BY 
    pct DESC;

  
SELECT 
  pizza_name, 
  SUM(total_price) AS tot_revenue 
FROM 
  pizza_sales 
GROUP BY 
  pizza_name
ORDER BY 
  tot_revenue DESC
LIMIT 5;

SELECT 
  pizza_name, 
  SUM(quantity) AS total_quantity 
FROM 
  pizza_sales
GROUP BY 
  pizza_name
ORDER BY 
  total_quantity DESC
LIMIT 5;

SELECT 
  pizza_name, 
  COUNT(DISTINCT order_id) AS total_orders 
FROM 
  pizza_sales
GROUP BY 
  pizza_name
ORDER BY 
  total_orders ASC
LIMIT 5;


