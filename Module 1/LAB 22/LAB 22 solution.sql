use publications;
select * from authors;
select * from sales;
select * from titles;
select * from titleauthor;
#challenge 1
#advance = titles.advance * titleauthor.royaltyper / 100
SELECT A.author_ID, Last_name, First_name, A.title_id, sales_royalty + total_advance as total_profit
from (select authors.au_id as Author_ID,
authors.au_lname as Last_name,
authors.au_fname as First_name,
title_id,
total_advance
from authors
left join
(select titles.title_id, advance*titleauthor.royaltyper/100 as total_advance,
au_id
from titles
left join titleauthor
on titles.title_id = titleauthor.title_id
group by title_id) as K
on authors.au_id=K.au_id) A
left join
#Royalty of each sale 
#sales_royalty = titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100
(select sales.title_id, titles.price*sales.qty*titles.royalty/100*titleauthor.royaltyper/100 as sales_royalty
from sales
left join titles
on titles.title_id =sales.title_id
left join titleauthor
on sales.title_id = titleauthor.title_id
group by title_id
order by sales_royalty desc) B 
on A.title_id = B.title_id
group by author_id
order by total_profit desc
limit 3;
#challenge 3
Create table the_most_profitable_author as
SELECT A.author_ID, sales_royalty + total_advance as total_profit
from (select authors.au_id as Author_ID,
authors.au_lname as Last_name,
authors.au_fname as First_name,
title_id,
total_advance
from authors
left join
(select titles.title_id, advance*titleauthor.royaltyper/100 as total_advance,
au_id
from titles
left join titleauthor
on titles.title_id = titleauthor.title_id
group by title_id) as K
on authors.au_id=K.au_id) A
left join
#Royalty of each sale 
#sales_royalty = titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100
(select sales.title_id, titles.price*sales.qty*titles.royalty/100*titleauthor.royaltyper/100 as sales_royalty
from sales
left join titles
on titles.title_id =sales.title_id
left join titleauthor
on sales.title_id = titleauthor.title_id
group by title_id
order by sales_royalty desc) B 
on A.title_id = B.title_id
group by author_id
order by total_profit desc
limit 3;
select * from the_most_profitable_author;


