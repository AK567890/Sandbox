-- База данных, с которой вы будете работать, состоит из одной таблицы. В ней собраны объявления, опубликованные на сайте
-- по поиску работы hh.ru в мае и июне 2024 года. Таблица хранит данные о работодателе, вакансии, заработной плате,
-- а также основные жёсткие и мягкие навыки, разделённые на разные столбцы.

-- Что нужно сделать
-- 1. Определите диапазон заработных плат в общем, а именно средние значения, минимумы и максимумы нижних и верхних порогов зарплаты.
-- 2. Выявите регионы и компании, в которых сосредоточено наибольшее количество вакансий.
-- 3. Проанализируйте, какие преобладают типы занятости, а также графики работы.
-- 4. Изучите распределение грейдов (Junior, Middle, Senior) среди аналитиков данных и системных аналитиков.
-- 5. Выявите основных работодателей, предлагаемые зарплаты и условия труда для аналитиков.
-- 6. Определите наиболее востребованные навыки (как жёсткие, так и мягкие) для различных грейдов и позиций.

select * from parcing_table limit 5;

-- 1.
select  min(salary_from) as min_lower_salary,
		round(avg(salary_from)::numeric,0) as avg_lower_salary,
		max(salary_from) as max_lower_salary,
		min(salary_to) as min_higher_salary,
		round(avg(salary_to)::numeric,0) as avg_higher_salary,
		max(salary_to) as max_higher_salary
from parcing_table;

-- 2.
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

-- 3.
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

-- 4.
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

-- 5.
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

-- 6.
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




