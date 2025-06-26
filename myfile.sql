Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 46
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bhanu              |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> use bhanu;
Database changed
mysql> show tables;
+-----------------+
| Tables_in_bhanu |
+-----------------+
| customers       |
| emp             |
| student         |
+-----------------+
3 rows in set (0.01 sec)

mysql> show customers;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'customers' at line 1
mysql> desc customers;
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| id      | int         | NO   | PRI | NULL    | auto_increment |
| Name    | varchar(60) | NO   |     | NULL    |                |
| Address | varchar(60) | YES  |     | NULL    |                |
| Salary  | int         | NO   |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> alter table customers add 'age';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''age'' at line 1
mysql> alter table customers add column 'age';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''age'' at line 1
mysql> alter table customers add column age;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> alter table customers add column 'age' int;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''age' int' at line 1
mysql> alter table customers add column age int;
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc customers;
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| id      | int         | NO   | PRI | NULL    | auto_increment |
| Name    | varchar(60) | NO   |     | NULL    |                |
| Address | varchar(60) | YES  |     | NULL    |                |
| Salary  | int         | NO   |     | NULL    |                |
| age     | int         | YES  |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> INSERT INTO customers (Name, Age, Address, Salary)
    -> VALUES
    -> ('Ramesh', 32, 'Ahmedabad', 2000),
    -> ('Khilan', 25, 'Delhi', 1500),
    -> ('Kaushik', 23, 'Kota', 2000),
    -> ('Chaitali', 25, 'Mumbai', 6500),
    -> ('Hardik', 27, 'Bhopal', 8500),
    -> ('Komal', 22, 'MP', 4500),
    -> ('Muffy', 24, 'Indore', 10000);
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> desc customers
    -> desc customers;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desc customers' at line 2
mysql> desc customers;
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| id      | int         | NO   | PRI | NULL    | auto_increment |
| Name    | varchar(60) | NO   |     | NULL    |                |
| Address | varchar(60) | YES  |     | NULL    |                |
| Salary  | int         | NO   |     | NULL    |                |
| age     | int         | YES  |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> INSERT INTO customers (id, Name, Age, Address, Salary)
    -> VALUES
    -> (1, 'Ramesh', 32, 'Ahmedabad', 2000),
    -> (2, 'Khilan', 25, 'Delhi', 1500),
    -> (3, 'Kaushik', 23, 'Kota', 2000),
    -> (4, 'Chaitali', 25, 'Mumbai', 6500),
    -> (5, 'Hardik', 27, 'Bhopal', 8500),
    -> (6, 'Komal', 22, 'MP', 4500),
    -> (7, 'Muffy', 24, 'Indore', 10000);
