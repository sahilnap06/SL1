--select statements
select item_name from food_item where item_id = 8;
	
--Insert commands #DML
insert into category values(1,"Chinese");
insert into customer values(1,"name",999999999);
insert into food_item values(1,"hakka noodles",110,1);
insert into orders values(1,1,1,sysdate(),2,110,220);
insert into customer(cust_name,mob_no) values ("abc",21323178); --this command uses auto_increment feature

--update customer table (records)
update customer set customer_name = "pavan" where cust_id = 2; --the query will update the customer name
update food_item set cost = 170 where item_id = 8;
update food_item set item_name = "Chicken masala" where item_name = "chicken handi";
update customer set cust_id = 4 where cust_id = 123;

--delete records from table
delete from food_item where item_id = 4; 

--alter/modify column name
alter table customer change customer_name cust_name varchar(30) not null; --alters the name of a column of the customer table

--alter records #DML
alter table orders add (newcolumn varchar(30));
alter table orders drop column newcolumn;					
