# SQL Interview Questions and Solutions

## Description

This repository contains a curated collection of common SQL interview questions, along with SQL query solutions.
It is designed to help individuals preparing for SQL-related job interviews by providing practice questions and solutions.

## Table of Contents

- [Getting Started](#getting-started)
- [Questions and Solutions](#questions-and-solutions)
- [Contributing](#contributing)

## Getting Started

To get started with this project, simply clone the repository:

```bash
git clone https://github.com/nargesanalytics/Sample_Interviw_Questions.sql.git
```

### Questions and Solutions

1. Delete table Employee, Department and Company.
  
2. Create tables:
  - Employee with attributes (id, name, city, department, salary)
  - Department with attributes (id, name)
  - Company with attributes (id, name, revenue).

    
3.Add rows into Department table
  - (1, 'IT'),
  - (2, 'Management'),
  - (3, 'IT'),
  - (4, 'Support')

4.  Add rows into Company table
- (1, 'IBM', 2000000),
- (2, 'GOOGLE', 9000000),
- (3, 'Apple', 10000000)


5. Add rows into employee table:
- (1, 'David', 'London', 'IT', 80000),
- (2, 'Emily', 'London', 'IT', 70000),
- (3, 'Peter', 'Paris', 'IT', 60000),
- (4, 'Ava', 'Paris', 'IT', 50000),
- (5, 'Penny', 'London', 'Management', 110000),
- (6, 'Jim', 'London', 'Management', 90000),
- (7, 'Amy', 'Rome', 'Support', 30000),
- (8, 'Cloe', 'London', 'IT', 110000)

......

30.Query all employees that work in same department as Peter

- SELECT *
- FROM employee
- WHERE department_id IN(SELECT department_id FROM employee WHERE name LIKE 'Peter')
- AND name NOT LIKE 'Peter';


### Contributing

Encourage others to contribute to your project. Provide guidelines on how to contribute, such as creating issues, making pull requests, or suggesting new questions.

```markdown
## Contributing

Contributions are welcome! If you have new questions or improvements to existing solutions, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or fix.
3. Make your changes and commit them.
4. Submit a pull request.



