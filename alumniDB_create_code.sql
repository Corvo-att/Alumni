create database AlumniDB
use AlumniDB
create schema alumni 

create table alumni.student(

stdnt_id int primary key ,
stdnt_name varchar(80) not null ,
stdnt_email varchar(80) not null ,
stdnt_ntnl_id char(14) not null ,
phone char(11) not null ,
adrs varchar(100) not null ,
pass int not null default 123 ,
birth_day date not null,

constraint ck_email check (stdnt_email LIKE '%_@_%._%'),
constraint ck_phone_ni check (stdnt_ntnl_id NOT LIKE '%[^0-9]%'),
constraint ck_phone check (stdnt_ntnl_id NOT LIKE '%[^0-9]%'),

grad_major varchar(100),
grad_year int not null ,
bach_degre varchar(100) not null ,
grad_project_nm varchar(100) not null , 

constraint ch_year check (grad_year >= 2000 AND grad_year <= YEAR(GETDATE())),


)


create table alumni.job_exprnc(

exprnc_id int primary key , 
exprnc_type bit,  -- 1 job , 0 training 
start_d date not null ,
end_d date ,
org_sector varchar (80),
org_name varchar (80) not null , 
org_phone varchar(11),
org_address varchar (100),

constraint ch_phone_2 check (org_phone NOT LIKE '%[^0-9]%'),

)

--many to many link
create table alumni.link (

stdnt_id int ,
exprnc_id int ,

primary key (stdnt_id , exprnc_id),
foreign key (stdnt_id) references alumni.student(stdnt_id),
foreign key (exprnc_id) references alumni.job_exprnc(exprnc_id)

)