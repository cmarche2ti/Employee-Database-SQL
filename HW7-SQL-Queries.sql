--List the following details of each employee: employee number, 
--last name, first name, gender, and salary.

SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary
FROM employees AS e
LEFT JOIN salaries AS s USING (emp_no)
ORDER BY e.emp_no;

--List employees who were hired in 1986.

SELECT *
FROM employees AS e
WHERE DATE_PART('year', hire_date) = '1986';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.

SELECT 
	dm.dept_no,
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name,
	dm.from_date,
	dm.to_date	
FROM dept_manager AS dm
LEFT JOIN departments AS d USING(dept_no)
LEFT JOIN employees AS e USING(emp_no);


--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT 
	d.dept_no,
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name	
FROM employees AS e
LEFT JOIN dept_emp AS de USING(emp_no)
LEFT JOIN departments AS d USING(dept_no)
ORDER BY e.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT 
	e.first_name, 
	e.last_name
FROM employees as e
WHERE 
	e.first_name = 'Hercules' and left(e.last_name, 1) = 'B';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM departments AS d
INNER JOIN dept_emp AS de USING(dept_no)
INNER JOIN employees AS e USING(emp_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;


--List all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.

SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM departments AS d
INNER JOIN dept_emp AS de USING(dept_no)
INNER JOIN employees AS e USING(emp_no)
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development'
ORDER BY e.emp_no;

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT 
    last_name, 
    COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;