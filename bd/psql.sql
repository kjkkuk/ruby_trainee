--insert
INSERT INTO actor (actor_id, first_name, last_name)
VALUES (201, 'Dmitry', 'Yakutovich');

--update
UPDATE actor
SET first_name = 'Alexandr',
    last_name = 'Sivakoff'
WHERE actor_id = 201;

--delete
DELETE FROM actor
WHERE actor_id = 201;

--where
SELECT
	last_name,
	first_name
FROM
	actor
WHERE
	first_name = 'Jamie';

--order by
SELECT
       first_name,
       last_name
FROM
       actor
ORDER BY
       last_name DESC;

--limit
SELECT
	film_id,
	title,
	description
FROM
	film
ORDER BY
	film_id
LIMIT 5 offset 4;

--like
SELECT
	first_name,
    last_name
FROM
	actor
WHERE
	first_name LIKE 'Jen%';

-- distinct
SELECT
   DISTINCT country,
   country_id
FROM
   country
ORDER BY
   country_id,
   country;

--inner join
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
INNER JOIN basket_b
    ON fruit_a = fruit_b;

--left join
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
LEFT JOIN basket_b 
   ON fruit_a = fruit_b;

--


--group by
SELECT 
	customer_id, 
	staff_id, 
	SUM(amount) 
FROM 
	payment
GROUP BY 
	staff_id, 
	customer_id
ORDER BY 
    customer_id;

--having 
SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id
HAVING
	SUM (amount) > 200;

--union
SELECT * FROM store
UNION
SELECT * FROM city
ORDER BY city_id;
