create database ss5_bai_1;

use ss5_bai_1;

create table products(
id int auto_increment,
product_code varchar(50) unique,
product_name varchar(255),
product_price decimal(10,2),
product_amount int,
product_description text,
product_status bit not null,
primary key(id)
);

insert into products (product_code, product_name, product_price, product_amount, product_description, product_status)
value
('P001', 'iPhone 15 Pro Max', 35000000, 20, 'Điện thoại Apple cao cấp', b'1'),
('P002', 'Samsung Galaxy S24 Ultra', 32000000, 25, 'Điện thoại Android flagship', b'1'),
('P003', 'MacBook Air M2', 28000000, 15, 'Laptop Apple chip M2', b'1'),
('P004', 'Dell XPS 13', 30000000, 10, 'Laptop mỏng nhẹ cao cấp', b'1'),
('P005', 'Asus ROG Strix G16', 40000000, 8, 'Laptop gaming cấu hình cao', b'1'),
('P006', 'iPad Pro M2', 25000000, 18, 'Máy tính bảng Apple M2', b'1'),
('P007', 'AirPods Pro 2', 6000000, 40, 'Tai nghe không dây Apple', b'1'),
('P008', 'Samsung Galaxy Tab S9', 22000000, 12, 'Máy tính bảng Android cao cấp', b'1'),
('P009', 'Sony WH-1000XM5', 9000000, 30, 'Tai nghe chống ồn cao cấp', b'1'),
('P010', 'GoPro Hero 12', 12000000, 20, 'Máy quay hành trình GoPro', b'0');

create unique index idx_product_code 
on products (product_code);

create index idx_product_name_price
on products(product_name,product_price);

explain select *
from products 
where product_code = 'P001';

explain select *
from products 
where product_name = 'Samsung Galaxy Tab S9'and product_price='22000000';

create view product_view as
select product_code,product_name,product_price,product_status
from products;

create or replace view product_view as
select product_code,product_name,product_price,product_status
from products;

update product_view 
set product_price = 36000000
where product_code = 'P001';

drop view product_view;

delimiter //
create procedure get_all_products()
begin
    select * from products;
end //
delimiter ;

call get_all_products();

delimiter //
create procedure add_product(
in p_code varchar(50),
in p_name varchar(255),
in p_price decimal(10,2),
in p_amount int,
in p_description text,
in p_status bit 
)
begin
insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
value (p_code,p_name,p_price,p_amount,p_description,p_status);
  end //
delimiter ;  

call add_product('p011', 'apple watch ultra 2', 23000000, 12, 'đồng hồ thông minh apple', b'1');


delimiter //
create procedure update_product(
in p_id int,
in p_code varchar(50),
in p_name varchar(255),
in p_price decimal(10,2),
in p_amount int,
in p_description text,
in p_status bit 
)
begin
update products
set product_code = p_code,
    product_name = p_name,
    product_price = p_price,
    product_amount = p_amount,
    product_description = p_description,
    product_status = p_status
where id = p_id;
  end //
delimiter ;

call update_product(1, 'p001', 'iphone 15 pro max - new', 34000000, 18, 'iphone cao cấp bản cập nhật', b'1');

delimiter //
create procedure delete_product(
in p_id int
)
begin
    delete from products where id = p_id;
end //
delimiter ;

call delete_product(11);
