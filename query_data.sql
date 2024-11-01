-- 1. Create a temporary table that joins the orders, order_products, and products tables.
--    This table, `order_info`, will contain detailed information about each order, including
--    products purchased and the associated department and aisle information.

CREATE TEMPORARY TABLE order_info AS
SELECT 
    o.order_id AS order_id,         -- Order ID from orders table
    o.order_number,                 -- Order number from orders table
    o.order_dow,                    -- Day of week from orders table
    o.order_hour_of_day,            -- Hour of day from orders table
    o.days_since_prior_order,       -- Days since prior order from orders table
    op.product_id,                  -- Product ID from order_products table
    op.add_to_cart_order,           -- Add to cart order from order_products table
    op.reordered,                    -- Reordered flag from order_products table
    p.product_name,                  -- Product name from products table
    p.aisle_id,                     -- Aisle ID from products table
    p.department_id                  -- Department ID from products table
FROM orders AS o
JOIN order_products AS op ON o.order_id = op.order_id
JOIN products AS p ON op.product_id = p.product_id;

select * from order_info;

SELECT * FROM products;
select * from order_products;

-- 2. Create a temporary table that groups orders by product, `product_order_summary`,
--    providing each product's total purchase count, reorder count, and average add-to-cart order.


CREATE TEMPORARY TABLE product_order_summary AS
    SELECT product_id, product_name, COUNT(*) AS total_orders,
           COUNT(CASE WHEN reordered = 1 THEN 1 ELSE NULL END) AS total_reorders,
           AVG(add_to_cart_order) AS avg_add_to_cart
    FROM order_info
    GROUP BY product_id, product_name;

SELECT * from product_order_summary;

-- 3. Create a temporary table that groups orders by department, `department_order_summary`,
--    summarizing purchase totals and averages, including weekday vs weekend purchases and average order time.

CREATE TEMPORARY TABLE department_order_summary AS
    SELECT department_id, COUNT(*) AS total_products_purchased,
           COUNT(DISTINCT product_id) AS total_unique_products_purchased,
           COUNT(CASE WHEN order_dow < 6 THEN 1 ELSE NULL END) AS total_weekday_purchases,
           COUNT(CASE WHEN order_dow >= 6 THEN 1 ELSE NULL END) AS total_weekend_purchases,
           AVG(order_hour_of_day) AS avg_order_time
    FROM order_info
    GROUP BY department_id;

select * from department_order_summary;

-- 4. Create a temporary table that groups orders by aisle, `aisle_order_summary`,
--    listing the top 10 most popular aisles based on total products purchased, 
--    along with the count of unique products in each aisle.

CREATE TEMPORARY TABLE aisle_order_summary AS
    SELECT aisle_id, COUNT(*) AS total_products_purchased,
           COUNT(DISTINCT product_id) AS total_unique_products_purchased
    FROM order_info
    GROUP BY aisle_id
    ORDER BY COUNT(*) DESC
    LIMIT 10;

select * from aisle_order_summary;

-- 5. Combine the information from all temporary tables into `product_behavior_analysis`,
--    which provides a comprehensive view of each product including its purchase stats, 
--    department, and aisle details. 
CREATE TEMPORARY TABLE product_behavior_analysis AS
    SELECT pi.product_id, pi.product_name, pi.department_id, d.department, pi.aisle_id, a.aisle,
           pos.total_orders, pos.total_reorders, pos.avg_add_to_cart,
           dos.total_products_purchased, dos.total_unique_products_purchased,
           dos.total_weekday_purchases, dos.total_weekend_purchases, dos.avg_order_time
    FROM product_order_summary AS pos
    JOIN products AS pi ON pos.product_id = pi.product_id
    JOIN departments AS d ON pi.department_id = d.department_id
    JOIN aisles AS a ON pi.aisle_id = a.aisle_id
    JOIN department_order_summary AS dos ON pi.department_id = dos.department_id

select * from product_behavior_analysis;
