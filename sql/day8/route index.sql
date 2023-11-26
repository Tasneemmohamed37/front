----------------------------------------------------------------
----------------------------- Index -------- -------------------
create clustered index myindex
on student(st_fname) -- Not Valid [Table already has a clustered index on PK]


create nonclustered index myindex
on student(st_fname)

create nonclustered index myindex2
on student(dept_id)

-- Primary Key   ---Constraint   ---> Clustered Index

-- Unique Key    ---Constraint   ---> Nonclustered Index
create table test
(
 X int primary key,
 Y int unique,
 Z int unique
)

create unique index i3
on student(st_age)
-- Will Make 2 Things If There is No Repeated Values
-- 1. Make Unique Constraint On St_Age 
-- 2. Make Non-Clustered Index On St_Age




-- Clustered Index Vs Nonclustered Index
-- Just One							... Many Up To 999
-- Last Level Is The Actual Data	... PreLast Level Is Pointer To Actual Data
-- Faster							...	Slower
-- PK => Clustered					... Unique => Nonclustered


-- How Can I Select The Columns To Make Indexes On It?
-- 1. Analysis
-- 2. Testing (Using SQL Server Profiler and Tuning Advisor)

Alter Schema dbo
Transfer HR.Instructor 






Create View IndexedView
With SchemaBinding
As
	Select S.St_Id, S.St_FName, D.Dept_Id, D.Dept_Name
	from dbo.Student S, dbo.Department D
	Where D.Dept_Id = S.Dept_Id

Create unique clustered Index ii
On IndexedView(St_Id)