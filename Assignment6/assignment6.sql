--											ASSIGNMENT 6


--  THE TABLE
-- mysql> select * from orders;
-- +----------+---------+---------+---------------+----------+---------------+------------+------+
-- | order_id | cust_id | item_id | date_of_order | quantity | cost_per_item | total_cost | city |
-- +----------+---------+---------+---------------+----------+---------------+------------+------+
-- |        1 |       1 |       1 | 2019-07-08    |        2 |            40 |         80 | pune |
-- |        2 |       1 |       9 | 2019-07-15    |        3 |           150 |        450 | pune |
-- |        3 |       2 |       4 | 2019-07-18    |        4 |            40 |        160 | pune |
-- |        3 |       2 |       5 | 2019-07-18    |        5 |            90 |        450 | pune |
-- |        4 |       3 |       1 | 2019-07-18    |        3 |            40 |        120 | pune |
-- |        4 |       3 |       7 | 2019-07-18    |        3 |           150 |        450 | pune |
-- |        5 |       4 |       6 | 2019-07-18    |        1 |            60 |         60 | pune |
-- |        5 |       4 |      10 | 2019-07-18    |        2 |            90 |        180 | pune |
-- |        5 |       4 |      12 | 2019-07-18    |        3 |           110 |        330 | pune |
-- |        6 |       1 |      10 | 2019-07-18    |        4 |            90 |        360 | pune |
-- |        6 |       1 |      12 | 2019-07-18    |        2 |           130 |        260 | pune |
-- +----------+---------+---------+---------------+----------+---------------+------------+------+


--1. Get the total no of customers.
select count(*) as 'Total Customers' from customer; 

-- mysql> select count(*) as 'Total Customers' from customer; 
-- +-----------------+
-- | Total Customers |
-- +-----------------+
-- |               4 |
-- +-----------------+


--2. Display average purchase amount of all the customers.
select cust_id,avg(total_cost) from orders group by cust_id;
-- mysql> select cust_id,avg(total_cost) from orders group by cust_id;
-- +---------+-----------------+
-- | cust_id | avg(total_cost) |
-- +---------+-----------------+
-- |       1 |        287.5000 |
-- |       2 |        305.0000 |
-- |       3 |        285.0000 |
-- |       4 |        190.0000 |
-- +---------+-----------------+


--3. Display total purchase amount of all the customers
select cust_id,sum(total_cost) from orders group by cust_id;		--as per customer
-- mysql> select cust_id,sum(total_cost) from orders group by cust_id;
-- +---------+-----------------+
-- | cust_id | sum(total_cost) |
-- +---------+-----------------+
-- |       1 |            1150 |
-- |       2 |             610 |
-- |       3 |             570 |
-- |       4 |             570 |
-- +---------+-----------------+

select sum(total_cost) from orders;		--total cost
--mysql> select sum(total_cost) from orders;
-- +-----------------+
-- | sum(total_cost) |
-- +-----------------+
-- |            2900 |
-- +-----------------+


--4. Find DAYNAME, MONTHNAME and YEAR of the purchase order made on “1995-11-2016”
select dayname(date_of_order) as 'Day',monthname(date_of_order) as 'Month', year(date_of_order) as 'Year' from orders where date_of_order = '2019-07-18';
--mysql> select dayname(date_of_order) as 'Day',monthname(date_of_order) as 'Month', year(date_of_order) as 'Year' from orders where date_of_order = '2019-07-18';
-- +----------+-------+------+
-- | Day      | Month | Year |
-- +----------+-------+------+
-- | Thursday | July  | 2019 |
-- | Thursday | July  | 2019 |
-- | Thursday | July  | 2019 |
-- | Thursday | July  | 2019 |
-- | Thursday | July  | 2019 |
-- | Thursday | July  | 2019 |
-- | Thursday | July  | 2019 |
-- | Thursday | July  | 2019 |
-- | Thursday | July  | 2019 |
-- +----------+-------+------+


--5. Get current date & time, current time, current date
select curdate() as 'Current date',current_time as 'Current time',sysdate();
--mysql> select curdate() as 'Current date',current_time as 'Current time',sysdate();
-- +--------------+--------------+---------------------+
-- | Current date | Current time | sysdate()           |
-- +--------------+--------------+---------------------+
-- | 2019-07-25   | 09:10:13     | 2019-07-25 09:10:13 |
-- +--------------+--------------+---------------------+


--6. Get 6 month future & past date using interval function based on current date and name the column accordingly.
select sysdate() + INTERVAL 6 month as 'Future 6 months',sysdate() - INTERVAL 6 month as 'Past 6 month';
--mysql> select sysdate() + INTERVAL 6 month as 'Future 6 months',sysdate() - INTERVAL 6 month as 'Past 6 month';
-- +---------------------+---------------------+
-- | Future 6 months     | Past 6 month        |
-- +---------------------+---------------------+
-- | 2020-01-25 09:10:57 | 2019-01-25 09:10:57 |
-- +---------------------+---------------------+

--7. Find purchase details of the customers group by product category.
select order_id, cust_id, total_cost,cat_name 
from orders 
natural JOIN food_item
natural join category;
-- +----------+---------+------------+-------------+
-- | order_id | cust_id | total_cost | cat_name    |
-- +----------+---------+------------+-------------+
-- |        3 |       2 |        160 | SNACKS      |
-- |        3 |       2 |        450 | SNACKS      |
-- |        5 |       4 |         60 | SNACKS      |
-- |        1 |       1 |         80 | STARTERS    |
-- |        4 |       3 |        120 | STARTERS    |
-- |        2 |       1 |        450 | MAIN COURSE |
-- |        4 |       3 |        450 | MAIN COURSE |
-- |        5 |       4 |        180 | chinese     |
-- |        5 |       4 |        330 | chinese     |
-- |        6 |       1 |        360 | chinese     |
-- |        6 |       1 |        260 | chinese     |
-- +----------+---------+------------+-------------+

-- if added following, we get
order by order_id;
-- +----------+---------+------------+-------------+
-- | order_id | cust_id | total_cost | cat_name    |
-- +----------+---------+------------+-------------+
-- |        1 |       1 |         80 | STARTERS    |
-- |        2 |       1 |        450 | MAIN COURSE |
-- |        3 |       2 |        450 | SNACKS      |
-- |        3 |       2 |        160 | SNACKS      |
-- |        4 |       3 |        120 | STARTERS    |
-- |        4 |       3 |        450 | MAIN COURSE |
-- |        5 |       4 |        330 | chinese     |
-- |        5 |       4 |         60 | SNACKS      |
-- |        5 |       4 |        180 | chinese     |
-- |        6 |       1 |        260 | chinese     |
-- |        6 |       1 |        360 | chinese     |
-- +----------+---------+------------+-------------+
-- 11 rows in set (0.00 sec)
