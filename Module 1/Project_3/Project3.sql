use project_3;
select * from salary_data;
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
DROP TABLE avg_salary_per_company;
SELECT  * FROM avg_salary_per_company;
DROP TABLE avg_salary_per_title;
SELECT  * FROM avg_salary_per_title;
#avg salary per title per company
CREATE TABLE avg_salary_per_title (SELECT *, ROUND (avg_basesalary*100/avg_totalyearlycompensation, 2) as percentage_basesalary_totalcompensation
FROM (SELECT title, ROUND (avg(basesalary), 2) as avg_basesalary, ROUND ( avg(stockgrantvalue) ,2) as avg_stockgrantvalue, ROUND (avg(bonus),2) as avg_bonus, ROUND (avg(totalyearlycompensation),2) as avg_totalyearlycompensation
FROM salary_data
WHERE title is not null
GROUP BY title
ORDER BY avg_totalyearlycompensation desc) as A);

#avg salary per title per company #choose 3 big companies ('APPLE', 'GOOGLE', 'MICROSOFT')
SELECT company, title, avg_basesalary, avg_totalyearlycompensation, percentage_basesalary_totalcompensation
