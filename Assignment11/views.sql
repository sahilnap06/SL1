create view cust_order AS
SELECT order_id as 'Order ID',cust_name as 'Name of the customer',sum(total_cost) as 'Total Cost',mob_no as 'Mobile number'
from customer c join orders o
on c.cust_id = o.cust_id
group by order_id,cust_name,mob_no
ORDER BY order_id;

-- mysql> create view cust_order AS
--     -> SELECT order_id as 'Order ID',cust_name as 'Name of the customer',sum(total_cost) as 'Total Cost',mob_no as 'Mobile number'
--     -> from customer c join orders o
--     -> on c.cust_id = o.cust_id
--     -> group by order_id,cust_name,mob_no
--     -> ORDER BY order_id
--     -> ;
-- Query OK, 0 rows affected (0.03 sec)

-- mysql> select * from cust_order;
-- +----------+----------------------+------------+---------------+
-- | Order ID | Name of the customer | Total Cost | Mobile number |
-- +----------+----------------------+------------+---------------+
-- |        1 | Pavan                |         80 | 4567893120    |
-- |        2 | Pavan                |        450 | 4567893120    |
-- |        3 | Yash                 |        610 | 2267893120    |
-- |        4 | Komal                |        570 | 6786721948    |
-- |        5 | Pranav               |        570 | 8408888123    |
-- |        6 | Pavan                |        620 | 4567893120    |
-- |        7 | Pranav               |         80 | 8408888123    |
-- |        8 | Yash                 |        450 | 2267893120    |
-- +----------+----------------------+------------+---------------+
-- 8 rows in set (0.00 sec)
