create database Net23Company 
on Primary
(
	Name ='Net23-Company-Data1',
	FileName='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Net23-Company-Data1.mdf',
	Size = 10MB,
	Maxsize = 50MB,
	filegrowth = 10%
),
FILEGROUP Secondary
(
	Name ='Net23-Company-Data2',
	FileName='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Net23-Company-Data2.ndf',
	Size = 10MB,
	Maxsize = 50MB,
	filegrowth = 10%
)
LOG on
(
	Name ='Net23-Company-Log',
	FileName='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Net23-Company-Log.log',
	Size = 5MB,
	Maxsize = 40MB,
	filegrowth = 10%
)
use Net23Company


create table Department 
(
	DeptNo int not null,
	DeptName nvarchar(20) not null,
	Location nchar(2)not null ,
	constraint DeptLocationCheck Check (Location in ('NY','DS','KW')),
	constraint DeptPK primary key (DeptNo)
)

create table Employee
(
	EmpNo int identity(1,1),
	Fname nvarchar(20) not null,
	Lname nvarchar(20) not null,
	DeptNo int not null,
	Salary int not null,
	constraint EmpPK primary key (EmpNo),
	constraint DepartmentEmpFK foreign key (DeptNo) references Department(DeptNo),
	constraint SalaryMinCheck Check (Salary >= 700),
	constraint SalaryMaxCheck Check (Salary < 6000)
)on [Secondary]

create table project
(
	ProjectNo int not null,
	ProjectName nvarchar(50) not null,
	Budject int,
	constraint ProjectPK primary key (ProjectNo)
)

create table works_on
(
	EmpNo int not null,
	ProjectNo int not null,
	Job varchar ,
	EnterDate date default getDate() ,
	constraint WorksEmpFK foreign key (EmpNo) references Department(DeptNo),
	constraint WorksProjectFK foreign key (ProjectNo) references project(ProjectNo),
	constraint WorksPK primary key (EmpNo ,ProjectNo)
)

alter table Employee
add TelephonNum int not null

alter table Employee
drop column TelephonNum

ALTER TABLE Employee  
DROP CONSTRAINT EmpPK   


