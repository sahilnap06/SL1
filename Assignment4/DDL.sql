--Data Definition Commands
create database foodhub;

use foodhub;

create table customer	(cust_id integer AUTO_INCREMENT,
				 	customer_name varchar(30) not null,
				 	mob_no varchar(10),
				 	PRIMARY KEY (cust_id));

create table category	(cat_id integer,
					cat_name varchar(15) not null,
					primary key(cat_id));

create table food_item	(item_id integer,
					item_name varchar(30) not null,
					cost integer not null,
					cat_id integer,
					primary key (item_id), 
					foreign key(cat_id) references category (cat_id));

create table orders	(order_id integer,
					cust_id integer,
					item_id integer,
					date_of_order date,
					quantity integer,
					cost_per_item integer,
					total_cost integer,
					primary key (order_id,cust_id,item_id),
					foreign key (cust_id) references customer(cust_id),
					foreign key (item_id) references food_item(item_id)
					);
