-- Types of SP
---- 1. User defined
			Sp_GetStudentNameById   SP_Getdata   SP_Sumdata
---- 2. Built-In SP
			Sp_helptext     Sp_Rename 
---- 3. Trigger (Special Stored Procedure)
----------- Can't Call
----------- Can't take parameters

--- Types of Triggers (Through Its Level)
---------- Server Level
---------- DB Level
---------- Table Level (Our Interest)
----------------- Actions In Table?(Insert   Update   Delete) [Events]
---------------------------------(Select Truncate) Not Logged In Log File



USE [ITI]
GO
-- was found befour
/****** Object:  Trigger [dbo].[AddRow]    Script Date: 8/16/2023 3:24:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create   trigger [dbo].[AddRow] on [dbo].[Student]
after insert
as
insert into StudentAudit (serverUserName,Dateof,Note)
values (SUSER_NAME(),GETDATE(),SUSER_NAME()+'Insert New Row with data ='+
(select concat(St_Id,St_Fname,St_Lname,St_Address,St_Age) from inserted)+'in table student')
GO

ALTER TABLE [dbo].[Student] ENABLE TRIGGER [AddRow]
GO
--------------------------------------------------------------------
-- was found befor
create or alter  trigger [dbo].[DontDelete] 
on [dbo].[Student]
instead of delete
as
	insert into StudentAudit (serverUserName,Dateof,Note)
	values (SUSER_NAME(),GETDATE(),SUSER_NAME()+' try to delete Row with id ='+(select concat(' ',St_Id) from deleted))
	GO
--===================================================================


create or alter trigger [insertIntoStudent]
on [dbo].[Student]
after insert 
as
	select 'welecome by first trigger'
GO

insert into Student ([St_Id], St_Fname , St_Lname , St_Address ,[St_Age]  , [Dept_Id] , [St_super])
values (17,'tasneem','muhammed','minia',22,40 ,12)

go
---------------------------------------
create or alter trigger GetDateAndUserNameWhenUpdateWhenUpdate
on [dbo].[Student]
after update
as
	select GETDATE() as 'Data and Time' , SUSER_NAME()

	update [dbo].[Student]
		set [St_Age] = 23
		where [St_Id] = 17
go
---------------------------------------------------------
create trigger preventDelete
on [dbo].[Student]
instead of delete
as
	select 'you cant delete from this table ' + SUSER_NAME()


	delete from [dbo].[Student]
	where [St_Id] = 17


alter table student 
disable trigger preventDelete
go
----------------------------------------------------
Create or alter Trigger Tri06
on [dbo].[Course]
Instead OF Delete
as
	Select 'U Can Not Delete From This Table : ' + (Select Crs_Name from deleted)

Delete From Course	
	Where Crs_Id = 900

go
--------------------------------------------------------------------------------
Alter Trigger Tri07
on Student
Instead OF Delete
as
	if Format( GETDATE(), 'dddd') != 'Wednesday'
		Delete From Student
			Where St_Id in (Select St_Id from deleted)

			
Delete from Student
	Where St_Id = 3242

--================================================================