ERROR 1062 (23000): Duplicate entry '1' for key 'customers.PRIMARY'
mysql> desc customers;
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| id      | int         | NO   | PRI | NULL    | auto_increment |
| Name    | varchar(60) | NO   |     | NULL    |                |
| Address | varchar(60) | YES  |     | NULL    |                |
| Salary  | int         | NO   |     | NULL    |                |
| age     | int         | YES  |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> insert into customers(id,Name,Age,Address,Salary)
    -> values(1,'Ramesh',32,'Ahmedabad',2000)
    -> values(1,'Ramesh',32,'Ahmedabad',2000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'values(1,'Ramesh',32,'Ahmedabad',2000)' at line 3
mysql> values(1,'Ramesh',32,'Ahmedabad',2000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(1,'Ramesh',32,'Ahmedabad',2000)' at line 1
mysql> insert into customers(id,Name,Age,Address,Salary)
    ->     -> values(1,'Ramesh',32,'Ahmedabad',2000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> values(1,'Ramesh',32,'Ahmedabad',2000)' at line 2
mysql> insert into insert into customers(id,Name,Age,Address,Salary)
    -> values(1,'Ramesh',32,'Ahmedabad',2000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'insert into customers(id,Name,Age,Address,Salary)
values(1,'Ramesh',32,'Ahmedaba' at line 1
mysql> insert into customers(id,Name,Age,Address,Salary)
    -> values(1,'Ramesh',32,'Ahmedabad',2000);
ERROR 1062 (23000): Duplicate entry '1' for key 'customers.PRIMARY'
mysql> -- Step 1: Create the table
mysql> CREATE TABLE customers (
    ->     id INT PRIMARY KEY AUTO_INCREMENT,
    ->     Name VARCHAR(60) NOT NULL,
    ->     Age INT,
    ->     Address VARCHAR(60),
    ->     Salary DECIMAL(10,2) NOT NULL
    -> );
ERROR 1050 (42S01): Table 'customers' already exists
mysql>
mysql> -- Step 2: Insert the data
mysql> INSERT INTO customers (id, Name, Age, Address, Salary)
    -> VALUES
    -> (1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
    -> (2, 'Khilan', 25, 'Delhi', 1500.00),
    -> (3, 'Kaushik', 23, 'Kota', 2000.00),
    -> (4, 'Chaitali', 25, 'Mumbai', 6500.00),
    -> (5, 'Hardik', 27, 'Bhopal', 8500.00),
    -> (6, 'Komal', 22, 'MP', 4500.00),
    -> (7, 'Muffy', 24, 'Indore', 10000.00);
ERROR 1062 (23000): Duplicate entry '1' for key 'customers.PRIMARY'
mysql> show tables;
+-----------------+
| Tables_in_bhanu |
+-----------------+
| customers       |
| emp             |
| student         |
+-----------------+
3 rows in set (0.00 sec)

mysql> desc customers;
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| id      | int         | NO   | PRI | NULL    | auto_increment |
| Name    | varchar(60) | NO   |     | NULL    |                |
| Address | varchar(60) | YES  |     | NULL    |                |
| Salary  | int         | NO   |     | NULL    |                |
| age     | int         | YES  |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> ALTER TABLE customers
    -> MODIFY id INT AUTO_INCREMENT PRIMARY KEY;
ERROR 1068 (42000): Multiple primary key defined
mysql> ALTER TABLE customers
    -> MODIFY id INT AUTO_INCREMENT;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO customers (id, Name, Age, Address, Salary)
    -> VALUES
    -> (1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
    -> (2, 'Khilan', 25, 'Delhi', 1500.00),
    -> (3, 'Kaushik', 23, 'Kota', 2000.00),
    -> (4, 'Chaitali', 25, 'Mumbai', 6500.00),
    -> (5, 'Hardik', 27, 'Bhopal', 8500.00),
    -> (6, 'Komal', 22, 'MP', 4500.00),
    -> (7, 'Muffy', 24, 'Indore', 10000.00);
ERROR 1062 (23000): Duplicate entry '1' for key 'customers.PRIMARY'
mysql> INSERT INTO customers (Name, Age, Address, Salary)
    -> VALUES
    -> ('Ramesh', 32, 'Ahmedabad', 2000.00),
    -> ('Khilan', 25, 'Delhi', 1500.00),
    -> ('Kaushik', 23, 'Kota', 2000.00),
    -> ('Chaitali', 25, 'Mumbai', 6500.00),
    -> ('Hardik', 27, 'Bhopal', 8500.00),
    -> ('Komal', 22, 'MP', 4500.00),
    -> ('Muffy', 24, 'Indore', 10000.00);
Query OK, 7 rows affected (0.02 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> desc customers;
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| id      | int         | NO   | PRI | NULL    | auto_increment |
| Name    | varchar(60) | NO   |     | NULL    |                |
| Address | varchar(60) | YES  |     | NULL    |                |
| Salary  | int         | NO   |     | NULL    |                |
| age     | int         | YES  |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> select * from customers;
+----+----------+-----------+--------+------+
| id | Name     | Address   | Salary | age  |
+----+----------+-----------+--------+------+
|  1 | Ramesh   | Ahmedabad |   2000 |   32 |
|  2 | Khilan   | Delhi     |   1500 |   25 |
|  3 | Kaushik  | Kota      |   2000 |   23 |
|  4 | Chaitali | Mumbai    |   6500 |   25 |
|  5 | Hardik   | Bhopal    |   8500 |   27 |
|  6 | Komal    | MP        |   4500 |   22 |
|  7 | Muffy    | Indore    |  10000 |   24 |
|  8 | Ramesh   | Ahmedabad |   2000 |   32 |
|  9 | Khilan   | Delhi     |   1500 |   25 |
| 10 | Kaushik  | Kota      |   2000 |   23 |
| 11 | Chaitali | Mumbai    |   6500 |   25 |
| 12 | Hardik   | Bhopal    |   8500 |   27 |
| 13 | Komal    | MP        |   4500 |   22 |
| 14 | Muffy    | Indore    |  10000 |   24 |
+----+----------+-----------+--------+------+
14 rows in set (0.00 sec)

mysql> delete from customers where id>7;
Query OK, 7 rows affected (0.02 sec)

mysql> select * from customers;
+----+----------+-----------+--------+------+
| id | Name     | Address   | Salary | age  |
+----+----------+-----------+--------+------+
|  1 | Ramesh   | Ahmedabad |   2000 |   32 |
|  2 | Khilan   | Delhi     |   1500 |   25 |
|  3 | Kaushik  | Kota      |   2000 |   23 |
|  4 | Chaitali | Mumbai    |   6500 |   25 |
|  5 | Hardik   | Bhopal    |   8500 |   27 |
|  6 | Komal    | MP        |   4500 |   22 |
|  7 | Muffy    | Indore    |  10000 |   24 |
+----+----------+-----------+--------+------+
7 rows in set (0.00 sec)

mysql> select * from customers where Salary>5000;
+----+----------+---------+--------+------+
| id | Name     | Address | Salary | age  |
+----+----------+---------+--------+------+
|  4 | Chaitali | Mumbai  |   6500 |   25 |
|  5 | Hardik   | Bhopal  |   8500 |   27 |
|  7 | Muffy    | Indore  |  10000 |   24 |
+----+----------+---------+--------+------+
3 rows in set (0.00 sec)

mysql> select * from customers where Salary<>5000;
+----+----------+-----------+--------+------+
| id | Name     | Address   | Salary | age  |
+----+----------+-----------+--------+------+
|  1 | Ramesh   | Ahmedabad |   2000 |   32 |
|  2 | Khilan   | Delhi     |   1500 |   25 |
|  3 | Kaushik  | Kota      |   2000 |   23 |
|  4 | Chaitali | Mumbai    |   6500 |   25 |
|  5 | Hardik   | Bhopal    |   8500 |   27 |
|  6 | Komal    | MP        |   4500 |   22 |
|  7 | Muffy    | Indore    |  10000 |   24 |
+----+----------+-----------+--------+------+
7 rows in set (0.00 sec)

mysql> select * from customers where Salary<>2000;
+----+----------+---------+--------+------+
| id | Name     | Address | Salary | age  |
+----+----------+---------+--------+------+
|  2 | Khilan   | Delhi   |   1500 |   25 |
|  4 | Chaitali | Mumbai  |   6500 |   25 |
|  5 | Hardik   | Bhopal  |   8500 |   27 |
|  6 | Komal    | MP      |   4500 |   22 |
|  7 | Muffy    | Indore  |  10000 |   24 |
+----+----------+---------+--------+------+
5 rows in set (0.00 sec)

mysql> select * from customers;
+----+----------+-----------+--------+------+
| id | Name     | Address   | Salary | age  |
+----+----------+-----------+--------+------+
|  1 | Ramesh   | Ahmedabad |   2000 |   32 |
|  2 | Khilan   | Delhi     |   1500 |   25 |
|  3 | Kaushik  | Kota      |   2000 |   23 |
|  4 | Chaitali | Mumbai    |   6500 |   25 |
|  5 | Hardik   | Bhopal    |   8500 |   27 |
|  6 | Komal    | MP        |   4500 |   22 |
|  7 | Muffy    | Indore    |  10000 |   24 |
+----+----------+-----------+--------+------+
7 rows in set (0.00 sec)

mysql> -- Here are simple examples showing usage of SQL Comparison Operators:
mysql> SELECT * FROM CUSTOMERS WHERE AGE >= 25 AND SALARY >= 6500;
+----+----------+---------+--------+------+
| id | Name     | Address | Salary | age  |
+----+----------+---------+--------+------+
|  4 | Chaitali | Mumbai  |   6500 |   25 |
|  5 | Hardik   | Bhopal  |   8500 |   27 |
+----+----------+---------+--------+------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM CUSTOMERS WHERE AGE >= 25 OR SALARY >= 6500;
+----+----------+-----------+--------+------+
| id | Name     | Address   | Salary | age  |
+----+----------+-----------+--------+------+
|  1 | Ramesh   | Ahmedabad |   2000 |   32 |
|  2 | Khilan   | Delhi     |   1500 |   25 |
|  4 | Chaitali | Mumbai    |   6500 |   25 |
|  5 | Hardik   | Bhopal    |   8500 |   27 |
|  7 | Muffy    | Indore    |  10000 |   24 |
+----+----------+-----------+--------+------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM CUSTOMERS WHERE AGE IS NOT NULL;
+----+----------+-----------+--------+------+
| id | Name     | Address   | Salary | age  |
+----+----------+-----------+--------+------+
|  1 | Ramesh   | Ahmedabad |   2000 |   32 |
|  2 | Khilan   | Delhi     |   1500 |   25 |
|  3 | Kaushik  | Kota      |   2000 |   23 |
|  4 | Chaitali | Mumbai    |   6500 |   25 |
|  5 | Hardik   | Bhopal    |   8500 |   27 |
|  6 | Komal    | MP        |   4500 |   22 |
|  7 | Muffy    | Indore    |  10000 |   24 |
+----+----------+-----------+--------+------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM CUSTOMERS WHERE NAME LIKE 'Ko%';
+----+-------+---------+--------+------+
| id | Name  | Address | Salary | age  |
+----+-------+---------+--------+------+
|  6 | Komal | MP      |   4500 |   22 |
+----+-------+---------+--------+------+
1 row in set (0.00 sec)

mysql> SELECT * FROM CUSTOMERS WHERE AGE IN ( 25, 27 );
+----+----------+---------+--------+------+
| id | Name     | Address | Salary | age  |
+----+----------+---------+--------+------+
|  2 | Khilan   | Delhi   |   1500 |   25 |
|  4 | Chaitali | Mumbai  |   6500 |   25 |
|  5 | Hardik   | Bhopal  |   8500 |   27 |
+----+----------+---------+--------+------+
3 rows in set (0.00 sec)

mysql> -- we can use between
mysql>  SELECT * FROM CUSTOMERS WHERE AGE BETWEEN 25 AND 27;
+----+----------+---------+--------+------+
| id | Name     | Address | Salary | age  |
+----+----------+---------+--------+------+
|  2 | Khilan   | Delhi   |   1500 |   25 |
|  4 | Chaitali | Mumbai  |   6500 |   25 |
|  5 | Hardik   | Bhopal  |   8500 |   27 |
+----+----------+---------+--------+------+
3 rows in set (0.01 sec)

mysql> --EXISTS Clause:
    -> The EXISTS keyword checks whether a subquery returns any rows.
    ->
    -> If the subquery returns at least one row, the EXISTS condition evaluates to TRUE → the outer query will return results.
    ->
    -> If the subquery returns no rows, the EXISTS condition evaluates to FALSE → the outer query will return no results.
    ->
    ->
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--EXISTS Clause:
The EXISTS keyword checks whether a subquery returns any rows.
' at line 1
mysql>  SELECT AGE FROM CUSTOMERS
    -> WHERE EXISTS (SELECT AGE FROM CUSTOMERS WHERE SALARY > 6500);
+------+
| AGE  |
+------+
|   32 |
|   25 |
|   23 |
|   25 |
|   27 |
|   22 |
|   24 |
+------+
7 rows in set (0.01 sec)

mysql> If the subquery returns no rows, the EXISTS condition evaluates to FALSE → the outer query will return no results.;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'If the subquery returns no rows, the EXISTS condition evaluates to FALSE → the' at line 1
mysql>  SELECT AGE FROM CUSTOMERS
    ->  where exists(select age from customers where salary>6500);
+------+
| AGE  |
+------+
|   32 |
|   25 |
|   23 |
|   25 |
|   27 |
|   22 |
|   24 |
+------+
7 rows in set (0.00 sec)

mysql>  SELECT * FROM CUSTOMERS
    -> WHERE AGE > ALL (SELECT AGE FROM CUSTOMERS WHERE SALARY > 6500);
+----+--------+-----------+--------+------+
| id | Name   | Address   | Salary | age  |
+----+--------+-----------+--------+------+
|  1 | Ramesh | Ahmedabad |   2000 |   32 |
+----+--------+-----------+--------+------+
1 row in set (0.01 sec)

mysql>