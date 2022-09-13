/
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