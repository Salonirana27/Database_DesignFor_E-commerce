-- =========================================
-- BUSINESS QUERIES
-- =========================================


 -- Query 1 : TOTAL REVENUE GENERATE 
 
SELECT SUM(amount) AS total_revenue FROM payments;

-- --------------------------------------------------

-- Query 2 : TOTAL REVENUE BY product_name 
  
SELECT p.product_name , SUM(oi.quantity * p.price) AS revenue 
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered' 
GROUP BY p.product_name
ORDER BY revenue DESC ;

-- --------------------------------------------------

-- Query 3 : TOP CUSTOMER BY SPEND 

SELECT 	c.name , SUM(p.amount) AS total_spent
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN payments p ON o.order_id = p.order_id
GROUP BY  c.name
ORDER BY total_spent DESC;

-- --------------------------------------------------

-- Query 4 : BEST SELLING PRODUCTS 

 SELECT p.product_name,
       SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- --------------------------------------------------

--  -- Query  5 : CANCELLED ORDERS COUNT

SELECT COUNT(*) AS cancelled_orders
FROM orders
WHERE order_status = 'Cancelled'; 

-- ---------------------------------------------------

-- Query 6 : MONTHLY REVENUE ANALYSIS 

SELECT   MONTH(payment_date) AS month,
    SUM(amount) AS monthly_revenue
FROM payments
GROUP BY MONTH(payment_date)
ORDER BY month;
-- --------------------------------------------------

-- Query 7 : AVERAGE ORDEER VALUE (AOV)

SELECT 
    AVG(amount) AS average_order_value
FROM payments;

--  -- --------------------------------------------------

-- Query 8 : TOTAL ORDERS BY STATUS

SELECT 
    order_status,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_status;

-- ------------------------------------------------

-- Query 9 : CATEGORY WISE REVENUE 

SELECT
    p.category,
    SUM(p.price * oi.quantity) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY revenue DESC;

-- ------------------------------------------------

-- Query 10 : TOP 5 HIGHEST SPENDING CUSTOMERS

SELECT
    c.customer_id,
    c.name,
    SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 5;


-- -----------------------------------------------

-- Query 11 : TOP 5 MOST ORDERED PRODUCTS

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 5;

-- ------------------------------------------------

-- Query 12 : PRODUCTS NEVER ORDERED

SELECT
    p.product_name
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;


-- ------------------------------------------------

-- Query 13 : ORDERS WITHOUT PAYMENT

SELECT
o.order_id 
FROM orders o
LEFT JOIN payments p
ON o.order_id=p.order_id
WHERE p.payment_id IS NULL;


-- --------------------------------------------------
 
-- Query 14 : RANK CUSTOMERS
 
 SELECT
c.name,
SUM(p.amount) total_spent,
RANK() OVER(ORDER BY SUM(p.amount) DESC) ranking
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN payments p
ON o.order_id=p.order_id
GROUP BY c.customer_id,c.name;


-- --------------------------------------------------

-- Query 15 :  TOTAL ORDERS BY EACH CUSTOMERS

SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC, c.customer_id;


-- --------------------------------------------------

-- Query 16 : REPEAT CUSTOMERS

SELECT
customer_id,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;


-- --------------------------------------------------

-- Query 17 : OUT OF STOCK PRODUCTS

SELECT
product_name,
stock
FROM products
WHERE stock = 0;


-- --------------------------------------------------

-- Query 18 : AVERAGE PRODUCT PRICE BY CATEGORY 

SELECT
category,
AVG(price) AS average_price
FROM products
GROUP BY category;


-- --------------------------------------------------

-- QUERY 19  : HIGHEST STOCK PRODUCT 

SELECT
product_name,
stock
FROM products
ORDER BY stock DESC
LIMIT 1;

-- --------------------------------------------------
-- Query 20 : MOST PREFERRED PAYMENT METHOD
 
SELECT
payment_mode,
COUNT(*) AS total_transactions
FROM payments
GROUP BY payment_mode
ORDER BY total_transactions DESC;
-- --------------------------------------------------