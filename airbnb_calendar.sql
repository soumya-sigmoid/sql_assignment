CREATE DATABASE first_db;
USE first_db;
select * from airbnb_calendar;
*Question-1
Select min(date), max(date),DATEDIFF(max(date),min(date)) from airbnb_calendar;

*Question-2
select listing_id,count(*) as frequency
from airbnb_calendar
group by listing_id;

select distinct listing_id from airbnb_calendar;



Question-3
            SELECT listing_id, (count(case when available = 't' then 1 end)) AS avl,(count(case when available = 'f' then 1 end)) AS unavl,(count(case when available = 't' then 1 end))/((count(case when available = 't' then 1 end))+(count(case when available = 'f' then 1 end))) AS ratio
            FROM airbnb_calendar
            GROUP BY listing_id;


*Question-4
select listing_id, percent FROM (
            SELECT listing_id, (count(case when available = 't' then 1 end) / count(*)) * 100 AS PERCENT
            FROM airbnb_calendar
            GROUP BY listing_id
        ) AS temp WHERE percent > 50;
*Question-5
SELECT listing_id AS property, MAX(CAST(SUBSTRING(price,2,10) AS DECIMAL(10,2))) AS Max, MIN(CAST(SUBSTRING(price,2,10) AS DECIMAL(10,2))) AS Min, AVG(CAST(SUBSTRING(price,2,10) AS DECIMAL(10,2))) AS Average
        FROM airbnb_calendar
        GROUP BY listing_id;    
        
*Question-6    
SELECT avg(CAST(SUBSTRING(price,2,10) AS DECIMAL(10,2))) AS prices 
FROM airbnb_calendar WHERE price!='';    
        