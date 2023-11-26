use [ITI]

--1 grad >60 ???
create view viewStudentNameWithCourceAndGrade as
(
select s.St_Fname , c.Crs_Name , sc.Grade
from  [dbo].[Stud_Course] as sc
join [dbo].[Student] as s
on sc.St_Id = s.St_Id
join [dbo].[Course] as c
on c.Crs_Id = sc.Crs_Id
)

select * from [dbo].[viewStudentNameWithCourceAndGrade] where Grade >70

-----------------------------------------------------------------
--2 

alter view instructorNameWithCourseName 
WITH ENCRYPTION
as
(
select i.[Ins_Name] as Inst_Name  ,
ic.Crs_Id as course_id ,
c.Crs_Name as course_name
from [dbo].[Department] as d 
join [dbo].[Instructor] as i 
on i.Ins_Id = d.[Dept_Manager] 
join [dbo].[Ins_Course] as ic
on i.Ins_Id = ic.Ins_Id
join [dbo].[Course] as c
on ic.Crs_Id = c.Crs_Id
)

select Inst_Name,course_name  from instructorNameWithCourseName
-----------------------------------------------------------------------------
--3
create view InstNameWithDepartmentName  
AS  
SELECT I.Ins_Name,D.Dept_Name  
from dbo.Instructor I,dbo.Department D  
where I.Dept_Id=D.Dept_Id and D.Dept_Name in('SD','JAVA')

select * from InstNameWithDepartmentName

---------------------------------------------------------------------
--4
create view v1
as
select *
from [dbo].[Student]
where [St_Address] in ('Alex','Cairo')
WITH CHECK OPTION

Update V1 set st_address='tanta'
Where st_address='alex'

------------------------------------------------------
--5
use [MyCompany]

create view projectNameWithNumberOfEmp
as
select p.[Pname] ,count(e.Fname) as numberOfEmp
from [dbo].[Project] as p , [HR].[Employee] as e
where e.Dno = p.Dnum
group by p.[Pname]

select * from projectNameWithNumberOfEmp

-------------------------------------------------------
--6


