-- Multi JOINS DVD DATABASE

SELECT first_name, last_name, title
FROM actor
JOIN film_actor
ON actor.actor_id = film_actor.actor_id
JOIN film
ON film.film_id = film_actor.film_id
WHERE first_name = 'Tom';

-- Customer info for people from Angola
-- first name, last name, email, country
SELECT CONCAT(customer.first_name,' ', customer.last_name) as full_name, customer.email, country.country
FROM customer
JOIN address
ON address.address_id = customer.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country.country = 'Angola';

-- They want the first and last name of all actors
--that appeared in films in 2006 and
-- the count of those films

SELECT first_name, last_name, COUNT(*)
FROM actor
JOIN film_actor
ON actor.actor_id = film_actor.actor_id
JOIN film
ON film.film_id = film_actor.film_id
WHERE release_year = 2006
GROUP BY actor.actor_id
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT * FROM actor WHERE first_name = 'Susan';

-- Basic Subquery
-- Find the customers that have total amount of payments greater than 175
SELECT *
FROM customer
WHERE customer_id in(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) >= 175
    ORDER BY SUM(amount)
);

--Find all films with a language of 'English'
SELECT *
FROM film
WHERE language_id IN(
    SELECT language_id
    FROM language
    WHERE name = 'English'
);

-- I want all the
--counts of movie ratings for rating with over 100 movies

SELECT * FROM(
    SELECT COUNT(rating) as cnt_rate,rating
    FROM film 
    GROUP BY rating
    ) as cnts
WHERE cnts.cnt_rate > 100;


SELECT DISTINCT CONCAT(actor.first_name, ' ', actor.last_name) as actor_full_name, actor_id
FROM actor

SELECT * FROM
(
SELECT 
CONCAT(customer.first_name, ' ', customer.last_name) as customer_full_name,
actor_full_name,
COUNT(actor_full_name) as number_of_rental_appearances
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON film.film_id = inventory.film_id
JOIN film_actor ON film_actor.film_id = film.film_id
JOIN (SELECT DISTINCT
    CONCAT(actor.first_name, ' ', actor.last_name) as actor_full_name, actor_id 
    FROM actor
    ) as a_names on a_names.actor_id = film_actor.actor_id
GROUP BY customer_full_name, actor_full_name
ORDER BY customer_full_name, number_of_rental_appearances DESC) as actor_appear_cusomter
WHERE number_of_rental_appearances >3;