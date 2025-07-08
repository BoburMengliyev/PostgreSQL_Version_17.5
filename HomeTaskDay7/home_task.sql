CREATE TABLE employees (
	employee_id SERIAL PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	position VARCHAR(50),
	salary NUMERIC(10,2),
	hire_date DATE,
	department_id INT
);

CREATE TABLE departments (
	department_id SERIAL PRIMARY KEY,
	department_name VARCHAR(100) NOT NULL
);

CREATE TABLE projects(
	project_id SERIAL PRIMARY KEY,
	project_name VARCHAR(100) NOT NULL,
	start_date DATE,
	end_date DATE
);

CREATE TABLE assignments(
	assignment_id SERIAL PRIMARY KEY,
	employee_id INT REFERENCES employees(employee_id),
	project_id INT REFERENCES projects(project_id)
);

INSERT INTO employees (full_name, position, salary, hire_date, department_id) VALUES ('Ahmad Karimov', 'Developer', 3200, '2023-06-15', 1);
INSERT INTO employees (full_name, position, salary, hire_date, department_id) VALUES ('Dilshod Rahmon', 'Designer', 2800, '2022-04-20', 2);
INSERT INTO employees (full_name, position, salary, hire_date, department_id) VALUES ('Mavluda Saidova', 'Manager', 4000, '2021-09-10', 1);
INSERT INTO employees (full_name, position, salary, hire_date, department_id) VALUES ('Shahnoza Aliyeva', 'QA Engineer', 3100, '2024-01-12', 3);
INSERT INTO employees (full_name, position, salary, hire_date, department_id) VALUES ('Jamshed Yusufov', 'Support', 2600, '2023-03-05', 2);

INSERT INTO departments (department_name) VALUES ('IT');
INSERT INTO departments (department_name) VALUES ('Design');
INSERT INTO departments (department_name) VALUES ('Quality Assurance');

INSERT INTO projects (project_name, start_date, end_date) VALUES ('CRM System', '2024-04-01', '2024-10-01');
INSERT INTO projects (project_name, start_date, end_date) VALUES ('Website Redesign', '2024-05-10', '2024-12-20');
INSERT INTO projects (project_name, start_date, end_date) VALUES ('Mobile App', '2024-02-15', '2024-08-15');
INSERT INTO projects (project_name, start_date, end_date) VALUES ('Internal Tools', '2024-01-01', '2024-06-01');
INSERT INTO projects (project_name, start_date, end_date) VALUES ('Automation Project', '2024-03-01', '2024-11-30');

INSERT INTO assignments (employee_id, project_id) VALUES (1, 1);
INSERT INTO assignments (employee_id, project_id) VALUES (2, 2);
INSERT INTO assignments (employee_id, project_id) VALUES (3, 3);
INSERT INTO assignments (employee_id, project_id) VALUES (4, 4);
INSERT INTO assignments (employee_id, project_id) VALUES (5, 5);

-- Task 1
SELECT department_id, COUNT(*) FROM employees GROUP BY department_id;

-- Task 2
SELECT employee_id, COUNT(*) FROM assignments GROUP BY employee_id;

-- Task 3
SELECT DISTINCT position FROM employees;

-- Task 4
SELECT full_name, hire_date FROM employees ORDER BY hire_date ASC LIMIT 5;

-- Task 5
SELECT project_name,end_date FROM projects WHERE end_date BETWEEN '2024-05-01' AND '2024-12-31';

-- Task 6
SELECT full_name FROM employees WHERE employee_id IN (2, 4, 7);

-- Task 7
SELECT full_name, salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

-- Task 8
SELECT department_id FROM employees GROUP BY department_id HAVING AVG(salary) > 3000;

-- Task 9
SELECT project_name FROM projects WHERE project_id NOT IN (SELECT project_id FROM assignments);

-- Task 10
SELECT COUNT(*), AVG(salary), MIN(salary), MAX(salary) FROM employees;