CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5),
    birth_date DATE NOT NULL,
    first_name VARCHAR(14) NOT NULL,
    last_name VARCHAR(16) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY titles (title_id, title)
FROM '/Users/jordancks/SQL-CHALLENGE/Starter_Code/data/titles.csv'
DELIMITER ','
CSV HEADER;

COPY departments (dept_no, dept_name)
FROM '/Users/jordancks/SQL-CHALLENGE/Starter_Code/data/departments.csv'
DELIMITER ','
CSV HEADER;

COPY employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM '/Users/jordancks/SQL-CHALLENGE/Starter_Code/data/employees.csv'
DELIMITER ','
CSV HEADER;

COPY dept_emp (emp_no, dept_no)
FROM '/Users/jordancks/SQL-CHALLENGE/Starter_Code/data/dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY dept_manager (dept_no, emp_no)
FROM '/Users/jordancks/SQL-CHALLENGE/Starter_Code/data/dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY salaries (emp_no, salary)
FROM '/Users/jordancks/SQL-CHALLENGE/Starter_Code/data/salaries.csv'
DELIMITER ','
CSV HEADER;