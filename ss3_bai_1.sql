create database quan_ly_sinh_vien;

use quan_ly_sinh_vien;

create table classes(
class_id int auto_increment ,
class_name varchar(60) not null,
start_date datetime not null,
status bit ,
primary key(class_id)
);

create table students(
student_id int auto_increment,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
class_id int not null,
foreign key(class_id) references class(class_id),
primary key(student_id)
);

create table subjects(
sub_id int auto_increment not null,
sub_name varchar(30) not null,
credit tinyint not null default 1 check(credit>=1),
 status bit default 1,
 primary key(sub_id)
);

create table marks(
mark_id int auto_increment not null,
sub_id int not null unique key,
student_id int not null unique key,
mark float default 0 check(mark between 0 and 100),
exam_times tinyint default 1,
foreign key(sub_id) references subject(sub_id),
foreign key(student_id) references student(student_id),
primary key(mark_id)
);


insert into classes value(1,'A1','2008-12-20',1);
insert into classes value(2,'A2','2008-12-22',1);
insert into classes value(3,'A3',current_date,0);

insert into students(student_name,address,phone,status,class_id)
value('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into students(student_name,address,status,class_id)
value('Hoa', 'Hai phong', 1, 1);
insert into students(student_name,address,phone,status,class_id)
value('Manh', 'HCM', '0123123123', 0, 2);

insert into subjects value(1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
 insert into marks(sub_id,student_id,mark,exam_times) 
 value(1, 1, 8, 1),
 (2, 2, 10, 2),
 (3, 3, 12, 1);
 
 select *
 from students
 where student_name like 'h%';
 
 select *
 from classes
 where month(start_date) = 12;

 select *
 from subjects
 where credit between 3 and 5;
 
update students
set class_id = 2
where student_name = 'Hung';

select s.student_name, sub.sub_name, m.mark
from students s
join marks m on s.student_id = m.student_id
join subjects sub on m.sub_id = sub.sub_id
order by m.mark desc, s.student_name asc;
 