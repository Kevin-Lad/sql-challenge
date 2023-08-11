-- Create Statements
CREATE TABLE departments(
  dept_number VARCHAR PRIMARY KEY, 
  dept_name VARCHAR
);

CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

CREATE TABLE employees(
	emp_number INTEGER PRIMARY KEY,
	title_id VARCHAR,
	FOREIGN KEY (title_id) REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

CREATE TABLE department_emp(
	emp_number INTEGER,
	FOREIGN KEY (emp_number) REFERENCES employees(emp_number),
	dept_number VARCHAR,
	FOREIGN KEY (dept_number) REFERENCES departments(dept_number),
	PRIMARY KEY (emp_number, dept_number)
);

CREATE TABLE department_mgr(
	dept_number VARCHAR,
	FOREIGN KEY (dept_number) REFERENCES departments(dept_number),
	emp_number INTEGER,
	FOREIGN KEY (emp_number) REFERENCES employees(emp_number),
	PRIMARY KEY (dept_number,emp_number)
);

CREATE TABLE salaries(
	emp_number INTEGER,
	FOREIGN KEY (emp_number) REFERENCES employees(emp_number),
	salary INTEGER
);

