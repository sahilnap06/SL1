--create a trigger on database to update the cost as per the quantity...

create trigger tc before insert on orders
for each row
set new.total_cost = new.quantity * new.cost_per_item;
