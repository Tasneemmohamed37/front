use [Examination_System]

--========================= 1 Create Database Roles: =================

-- Create a role for the admin account
CREATE ROLE AdminRole;

-- Create a role for the training manager account
CREATE ROLE ManagerRole;

-- Create a role for the instructor account
CREATE ROLE InstructorRole;

-- Create a role for the student account
CREATE ROLE StudentRole;

--================== 2 login on server Vs user on DB ================================
-- ////Create SQL Logins and Map Them to Database Users:
-- Create SQL logins for each account
CREATE LOGIN AdminLogin WITH PASSWORD = 'AdminPassword';
CREATE LOGIN ManagerLogin WITH PASSWORD = 'ManagerPassword';
CREATE LOGIN InstructorLogin WITH PASSWORD = 'InstructorPassword';
CREATE LOGIN StudentLogin WITH PASSWORD = 'StudentPassword';

--================== 3 Map logins to database users and assign roles ================================

CREATE USER AdminUser FOR LOGIN AdminLogin WITH DEFAULT_SCHEMA = dbo;
ALTER ROLE AdminRole ADD MEMBER AdminUser;

CREATE USER ManagerUser FOR LOGIN ManagerLogin WITH DEFAULT_SCHEMA = dbo;
ALTER ROLE ManagerRole ADD MEMBER ManagerUser;

CREATE USER InstructorUser FOR LOGIN InstructorLogin WITH DEFAULT_SCHEMA = dbo;
ALTER ROLE InstructorRole ADD MEMBER InstructorUser;

CREATE USER StudentUser FOR LOGIN StudentLogin WITH DEFAULT_SCHEMA = dbo;
ALTER ROLE StudentRole ADD MEMBER StudentUser;

--================================== 4 Assign Permissions to Roles:  ===============================================

-- Grant necessary permissions to the admin role
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo  TO AdminRole;


-- Grant necessary permissions to the training manager role
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Instructor] TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Courses] TO ManagerRole;
GRANT SELECT, INSERT, UPDATE ON [dbo].[Department] TO ManagerRole;
GRANT SELECT, INSERT, UPDATE ON  [dbo].[Branch] TO ManagerRole;
GRANT SELECT, INSERT, UPDATE ON [dbo].[Intake]  TO ManagerRole;
GRANT SELECT, INSERT, UPDATE ON [dbo].[track]  TO ManagerRole;
GRANT SELECT, INSERT, UPDATE ON  [dbo].[Student] TO ManagerRole;


-- Grant necessary permissions to the instructor role
GRANT SELECT, INSERT, UPDATE, DELETE ON  [dbo].[Question_Pool] TO InstructorRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON  [dbo].[Choises]  TO InstructorRole;
GRANT SELECT  ON  [dbo].[Courses] TO InstructorRole;
GRANT INSERT  ON  [dbo].[EXAM] TO InstructorRole;
GRANT SELECT, INSERT ON [dbo].[Exam_Question]  TO InstructorRole;
GRANT SELECT  ON [dbo].[Instructor]  TO InstructorRole;
GRANT SELECT ON  [dbo].[Student] TO InstructorRole;
GRANT SELECT ON  [dbo].[Stud_Exa_Answer]  TO InstructorRole;
GRANT SELECT  ON  [dbo].[Stud_Result] TO InstructorRole;




  

-- Grant necessary permissions to the student role
GRANT SELECT ON  [dbo].[Courses] TO StudentRole;
GRANT SELECT ON   [dbo].[Student] TO StudentRole;
GRANT SELECT ON  [dbo].[EXAM]  TO StudentRole;
GRANT SELECT ON  [dbo].[Stud_Result]  TO StudentRole;
GRANT SELECT ,INSERT ON  [dbo].[Stud_Exa_Answer]  TO StudentRole;




