-- set exam by inst of spesific course

create or alter ALTER PROC [dbo].[Ist_Set_Exam]
	@InstEmail varchar(50) ,
	@Password varchar(25) ,
	@Crs_ID INT,
	@Ex_NO INT ,
	@Ex_Duration INT,
	@Exam_Type varchar(20),
	@Num_TF_Questions INT,
	@Num_MCQ_Questions INT,
	@Num_Text_Questions int
AS
BEGIN TRY
	-- get ins id based on int email
	declare @Instructor_id int 
	set @Instructor_id = ( select ins.Id from [Instructor] as ins where ins.Email = @InstEmail )

	-- make sure of corrcteness of inst info
    IF EXISTS
	(
		SELECT [Email] ,[Insructor_pass]  , c.Course_Code , c.Instructor_ID
		FROM [dbo].[Instructor] , [dbo].[Courses] as c 
		WHERE  [Email]= @InstEmail AND [Insructor_pass] = @Password and c.Instructor_ID =  @Instructor_id and c.Course_Code = @Crs_ID
	)
		    BEGIN TRY
				-- check course info
				IF NOT EXISTS (SELECT * FROM Courses WHERE [Course_Code] = @Crs_ID)
					BEGIN
						SELECT 'The course does not exist' AS 'ErrMessage'
					END
				ELSE
					BEGIN
						-- calc total numbers of question for this exam
						declare @total_number_of_Quest int 
						set @total_number_of_Quest = @Num_TF_Questions + @Num_MCQ_Questions + @Num_Text_Questions

						--calc total degree of all exams for this course
						declare @total_degrees_of_Exams_for_spesific_course int
					    select @total_degrees_of_Exams_for_spesific_course = ISNULL(sum([Ex_Degree]),0) from  [dbo].[EXAM]
						where [course_CODE] = @Crs_ID

						-- get course max degree
						declare @Course_degree int
						select @Course_degree = [Degree] from [dbo].[Courses] where [Course_Code] = @Crs_ID

						-- make sure create this exam will not execce max degree for this course => as payment
						if (@total_degrees_of_Exams_for_spesific_course + @total_number_of_Quest ) <= @Course_degree
						begin
						--SET IDENTITY_INSERT [dbo].[EXAM] ON
						-- Generate a random exam  
						INSERT INTO EXAM ([Exam_ID], Ex_Date, Ex_Duration,[course_CODE],[Ex_Degree] )
						VALUES (@Ex_NO, GETDATE(), @Ex_Duration, @Crs_ID , @total_number_of_Quest);

						-- Select True/False questions related to the same course
						INSERT INTO [dbo].[Exam_Question](Exam_NO , Quest_NO)
						SELECT TOP (@Num_TF_Questions) @Ex_No, Q.Question_ID
						FROM [dbo].[Question_Pool]Q
						WHERE Q.Course_ID = @Crs_ID AND Q.Question_type = 'T/F'
						ORDER BY NEWID();

						-- Select Multiple Choice questions related to the same course
						INSERT INTO [dbo].[Exam_Question](Exam_NO ,[Quest_NO])
						SELECT TOP (@Num_MCQ_Questions) @Ex_No, Q.Question_ID
						FROM [dbo].[Question_Pool]Q
						WHERE Q.Course_ID = @Crs_ID AND Q.Question_type = 'MCQ'
						ORDER BY NEWID();
    
						-- Select text questions related to the same course
						INSERT INTO [dbo].[Exam_Question](Exam_NO ,[Quest_NO])
						SELECT TOP (@Num_Text_Questions) @Ex_No, Q.Question_ID
						FROM [dbo].[Question_Pool]Q
						WHERE Q.Course_ID = @Crs_ID AND Q.Question_type = 'text'
						ORDER BY NEWID();
			
						-- Select exam model
						SELECT Q.Question_type, Q.Question_Text,ISNULL(STRING_AGG(Ch.Choise_TEXT, ', '),'') AS Choices
						FROM [dbo].[Exam_Question] eq, [dbo].[Question_Pool] Q, [dbo].[EXAM] E , [dbo].[Choises] Ch
						WHERE eq.[Exam_NO] = E.Exam_ID AND eq.[Quest_NO] = Q.Question_ID AND eq.[Exam_NO] = @Ex_No and ch.Question_ID = Q.Question_ID
						GROUP BY Q.Question_type, Q.Question_Text
						end
						else 
							begin
								select 'sorry , total degree of exams Exceeds course max degree'
							end
					END
			END TRY
			BEGIN CATCH
				SELECT ERROR_MESSAGE() AS errorMessage
			END CATCH
	ELSE
		BEGIN
			select 'ONLY instructor of this course can manage Question Pool';
		END
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS errorMessage
END CATCH
GO


