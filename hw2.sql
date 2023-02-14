postgres=# \c skypro

skypro-# SELECT * FROM employees;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Diana      | Kuzmina   | female |  26
  2 | Pavel      | Fedorov   | male   |  28

skypro=# INSERT INTO employees (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Ivan', 'Ivanov', 'male', 44);
INSERT 0 1
skypro=# INSERT INTO employees (
skypro(# first_name, last_name, gender, age)
skypro-#  VALUES ('Natalya', 'Pehota', 'female', 60);
INSERT 0 1
skypro=# INSERT INTO employees (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Petr', 'Kim', 'male', 51);
INSERT 0 1
skypro=# SELECT * FROM employees;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Diana      | Kuzmina   | female |  26
  2 | Pavel      | Fedorov   | male   |  28
  4 | Ivan       | Ivanov    | male   |  44
  5 | Natalya    | Pehota    | female |  60
  6 | Petr       | Kim       | male   |  51

skypro=# SELECT first_name AS Имя,
skypro-# last_name AS Фамилия
skypro-# FROM employees
skypro-# GROUP BY Фамилия, Имя;
   Имя   | Фамилия
---------+---------
 Diana   | Kuzmina
 Petr    | Kim
 Natalya | Pehota
 Pavel   | Fedorov
 Ivan    | Ivanov

skypro=# SELECT first_name, last_name, gender, age
skypro-# FROM employees
skypro-# WHERE age < 30;
 first_name | last_name | gender | age
------------+-----------+--------+-----
 Diana      | Kuzmina   | female |  26
 Pavel      | Fedorov   | male   |  28

skypro=# SELECT first_name, last_name, gender, age
skypro-# FROM employees
skypro-# WHERE age > 50;
 first_name | last_name | gender | age
------------+-----------+--------+-----
 Natalya    | Pehota    | female |  60
 Petr       | Kim       | male   |  51

skypro=# SELECT first_name, last_name, gender, age
skypro-# FROM employees
skypro-# WHERE age
skypro-# BETWEEN 30 AND 50;
 first_name | last_name | gender | age
------------+-----------+--------+-----
 Ivan       | Ivanov    | male   |  44

skypro=# SELECT first_name, last_name, gender, age
skypro-# FROM employees
skypro-# ORDER BY last_name DESC;
 first_name | last_name | gender | age
------------+-----------+--------+-----
 Natalya    | Pehota    | female |  60
 Diana      | Kuzmina   | female |  26
 Petr       | Kim       | male   |  51
 Ivan       | Ivanov    | male   |  44
 Pavel      | Fedorov   | male   |  28

skypro=# SELECT first_name, last_name, gender, age
skypro-# FROM employees
skypro-# WHERE length(first_name) > 4;
 first_name | last_name | gender | age
------------+-----------+--------+-----
 Diana      | Kuzmina   | female |  26
 Pavel      | Fedorov   | male   |  28
 Natalya    | Pehota    | female |  60

ЗАДАНИЕ 2

skypro=# UPDATE employees SET first_name = 'Pavel' WHERE id = 6;
UPDATE 1
skypro=# UPDATE employees SET first_name = 'Diana' WHERE id = 5;
UPDATE 1
skypro=# SELECT * FROM employees;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Diana      | Kuzmina   | female |  26
  2 | Pavel      | Fedorov   | male   |  28
  4 | Ivan       | Ivanov    | male   |  44
  6 | Pavel      | Kim       | male   |  51
  5 | Diana      | Pehota    | female |  60

skypro=# SELECT first_name AS Имя,
skypro-# SUM(age) AS Суммарный_возраст
skypro-# FROM employees
skypro-# GROUP BY Имя;
  Имя  | Суммарный_возраст
-------+-------------------
 Pavel |                79
 Ivan  |                44
 Diana |                86


skypro=# SELECT first_name AS Имя,
skypro-# MIN(age) AS Самый_юный_возраст
skypro-# FROM employees
skypro-# GROUP BY Имя;
  Имя  | Самый_юный_возраст
-------+--------------------
 Pavel |                 28
 Ivan  |                 44
 Diana |                 26


skypro=# SELECT first_name AS Имя,
skypro-# MAX(age) AS Максимальный_возраст
skypro-# FROM employees
skypro-# GROUP BY Имя
skypro-# HAVING count(first_name) > 1
skypro-# ORDER BY Максимальный_возраст;
  Имя  | Максимальный_возраст
-------+----------------------
 Pavel |                   51
 Diana |                   60