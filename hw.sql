-- Q1

SELECT CONCAT(customer.first_name,' ', customer.last_name) as full_name, city, district
FROM customer
JOIN address
ON address.address_id = customer.address_id
JOIN city
ON address.city_id = city.city_id
WHERE district = 'Texas'

-- Answer: 5 peeps live in Texas: Richard, Bryan, Ian, Kim, and Jennifer

-- Q2

SELECT CONCAT(customer.first_name,' ', customer.last_name) as full_name, amount
FROM customer
JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99

-- Answer: A Very Long List of Names.

-- Q3

SELECT CONCAT(customer.first_name,' ', customer.last_name) as full_name
FROM customer
WHERE customer_id in(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) >= 175
    ORDER BY SUM(amount)
);

-- Answer: Rhonda Kennedy, Clara Shaw, Eleanor Hunt, Marion Snyder, Peter Menard, Tommy Collazo, Karl Seal

-- Q4

SELECT CONCAT(customer.first_name,' ', customer.last_name) as full_name, country
FROM customer
JOIN address
ON address.address_id = customer.address_id
JOIN city
ON address.city_id = city.city_id
Join country
ON city.country_id = country.country_id
WHERE country = 'Nepal'

-- Answer: Kevin Schuler lives in Nepal

-- Q5

SELECT COUNT(staff_id), customer_id
FROM payment
GROUP BY customer_id

-- Answer staff_id = 2 has the most transactions

-- Q6

SELECT COUNT(title), rating
FROM film
GROUP BY rating

-- Answer: PG - 194, NC-17 - 210, R - 195, PG-13 - 223, G - 178 

-- Q7
SELECT *
FROM payment
WHERE amount in(
    SELECT amount
    FROM payment
    GROUP BY amount
    HAVING amount > 6.99
);

-- Answer: Using this formula you can see the many people who issued single payments above 6.99 via their customer id's 

-- Q8
SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00

-- Answer: they gave 24 rentals away for free