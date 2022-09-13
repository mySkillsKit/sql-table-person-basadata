
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
