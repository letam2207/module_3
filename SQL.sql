

use ss1_relational_database;

create table classes(
id int auto_increment,
name_class varchar(100),
primary key(id)
);

create table teachers(
id int auto_increment,
name_teacher varchar(100),
age int,
country varchar(100),
primary key(id)
);

 insert into classes (name_class) value ("C0525G1"),("C0325G1"),("C0225G1");
 insert into teachers (name_teacher,age,country) value ("HảiTT",24,"Quảng Nam") 