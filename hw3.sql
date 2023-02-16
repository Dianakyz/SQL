postgres=# \c skypro

skypro=# CREATE TABLE city (
    skypro(# city_id BIGSERIAL NOT NULL PRIMARY KEY,
        skypro(# name_city VARCHAR(60)
        skypro(# );

skypro=# SELECT * FROM city;

skypro=# SELECT * FROM employees;

skypro=# ALTER TABLE employees ADD COLUMN city_id  bigint;

skypro=# SELECT * FROM employees;

skypro=# ALTER TABLE employees
    skypro-# ADD CONSTRAINT city FOREIGN KEY (city_id)
    skypro-# REFERENCES city (city_id);

skypro=# INSERT INTO city (
skypro(#  name_city)
skypro-# VALUES ('Moscow');
skypro=# INSERT INTO city (
skypro(# name_city)
skypro-# VALUES ('Astrakhan');
skypro=# INSERT INTO city (
skypro(#  name_city)
skypro-# VALUES ('Vologda');
skypro=# INSERT INTO city (
skypro(# name_city)
skypro-# VALUES ('Vladimir');

skypro=# UPDATE employees SET city_id = 1 WHERE id = 1;
skypro=# UPDATE employees SET city_id = 1 WHERE id = 2;
skypro=# UPDATE employees SET city_id = 3 WHERE id = 4;
skypro=# UPDATE employees SET city_id = 2 WHERE id = 5;
skypro=# UPDATE employees SET city_id = 2 WHERE id = 6;

skypro=# SELECT * FROM employees;
 id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  1 | Diana      | Kuzmina   | female |  26 |       1
  2 | Pavel      | Fedorov   | male   |  28 |       1
  4 | Ivan       | Ivanov    | male   |  44 |       3
  5 | Diana      | Pehota    | female |  60 |       2
  6 | Pavel      | Kim       | male   |  51 |       2

skypro=# SELECT first_name, last_name, name_city
skypro-# FROM employees
skypro-# INNER JOIN city
skypro-# ON employees.city_id = city.city_id;
 first_name | last_name | name_city
------------+-----------+-----------
 Diana      | Kuzmina   | Moscow
 Pavel      | Fedorov   | Moscow
 Ivan       | Ivanov    | Vologda
 Diana      | Pehota    | Astrakhan
 Pavel      | Kim       | Astrakhan

skypro=# SELECT first_name, last_name, name_city
skypro-#  FROM city LEFT JOIN employees
skypro-# ON employees.city_id = city.city_id
skypro-# ORDER BY name_city;
 first_name | last_name | name_city
------------+-----------+-----------
 Diana      | Pehota    | Astrakhan
 Pavel      | Kim       | Astrakhan
 Diana      | Kuzmina   | Moscow
 Pavel      | Fedorov   | Moscow
            |           | Vladimir
 Ivan       | Ivanov    | Vologda

skypro=# INSERT INTO employees (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Vladimir', 'Letov', 'female', 42);
skypro=# SELECT first_name,name_city
skypro-# FROM city FULL OUTER JOIN employees
skypro-# ON employees.city_id = city.city_id
skypro-# ORDER BY name_city;
 first_name | name_city
------------+-----------
 Diana      | Astrakhan
 Pavel      | Astrakhan
 Diana      | Moscow
 Pavel      | Moscow
            | Vladimir
 Ivan       | Vologda
 Vladimir   |

skypro=# SELECT first_name,name_city
skypro-# FROM city
skypro-# CROSS JOIN employees;
 first_name | name_city
------------+-----------
 Diana      | Moscow
 Pavel      | Moscow
 Ivan       | Moscow
 Diana      | Moscow
 Pavel      | Moscow
 Vladimir   | Moscow
 Diana      | Astrakhan
 Pavel      | Astrakhan
 Ivan       | Astrakhan
 Diana      | Astrakhan
 Pavel      | Astrakhan
 Vladimir   | Astrakhan
 Diana      | Vologda
 Pavel      | Vologda
 Ivan       | Vologda
 Diana      | Vologda
 Pavel      | Vologda
 Vladimir   | Vologda
 Diana      | Vladimir
 Pavel      | Vladimir
 Ivan       | Vladimir
 Diana      | Vladimir
 Pavel      | Vladimir
 Vladimir   | Vladimir
