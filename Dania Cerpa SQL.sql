1.--Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.


--Insertar Customer
SELECT * FROM country co
JOIN city ci
on co.country_id = ci.country_id
WHERE country ILIKE 'Chile';


SELECT * FROM city;
INSERT INTO city VALUES
(default, 'Santiago', 22, default);


SELECT * FROM address;
INSERT INTO address VALUES
(default, 'Olga Norte', null, 'Metropolitana', 601, null, 999141750, default);

SELECT * FROM address
WHERE address ilike 'Olga Norte';


SELECT * FROM customer;
INSERT INTO customer (store_id, first_name, last_name, email, address_id) VALUES
(2, 'Adan', 'Medina', 'adan.medina@sakilacustomer.org', 607) returning *;

--Modificar customer
UPDATE customer SET active = 1 
WHERE first_name = 'Adan' AND last_name = 'Medina' returning *;

--Eliminar customer
DELETE FROM customer 
WHERE first_name = 'Adan' AND last_name = 'Medina';


--Insertar Staff

SELECT * FROM address;
INSERT INTO address VALUES
(default, 'Diego Silva', null, 'Metropolitana', 601, null, 992785501, default);

SELECT * FROM address
WHERE address ilike 'Diego Silva'

SELECT * FROM staff;
INSERT INTO staff (first_name, last_name, address_id, email, store_id, username) VALUES
('Juan', 'Gomez', 608, 'juan.gomez@sakilacustomer.org',2, 'Juanito') returning *;

--Modificar staff

UPDATE staff SET email = 'Juan.gomez@sakilastaff.org' 
WHERE first_name = 'Juan' AND last_name = 'Gomez' returning *;

--Eliminar staff
DELETE FROM staff
WHERE first_name = 'Juan' AND last_name = 'Gomez';


--Insertar actor

SELECT * FROM actor;
INSERT INTO actor VALUES
(default, 'Maria', 'Gertrudiz', default) returning *;

--Modificar actor

UPDATE actor SET last_name = 'Gertrudis' 
WHERE first_name = 'Maria' AND last_name = 'Gertrudiz' returning *;

--Eliminar actor

DELETE FROM actor
WHERE actor_id = 201;



2.--Listar todas las “rental” con los datos del “customer” dado un año y mes.

SELECT r.rental_id, r.rental_date, r.inventory_id, r.customer_id, r.return_date, c.first_name, c.last_name, c.email FROM rental r
JOIN customer c
ON r.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM rental_date) = 2005
AND EXTRACT(MONTH FROM rental_date) = 7;


--Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.

SELECT payment_id "Numero", payment_date "Fecha", amount "Total" FROM payment
ORDER BY "Total";


--Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.


SELECT * FROM film 
WHERE release_year = 2006 AND rental_rate > 4
ORDER BY title;

2.--Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente

SELECT isc.table_name "Tabla", 	
 isc.column_name "Columna",
 isc.is_nullable  "Acepta Nulo",
 isc.data_type "Tipo de dato"
FROM
 information_schema.columns isc
INNER JOIN PG_CLASS t2 ON (t2.RELNAME = isc.TABLE_NAME)
WHERE
isc.TABLE_SCHEMA = 'public'
ORDER BY
isc.TABLE_NAME;

