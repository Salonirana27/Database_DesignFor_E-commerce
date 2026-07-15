# Database Design for E-commerce Website

A complete SQL-based E-commerce Database Management System built using **MySQL**. This project demonstrates database design, relational modeling, data management, and business analysis through real-world SQL queries.


# 📌 Project Overview

The objective of this project is to design and implement a normalized relational database for an E-commerce website. The database manages customer information, products, orders, order items, and payments while supporting business-oriented analysis using SQL.

The project simulates a real-world online shopping platform and answers important business questions using SQL queries.


# 🎯 Objectives

- Design a normalized relational database.
- Implement relationships using Primary Keys and Foreign Keys.
- Store customer, product, order, and payment information.
- Perform business analysis using SQL.
- Generate meaningful business insights from transactional data.


# 🛠 Technologies Used

- MySQL
- MySQL Workbench
- SQL
- Git
- GitHub


# 🗄 Database Schema

The database consists of five tables:

## 1. Customers

Stores customer information.

Columns:
 customer_id int AI PK 
 name varchar(100) 
 email varchar(150) 
 city varchar(50) 
 signup_date date


## 2. Products

Stores product information.

Columns:
 product_id int AI PK 
 product_name varchar(100) 
 category varchar(100) 
 price decimal(10,2) 
 stock int



## 3. Orders

Stores customer order details.

Columns:
 order_id int AI PK 
 customer_id int 
 order_date date 
 order_status varc


## 4. Order_Items

Stores products included in each order.

Columns:
 order_item_id int AI PK 
 order_id int 
 product_id int 
 quantity in

## 5. Payments

Stores payment information.

Columns:
 payment_id int AI PK 
 order_id int 
 payment_mode varchar(30) 
 amount decimal(10,2) 
 payment_date date

---

# 🔗 Entity Relationship

- One Customer can place multiple Orders.
- One Order can contain multiple Products.
- One Product can appear in multiple Orders.
- Each Order has one Payment.

---

# 📈 Business Queries Implemented

This project answers several real-world business questions using SQL.

### Sales Analysis

- Total Revenue Generated
- Revenue by Product
- Revenue by Category
- Monthly Revenue Analysis
- Average Order Value (AOV)

### Customer Analysis

- Top Customer by Spend
- Top 5 Highest Spending Customers
- Total Orders by Each Customer
- Customer Ranking Based on Spending

### Product Analysis

- Best Selling Products
- Top 5 Most Ordered Products
- Products Never Ordered

### Order Analysis

- Cancelled Orders Count
- Total Orders by Status
- Orders Without Payment

### Payment Analysis

- Monthly Revenue Report
- Payment Analytics

---

# 💡 SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- AUTO_INCREMENT
- INSERT
- UPDATE
- DELETE
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- LIMIT
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- Window Functions (RANK)
- Subqueries



# 📂 Project Structure

Database-Design-for-Ecommerce-Website/

│── README.md
│── ecommerce_database_setup.sql
│── ecommerce_sql_queries.sql
│── ER_Diagram.png
│
└── Screenshots
    ├── Database_Tables.png
    ├── Total_Revenue.png
    ├── Top_Customers.png
    ├── Best_Selling_Products.png
    └── Monthly_Revenue.png



# 📊 Sample Business Insights

- Identified repeat customers using order history.
- Calculated total revenue generated.
- Found top-selling products.
- Analyzed monthly revenue trends.
- Ranked customers based on total spending.
- Identified products that were never ordered.
- Counted cancelled orders.
- Analyzed category-wise revenue.


# 🚀 Future Enhancements

- Shopping Cart Module
- Product Reviews
- Shipping Details
- Inventory Management
- Employee Management
- Power BI Dashboard Integration
- Python (Pandas) for Data Analysis



# 👩‍💻 Author

**Saloni Rana**

MCA Student

Aspiring Data Analyst | SQL | MySQL | Data Analytics


# ⭐ If you found this project helpful, please consider giving it a star.
