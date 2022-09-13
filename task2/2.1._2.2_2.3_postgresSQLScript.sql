
/*
 Напишите скрипт создания таблицы со следующими параметрами:
 - название таблицы - `CUSTOMERS`
 - содержит в себе 5 столбцов - `id`, `name`, `surname`, `age`, `phone_number`
 - первичным ключом будет поле `id`, который инкрементируется каждый раз,
  при создании пользователя
 */
CREATE SCHEMA netology


CREATE TABLE customers
(
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(128) NOT NULL,
    surname      VARCHAR(128) NOT NULL,
    age          INT CHECK ( age > 0 AND age < 150 ),
    phone_number VARCHAR(50) NOT NULL
    -- UNIQUE(name, surname)
);

INSERT INTO customers(name, surname, age, phone_number)
VALUES ('Pert', 'Petrov', 37, '9384877'),
       ('Ivan', 'Ivanov', 27, '3646466'),
       ('Pert', 'Sidorov', 18, '3464677'),
       ('Sergey', 'Alekseev', 39, '9384877'),
       ('Fedor', 'Fedorov', 67, '6786545'),
       ('Stepan', 'Stepanov', 32, '3545788'),
       ('Alexey', 'Ivanov', 84, '9384877'),
       ('Pert', 'Ivanov', 23, '8664445'),
       ('Alexey', 'Petrov', 43, '6544567'),
       ('Fedor', 'Petrov', 21, '6556785'),
       ('Igor', 'Aleksandrov', 22, '9384877');


/*
Напишите скрипт создания таблицы со следующими параметрами:
 - название таблицы - `ORDERS`
 - содержит в себе 4 столбца - `id`, `date`, `customer_id`,`product_name`, `amount`
 - первичным ключом будет поле `id`, который инкрементируется каждый раз, при создании заказа
 - внешним ключом на поле `id` таблицы пользователей будет `customer_id`
*/

CREATE TABLE orders
(
    id           SERIAL PRIMARY KEY,
    date         DATE         NOT NULL,
    customer_id  INT REFERENCES customers (id),
    product_name VARCHAR(128) NOT NULL,
    amount       INT          NOT NULL
    -- FOREIGN KEY (customer_id) REFERENCES customers
);


INSERT INTO orders (date, customer_id, product_name, amount)
VALUES ('2020-03-08', 7, 'iphone XR', 63000),
       ('2021-01-18', 5, 'iphone 12Pro', 96000),
       ('2019-08-11', 3, 'Samsung S6', 34000),
       ('2022-12-28', 1, 'Xiaomi Q2', 13000),
       ('2019-03-12', 5, 'Nokia 3310', 8000),
       ('2021-04-04', 6, 'iphone XR', 63000),
       ('2022-07-17', 3, 'Sony X2', 23000),
       ('2022-04-09', 9, 'Samsung F8', 68000);


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
