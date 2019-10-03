--														ASSIGNMENT 5

--Assignement questions


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


--1. Display all the Purchase orders of a specific Customer.
select cust_id,order_id,item_id,total_cost from orders where cust_id=1;
-- mysql> select cust_id,order_id,item_id,total_cost from orders where cust_id=1;
-- +---------+----------+---------+------------+
-- | cust_id | order_id | item_id | total_cost |
-- +---------+----------+---------+------------+
-- |       1 |        1 |       1 |         80 |
-- |       1 |        2 |       9 |        450 |
-- |       1 |        6 |      10 |        360 |
-- |       1 |        6 |      12 |        260 |
-- +---------+----------+---------+------------+

--2. Get Customer and Data Item Information for a Specific Purchase Order.
select o.order_id,o.cust_id,c.cust_name,o.item_id,f.item_name
from orders o,customer c,food_item f
where order_id = 4 and o.cust_id = c.cust_id and o.item_id = f.item_id;
-- mysql> select o.order_id,o.cust_id,c.cust_name,o.item_id,f.item_name
--     -> from orders o,customer c,food_item f
--     -> where order_id = 4 and o.cust_id = c.cust_id and o.item_id = f.item_id;
-- +----------+---------+-----------+---------+-----------------+
-- | order_id | cust_id | cust_name | item_id | item_name       |
-- +----------+---------+-----------+---------+-----------------+
-- |        4 |       3 | Komal     |       1 | Masala papad    |
-- |        4 |       3 | Komal     |       7 | Paneer Chingara |
-- +----------+---------+-----------+---------+-----------------+

select * from orders
natural JOIN customer;
-- +---------+----------+---------+---------------+----------+---------------+------------+------+-----------+------------+
-- | cust_id | order_id | item_id | date_of_order | quantity | cost_per_item | total_cost | city | cust_name | mob_no     |
-- +---------+----------+---------+---------------+----------+---------------+------------+------+-----------+------------+
-- |       1 |        1 |       1 | 2019-07-08    |        2 |            40 |         80 | pune | Pavan     | 4567893120 |
-- |       1 |        2 |       9 | 2019-07-15    |        3 |           150 |        450 | pune | Pavan     | 4567893120 |
-- |       1 |        6 |      10 | 2019-07-18    |        4 |            90 |        360 | pune | Pavan     | 4567893120 |
-- |       1 |        6 |      12 | 2019-07-18    |        2 |           130 |        260 | pune | Pavan     | 4567893120 |
-- |       2 |        3 |       4 | 2019-07-18    |        4 |            40 |        160 | pune | Yash      | 2267893120 |
-- |       2 |        3 |       5 | 2019-07-18    |        5 |            90 |        450 | pune | Yash      | 2267893120 |
-- |       3 |        4 |       1 | 2019-07-18    |        3 |            40 |        120 | pune | Komal     | 6786721948 |
-- |       3 |        4 |       7 | 2019-07-18    |        3 |           150 |        450 | pune | Komal     | 6786721948 |
-- |       4 |        5 |       6 | 2019-07-18    |        1 |            60 |         60 | pune | Pranav    | 8408888123 |
-- |       4 |        5 |      10 | 2019-07-18    |        2 |            90 |        180 | pune | Pranav    | 8408888123 |
-- |       4 |        5 |      12 | 2019-07-18    |        3 |           110 |        330 | pune | Pranav    | 8408888123 |
-- +---------+----------+---------+---------------+----------+---------------+------------+------+-----------+------------+

select * from orders
natural JOIN customer
where order_id = 4;
-- +---------+----------+---------+---------------+----------+---------------+------------+------+-----------+------------+
-- | cust_id | order_id | item_id | date_of_order | quantity | cost_per_item | total_cost | city | cust_name | mob_no     |
-- +---------+----------+---------+---------------+----------+---------------+------------+------+-----------+------------+
-- |       3 |        4 |       1 | 2019-07-18    |        3 |            40 |        120 | pune | Komal     | 6786721948 |
-- |       3 |        4 |       7 | 2019-07-18    |        3 |           150 |        450 | pune | Komal     | 6786721948 |
-- +---------+----------+---------+---------------+----------+---------------+------------+------+-----------+------------+


--3. Get the Total Value of Purchase Orders.
select order_id,sum(total_cost) from orders group by order_id;
-- mysql> select order_id,sum(total_cost) from orders group by order_id;
-- +----------+-----------------+
-- | order_id | sum(total_cost) |
-- +----------+-----------------+
-- |        1 |              80 |
-- |        2 |             450 |
-- |        3 |             610 |
-- |        4 |             570 |
-- |        5 |             570 |
-- |        6 |             620 |
-- +----------+-----------------+

