-- scalar => return only one value

create function detManagerNameByDeptName (@dept_name nvarchar (50))
returns nvarchar(50)
begin
declare @mng_name nvarchar(50)
select @mng_name= e.Fname
from [HR].[Employee] as e ,[dbo].[Departments] as d 
where e.SSN = d.MGRSSN and d.Dname = @dept_name
return @mng_name
end

select dbo.detManagerNameByDeptName ('DP1')
-------------------------------------------------------
--inline => return table

create function GetInstructorsByDeptId (@dept_id int)
returns table 
as
return
(
select [Ins_Name],[Ins_Degree],[Salary]
from [dbo].[Instructor]
where [Dept_Id] = @dept_id
)

select * from dbo.GetInstructorsByDeptId(10)

-----------------------------------------------
--multiline => return table

create function StudentNameBasedOnPassedFormate (@format varchar (20))
returns @t table ( st_id int, st_name nvarchar (50))
as
begin
	if @format = 'first'
		insert into @t
		select [St_Id],[St_Fname]
		from [dbo].[Student]
	else if @format='last'
		insert into @t
		select [St_Id],[St_Lname]
		from [dbo].[Student]
	else if @format='full'
		insert into @t
		select [St_Id] , concat([St_Fname],' ',[St_Lname])
		from [dbo].[Student]
	return 
end

select * from [dbo].[StudentNameBasedOnPassedFormate]('full')