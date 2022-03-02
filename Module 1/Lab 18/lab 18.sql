create database appledatabase;
use appledatabase;
create table apple ( id INTEGER PRIMARY KEY, track_name TEXT, size_bytes Integer,
currency TEXT, price FLOAT,
rating_count_tot FLOAT,
rating_count_ver FLOAT,
user_rating FLOAT,
user_rating_ver FLOAT,
ver TEXT,
cont_rating FLOAT,
prime_genre TEXT,
sup_devices_num Integer,
ipadSc_urls_num Integer,
lang_num Integer,
vpp_lic			Integer);
select * from apple;
select concat(price,' ', currency) from apple;
select count(distinct prime_genre) from apple;
select prime_genre, rating_count_tot 
from apple
where rating_count_tot = (select max(rating_count_tot) from apple);
select id, rating_count_ver from apple
where rating_count_ver =26;
select id, track_name from apple
where track_name like "a%";
# waiting
select prime_genre, track_name, rating_count_ver
from apple
where rating_count_ver = (select max(rating_count_ver) from app);
select track_name, rating_count_ver,price from apple
where rating_count_ver > 1000
Order by price desc;
select track_name, price from apple
where price > 100
ORDER BY price desc
limit 3;
select track_name, rating_count_ver, prime_genre 
from apple
where rating_;
select count(id), prime_genre
from apple
group by prime_genre;
select count(track_name), prime_genre
from apple
group by prime_genre
order by count(track_name) desc;
select track_name, rating_count_tot
from apple
order by rating_count_tot desc

limit 10;
select track_name, user_rating
from apple
order by user_rating desc
limit 10;
select track_name, user_rating_ver, rating_count_tot
from apple
order by user_rating_ver desc, rating_count_tot desc
limit 3;
select track_name, user_rating_ver, rating_count_tot, price
from apple
order by user_rating_ver desc, price asc, rating_count_tot desc;
#user_rating_ver desc