--4. List  the  Purchase  Orders  in  descending  order  as  per total
select order_id, sum(total_cost) as 'total' from orders group by order_id order by total desc;   
-- mysql> select order_id, sum(total_cost) as 'total' from orders group by order_id order by total desc;
-- +----------+-------+
-- | order_id | total |
-- +----------+-------+
-- |        6 |   620 |
-- |        3 |   610 |
-- |        4 |   570 |
-- |        5 |   570 |
-- |        2 |   450 |
-- |        1 |    80 |
-- +----------+-------+

--5. Display  the  name  of  customers  whose  first  name  starts with “P”. (String matching :Like operator
select cust_name from customer where cust_name like 'p%';
-- mysql> select cust_name from customer where cust_name like 'p%';
-- +-----------+
-- | cust_name |
-- +-----------+
-- | Pavan     |
-- | Pranav    |
-- +-----------+

--6. Display  the name  of  customer  whose  order  amount  is greater  than  all  the  customers.  (Relational  Operator:  <, >, <=, >=, = =,!=)
select cust_name,total_cost from orders o,customer c where o.cust_id = c.cust_id group by o.cust_id,o.total_cost order by total_cost desc; 
-- mysql> select cust_name,total_cost from orders o,customer c where o.cust_id = c.cust_id group by o.cust_id,o.total_cost order by total_cost desc;  
-- +-----------+------------+
-- | cust_name | total_cost |
-- +-----------+------------+
-- | Pavan     |        450 |
-- | Komal     |        450 |
-- | Yash      |        450 |
-- | Pavan     |        360 |
-- | Pranav    |        330 |
-- | Pavan     |        260 |
-- | Pranav    |        180 |
-- | Yash      |        160 |
-- | Komal     |        120 |
-- | Pavan     |         80 |
-- | Pranav    |         60 |
-- +-----------+------------+
-- 11 rows in set (0.00 sec)

--7. Display order details of customer whose city name is “Pune” and purchase date is “22/08/2016” (Boolean Operators: and, or)
select * from orders where city = 'pune' and date_of_order='2019-07-18';

-- mysql> select * from orders where city = 'pune' and date_of_order='2019-07-18';
-- +----------+---------+---------+---------------+----------+---------------+------------+------+
-- | order_id | cust_id | item_id | date_of_order | quantity | cost_per_item | total_cost | city |
-- +----------+---------+---------+---------------+----------+---------------+------------+------+
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


--8.Add discount of 5% to all the customers whose order is more than Rs. 500/-. (Arithmetic Operators +, -, *, /) 
select order_id, sum(total_cost) as total, 0.95*sum(total_cost) as 'Discounted'
from orders
group by order_id
having sum(total_cost) > 500;

-- +----------+-------+------------+
-- | order_id | total | Discounted |
-- +----------+-------+------------+
-- |        3 |   610 |     579.50 |
-- |        4 |   570 |     541.50 |
-- |        5 |   570 |     541.50 |
-- |        6 |   620 |     589.00 |
-- +----------+-------+------------+

--9. Delete Purchase Order 5.
delete from orders where order_id = 5;
-- query executed successfully!
-- mysql> select * from orders where city = 'pune' and date_of_order='2019-07-18';
-- +----------+---------+---------+---------------+----------+---------------+------------+------+
-- | order_id | cust_id | item_id | date_of_order | quantity | cost_per_item | total_cost | city |
-- +----------+---------+---------+---------------+----------+---------------+------------+------+
-- |        1 |       1 |       1 | 2019-07-08    |        2 |            40 |         80 | pune |
-- |        2 |       1 |       9 | 2019-07-15    |        3 |           150 |        450 | pune |
-- |        3 |       2 |       4 | 2019-07-18    |        4 |            40 |        160 | pune |
-- |        3 |       2 |       5 | 2019-07-18    |        5 |            90 |        450 | pune |
-- |        4 |       3 |       1 | 2019-07-18    |        3 |            40 |        120 | pune |
-- |        4 |       3 |       7 | 2019-07-18    |        3 |           150 |        450 | pune |
-- |        6 |       1 |      10 | 2019-07-18    |        4 |            90 |        360 | pune |
-- |        6 |       1 |      12 | 2019-07-18    |        2 |           130 |        260 | pune |
-- +----------+---------+---------+---------------+----------+---------------+------------+------+
