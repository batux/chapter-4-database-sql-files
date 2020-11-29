
select * from employees;

select * from employees where emp_no = 10004;

update employees set first_name = "Alex" where emp_no = 10004 limit 1;
update employees set first_name = "Chirstian" where emp_no = 10004 limit 1;

delete from employees where emp_no = 10004;

insert into `employees` (`emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date`)
values
	(10004, '1954-05-01', 'Chirstian', 'Koblick', 'M', '1986-12-01');


select emp_no, SUM(salary) from salaries group by emp_no;
select * from dept_emp order by from_date desc;
select * from dept_emp order by from_date asc;

select emp.*, s.salary from employees emp inner join salaries s on s.emp_no = emp.emp_no
where emp.emp_no = 10004;


select emp.*, dm.* from employees emp left join dept_manager dm on dm.emp_no = emp.emp_no;
select emp.*, dm.* from dept_manager dm right join employees emp on dm.emp_no = emp.emp_no;

-- şuan aktif olarak yönetici olan personel
select emp.*, dm.*, dp.* from employees emp 
left join dept_manager dm on dm.emp_no = emp.emp_no
left join departments dp on dp.dept_no = dm.dept_no
where dm.to_date >= NOW();

-- title sayısı 1'den fazla olan personellerin geçmiş iş ünvanlarını döküyoruz.
select * from titles where emp_no in(
select emp_no from titles
group by emp_no having count(emp_no) > 1);
