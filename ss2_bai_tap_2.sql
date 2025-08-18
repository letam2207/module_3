create database ss2_bai_tap_2;

use ss2_bai_tap_2;

create table customers (
    c_id int auto_increment,
    c_name varchar(100) not null,
    c_address varchar(255),
    primary key (c_id)
);

create table products (
    p_id int auto_increment,
    p_name varchar(100) not null,
    p_price decimal(10,2) not null,
    primary key (p_id)
);


create table orders (
    o_id int auto_increment,
    c_id int not null,
    o_date date not null,
    primary key (o_id),
    foreign key (c_id) references customers(c_id)
);

create table order_detail (
    od_id int auto_increment,
    o_id int not null,
    p_id int not null,
    od_qty int not null,
    primary key (od_id),
    foreign key (o_id) references orders(o_id),
    foreign key (p_id) references products(p_id)
);
