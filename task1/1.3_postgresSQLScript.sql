/*
 Напишите скрипт, который будет искать в таблице
 PERSONS все поля, у которых поле age выше 27 лет.
 Отсортируем получаемые результаты по убыванию возраста.
 */

SELECT *
FROM persons
WHERE age > 27
ORDER BY age DESC;


--Удаление таблицы
-- DROP TABLE persons;