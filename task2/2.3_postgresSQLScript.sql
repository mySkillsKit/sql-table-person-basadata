/*
Напишите скрипт, который будет возвращать из таблиц поля product_name
для пользователей с именем alexey независимо от регистра ввода имени.
 */

--variant 1
SELECT product_name
FROM orders
WHERE customer_id IN (
    SELECT id
    FROM customers c
         -- WHERE name ILIKE 'alexey'
    WHERE LOWER(name) = LOWER('alexey'));


--variant 2 with JOIN
SELECT product_name,
       c.name,
       c.surname
FROM orders
         JOIN customers c on c.id = orders.customer_id
WHERE LOWER(name) = LOWER('aleXey');


--Удаление таблицы
-- DROP TABLE orders;
-- DROP TABLE customers;
-- DROP TABLE customers;