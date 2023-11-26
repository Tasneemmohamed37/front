
-- student do his exam in spesific course 

ALTER PROC [dbo].[StudentExamAnswers]
	@Std_Id INT,
	@Stu_Password varchar(10),
    @Exam_ID INT,
    @Question_ID INT,
    @Student_answer varchar(100)
	
AS
BEGIN TRY
	-- check student idintity
	IF EXISTS
	(
		SELECT [Std_Id] , [Stu_Password]
		FROM  [dbo].[Student]
		WHERE [Std_Id] = @Std_Id AND [Stu_Password] = @Stu_Password
	)
		begin
		BEGIN TRY
			-- check exam info
			IF NOT EXISTS (SELECT * FROM [dbo].[EXAM] WHERE Exam_ID = @Exam_ID)
				BEGIN
					SELECT 'The exam does not exist' AS 'ErrMessage'
				END
				-- check quest if exist or not
			ELSE IF NOT EXISTS (SELECT * FROM [dbo].[Question_Pool] WHERE [Question_ID] = @Question_ID)
				BEGIN
					SELECT 'The question does not exist' AS 'ErrMessage'
				END
				-- check std data
			ELSE IF NOT EXISTS (SELECT * FROM [dbo].[Student] WHERE [Std_Id] = @Std_Id)
				BEGIN
					SELECT 'The student does not exist' AS 'ErrMessage'
				END
			ELSE
				BEGIN 
					-- insert student answer
					INSERT INTO [dbo].[Stud_Exa_Answer] ([Std_ID] , [Exam_ID] , Question_ID , [Student_answer])
					VALUES (@Std_Id,@Exam_ID ,@Question_ID ,@Student_answer );
				END
		END TRY

		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ErrorMessage
			END CATCH
		end
    
	ELSE
		BEGIN
			select 'student password not correct please enter correct password'
		END
	
END TRY

BEGIN CATCH
	SELECT ERROR_MESSAGE() AS errorMessage
END CATCH
GO


