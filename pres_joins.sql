-- Inner Join
SELECT customer.first_name, customer.last_name, "order".order_date, "order".amount
FROM customer
JOIN "order"
ON customer.customer_id = "order".customer_id;

-- Left Join
SELECT first_name, last_name, order_date, amount
FROM customer
LEFT JOIN "order"
ON customer.customer_id = "order".customer_id;

-- Right Join
SELECT first_name, last_name, order_date, amount
FROM customer
RIGHT JOIN "order"
ON customer.customer_id = "order".customer_id;

-- Left Join from reversed
SELECT first_name, last_name, order_date, amount
FROM "order"
LEFT JOIN customer
ON customer.customer_id = "order".customer_id;

-- Full Outer Join
SELECT first_name, last_name, order_date, amount
FROM "order"
FULL OUTER JOIN customer
ON customer.customer_id = "order".customer_id;

-- Left join only nulls
SELECT first_name, last_name, order_date, amount
FROM customer
LEFT JOIN "order"
ON customer.customer_id = "order".customer_id
WHERE "order".customer_id IS NULL;

-- Right join only nulls
SELECT first_name, last_name, order_date, amount
FROM customer
RIGHT JOIN "order"
ON customer.customer_id = "order".customer_id
WHERE "order".customer_id IS NULL;

-- Full Outer Join Nulls
SELECT first_name, last_name, order_date, amount
FROM customer
FULL OUTER JOIN "order"
ON customer.customer_id = "order".customer_id
WHERE "customer".customer_id IS NULL OR "order".customer_id IS NULL;
