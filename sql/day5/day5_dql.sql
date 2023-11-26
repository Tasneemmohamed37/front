use [MyCompany]

--1
select e.[Fname] , d.[Dependent_name]  , d.Sex as 'dependant gender'
from [dbo].[Employee] as e  ,[dbo].[Dependent] as d
where e.SSN = d.ESSN and e.Sex ='F' and d.Sex ='F'
union
select e.[Fname] , d.[Dependent_name]  , d.Sex as 'dependant gender'
from [dbo].[Employee] as e  ,[dbo].[Dependent] as d
where e.SSN = d.ESSN and e.Sex ='M' and d.Sex ='M'

--2
select p.[Pname] ,SUM([Hours]) as 'total hours'
from [dbo].[Project] as p , [dbo].[Works_for] as w 
where p.Pnumber = w.Pno
group by p.Pname

--3
select *
from [dbo].[Departments] 
where [Dnum] = (
select top 1 [Dno] 
from [dbo].[Employee]
order by [SSN] asc 
)


--4
select d.Dname ,max( e.Salary) as 'max salary for this department' , min(e.Salary) as 'min salary for this department'
from [dbo].[Departments] as d , [dbo].[Employee] as e 
where e.Dno = d.Dnum
group by d.[Dname]

--5 ????
select d.Dname ,e.Fname ,e.Lname , e.SSN
from [dbo].[Departments] as d , [dbo].[Employee] as e 
where d.MGRSSN = e.SSN

--6 ?????
select * 
from [dbo].[Employee]
where [Salary] < (
select  avg(e.Salary) as 'avg salary for this deparmtent'
from [dbo].[Departments] as d , [dbo].[Employee] as e 
where e.Dno = d.Dnum
group by d.[Dname]
)

--6 gpt
SELECT emp.*
FROM [dbo].[Employee] AS emp
JOIN (
    SELECT d.[Dnum], AVG(e.[Salary]) AS avg_salary
    FROM [dbo].[Departments] AS d
    JOIN [dbo].[Employee] AS e ON e.[Dno] = d.[Dnum]
    GROUP BY d.[Dnum]
) AS dept_avg ON emp.[Dno] = dept_avg.[Dnum]
WHERE emp.[Salary] < dept_avg.avg_salary


--7 ???
select e.Fname as 'emp name' , w.Pno as 'project num'  , e.Dno
from [dbo].[Employee] as e , [dbo].[Works_for] as w 
where e.SSN = w.ESSn
order by e.Fname 


--8
select top 2 *
from [dbo].[Employee]
order by [Salary] desc

-- with ranking???
select * 
from [dbo].[Employee]
where [Salary]  in 
(
select DISTINCT top 2 Salary
from [dbo].[Employee]
order by [Salary] desc
)


SELECT *
FROM (
  SELECT *, RANK() OVER (ORDER BY salary DESC) AS salary_rank
  FROM [dbo].[Employee]
) AS ranked_employees
WHERE salary_rank <= 2;


--9
SELECT DISTINCT e.Fname
FROM [dbo].[Employee] as e
JOIN [dbo].[Dependent] d ON e.SSN = d.ESSN
WHERE d.dependent_name LIKE CONCAT('%', e.Fname , '%')

--10 => wizard

--11


--12
update [dbo].[Employee]
set Salary=  Salary + (Salary * 30/100)
where [SSN]=(
select [ESSn]
from [dbo].[Works_for]
where [Pno] =(
select [Pnumber]
from  [dbo].[Project]
where [Pname] ='Al Rabwah')
)