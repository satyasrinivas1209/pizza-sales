# pizza-sales
sql pizza sales
# Pizza Sales Data Analysis (SQL Project)

## Project Overview
This project performs **SQL-based data analysis** on a Pizza Sales dataset.  
Using **MySQL**, it loads raw sales data from a CSV file, stores it in a database table, and runs multiple analytical queries to extract valuable **business insights** like revenue trends, best-selling products, and order patterns.

## Files in This Repository
- **`pizza_sales_1.csv`** – Raw dataset containing pizza sales data.
- **`SQL_Pizza_sales_project.sql`** – SQL script that:
  - Creates the `pizza_sales` table.
  - Loads CSV data into MySQL.
  - Runs queries to analyze sales performance.

##Dataset Columns
| Column Name         | Description |
|---------------------|-------------|
| pizza_id            | Unique pizza identifier |
| order_id            | Unique order identifier |
| pizza_name_id       | Short code for pizza name |
| quantity            | Number of pizzas ordered |
| order_date          | Date of the order |
| order_time          | Time of the order |
| unit_price          | Price per pizza |
| total_price         | Total price for the order |
| pizza_size          | Size of pizza (S, M, L, XL) |
| pizza_category      | Category of pizza (Classic, Veggie, Supreme, etc.) |
| pizza_ingredients   | List of ingredients |
| pizza_name          | Full pizza name |

##SQL Analysis Performed
The SQL script answers key business questions, including:
1. **Total Revenue**
2. **Average Order Value**
3. **Total Pizzas Sold**
4. **Total Orders**
5. **Average Pizzas Per Order**
6. **Orders by Day of Week**
7. **Orders by Month**
8. **Monthly Sales by Pizza Category**
9. **Quarterly Sales by Pizza Size**
10. **Top 5 Pizzas by Revenue**
11. **Top 5 Pizzas by Quantity Sold**
12. **Bottom 5 Pizzas by Orders**

## How to Run
1. Install **MySQL** on your system.
2. Create a database:
   ```sql
   CREATE DATABASE pizza_sales_db;
   USE pizza_sales_db;

