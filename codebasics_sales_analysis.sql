drop database codebasics;
drop database pre;

use codebasics2;
select * from df2;
alter table df2 
rename dim_customer;

alter table df2
rename dim_market;

select count(*) from fact_sales_monthly;






