use [MyCompany]

--1 ‘clerk’ Employees ???
create view clerkEmp 
as
select e.Fname , p.Pname
from [HR].[Employee] as e , [dbo].[Project] as p 
where e.Dno = p.Dnum

---------------------------------
--2 ???
create view projectNameWithNumberOfEmp
as
select p.[Pname] ,count(e.Fname) as numberOfEmp
from [dbo].[Project] as p , [HR].[Employee] as e
where e.Dno = p.Dnum
group by p.[Pname]


select * from projectNameWithNumberOfEmp