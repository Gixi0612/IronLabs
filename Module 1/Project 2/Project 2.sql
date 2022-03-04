use project2_energy;
select * from alt_nuclear_use_2;
select * from co2_emissions_2;
select * from gdp_2;
select * from energy_import_2;
select * from energy_use_2;
Create table alt_nuclear_use_2 (select economy, YR2010, YR2011, YR2012, YR2013, YR2014 from alternative_nuclear_use
where economy = 'RUS'
or economy = 'CHN'
or economy = 'FRA'
or economy = 'USA'
or economy = 'JPN');
Create table co2_emissions_2 (select economy, YR2010, YR2011, YR2012, YR2013, YR2014 from co2_emissions
where economy = 'RUS'
or economy = 'CHN'
or economy = 'FRA'
or economy = 'USA'
or economy = 'JPN');
Create table energy_import_2 (select economy, YR2010, YR2011, YR2012, YR2013, YR2014 from energy_import
where economy = 'RUS'
or economy = 'CHN'
or economy = 'FRA'
or economy = 'USA'
or economy = 'JPN');
Create table energy_use_2 (select economy, YR2010, YR2011, YR2012, YR2013, YR2014 from energy_use
where economy = 'RUS'
or economy = 'CHN'
or economy = 'FRA'
or economy = 'USA'
or economy = 'JPN');
Create table gdp_2 (select economy, YR2010, YR2011, YR2012, YR2013, YR2014 from gdp
where economy = 'RUS'
or economy = 'CHN'
or economy = 'FRA'
or economy = 'USA'
or economy = 'JPN');
ALTER TABLE co2_emissions_2
MODIFY COLUMN YR2010 Integer,
MODIFY COLUMN YR2011 Integer,
MODIFY COLUMN YR2012 Integer,
MODIFY COLUMN YR2013 Integer,
MODIFY COLUMN YR2014 Integer;
ALTER TABLE energy_import_2
MODIFY COLUMN YR2010 Integer,
MODIFY COLUMN YR2011 Integer,
MODIFY COLUMN YR2012 Integer,
MODIFY COLUMN YR2013 Integer,
MODIFY COLUMN YR2014 Integer;
ALTER TABLE energy_use_2
MODIFY COLUMN YR2010 Integer,
MODIFY COLUMN YR2011 Integer,
MODIFY COLUMN YR2012 Integer,
MODIFY COLUMN YR2013 Integer,
MODIFY COLUMN YR2014 Integer;
ALTER TABLE gdp_2
MODIFY COLUMN YR2010 Integer,
MODIFY COLUMN YR2011 Integer,
MODIFY COLUMN YR2012 Integer,
MODIFY COLUMN YR2013 Integer,
MODIFY COLUMN YR2014 Integer;

CREATE TABLE alter_rank (SELECT economy, 
ROW_NUMBER() OVER(ORDER BY YR2010 ASC) RANK_2010,
ROW_NUMBER() OVER(ORDER BY YR2011 ASC) RANK_2011,
ROW_NUMBER() OVER(ORDER BY YR2012 ASC) RANK_2012,
ROW_NUMBER() OVER(ORDER BY YR2013 ASC) RANK_2013,
ROW_NUMBER() OVER(ORDER BY YR2014 ASC) RANK_2014
from alt_nuclear_use_2;
CREATE TABLE GDP_rank (SELECT economy, 
ROW_NUMBER() OVER(ORDER BY YR2010 ASC) RANK_2010,
ROW_NUMBER() OVER(ORDER BY YR2011 ASC) RANK_2011,
ROW_NUMBER() OVER(ORDER BY YR2012 ASC) RANK_2012,
ROW_NUMBER() OVER(ORDER BY YR2013 ASC) RANK_2013,
ROW_NUMBER() OVER(ORDER BY YR2014 ASC) RANK_2014
from gdp_2);
CREATE TABLE energy_use_rank (SELECT economy, 
ROW_NUMBER() OVER(ORDER BY YR2010 ASC) RANK_2010,
ROW_NUMBER() OVER(ORDER BY YR2011 ASC) RANK_2011,
ROW_NUMBER() OVER(ORDER BY YR2012 ASC) RANK_2012,
ROW_NUMBER() OVER(ORDER BY YR2013 ASC) RANK_2013,
ROW_NUMBER() OVER(ORDER BY YR2014 ASC) RANK_2014
from energy_use_2);
CREATE TABLE energy_import_rank (SELECT economy, 
ROW_NUMBER() OVER(ORDER BY YR2010 ASC) RANK_2010,
ROW_NUMBER() OVER(ORDER BY YR2011 ASC) RANK_2011,
ROW_NUMBER() OVER(ORDER BY YR2012 ASC) RANK_2012,
ROW_NUMBER() OVER(ORDER BY YR2013 ASC) RANK_2013,
ROW_NUMBER() OVER(ORDER BY YR2014 ASC) RANK_2014
from energy_import_2);
CREATE TABLE co2_emissions_rank (SELECT economy, 
ROW_NUMBER() OVER(ORDER BY YR2010 ASC) RANK_2010,
ROW_NUMBER() OVER(ORDER BY YR2011 ASC) RANK_2011,
ROW_NUMBER() OVER(ORDER BY YR2012 ASC) RANK_2012,
ROW_NUMBER() OVER(ORDER BY YR2013 ASC) RANK_2013,
ROW_NUMBER() OVER(ORDER BY YR2014 ASC) RANK_2014
from co2_emissions_2);

select * from co2_emissions_rank;
select * from alt_rank;
select * from gdp_rank;
select * from energy_import_rank;
select * from energy_use_rank;



