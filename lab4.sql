create table employees(
employee_id char(10),
first_name varchar(20),
last_name varchar(20),
email varchar(60),
phone_number char(14),
hire_date date,
job_id int,
salary int,
commission_pct decimal(5,3),
manager_id char(10),
department_id int
);


insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary ,commission_pct, manager_id, department_id) values ('1', 'A', 'Z', 'A@GMAIL.COM', '012', '2020-09-15', 100, 2000, 52.000, 'M1', 01),('2', 'B', 'Y', 'B@GMAIL.COM', '013', '2020-09-16', 101, 3000, 36.000, 'M3', 02),('3', 'C', 'X', 'C@GMAIL.COM', '014', '2020-09-01', 102, 4000, 45.000, 'M5', 03),('4', 'D', 'W', 'D@GMAIL.COM', '015', '2020-09-05', 103, 5000, 78.000, 'M7', 04),('5', 'E', 'V', 'E@GMAIL.COM', '016', '2020-09-04', 104, 6000, 15.000, 'M9', 05),('6', 'F', 'U', 'F@GMAIL.COM', '017', '2020-09-19', 105, 7000, 98.000, 'M1', 06),('7', 'G', 'T', 'G@GMAIL.COM', '018', '2020-09-24', 106, 8000, 46.000, 'M3', 07),('8', 'H', 'S', 'H@GMAIL.COM', '019', '2020-09-04', 107, 9000, 31.000, 'M5', 08),('9', 'I', 'R', 'I@GMAIL.COM', '020', '2020-09-12', 108, 2500, 35.000, 'M7', 09),('10', 'J', 'Q', 'J@GMAIL.COM', '021', '2020-09-06', 109, 1100, 39.000, 'M9', 10),('11', 'K', 'P', 'K@GMAIL.COM', '022', '2020-08-04', 110, 1200, 41.000, 'M1', 11),('12', 'L', 'O', 'L@GMAIL.COM', '023', '2020-07-02', 111, 1500, 43.000, 'M3', 12),('13', 'M', 'N', 'M@GMAIL.COM', '024', '2020-06-08', 112, 1700, 45.000, 'M5', 13),('14', 'N', 'M', 'N@GMAIL.COM', '025', '2020-06-30', 113, 1900, 47.000, 'M7', 14),('15', 'O', 'L', 'O@GMAIL.COM', '026', '2020-06-27', 114, 2200, 49.000, 'M9', 15),('16', 'P', 'K', 'P@GMAIL.COM', '027', '2019-11-01', 115, 40000, 51.000, 'M1', 16),('17', 'Q', 'J', 'Q@GMAIL.COM', '028', '2021-01-20', 116, 3500, 53.000, 'M3', 17),('18', 'R', 'I', 'R@GMAIL.COM', '029', '2020-02-27', 117, 9500, 55.000, 'M5', 18),('19', 'S', 'H', 'S@GMAIL.COM', '030', '2019-12-14', 118, 35000, 57.000, 'M7', 19),('20', 'T', 'G', 'T@GMAIL.COM', '031', '2020-04-23', 119, 4500, 59.000, 'M9', 20),('21', 'U', 'F', 'U@GMAIL.COM', '032', '2020-09-17', 120, 3600, 79.000, 'M1', 21),('22', 'V', 'E', 'V@GMAIL.COM', '033', '2020-11-16', 121, 4400, 77.000, 'M3', 22),('23', 'W', 'D', 'W@GMAIL.COM', '034', '2021-01-28', 122, 4400, 75.000, 'M5', 23),('24', 'X', 'C', 'X@GMAIL.COM', '035', '2020-05-14', 123, 7800, 73.000, 'M7', 24), ('25', 'Y', 'B', 'Y@GMAIL.COM', '036', '2020-03-01', 124, 5600, 26.000, 'M9', 25), ('26', 'Z', 'A', 'Z@GMAIL.COM', '037', '2020-09-25', 125, 3100, 66.000, 'M1', 26); 


Task01
select first_name, last_name, email, phone_number, hire_date, department_id 
from employees 
where hire_date in 
(select MAX(hire_date) from employees 
group by department_id)
;



Task02
select first_name, last_name, email, phone_number, hire_date, department_id 
from employees 
where hire_date in
(select MIN(hire_date) from employees 
group by department_id)
;



Task03
SELECT first_name, last_name, employee_id, phone_number, salary, department_id  
FROM employees  
WHERE salary in
(SELECT MIN(salary)  
FROM employees  
GROUP BY department_id)
;


Task04
select first_name, last_name, employee_id, commission_pct, department_id 
from employees 
where department_id = 7 and commission_pct<all
(select commission_pct from employees where department_id = 5)
;


Task05
select department_id, (count(*)) AS Total_Number 
from employees 
group by department_id
;



Task06
SELECT first_name, last_name, employee_id, email, salary 
from employees 
where hire_date < '2020-01-01'
;


Task07
SELECT first_name, last_name, employee_id, email, salary, department_id 
from employees 
where salary in 
(SELECT MAX(salary) FROM employees WHERE manager_id = 'M1')
;


Task08
select distinct department_id 
from employees 
where not  exists 
(select * from employees1 where employees1.department_id = employees.department_id and salary > 30000)
;


Task09
select department_id, job_id, commission_pct
 from employees 
where  commission_pct < any 
(select job_id from employees group by department_id)
;


Task10
select first_name, last_name, employee_id, email, salary, department_id, commission_pct 
from employees 
where commission_pct in 
(select MIN(commission_pct) from employees group by manager_id)
;


Task11
select count(*) 
from employees 
where employee_id in 
(select manager_id  from employees group by manager_id)
;


Task12
select department_id, job_id, salary 
from employees 
where  salary < any 
(select job_id from employees group by department_id)
;


Task13
select distinct manager_id 
from employees 
where manager_id in 
(select manager_id from employees where salary > 1500 group by manager_id)
;


Task14
select distinct manager_id 
from employees 
where manager_id in 
(select manager_id from employees where commission_pct < 15.25 group by manager_id)
;


Task15
select distinct manager_id 
from employees 
where not exists 
(select * from employees1 where employees1.department_id = employees.department_id and salary < 3500)
;