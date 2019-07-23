--														ASSIGNMENT 5

--Assignement questions

--1. Display all the Purchase orders of a specific Customer.
select cust_id,order_id,item_id,total_cost from orders where cust_id=1;

--2. Get Customer and Data Item Information for a Specific Purchase Order.
select o.order_id,o.cust_id,c.cust_name,o.item_id,f.item_name
from orders o,customer c,food_item f
where order_id = 4 and o.cust_id = c.cust_id and o.item_id = f.item_id;

--3. Get the Total Value of Purchase Orders.
select order_id,sum(total_cost) from orders group by order_id;

--4. List  the  Purchase  Orders  in  descending  order  as  per total
select order_id, sum(total_cost) as 'total' from orders group by order_id order by total desc;   

--5. Display  the  name  of  customers  whose  first  name  starts with “P”. (String matching :Like operator
select cust_name from customer where cust_name like 'p%';

--6. Display  the name  of  customer  whose  order  amount  is greater  than  all  the  customers.  (Relational  Operator:  <, >, <=, >=, = =,!=)
select cust_name,total_cost from orders o,customer c where o.cust_id = c.cust_id group by o.cust_id,o.total_cost order by total_cost desc;  

--7. Display order details of customer whose city name is “Pune” and purchase date is “22/08/2016” (Boolean Operators: and, or)
select * from orders where city = 'pune' and date_of_order='2019-07-18';

--8.Add discount of 5% to all the customers whose order is more than Rs. 500/-. (Arithmetic Operators +, -, *, /) 
--error!!!
select order_id,cust_id,total_cost, 0.95*total_cost as 'Discounted cost'
from orders
group by order_id,cust_id,total_cost
having sum(total_cost) > 500;

--9. Delete Purchase Order 5.
delete from orders where order_id = 5;
