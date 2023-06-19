-- 1. List the employee number, last name, sex, and salary of each employee
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
inner join salaries s
on e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
select d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
from departments d
inner join dept_manager m
on d.dept_no = m.dept_no
inner join employees e
on e.emp_no = m.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from departments d
inner join dept_emp a
on a.dept_no = d.dept_no
inner join employees e
on a.emp_no = e.emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name
select emp_no, last_name, first_name
from employees
where emp_no in (
	select emp_no
	from dept_emp
	where dept_no in (
		select dept_no
		from departments
		where dept_name = 'Sales'
	)
);

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees e
inner join dept_emp m
on m.emp_no = e.emp_no
inner join departments d
on d.dept_no = m.dept_no
where d.dept_name in ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names
select last_name, count(last_name) as frequency
from employees
group by last_name
order by frequency desc;