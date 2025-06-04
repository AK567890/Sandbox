select * from parcing_table limit 5;

select  min(salary_from) as min_lower_salary,
		round(avg(salary_from)::numeric,0) as avg_lower_salary,
		max(salary_from) as max_lower_salary,
		min(salary_to) as min_higher_salary,
		round(avg(salary_to)::numeric,0) as avg_higher_salary,
		max(salary_to) as max_higher_salary
from parcing_table;

select  area,
		count(id) as qty
from parcing_table
group by area
order by qty desc
limit 10;

select  employer,
		count(id) as qty
from parcing_table
group by employer order by qty desc
limit 10;

select  employment,
		count(id) as qty
from parcing_table
group by employment
order by qty desc;

select  schedule,
		count(id) as qty
from parcing_table
group by schedule
order by qty desc;

select  experience,
		count(id) as qty
from parcing_table
WHERE name LIKE '%Аналитик данных%' 
   OR name LIKE '%Системный аналитик%'
group by experience
order by experience;

select  count(id) as qty
	from parcing_table
		WHERE name LIKE '%Аналитик данных%' 
   			OR name LIKE '%Системный аналитик%';

select  experience,
		round(count(id)::numeric*100/(select  count(id)	from parcing_table
		WHERE name LIKE '%Аналитик данных%' 
   			OR name LIKE '%Системный аналитик%'), 2) as perc
from parcing_table
		WHERE name LIKE '%Аналитик данных%' 
   			OR name LIKE '%Системный аналитик%'
group by experience
order by experience;

select  employer,
		count(id) as qty,
		min(salary_from) as sal_from,
		max(salary_to) as sal_to,
		employment,
		schedule
from parcing_table
WHERE name LIKE '%Аналитик данных%' OR name LIKE '%Системный аналитик%'
group by employer, employment, schedule
order by qty desc
limit 20;

select 	key_skills_1,
		count(id) as qty
from parcing_table
where key_skills_1<>''
group by key_skills_1
order by qty desc, key_skills_1;

select 	soft_skills_1,
		count(id) as qty
from parcing_table
where soft_skills_1<>''
group by soft_skills_1
order by qty desc, soft_skills_1;




