use [World]


--1
select * from [dbo].[Country]

--2
select distinct [Language]
from  [dbo].[CountryLanguage]

--3
select [Name] ,[Region]
from [dbo].[Country]
where [Continent] ='Africa'
order by [Region]

--4
select [Name] , [Population]
from [dbo].[City]
where [Population] > 2000000

--5
select [Name] ,[IndepYear]
from [dbo].[Country]
where [IndepYear] between 1920 and 1990

--6
select [Name] ,[IndepYear]
from [dbo].[Country]
where [IndepYear] is null

--7
select [Name],[GovernmentForm]
from [dbo].[Country]
where [GovernmentForm] = 'Republic'

--8 
select [Name] ,[Continent] ,[Population]
from [dbo].[Country]
where [Continent] = 'Asia' and [Population] > 1000000000

--9
select [Code] ,[Name] ,[Language]
from [dbo].[Country] c , [dbo].[CountryLanguage] l
where c.Code = l.CountryCode and Language = 'Spanish'

--10
select  [CountryCode] , count(*)as 'count'
from [dbo].[CountryLanguage]
group by [CountryCode]
having COUNT(*)> 2

--11
select sum(cast([Population] as bigint)) 
from [dbo].[Country]

--12
select [Continent] ,sum(cast([Population] as bigint))
from [dbo].[Country]
group by [Continent]



--13
insert [dbo].[Country] 
values('ToT','Tasneem','San Salvador','region',193,null ,25467284,90,0,793,'Aruba','Republic','José Eduardo dos Santos',1,'AO')

select *
from [dbo].[Country]
where [Code] = 'ToT'

--14
update [dbo].[Country]
set [LifeExpectancy] +=5
where [Name] = 'Egypt'
