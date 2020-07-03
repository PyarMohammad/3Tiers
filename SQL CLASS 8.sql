create database jQy050320
use jQy050320

create table Emp
(
  id int primary key identity,
  name varchar(50),
  address varchar(50),
  age int,
  inserted_date date,
  status int default 0
)

create proc usp_Emp_insert
@name varchar(50),
@address varchar(50),
@age int
as
begin
      insert into Emp(name,address,age,inserted_date)values(@name,@address,@age, GETDATE())
end 

create proc usp_Emp_get
as
begin
      select *, CONVERT(varchar(50), inserted_date, 106)idate from Emp where status=0
end 

create proc usp_Emp_delete
@id int
as
begin
      update Emp set status = 1 where id=@id
end 

create proc usp_Emp_edit
@id int
as
begin
      select *From Emp where id=@id
end 

create proc usp_Emp_update
@name varchar(50),
@address varchar(50),
@age int,
@id int
as
begin
      update Emp set name=@name,address=@address,age=@age where id=@id
end 

select *from Emp

truncate table Emp
