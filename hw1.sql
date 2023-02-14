CREATE DATABASE skypro;
postgres=# \c skypro
skypro=# CREATE TABLE employees (
        skypro(# id BIGSERIAL NOT NULL PRIMARY KEY,
        skypro(# first_name VARCHAR(50) NOT NULL,
        skypro(# last_name VARCHAR(50) NOT NULL,
        skypro(# gender VARCHAR(6) NOT NULL,
        skypro(# age INT NOT NULL
        skypro(# );
CREATE TABLE
    skypro=# INSERT INTO employees (
                                       skypro(# first_name, last_name, gender, age)
    skypro-# VALUES ('Diana', 'Kuzmina', 'female', 26);
    INSERT 0 1
    skypro=# INSERT INTO employees (
                                       skypro(# first_name, last_name, gender, age)
    skypro-# VALUES ('Pavel', 'Fedorov', 'male', 28);
    INSERT 0 1
    skypro=# INSERT INTO employees (
                                       skypro(# first_name, last_name, gender, age)
    skypro-#  VALUES ('Milena', 'Velichko', 'female', 20);
    INSERT 0 1
    skypro=#  SELECT * FROM employees;
    id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
    1 | Diana      | Kuzmina   | female |  26
    2 | Pavel      | Fedorov   | male   |  28
    3 | Milena     | Velichko  | female |  20
    skypro=# UPDATE employees SET first_name = 'Ivan' WHERE id = 3;
    UPDATE 1
    skypro=# UPDATE employees SET last_name = 'Vetrov' WHERE id = 3;
    UPDATE 1
    skypro=# UPDATE employees SET gender = 'male' WHERE id = 3;
    UPDATE 1
    skypro=# UPDATE employees SET age = 30  WHERE id = 3;
    UPDATE 1
    skypro=# SELECT * FROM employees;
    id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
    1 | Diana      | Kuzmina   | female |  26
    2 | Pavel      | Fedorov   | male   |  28
    3 | Ivan       | Vetrov    | male   |  30
    skypro=# DELETE FROM employees WHERE id = 3;
    DELETE 1
    skypro=# SELECT * FROM employees;
    id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
    1 | Diana      | Kuzmina   | female |  26
    2 | Pavel      | Fedorov   | male   |  28
