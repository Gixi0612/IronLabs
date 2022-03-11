use project_3;
select * from salary_data;
select * from avg_salary_per_company;
SELECT * FROM avg_salary_per_title;
SELECT * FROM three_companies;

DROP TABLE avg_salary_per_company;
DROP TABLE avg_salary_per_title;
ALTER TABLE salary_data
MODIFY COLUMN totalyearlycompensation Integer,
MODIFY COLUMN basesalary Integer,
MODIFY COLUMN bonus Integer,
MODIFY COLUMN stockgrantvalue Integer;
#the 20 companies who have the most total yearly compensation
CREATE TABLE avg_salary_per_company (
SELECT company, ROUND (avg(basesalary), 2) as avg_basesalary, ROUND ( avg(stockgrantvalue) ,2) as avg_stockgrantvalue, ROUND (avg(bonus),2) as avg_bonus, ROUND (avg(totalyearlycompensation),2) as avg_totalyearlycompensation
FROM salary_data
GROUP BY company
ORDER BY avg_totalyearlycompensation desc
limit 20);

#avg salary per title per company
CREATE TABLE avg_salary_per_title (SELECT *, ROUND (avg_basesalary*100/avg_totalyearlycompensation, 2) as percentage_basesalary_totalcompensation
FROM (SELECT title, ROUND ( avg(basesalary), 2) as avg_basesalary, ROUND ( avg(stockgrantvalue) ,2) as avg_stockgrantvalue, ROUND (avg(bonus),2) as avg_bonus, ROUND (avg(totalyearlycompensation),2) as avg_totalyearlycompensation
FROM salary_data
WHERE title is not null
GROUP BY title
ORDER BY avg_totalyearlycompensation desc) as A);

SELECT  * FROM avg_salary_per_company;
SELECT  * FROM avg_salary_per_title;
SELECT  * FROM three_companies;
DROP TABLE three_companies;
#avg salary per title per company #choose 3 big companies ('APPLE', 'GOOGLE', 'MICROSOFT')

CREATE TABLE three_companies (SELECT A.title, A.avg_basesalary as Microsoft_avg_basesalary, B.avg_basesalary as Apple_avg_basesalary, C.avg_basesalary as Google_avg_basesalary,
A.avg_totalyearlycompensation as Microsoft_avg_totalyearlycompensation, B.avg_totalyearlycompensation as Apple_avg_totalyearlycompensation, C.avg_totalyearlycompensation as Google_avg_totalyearlycompensation
FROM (SELECT company, title, avg(basesalary) as avg_basesalary, avg(totalyearlycompensation) as avg_totalyearlycompensation
from salary_data
WHERE title is not null and company = 'Microsoft'
GROUP BY company, title
ORDER BY company asc) as A
LEFT JOIN 
(SELECT company, title, avg(basesalary) as avg_basesalary, avg(totalyearlycompensation) as avg_totalyearlycompensation
from salary_data
WHERE title is not null and company = 'Apple'
GROUP BY company, title
ORDER BY company asc) as B
on A.title = B.title
LEFT JOIN 
(SELECT company, title, avg(basesalary) as avg_basesalary, avg(totalyearlycompensation) as avg_totalyearlycompensation
from salary_data
WHERE title is not null and company = 'Google'
GROUP BY company, title
ORDER BY company asc) as C
on A.title = C.title);