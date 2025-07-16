
SELECT SUM(transaction_qty*unit_price)AS total_revenue,
       SUM(transaction_qty) AS number_of_units_sold,
       COUNT(transaction_id) AS number_of_sales, 
       product_category,
       product_type,
       product_detail,
       MONTHNAME(TRANSACTION_DATE) AS month_name,
       CASE
           WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'morning'
           WHEN transaction_time BETWEEN '12:00:00' AND '15:59:59' THEN 'afternoon'
           WHEN transaction_time BETWEEN '16:00:00' AND '20:00:00' THEN 'evening'
           ELSE 'night'
           END AS time_bucket
           FROM coffee_shop.retail_sales.transactions
           GROUP BY
                   time_bucket,
                   month_name,
                   product_type,
                   product_detail,
                   product_category;