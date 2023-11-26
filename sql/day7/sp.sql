use ITI
go


--1
create or alter proc SP_StudentNumPerDept01 @Dept_id int
as
select [Dept_Id] , count(St_Id) as 'Student num per this department'
from [dbo].[Student]
where [Dept_Id] = @Dept_id
group by [Dept_Id]
go

SP_StudentNumPerDept01 10
go
--------------------------------------------------------------------
--2
use [MyCompany]
go

create or alter proc SP_EmpNumbersByProjectName01 @Project_name nvarchar(50)
as
	begin 
		declare @EmpCount int 
		declare @ProjectNo int

			select @ProjectNo = [Pnumber]
			from [dbo].[Project]
			where [Pname] = @Project_name

			select @EmpCount= count(ESSn) 
			from [dbo].[Works_for]
			where [Pno] = @ProjectNo

			


			IF @EmpCount >= 3 
				SELECT 'The number of employees in the project p1 is 3 or more' as 'details'
			ELSE
				begin
				SELECT 'The following employees work for the project p1' as 'details'

				SELECT ESSn
				FROM [dbo].[Works_for]
				WHERE Pno = @ProjectNo
				end
			
	end
go

SP_EmpNumbersByProjectName01 'AL Solimaniah'
go
----------------------------------------------------------------

--3

CREATE PROCEDURE ReplaceEmployeeInProject @oldEmpNumber INT, @newEmpNumber INT, @projectNumber VARCHAR(50)
as
BEGIN
    UPDATE [dbo].[Works_for]
    SET  [ESSn] = @newEmpNumber
    WHERE  [ESSn] = @oldEmpNumber
    AND [Pno] = @projectNumber
    
    IF @@ROWCOUNT > 0
        SELECT 'Employee replacement successful.' AS message;
    ELSE
        SELECT 'No changes made. Please check the provided employee and project numbers.' AS message;

    
END

ReplaceEmployeeInProject 512463 , 1162001 , 600