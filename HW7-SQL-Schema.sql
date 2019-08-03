-- Create Tables

CREATE TABLE departments (
	dept_no VARCHAR(100) NOT NULL,
	dept_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date TIMESTAMP,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	gender VARCHAR(5),
	hire_date TIMESTAMP,
	PRIMARY KEY (emp_no)
);


CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(100) NOT NULL,
	from_date TIMESTAMP,
	to_date TIMESTAMP,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(100),
	emp_no INT,
	from_date TIMESTAMP,
	to_date TIMESTAMP,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	from_date TIMESTAMP,
	to_date TIMESTAMP,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
	emp_no INT,
	title VARCHAR(100),
	from_date TIMESTAMP,
	to_date TIMESTAMP,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
