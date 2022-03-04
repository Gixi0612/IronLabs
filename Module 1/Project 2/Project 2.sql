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

select * from alt_nuclaire_rank;
select * from alter_nuclear_good_rank;
select * from co2_emissions_rank;
select * from gdp_rank;
select * from energy_import_rank;
select * from energy_use_rank;
#Alt_nuclear_use_rank
CREATE TABLE A (Select economy, AVG_alt_nuclear_use,
(6- Alt_nuclear_use_rank) as Alt_nuclear_good_ranking
from (select economy,
AVG_alt_nuclear_use,
row_number() OVER(ORDER BY AVG_alt_nuclear_use DESC) Alt_nuclear_use_rank
from (select economy, (YR2010+YR2011+YR2012+YR2013+YR2014)/5 as AVG_alt_nuclear_use
from alt_nuclear_use_2) as A) as B
order by economy); #avg_alt_use

#co2_emission_use_rank
CREATE TABLE B (select economy,
AVG_co2_emission_use,
row_number() OVER(ORDER BY AVG_co2_emission_use DESC) co2_emission_use_rank
from (select economy, (YR2010+YR2011+YR2012+YR2013+YR2014)/5 as AVG_co2_emission_use
from co2_emissions_2) as A
order by economy);

#energy_import_rank
CREATE TABLE C (select economy,
AVG_energy_import,
row_number() OVER(ORDER BY AVG_energy_import DESC) energy_import_rank
from (select economy, (YR2010+YR2011+YR2012+YR2013+YR2014)/5 as AVG_energy_import
from energy_import_2) as A
order by economy);

#energy_use_rank
CREATE TABLE D (select economy,
AVG_energy_use,
row_number() OVER(ORDER BY AVG_energy_use DESC) energy_use_rank
from (select economy, (YR2010+YR2011+YR2012+YR2013+YR2014)/5 as AVG_energy_use
from energy_use_2) as A
order by economy);

create table Energy_Effiency_Index (SELECT *, 
(Alt_nuclear_good_ranking + co2_emission_use_rank + energy_import_rank + energy_use_rank)/4 as Energy_Effiency_Index
from 
(Select A.economy, A.Alt_nuclear_good_ranking,
B.co2_emission_use_rank,
C.energy_import_rank,
D.energy_use_rank from A
inner join B
on A.economy = B.economy 
inner join C
on A.economy = C.economy 
inner join D
on A.economy = D.economy
ORDER BY economy) as E 
order by Energy_Effiency_Index desc);

select * from A;
select * from B;
select * from C;
select * from D;
select * from energy_effiency_index;




