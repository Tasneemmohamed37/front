use [AdventureWorks2022]
select [NationalIDNumber],[LoginID] ,[JobTitle] from [HumanResources].[Employee]

select [Title],[FirstName],[LastName]
from [Person].[Person]
where [Title] ='Ms.' or [LastName]='Antrim'


select [SalesOrderNumber], [ShipDate] 
from [Sales].[SalesOrderHeader]
where [ShipDate] between '2002-07-28' and '2002-07-29'

select [ProductID],[Name]
from [Production].[Product]
where [StandardCost] < 110

select * from [Production].[Product]
where [Name] like '[B]%'

select [DueDate] ,[OrderDate] , count(*)as 'count', max([TotalDue]) as 'Max TotalDue'
from [Sales].[SalesOrderHeader]
where [DueDate] between '2011-07-1' and '2011-07-29'
group by [TotalDue]
