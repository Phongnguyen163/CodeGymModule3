use demo2006;
-- Bai 1
-- 1
select * 
from product
where quantity > 30;
-- 2
select *
from product
where quantity > 30 and ( price > 100 and price < 200 );
-- 3
select * 
from customer
where age > 18;
-- 4
select *
from customer
where name like "%Nguyễn%" and age > 20;
-- 5
select *
from product
where name like "M%";
-- 6
select * 
from product
where name like "%E";
-- 7
select *
from product
order by quantity asc;
-- 8
select * 
from product
order by price desc;
-- Bai 2 
-- 1
select sum(quantity)
from product
where price < 300;
-- 2
select sum(quantity), price
from product
group by price;
-- 3
select MAX(price)
from product;
-- 4
select avg(price)
from product;
-- 5
select sum(price * quantity)
from product;
-- 6
select sum(quantity)
from product
where price < 300;
-- 7
select max(price)
from product
where name like 'M%';
-- 8
select min(price)
from product
where name like 'M%';
-- 9
select avg(price)
from product
where name like 'M%';
-- Bai 3
-- 1
select customer.name, time 
from customer 
join `order` on customer.id = `order`.customerId;
-- 2
select C.name, P.name
from customer C
join `order` O on O.customerId = C.id
join orderdetail OD on O.id = OD.orderId
join product P on P.id = OD.productId;
-- 3
select O.id, sum(P.price * OD.quantity)
from `order` O
join orderdetail OD on O.id  = OD.orderId
join product P on OD.orderId = P.id
group by O.id;
-- 4
select O.id, sum(P.price * OD.quantity) AS "Total"
from `order` O
join orderdetail OD on O.id  = OD.orderId
join product P on OD.orderId = P.id
group by O.id
order by total DESC;