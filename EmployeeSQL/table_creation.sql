create table titles (
	title_id varchar primary key,
	title varchar
);

create table employees (
	emp_no integer primary key,
	emp_title_id varchar,
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date,
	foreign key (emp_title_id) references titles(title_id)
);

create table salaries (
	emp_no integer primary key,
	salary money,
	foreign key (emp_no) references employees(emp_no)
);

create table departments (
	dept_no varchar primary key,
	dept_name varchar
);

create table dept_emp (
	emp_no integer,
	dept_no varchar,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no),
	primary key (emp_no, dept_no)
);

create table dept_manager (
	dept_no varchar,
	emp_no integer primary key,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);