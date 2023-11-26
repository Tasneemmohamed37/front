--1
select c.[Name], Co.[Name]
from [dbo].[Country] as Co inner join [dbo].[City] as c
on [Code] = [CountryCode] and  Co.[Name]='Egypt'

--2
select  Co.[Name] ,c.Population
from [dbo].[Country] as Co inner join [dbo].[City] as c
on [Code] = [CountryCode] and  c.Population > 5000000

--3
select Co.Name , l.Language , l.IsOfficial
from [dbo].[Country] as Co inner join [dbo].[CountryLanguage] as l
on [Code] = [CountryCode] and l.Language ='Dutch' and l.IsOfficial =0

--4
select Co.Name , l.Language , l.IsOfficial
from [dbo].[Country] as Co inner join [dbo].[CountryLanguage] as l
on [Code] = [CountryCode]  and l.IsOfficial =1

--5
select c.[Name] ,c.[District]
from [dbo].[City] as c join [dbo].[City] as cc
on c.District = cc.District


--group by should have aggregation
--6
select [Name]
from [dbo].[Country]
where [Continent] = 'Africa'


--7
select co.[Name] , count(l.Language)
from [dbo].[Country] as co , [dbo].[CountryLanguage] as l
where co.Code = l.CountryCode and l.IsOfficial = 'False'
group by co.Name

--8
select co.[Name] , count(l.Language)
from [dbo].[Country] as co , [dbo].[CountryLanguage] as l
where co.Code = l.CountryCode and l.IsOfficial = 'True'
group by co.Name
having count(l.Language) >=2

--9
select top 1 *
from [dbo].[Country]
order by [LifeExpectancy] desc

--10 ???
select c.[Name] as 'country'  , count(ci.Name) as 'num of city'
from [dbo].[Country] as c , [dbo].[City] as ci
where c.Code = ci.CountryCode and ci.Population > 100000000
group by c.Name
order by c.Name

--11 ???
select c.Name 
from [dbo].[Country] as c , [dbo].[City] as ci
where c.Code = ci.CountryCode
group by ci.Name
having max(ci.Population)

--12
create table WaterResource
(
	ID	int identity(1,1),
	code char(3) not null,
	[type] varchar(20) ,
	WaterResourceName varchar(50) not null,
	constraint WaterResourceCodeFKContryCode foreign key (code) references [dbo].[Country]([Code]),
	constraint WaterResourcePK primary key (code,WaterResourceName)

)

--13
insert WaterResource
values('ToT','Sea','Red sea')

select *
from WaterResource


