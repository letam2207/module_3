drop database soan_bai;
create database soan_bai;
use soan_bai;

create table teacher (
    teacher_id int auto_increment primary key,
    teacher_name varchar(100),
    phone_number varchar(15)
);

create table class (
    class_id int auto_increment primary key,
    class_name varchar(100),
    teacher_id int,
    foreign key (teacher_id) references teacher(teacher_id)
);

create table student (
    student_id int auto_increment primary key,
    name varchar(100),
    dob date,
    phone_number varchar(15),
    class_id int,
    foreign key (class_id) references class(class_id)
);

create table account (
    account_id int auto_increment primary key,
    username varchar(50),
    password varchar(50),
    student_id int,
    foreign key (student_id) references student(student_id)
);

create table module (
    module_id int auto_increment primary key,
    module_name varchar(100),
    credit int
);

create table point (
    point_id int auto_increment primary key,
    score decimal(5,2),
    student_id int,
    module_id int,
    foreign key (student_id) references student(student_id),
    foreign key (module_id) references module(module_id)
);
insert into teacher (teacher_name, phone_number) values
('ChánhTV', '0912345678'),
('HaiTT', '0987654321');


insert into class (class_name, teacher_id) values
('C05', 1),
('C02', 2);

-- 3. Thêm student (tham chiếu class_id)
insert into student (name, dob, phone_number, class_id) values
('Lê Tâm', '2006-05-10', '0901111222', 1),
('Nguyễn Thành', '2006-09-15', '0903333444', 2);

insert into account (username, password, student_id) values
('letam', 'pass123', 1),
('nguyenthanh', 'pass456', 2);

insert into module (module_name, credit) values
('module 1', 3),
('module 2', 4);

-- 6. Thêm point (tham chiếu student_id, module_id)
insert into point (score, student_id, module_id) values
(85, 1, 1),
(70, 1, 2),
(90, 2, 1);

