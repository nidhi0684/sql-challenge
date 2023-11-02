-- Data Analysis
-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT emp.emp_no AS "Employee#", emp.last_name AS "LastName", emp.first_name AS "FirstName", emp.sex As "Sex", sal.salaries AS "Salaries" 
FROM employees emp
INNER JOIN salaries sal ON emp.emp_no = sal.emp_no
ORDER BY sal.salaries DESC

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp.first_name AS "FirstName", emp.last_name AS "LastName", emp.hire_date AS "HireDate" 
FROM employees emp
WHERE DATE_PART('YEAR', emp.hire_date) = 1986
ORDER BY emp.hire_date

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept.dept_no AS "Department#" , dept.dept_name AS "DepartmentName", emp.emp_no AS "Employee#", emp.last_name AS "LastName", emp.first_name AS "FirstName" 
FROM departments dept
INNER JOIN dept_manager deptmgr ON dept.dept_no = deptmgr.dept_no
INNER JOIN employees emp ON deptmgr.emp_no = emp.emp_no
ORDER BY emp.last_name, emp.first_name

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept.dept_no AS "Department#" , emp.emp_no AS "Employee#", emp.last_name AS "LastName", emp.first_name AS "FirstName", dept.dept_name AS "DepartmentName"
FROM departments dept
INNER JOIN dept_emp deptemp ON dept.dept_no = deptemp.dept_no
INNER JOIN employees emp ON deptemp.emp_no = emp.emp_no
ORDER BY dept.dept_name, emp.last_name, emp.first_name

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT emp.first_name AS "FirstName", emp.last_name AS "LastName", emp.sex As "Sex"
FROM employees emp 
WHERE (emp.first_name = 'Hercules' AND emp.last_name LIKE 'B%')
ORDER BY emp.last_name

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no AS "Employee#", emp.last_name AS "LastName", emp.first_name AS "FirstName", dept.dept_name AS "DepartmentName"
FROM departments dept
INNER JOIN dept_emp deptemp ON dept.dept_no = deptemp.dept_no
INNER JOIN employees emp ON deptemp.emp_no = emp.emp_no
WHERE dept.dept_name = 'Sales'
ORDER BY emp.last_name, emp.first_name

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no AS "Employee#", emp.last_name AS "LastName", emp.first_name AS "FirstName", dept.dept_name AS "DepartmentName"
FROM departments dept
INNER JOIN dept_emp deptemp ON dept.dept_no = deptemp.dept_no
INNER JOIN employees emp ON deptemp.emp_no = emp.emp_no
WHERE (dept.dept_name = 'Sales' OR dept.dept_name = 'Development')
ORDER BY dept.dept_name, emp.last_name, emp.first_name


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT emp.last_name AS last_name, COUNT(*) AS "frequency_count" 
FROM employees emp 
GROUP BY emp.last_name 
ORDER BY frequency_count DESC
