
use [MyCompany]


--1
CREATE SCHEMA HR

alter schema HR
transfer [dbo].[Employee]

select * 
from [HR].[Employee]

--2
CREATE TYPE CityUDD FROM nvarchar(10)

--3
CREATE TYPE tel FROM nvarchar(11) not null

--4
create default d as 'Not applied'
sp_bindefault d ,'[HR].[Employee].[Lname]'

--5
create rule rule1 as @Col in ('Assiut','Mansoura','Cairo','Alex','Ismalia')
sp_bindrule rule1,'[HR].[Employee].[Address]'

--6
sp_bindefault d ,'CityUDD'
sp_bindrule rule1,'CityUDD'

--7
CREATE TYPE IDNumber FROM char(14) NOT NULL;
create table student
(
IDNo IDNumber Primary key,
[Name] nvarchar(50)
)

--8
CREATE SEQUENCE idSequence
START WITH 1
INCREMENT BY 1

insert into [dbo].[student]([IDNo],[Name]) 
values(NEXT VALUE FOR idSequence,'tasneem')

insert into [dbo].[student]([IDNo],[Name]) 
values(NEXT VALUE FOR idSequence,'laren')

insert into [dbo].[student]([IDNo],[Name]) 
values(NEXT VALUE FOR idSequence,'kamelia')

DELETE FROM [dbo].[student] WHERE [IDNo]=2

insert into [dbo].[student]([IDNo],[Name]) 
values(NEXT VALUE FOR idSequence,'younis')

insert into [dbo].[student]([IDNo],[Name]) 
values(NEXT VALUE FOR idSequence,'zain')

insert into [dbo].[student]([IDNo],[Name]) 
values(NEXT VALUE FOR idSequence,'laren')

--d ==> error
insert into [dbo].[student]([IDNo],[Name]) 
values(4,'kamelia')

--9
create synonym s 
for [dbo].[student]

select *from s



