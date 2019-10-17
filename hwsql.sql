drop table departments;
CREATE TABLE departments(
  dept_no VARCHAR(255) not NULL,
  dept_name VARCHAR(255) not null
);
drop table dept_emp;

CREATE TABLE dept_emp(
 emp_no INT not NULL,
  dept_no VARCHAR(255) not NULL,
  from_date VARCHAR(255) not null,
  to_date VARCHAR(255) not null
);

drop table dept_manager;
CREATE TABLE dept_manager(
   dept_no VARCHAR(255) not NULL,
	emp_no INT not NULL,
  from_date Date not null,
  to_date Date not null
);

drop table employees;
CREATE TABLE employees(
   	emp_no INT not NULL,
  birth_date VARCHAR(255) not null,
  first_name VARCHAR(255) not null,
	last_name VARCHAR(255) not null,
	gender VARCHAR(255) not null,
	hire_date VARCHAR(255) not null
);

drop table salaries;
CREATE TABLE salaries(
   	emp_no INT not NULL,
  salary int not null,
  from_date VARCHAR(255) not null,
	to_date VARCHAR(255) not null
);

CREATE TABLE titles(
   	emp_no INT not NULL,
  title VARCHAR(255) not null,
  from_date Date not null,
	to_date Date not null
);

-------#1---------------
SELECT employees.emp_no, employees.last_name, employees.first_name, 
employees.gender, salaries.salary
FROM employees
INNER JOIN salaries ON 
employees.emp_no=salaries.emp_no;

------#2------------------
drop table employees;
Alter table employees
Add column year_hire varchar(255)

select * from employees;

UPDATE employees
SET year_hire = substring (hire_date,1,4)

select * from employees where year_hire like '1986%';

-------#3--------------------
select * from dept_manager;

SELECT employees.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
from employees
INNER JOIN dept_manager ON 
employees.emp_no=dept_manager.emp_no
inner join departments on
dept_manager.dept_no= departments.dept_no;

------#4-------------
SELECT * FROM employees
INNER JOIN dept_manager on employees.emp_no=dept_manager.emp_no
INNER JOIN departments on dept_manager.dept_no=departments.dept_no

------#5------------
SELECT first_name,last_name 
FROM employees where first_name='Hercules' and last_name like 'B%'

------#6----------
SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM employees
INNER JOIN dept_manager on employees.emp_no=dept_manager.emp_no
INNER JOIN departments on dept_manager.dept_no=departments.dept_no
WHERE departments.dept_name='Sales'

-----#7------------
SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM employees
INNER JOIN dept_manager on employees.emp_no=dept_manager.emp_no
INNER JOIN departments on dept_manager.dept_no=departments.dept_no
WHERE departments.dept_name='Sales' or departments.dept_name='Development'

----#8-------------
SELECT last_name,count(emp_no) as count_lastname FROM employees
group by last_name
order by count_lastname desc
