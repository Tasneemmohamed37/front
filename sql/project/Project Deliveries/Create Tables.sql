use [Examination]

Create table Student 
(
Std_ID int identity(1,1),
Std_Name varchar(50) Not Null,
Std_Gender varchar(1) ,
Std_Phone varchar(11) ,
Std_Email varchar(50) unique ,
Std_Address varchar(20) default 'Minia',
constraint PK_Student primary key (Std_ID),
constraint Std_GenderCheck Check (Std_Gender in ('M','F'))
);

Create table Exam 
(
Exam_NO int Not Null ,
Exam_type varchar(10) not null,
Duration int ,
Options varchar(50),
Exam_Date date,
Crs_Code int,
constraint PK_Eaxm primary key (Exam_NO),
constraint FK_Crs_Ex foreign key (Crs_Code) references [dbo].[Course](Crs_Code),
constraint ExamTypeCheck check (Exam_type in ('exam','corrective'))
);

create table Exam_Quest
(
Exam_NO int ,
Quest_NO int ,
constraint PK_Eaxm_Quest primary key (Exam_NO , Quest_NO),
constraint FK_Quest_ExQuest foreign key (Quest_NO) references [dbo].[Question](Quest_NO),
constraint FK_Exam_ExQuest foreign key (Exam_NO) references [dbo].[Exam](Exam_NO)
);


create table Student_Exam
(
Std_ID int ,
Exam_NO int,
Total_degree int ,
PRIMARY KEY (Std_ID, Exam_NO ),
constraint FK_Std_StdEx foreign key (Std_ID) references [dbo].[Student]([Std_ID]),
constraint FK_Ex_Std_Ex foreign key (Exam_NO) references [dbo].[Exam]([Exam_NO])
);


create table Question
(
Quest_NO int identity(1,1),
Quest_Text nvarchar(300) ,
Quest_Type varchar(20),
Quest_Degree int not null ,
Crs_Code int ,
Ins_ID int ,
constraint PK_Quest primary key  (Quest_NO),
constraint FK_Crs_Quest foreign key (Crs_Code) references [dbo].[Course](Crs_Code),
constraint FK_Ins_Quest foreign key (Ins_ID) references [dbo].[Instructor](Ins_ID),
constraint QuestTypeCheck Check (Quest_Type in ('MCQ','T/F' , 'Text'))
);


create table Choises
(
Choise_Id int identity(1,1) primary key,
Quest_NO int ,
choise_Text varchar(100) not null ,
IsCorrect varchar(1) ,
constraint IsCorrectCheck Check (IsCorrect in ('0','1')),
constraint FK_Quest_Choises foreign key (Quest_NO) references Question(Quest_NO)
);

create table Std_Ex_Answer
(
Std_ID int,
Exam_NO int,
Quest_NO int,
Std_Answer varchar(100),
Std_Score int ,
primary key (Std_ID ,Exam_NO,Quest_NO),
constraint FK_Std_SEA foreign key (Std_ID) references Student(Std_ID) ,
constraint FK_Ex_SEA foreign key (Exam_NO) references Exam (Exam_NO),
constraint FK_Quest_SEA foreign key (Quest_NO) references Question(Quest_NO)
);

create table Intake
(
Intake_name varchar(50) primary key,
StartDate date ,
EndDate date
);

create table Branch
(
Branch_name  varchar(50) not null primary key,
Branch_Id int identity(1,1)  
);

create table Track
(
Track_name  varchar(50) not null primary key,
Track_Id int identity(1,1)  
);

create table Intake_branch_tarck
(
Intake_name varchar(50) ,
Branch_name  varchar(50),
Track_name  varchar(50),
Std_ID int ,
primary key (Intake_name , Branch_name , Track_name ,Std_ID),
constraint FK_Intack_IBT foreign key (Intake_name) references Intake(Intake_name) ,
constraint FK_Branch_IBT foreign key (Branch_name) references Branch (Branch_name) ,
constraint FK_Track_IBT foreign key (Track_name) references Track (Track_name),
constraint FK_Std_IBT foreign key (Std_ID) references [dbo].[Student](Std_ID)
);

CREATE TABLE Department (
    Dept_No INT identity(1,1) PRIMARY KEY,
    Dept_name VARCHAR(50),
    Dept_Location VARCHAR(50),
    Manager_Id INT ,
	

);

alter table Department
add constraint FK_Ins_Dept foreign key (Manager_Id) references [dbo].[Instructor](Ins_ID)

CREATE TABLE Course (
    Crs_Code INT identity(1,1) PRIMARY KEY,
    Crs_Name VARCHAR(50),
    Min_degree VARCHAR(50),
    Max_degree VARCHAR(50),
	--???
    --Std_Degree VARCHAR(50) 
);

CREATE TABLE Instructor (
    Ins_ID INT identity(1,1) PRIMARY KEY,
    Ins_Name VARCHAR(50),
    Email VARCHAR(100) unique ,
    Phone VARCHAR(11),
    Salary DECIMAL(10, 2),
    Gender CHAR(1),
    Crs_Code INT,
    Dept_No INT,
	constraint InstructorGenderCheck Check (Gender in ('M','F')),
	constraint FK_Course_Instructor foreign key (Crs_Code) references Course(Crs_Code) ,
    constraint FK_Dept_Instructor FOREIGN KEY (Dept_No) REFERENCES Department(Dept_No)
);



CREATE TABLE Std_Course (
    Std_ID INT,
    Crs_Code INT,
	primary key (Std_ID ,Crs_Code),
    constraint FK_Course_SC foreign key (Crs_Code) references Course (Crs_Code),
	constraint FK_Std_SC foreign key (Std_ID) references [dbo].[Student]([Std_ID])

);