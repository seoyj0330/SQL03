--문제 1번
--  각 사원에 대해서 사번, 이름, 부서명, 매니저의 이름을 조회
select  em.employee_id, em.first_name, 
        de.department_name,
        em.manager_id, man.first_name, man.employee_id       
from employees em, employees man, departments de
where em.manager_id = man.employee_id    
and em.department_id = de.department_id;


--문제 2번
--  지역에 속한 나라들을 지역이름, 나라이름으로 출력하되
--  지역이름, 나라이름 순서대로 내림차순 정렬  25개국
select  rg.region_name, 
        ct.country_name
from countries ct, regions rg
where ct.region_id = rg.region_id 
order by rg.region_name desc,
         ct.country_name desc;
     
         
--문제 3번
--  각 부서에 대해서 부서번호, 부서이름 ,매니저의 이름, 위치한 도시, 나라의 이름
--  지역구분의 이름까지 전부 출력  11개
select  de.department_id, de.department_name, 
        em.manager_id,
        em.first_name,
        lo.city, 
        ct.country_name,
        rg.region_name
from departments de, locations lo, countries ct, 
     regions rg , employees em
where em.employee_id = de.manager_id
    and de.location_id = lo.location_id
    and ct.country_id = lo.country_id
    and ct.region_id = rg.region_id;
 
    
--문제 4번
--  public Accountant 의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력
--  
-- 이름은 first_name과 last_name을 합쳐 출력  2명
select em.employee_id,
        em.first_name ||' '|| em.last_name
from job_history jh, jobs j, employees em
where jh.job_id = j.job_id
    and j.job_title = 'Public Accountant'
    and em.employee_id = jh.employee_id;
    
    
--문제 5번
--  직원들의 사번, 이름, 성과 부서이름을 조회하여
--  성(last_name)순으로 오름차순     106명
select  em.employee_id, em.first_name, em.last_name,
        de.department_name
from employees em, departments de
where em.department_id = de.department_id
order by em.last_name asc;


--문제 6번
--  자신의 매니저보다 채용일이 빠른 사원의 사번, 성과 채용일 조회
select  em.employee_id, 
        em.last_name,
        em.hire_date 
from employees em, employees man
where em.manager_id = man.employee_id
    and em.hire_date < man.hire_date;