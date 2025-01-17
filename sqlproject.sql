create database screentime;
-- dataset taken from kaggle.
 
use screentime;

select * from screentime_analysis;

select * 
from screentime_analysis
where app = 'instagram';

--  to show which app is used maximum minutes. 
select app , max(minutesused) AS Maxtime
from screentime_analysis
group by app 
order by max(minutesused) desc ;

-- to show how many times on an average an app is opened. 

select app, AVG(timesopened)
from screentime_analysis
group by app 
order by avg(timesopened) desc;

-- it shows apps which have maximum notifications 
select app, max(notifications)
from screentime_analysis
group by app;

-- CREATING VIRTUAL TABLES BY VIEW

CREATE VIEW MAXUSED AS 
select app , max(minutesused) AS Maxtime
from screentime_analysis
group by app 
order by max(minutesused) desc ;

SELECT * FROM MAXUSED;

CREATE VIEW MAXNOTIFY AS 
select app, max(notifications) as Maxnotifications
from screentime_analysis
group by app;

SELECT * FROM MAXNOTIFY;

-- Joining both the virtual table. 
SELECT A.* , b.maxnotifications
FROM MAXUSED as A
left join  maxnotify as B 
on A.app = b.app;

-- to show which app is consuimg more time when notifications are more than 50. 
SELECT A.* , b.maxnotifications
FROM MAXUSED as A
left join  maxnotify as B 
on A.app = b.app
where b.maxnotifications >50
order by maxtime desc ;