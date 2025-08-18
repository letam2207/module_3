create database ss4_bai_1;

use ss4_bai_1;

create table classes
(
    class_id   int         not null auto_increment primary key,
    class_name varchar(60) not null,
    start_date datetime    not null,
    status     bit
);

create table students
(
    student_id   int         not null auto_increment primary key,
    student_name varchar(30) not null,
    address      varchar(50),
    phone        varchar(20),
    status       bit,
    class_id     int         not null,
    foreign key (class_id) references classes (class_id)
);

create table subjects
(
    sub_id   int         not null auto_increment primary key,
    sub_name varchar(30) not null,
    credit   tinyint     not null default 1 check ( credit >= 1 ),
    status   bit                  default 1
);

create table marks
(
    mark_id    int not null auto_increment primary key,
    sub_id     int not null,
    student_id int not null,
    mark       float   default 0 check ( mark between 0 and 100),
    examtimes  tinyint default 1,
    unique (sub_id, student_id),
    foreign key (sub_id) references subjects (sub_id),
    foreign key (student_id) references students (student_id)
);

insert into classes (class_name, start_date, status) values
('cntt k15', '2023-09-01', 1),
('qtkd k14', '2023-09-05', 1),
('kt k13', '2023-09-10', 0),
('tcnh k15', '2023-09-15', 1),
('nn k12', '2023-09-20', 1);

insert into students (student_name, address, phone, status, class_id) values
('nguyen van a', 'ha noi', '0901234567', 1, 1),
('tran thi b', 'hai phong', '0912345678', 1, 1),
('le van c', 'da nang', '0923456789', 0, 2),
('pham thi d', 'hue', '0934567890', 1, 3),
('hoang van e', 'hcm', '0945678901', 1, 4);

insert into subjects (sub_name, credit, status) values
('toan cao cap', 3, 1),
('lap trinh java', 4, 1),
('co so du lieu', 3, 1),
('marketing can ban', 2, 1),
('tai chinh doanh nghiep', 3, 1);

insert into marks (sub_id, student_id, mark, examtimes) values
(1, 1, 85, 1),
(2, 1, 90, 1),
(3, 2, 75, 1),
(4, 3, 60, 2),
(5, 4, 88, 1);

select *
from subjects
where credit = (select max(credit) from subjects);

select s.*
from subjects s
join marks m on s.sub_id = m.sub_id
where m.mark = (select max(mark) from marks);

select s.student_id, s.student_name, avg(m.mark) as avg_score
from students s
join marks m
on s.student_id = m.student_id
group by s.student_id, s.student_name
order by avg_score desc;

