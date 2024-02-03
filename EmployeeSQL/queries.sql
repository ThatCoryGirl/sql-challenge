--Data Analysis
--List the employee number, last name, first name, sex, and salary of each employee.

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
JOIN salaries AS sal
ON emp.emp_no = sal.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT departments.dept_no, departments.dept_name, man.emp_no, emp.last_name, emp.first_name
FROM departments
JOIN dept_manager AS man
ON departments.dept_no = man.dept_no
JOIN employees AS emp
ON man.emp_no = emp.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, emp.last_name, emp.first_name, departments.dept_name
FROM dept_emp
JOIN employees AS emp
ON dept_emp.emp_no = emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT emp.first_name, emp.last_name, emp.sex
FROM employees AS emp
WHERE first_name = 'Hercules'
AND last_name Like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT depts.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM dept_emp
JOIN employees AS emp
ON dept_emp.emp_no = emp.emp_no
JOIN departments AS depts
ON dept_emp.dept_no = depts.dept_no
WHERE depts.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, emp.emp_no, emp.last_name, emp.first_name, depts.dept_name
FROM dept_emp
JOIN employees AS emp
ON dept_emp.emp_no = emp.emp_no
JOIN departments AS depts
ON dept_emp.dept_no = depts.dept_no
WHERE depts.dept_name = 'Sales' 
OR depts.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name,
COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;