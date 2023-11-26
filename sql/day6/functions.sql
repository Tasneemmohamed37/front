--1
create function ValuesBetweenTwoIntegers(@first_int int , @second_int int)
returns @t table (num int)
as
begin 
	while @first_int < @second_int
	begin
		insert into @t select @first_int
		set @first_int = @first_int +1
	end
	return
end

select * from dbo.ValuesBetweenTwoIntegers(1,5)

-----------------------------------------------------------------

--2 parameter????
alter function GetEmpDetailsBasedOnId (@Emp_Id int)
returns table 
as 
return
(
select
p.FirstName  ,

ISNULL(p.title , 'Not provided') as title, 

case 
	when e.MaritalStatus ='S' then 'single'
	when e.MaritalStatus ='M' then 'Married'
end as MaritalStatus,

case
	when e.Gender='M' then 'male'
	when e.Gender='F' then 'female'
end as gender

from [HumanResources].[Employee] as e , [Person].[Person] as p
where p.BusinessEntityID = e.BusinessEntityID and p.BusinessEntityID = @Emp_Id

)

select * from dbo.GetEmpDetailsBasedOnId(5)

-----------------------------------------------------------------

--3 add date ????
alter function EmployeeDetailsWithClacYearsOfExp ()
returns table
as
return
(
select 
p.FirstName  ,
ISNULL(p.title , 'Not provided') as title, 
e.[HireDate],
datediff(year,[HireDate],getDate()) as yearsOfExp,
e.[BirthDate],
DATEADD(year, 21, e.[BirthDate]) as graduationYear
from [HumanResources].[Employee] as e , [Person].[Person] as p
where p.BusinessEntityID = e.BusinessEntityID
)

select * from dbo.EmployeeDetailsWithClacYearsOfExp()

------------------------------------------------------------

--4
create function netSalaryAfterIncrease (@salary int , @ExperYears int)
returns int
as
begin

declare @increasePer DECIMAL(10, 2) = @ExperYears * 0.1
if @increasePer > 0.7
	set @increasePer = 0.7

declare @netSalary int = @salary +( @salary * @increasePer)
return @netSalary
end


select dbo.netSalaryAfterIncrease(8000,2)

------------------------------------------------------------
--5
alter function highest10SalaryInThisDepartment (@DepratmentId int)
returns table
as
return
(
select top 10 p.FirstName , s.Rate
from [Person].[Person] as p , [HumanResources].[EmployeePayHistory] as s , [HumanResources].[EmployeeDepartmentHistory] as d
where p.BusinessEntityID = s.BusinessEntityID and s.BusinessEntityID =d.BusinessEntityID and d.DepartmentID = @DepratmentId
order by s.Rate desc
)
select * from dbo.highest10SalaryInThisDepartment(5)
