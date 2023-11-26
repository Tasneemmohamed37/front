
create PROC [dbo].[Ist_Set_Exam_manually]
	@InstEmail varchar(50) ,
	@Password varchar(25) ,
	@Crs_ID INT,
	@Ex_NO INT ,
	@Ex_Duration INT,
	@Exam_Type varchar(20),
	@Question_ID_num1 int ,
	@Question_ID_num2 int ,
	@Question_ID_num3 int ,
	@Question_ID_num4 int ,
	@Question_ID_num5 int ,
	@Question_ID_num6 int ,
	@Question_ID_num7 int ,
	@Question_ID_num8 int ,
	@Question_ID_num9 int ,
	@Question_ID_num10 int 
AS
BEGIN TRY
	-- get ist id to reduce amount of inputs
	declare @Instructor_id int 
	set @Instructor_id = ( select ins.Id from [Instructor] as ins where ins.Email = @InstEmail )

	-- check identity of instructor by password and courses he teach
    IF EXISTS
	(
		SELECT [Email] ,[Insructor_pass]  , c.Course_Code , c.Instructor_ID
		FROM [dbo].[Instructor] , [dbo].[Courses] as c 
		WHERE  [Email]= @InstEmail AND [Insructor_pass] = @Password and c.Instructor_ID =  @Instructor_id and c.Course_Code = @Crs_ID
	)
		    BEGIN TRY
				-- check course inf
				IF NOT EXISTS (SELECT * FROM Courses WHERE [Course_Code] = @Crs_ID)
					BEGIN
						SELECT 'The course does not exist' AS 'ErrMessage'
					END
				ELSE
					BEGIN
						
						declare @total_number_of_Quest int 
						set @total_number_of_Quest =10

						declare @total_degrees_of_Exams_for_spesific_course int
					    select @total_degrees_of_Exams_for_spesific_course = ISNULL(sum([Ex_Degree]),0) from  [dbo].[EXAM]
						where [course_CODE] = @Crs_ID

						declare @Course_degree int
						select @Course_degree = [Degree] from [dbo].[Courses] where [Course_Code] = @Crs_ID

						if (@total_degrees_of_Exams_for_spesific_course + @total_number_of_Quest ) <= @Course_degree
						begin

						--SET IDENTITY_INSERT [dbo].[EXAM] ON
						-- Generate  an exam with 10 questions include spesific quest
						INSERT INTO EXAM ([Exam_ID], Ex_Date, Ex_Duration,[course_CODE],[Ex_Degree] )
						VALUES (@Ex_NO, GETDATE(), @Ex_Duration, @Crs_ID , @total_number_of_Quest);

						-- Select questions 
						INSERT INTO [dbo].[Exam_Question](Exam_NO , Quest_NO)
						SELECT  @Ex_No, Q.Question_ID
						FROM [dbo].[Question_Pool]Q
						WHERE Q.Course_ID = @Crs_ID AND Q.Question_ID in  (@Question_ID_num1 , @Question_ID_num2  , @Question_ID_num3  , @Question_ID_num4  , @Question_ID_num5  , @Question_ID_num6  , @Question_ID_num7  , @Question_ID_num8  , @Question_ID_num9  , @Question_ID_num10 )
						

			
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


