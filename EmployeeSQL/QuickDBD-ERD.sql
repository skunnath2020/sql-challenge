--1.List the details of each employee: employee number, last name, first name, sex, and salary
select em."emp_no" as "Employee Number",
	"last_name", "first_name",
	"sex" , s."salary"
	from "Employees" em
	left join "Salaries" s on em."emp_no"=s."emp_no";
Select * from "Employees";
-- 2.List first name, last name, and hire date for employees who were hired in 1986.
select "last_name", "first_name", hire_date from "Employees" 
	where date_part('year', hire_date) = 1986
--3.List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.	
select dm."dept_no" as "Dept Number", dm."emp_no" as "Empl Number", d."dept_name" as "Dept Name", em."last_name", em."first_name" 
	from "Dept_manager" dm
	left join "Department" d on dm."dept_no"=d."dept_no"
	left join "Employees" em on dm."emp_no"= em."emp_no"
	;
--select * from "Dept_Emp";
-- 4.List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select de."emp_no", em."last_name", em."first_name", d."dept_name"
	from "Dept_Emp" de
	left join "Department" d on de."dept_no"=d."dept_no"
	left join "Employees" em on de."emp_no"= em."emp_no"
--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."	
select "last_name", "first_name", "sex" from "Employees" 
	where  "first_name" ='Hercules' and "last_name" like 'B%'
-- 6.List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
select em."emp_no", em."last_name", em."first_name", d."dept_name"
	from "Employees" em
	inner join "Dept_Emp" de on de."emp_no"=em."emp_no" 
	inner join "Department" d on d."dept_no"=de."dept_no"
	where d."dept_name" = 'Sales';
--7. List all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.	
select em."emp_no", em."last_name", em."first_name", d."dept_name"
	from "Employees" em
	inner join "Dept_Emp" de on de."emp_no"=em."emp_no" 
	inner join "Department" d on d."dept_no"=de."dept_no"
	where d."dept_name" in ('Sales', 'Development');
--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
select "last_name", count("last_name") as "name_count"
from "Employees" group by "last_name" order by "name_count" desc;

