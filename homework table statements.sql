-- Create Statements
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments(
  dept_no VARCHAR PRIMARY KEY, 
  dept_name VARCHAR
);

DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex CHAR(1),
	hire_date DATE
);

DROP TABLE IF EXISTS department_emp CASCADE;
CREATE TABLE department_emp(
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

DROP TABLE IF EXISTS department_mgr CASCADE;
CREATE TABLE department_mgr(
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no)
);

DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE salaries(
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER
);

