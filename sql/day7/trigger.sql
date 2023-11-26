--4

use [MyCompany]
go

create or alter trigger preventInsertIntoEmployeeInMarch
on [HR].[Employee]
instead of insert 
as
	if format(GETDATE(),'MMMM') != 'March'
		begin
			insert into [HR].[Employee]([Fname],[SSN])
			(select Fname , SSN from inserted)
		end

insert into [HR].[Employee]([Fname],[SSN])
values('laren', 111)

go
---------------------------------------------------------------
--5

create trigger preventInsertOnDepartmentTable
on [dbo].[Departments]
instead of insert
as	
	select 'cant insert new record in this table'

insert into [dbo].[Departments]
values('DP5',40,223344,'2006-01-03')
go
--------------------------------------------------
--6
create table StudentAudittable
(
serverUserName nvarchar(100),
[date] date
)

create or alter trigger StudentAfterInsert
on [dbo].[student]
after insert 
as
	select SUSER_NAME()+' Insert New Row with ID = '+ (select [IDNo] from inserted) + 'in table Student'
	insert into [dbo].[StudentAudittable]
	values(SUSER_NAME(),GETDATE())
	

	insert into [dbo].[student]
	values(13,'selim')

------------------------------------------------------------------
--7
create or alter trigger StudentInsteadOfDelete
on [dbo].[student]
instead of delete 
as
	select SUSER_NAME()+' try to delete row with ID = '+ (select [IDNo] from deleted) + 'in table Student'
	insert into [dbo].[StudentAudittable]
	values(SUSER_NAME(),GETDATE())

	delete from [dbo].[student]
	where [IDNo]=13
	