create procedure list_food_item(inout namelist varchar(4000))
begin
declare is_done integer default 0;
declare f_name varchar(100) default "";
declare food_cursor cursor for select item_name from food_item;
declare continue handler for not found set is_done = 1;
open food_cursor;
get_names : LOOP
fetch food_cursor into f_name;
if is_done = 1 then leave get_names;
end if;
set namelist = concat(f_name,", ",namelist);
end loop get_names;
close food_cursor;
end$$

delimiter ;