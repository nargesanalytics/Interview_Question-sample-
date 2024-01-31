CREATE DATABASE question;
USE question;
/*1. Delete table Employee, Department and Company.*/

DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Company;


/*
2. Create tables:

Employee with attributes (id, name, city, department, salary)
Department with attributes (id, name)
Company with attributes (id, name, revenue)
*/
DROP TABLE employee;
CREATE TABLE employee(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL ,
    city VARCHAR(150) NOT NULL ,
    department_id INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id)

);

CREATE TABLE Department(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Company(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL ,
    revenue INT

);

/*
4. Add rows into Department table
(1, 'IT'),
(2, 'Management'),
(3, 'IT'),
(4, 'Support');
*/

INSERT INTO Department VALUES (1, 'IT');
INSERT INTO Department VALUES (2, 'Management');
INSERT INTO Department VALUES (3, 'IT');
INSERT INTO Department VALUES (4, 'Support');

/*
5. Add rows into Company table
(1, 'IBM', 2000000),
(2, 'GOOGLE', 9000000),
(3, 'Apple', 10000000);
*/

INSERT INTO Company VALUES (1, 'IBM', 2000000);
INSERT INTO Company VALUES (2, 'GOOGLE', 9000000);
INSERT INTO Company VALUES (3, 'Apple', 10000000);


/*
3.Add rows into employee table:
(1, 'David', 'London', 'IT', 80000),
(2, 'Emily', 'London', 'IT', 70000),
(3, 'Peter', 'Paris', 'IT', 60000),
(4, 'Ava', 'Paris', 'IT', 50000),
(5, 'Penny', 'London', 'Management', 110000),
(6, 'Jim', 'London', 'Management', 90000),
(7, 'Amy', 'Rome', 'Support', 30000),
(8, 'Cloe', 'London', 'IT', 110000);
*/

INSERT INTO employee(name, city, department_id, salary)
VALUES
('David', 'London', 3, 80000),
('Emily', 'London', 3, 70000),
('Peter', 'Paris', 3, 60000),
('Ava', 'Paris', 3, 50000),
('Penny', 'London', 2, 110000),
('Jim', 'London', 2, 90000),
('Amy', 'Rome', 4, 30000),
('Cloe', 'London', 3, 110000);

/*
6. Query all rows from Department table
*/

SELECT *
FROM department;

/*
7. Change the name of department with id =  1 to 'Management'
*/

UPDATE Department
SET name = 'Management'
WHERE id = 4;

/*
8. Delete employees with salary greater than 100 000
*/
DELETE FROM employee
WHERE salary > 100000;

SELECT * FROM employee;


/*
9. Query the names of companies
*/
SELECT Company.name
FROM Company;

/*
10. Query the name and city of every employee
*/

SELECT employee.name , employee.city
FROM employee;

/*
11. Query all companies with revenue greater than 5 000 000
*/

SELECT * FROM Company;
SELECT id, name, revenue
FROM Company
WHERE revenue > 5000000;

/*
12. Query all companies with revenue smaller than 5 000 000
*/

SELECT *
FROM Company
WHERE revenue < 5000000;

/*
13. Query all companies with revenue smaller than 5 000 000, but you cannot use the '<' operator
*/
SELECT *
FROM Company
ORDER BY revenue DESC
LIMIT 1;

/*
14. Query all employees with salary greater than 50 000 and smaller than 70 000
*/

SELECT *
FROM employee
WHERE salary BETWEEN 50000 AND 70000;

/*
15. Query all employees with salary greater than 50 000 and smaller than 70 000, but you cannot use BETWEEN
*/

SELECT *
FROM employee
WHERE salary >=50000 AND salary<= 70000;

/*
16. Query all employees with salary equal to 80 000
*/

SELECT *
FROM employee
WHERE salary = 80000;


/*
17. Query all employees with salary not equal to 80 000
*/

SELECT *
FROM employee
WHERE salary <> 80000;

/*
18. Query all names of employees with salary greater than 70 000 together with employees who work on the 'IT' department.
*/

SELECT e.name
FROM employee e
JOIN question.department d on d.id = e.department_id
WHERE e.salary > 70000 OR d.name = 'IT';

/* version 2*/
SELECT name FROM employee
WHERE salary > 70000
OR department_id IN (
	SELECT id FROM department
    WHERE name = 'IT'
);

/*
19. Query all employees that work in city that starts with 'L'
*/

SELECT *
FROM employee
WHERE city LIKE 'L%';

/*
20. Query all employees that work in city that starts with 'L' or ends with 's'
*/

SELECT *
FROM employee
WHERE city LIKE '%L' OR city LIKE '%s';

/*
21. Query all employees that  work in city with 'o' somewhere in the middle
*/

SELECT *
FROM employee
WHERE city LIKE '%o%';

/*
22. Query all departments (each name only once)
*/

SELECT DISTINCT name
FROM Department;

/*
23. Query names of all employees together with id of department they work in, but you cannot use JOIN
*/

SELECT e.name,e.id,d.id
FROM employee e,department d
WHERE e.department_id =d.id
GROUP BY e.name,e.id ;


/*
24. Query names of all employees together with id of department they work in, using JOIN
*/

SELECT e.name,e.id,d.id
FROM employee e
JOIN question.department d on d.id = e.department_id
GROUP BY e.name,e.id ;

/*
24. Query name of every company together with every department
Personal thoughts: It is kinda weird question, as there is no relationship between company and department
*/

SELECT *
FROM department;

SELECT c.name, d.name
FROM company c,department d
ORDER BY c.name;

/*
25. Query name of every company together with departments without the 'Support' department
*/

SELECT c.name, d.name
FROM company c,department d
WHERE d.name <> 'Support'
ORDER BY c.name;

/*
26. Query employee name together with the department name that they are not working in
*/

SELECT e.name,d.name
FROM employee e,department d
WHERE d.id <> e.department_id;

/*
27. Query company name together with other companies names
LIKE:
GOOGLE Apple
GOOGLE IBM
Apple IBM
...
*/
SELECT c1.name,c2.name
FROM company c1,company c2
# WHERE c1.name <> c2.name
ORDER BY c1.name,c2.name;


/*
28. Query employee names with salary smaller than 80 000 without using NOT and <
NOTE: for POSTGRESQL only. Mysql doesn't support except
*/
SELECT e1.name FROM employee e1
EXCEPT
SELECT e2.name FROM employee e2 WHERE e2.salary >= 80000;
/*
29.Query names of every company and change the name of column to 'Company'
*/
SELECT Company.name AS Company
FROM company;

/*
30. Query all employees that work in same department as Peter
*/
SELECT *
FROM employee
WHERE department_id IN(SELECT department_id FROM employee WHERE name LIKE 'Peter')
AND name NOT LIKE 'Peter';