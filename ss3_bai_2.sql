create database ss3_bai_2;

use ss3_bai_2;

create table customers (
    c_id int auto_increment,
    c_name varchar(25) not null,
    c_age tinyint,
    primary key (c_id)
);

create table orders (
    o_id int auto_increment,
    c_id int ,
    o_date datetime,
    o_total_price int,
    primary key (o_id),
    foreign key (c_id) references customers(c_id)
);

create table products (
    p_id int auto_increment,
    p_name varchar(25) not null,
    p_price int,
    primary key (p_id)
);




create table order_detail (
    od_id int auto_increment,
    o_id int ,
    p_id int ,
    od_qty int ,
    primary key (od_id),
    foreign key (o_id) references orders(o_id),
    foreign key (p_id) references products(p_id)
);

insert into customers
value(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong ha',50);

insert into orders(c_id,o_date) 
value(1, '2006-03-21'),
(2, '2006-03-23'),
(1, '2006-03-16');

insert into products(p_name,p_price)
value('May Giat',3),
('Tu Lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien',2);

insert into order_detail(o_id,p_id,od_qty)
value (1,1,3),(1,3,1),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

select o_id, o_date, o_total_price
from orders;

select distinct c.c_id, c.c_name, c.c_age
from customers c
join orders o on c.c_id = o.c_id;

select c.c_name, p.p_name, od.od_qty
from customers c
join orders o on c.c_id = o.c_id
join order_detail od on o.o_id = od.o_id
join products p on od.p_id = p.p_id;

select c.c_id, c.c_name
from customers c
left join orders o on c.c_id = o.c_id
where o.o_id is null;

select 
    o.o_id,
    o.o_date,
    sum(od.od_qty * p.p_price) as total_price
from orders o
join order_detail od on o.o_id = od.o_id
join products p on od.p_id = p.p_id
group by o.o_id, o.o_date;

