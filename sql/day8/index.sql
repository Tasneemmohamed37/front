--1
--Full Backup:
	--A full backup is a complete backup of the entire database.
	--It includes all data and objects within the database.

--Differential Backup:
	--A differential backup only includes the changes made to the database since the last full backup.
	--Use a differential backup when: You need to restore the database to a specific point in time after a full backup.

--Transaction Log Backup:
	--A transaction log backup captures the transaction log records, which contain every transaction performed on the database since the last transaction log backup or the start of the database. It allows for point-in-time recovery and helps maintain data consistency.
	--Use a transaction log backup when:
	--You need to restore the database to a specific point in time, such as just before an error occurred.
	--You want to recover the database to a specific transaction or moment.
	--You want to free up space in the transaction log file after the log records have been backed up.

-------------------------------------------------------------------------------------------------------
--3-a  Not Valid [Table already has a clustered index on PK]

--3-b
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)

)

create clustered index PersonIDindex
on Persons(PersonID)

--3-c  yes any column can used if table not have a pk 

--3-d yes , you can change a clustered index to a non-clustered index and create a new clustered index on another column.
--However, altering an existing clustered index to a non-clustered index or creating a new clustered index
--involves reorganizing or rebuilding the table, which can be a time-consuming operation,
--especially for large tables. It's important to consider the impact on performance
--and resource usage before making such changes


--4
create nonclustered index myindex
on student([Name])

-- Clustered Index				 Vs			 Nonclustered Index
-- Just One								... Many Up To 999
-- Last Level Is The Actual Data		... PreLast Level Is Pointer To Actual Data
-- Faster								...	Slower
-- PK => Clustered						... Unique => Nonclustered


