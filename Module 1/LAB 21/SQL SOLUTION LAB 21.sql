use publications;
#create a table
Create table newtable1 AS select authors.au_id as Author_ID,
authors.au_lname as Last_name,
authors.au_fname as First_name,
title_id
from authors
left join titleauthor title
on authors.au_id = title.au_id;

select * from newtable1;
select * from titles;
Create table newtable5 as select newtable1.Author_ID,
newtable1.last_name,
newtable1.first_name,
newtable1.title_id,
title,
pub_id
from newtable1
left join titles
on newtable1.title_id = titles.title_id;
select * from newtable5;
create table challenge1 AS select newtable5.Author_ID,
newtable5.last_name,
newtable5.first_name,
newtable5.title,
pub_name
from newtable5
left join publishers
on newtable5.pub_id = publishers.pub_id;
select * from challenge1;
select Author_id, pub_name, count(title) #challenge2
from challenge1
group by pub_name;
select Author_id, last_name, first_name,  count(title) #challenge3
from challenge1
group by author_id
order by count(title) desc
limit 3;
select Author_id, last_name, first_name,  count(title) #challenge4
from challenge1
group by author_id
order by count(title) desc;



