/*locations*/
INSERT INTO locations (street_address, postal_code, city, state_province,country_id)
SELECT distinct
    lc.street_address,
    lc.postal_code,
    lc.city,
    lc.state_province,
    lc.country_id
FROM report lc
where lc.street_address is not null
AND   lc.postal_code is not null
AND   lc.city is not null 
AND   lc.state_province is not null
AND    lc.country_id is not null;

/*departments*/
INSERT INTO departments (DEPARTMENT_NAME, manager_id, location_id)
SELECT distinct
re.DEPARTMENT_NAME as department_name,
null as manager_id,
lc.location_id
FROM report re left join locations lc using(city)
where department_name is not null;

/*employees*/
insert into employees( first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct,manager_id, department_id)
SELECT distinct
	em.FIRST_NAME,
    em.LAST_NAME,
    em.email,
    em.PHONE_NUMBER,
    em.HIRE_DATE,
    em.JOB_ID,
    em.SALARY,
    em.COMMISSION_PCT,
null as manager_id,
	d.department_id
FROM report em left join departments d using(department_name)
WHERE
em.FIRST_NAME is not null
AND    em.LAST_NAME is not null
AND    em.PHONE_NUMBER is not null
AND    em.HIRE_DATE is not null
AND    em.JOB_ID is not null
AND   em.SALARY is not null;

/*Добавляет Manager_id*/
update employees e
INNER JOIN  (
select distinct FIRST_NAME, LAST_NAME, (select employee_id from employees e where r.MANAGER_FIRST_NAME=e.first_name AND r.MANAGER_LAST_NAME = e.last_name) as manager_id
from report r) as t on e.first_name=t.FIRST_NAME and e.last_name=t.LAST_NAME
SET e.manager_id=t.manager_id;

/* для каждого работнака исключая менеджеров увеличить зарплату на 100$*/
update employees
set salary=salary+100
WHERE job_id not IN (SELECT job_id
From jobs
WHERE job_title like '%manager');

/*для каждого рабоника установить email = 5 первые буквы имени + 5 первые буквы фамилии*/
update employees
set email=concat(SUBSTRING(first_name,1,5),SUBSTRING(last_name,1,5));

/*для каждого департамента где количество работников меньше 10 необходимо увеличить зарплату на 10%*/
update employees
set salary=salary*1.1
where department_id in (select department_id from(select department_id,count(department_id) as numb from employees group by department_id) as countTable
where numb>10);
commit;
