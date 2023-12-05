--1. employee first name, last name, sex, salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	FROM "Employees" AS e
	INNER JOIN "Salaries" AS s
	ON e.emp_no=s.emp_no;
	
--2. employees hired in 1986	
SELECT first_name, last_name, hire_date
	FROM "Employees"
	WHERE hire_date BETWEEN '1/1/86' AND '12/31/86';

--3. manager of each dept, dept name, employee number, last name, first name
SELECT dman.emp_no, emp.last_name, emp.first_name, dman.dept_no, dp.dept_name
	FROM "Employees" AS emp
	INNER JOIN "Dep_managers" AS dman
	ON emp.emp_no= dman.emp_no
	INNER JOIN "Departments" AS dp
	ON dman.dept_no=dp.dept_no;
	
--4. dept for each employee, employee number, last name, first name, dept name
SELECT emp.emp_no, emp.last_name, emp.first_name, dpemp.dept_no, dp.dept_name
	FROM "Employees" AS emp
	INNER JOIN "Dep_employees" AS dpemp
	ON emp.emp_no= dpemp.emp_no
	INNER JOIN "Departments" AS dp
	ON dpemp.dept_no=dp.dept_no;
	
--5. first name, last name, and sex of each employee named Hercules with last name "B"
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name ='Hercules' AND last_name LIKE 'B%';

--6. each employee from sales department including employee number, last name, first name
SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
	FROM "Employees" AS emp
	INNER JOIN "Dep_employees" AS dpemp
	ON emp.emp_no=dpemp.emp_no
	INNER JOIN "Departments" AS dp
	ON dpemp.dept_no=dp.dept_no
WHERE dp.dept_name = 'Sales';

--7.each employee in sales and development dept, employee number, first name, last name, dept name
SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
	FROM "Employees" AS emp
	INNER JOIN "Dep_employees" AS dpemp
	ON emp.emp_no=dpemp.emp_no
	INNER JOIN "Departments" AS dp
	ON dpemp.dept_no=dp.dept_no
WHERE dp.dept_name = 'Development' OR dp.dept_name='Sales';

--8. frequency count of last names in descending order
SELECT last_name, COUNT (last_name) AS "Frequency"
FROM "Employees"
GROUP BY last_name
ORDER BY last_name DESC;
