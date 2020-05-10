---List following details if each employee: employee number, last name, first name, sex and salary
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
JOIN salaries as sal
ON emp.emp_no = sal.emp_no
;

-- List first name, last name and hire date for emplopyees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date < '1987-01-01'
and hire_date > '1985-12-31'
order by hire_date asc;

--List the manager of each dept with the following info: dept number, dept name, the mgr emp number
--last name and first name
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, emp.last_name, emp.first_name
FROM employees as emp
JOIN dept_manager 
ON emp.emp_no = dept_manager.emp_no
JOIN departments 
ON departments.dept_no = dept_manager.dept_no
;

--List the dept of each employee with the following information: emp number, last name, first name and dept name
SELECT departments.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM employees as emp
JOIN dept_emp 
ON emp.emp_no = dept_emp.emp_no
JOIN departments 
ON departments.dept_no = dept_emp.dept_no
;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT emp.first_name, emp.last_name, emp.sex
FROM employees as emp
WHERE first_name = 'Hercules'
AND last_name like 'B%'
;

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT departments.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM employees as emp
JOIN dept_emp 
ON emp.emp_no = dept_emp.emp_no
JOIN departments 
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT departments.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM employees as emp
JOIN dept_emp 
ON emp.emp_no = dept_emp.emp_no
JOIN departments 
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development'
;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name) 
FROM employees
GROUP BY last_name
ORDER BY last_name desc
;