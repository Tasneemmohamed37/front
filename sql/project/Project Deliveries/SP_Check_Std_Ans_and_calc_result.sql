
-- mark each question of student answer and calc total degree of exam then get student passed or not

Create or alter PROCEDURE StudentModelAnswer
    @Std_Id INT,
    @Exam_ID INT
As
BEGIN TRY
	-- check info of exam
	IF NOT EXISTS (SELECT * FROM [dbo].[EXAM] WHERE [Exam_ID] = @Exam_ID)
	    BEGIN
            SELECT 'The exam does not exist' AS 'ErrMessage'
        END
		-- check student info
    ELSE IF NOT EXISTS (SELECT * FROM [dbo].[Student] WHERE [Std_Id] = @Std_Id)
	    BEGIN
            SELECT 'The student does not exist' AS 'ErrMessage'
        END
    ELSE
        BEGIN
            -- Update Std_Score based on the student's answers
            UPDATE SE
            SET SE.Std_Score = CASE WHEN C.Correct_answer = 1 THEN 1 ELSE 0 END
            FROM Stud_Exa_Answer SE
            INNER JOIN [dbo].[Choises] C ON SE.Question_ID = C.Question_ID and Se.Student_answer = C.Choise_TEXT
            WHERE SE.Exam_ID = @Exam_ID AND SE.Std_ID = @Std_Id

            -- Calculate the total number of correct answers
            DECLARE @TotalCorrectAnswers INT;
            SELECT @TotalCorrectAnswers = SUM(Std_Score)
            FROM Stud_Exa_Answer
            WHERE [Exam_ID] = @Exam_ID AND [Std_ID] = @Std_Id;
       
			-- count number of questions for this exam
			declare @QuestNombers int
			select @QuestNombers = count(Std_Score) from  Stud_Exa_Answer  WHERE [Exam_ID] = @Exam_ID AND [Std_ID] = @Std_Id

            -- Calculate the grade in percentage
            DECLARE @GradePercentage DECIMAL(5, 2);
            SELECT @GradePercentage = (@TotalCorrectAnswers / @QuestNombers)* 100

			-- check if student passed or not
			declare @IsPassed varchar(3)
			set @IsPassed = iif(@GradePercentage >= 60 , 'YES','NO')
	
            -- Return the grade percentage
            SELECT @Std_Id AS Std_Id,'get total score: ' + CAST(@GradePercentage AS VARCHAR) + ' For Exam: ' + CAST(@Exam_ID AS VARCHAR) AS Result

			-- insert student degree data into student result
			INSERT INTO  [dbo].[Stud_Result] ([Std_ID] , [Exam_ID] ,[Result] ,[PassedORnot] )
			VALUES (@Std_Id , @Exam_ID , @GradePercentage , @IsPassed );

        END
 
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS errorMessage
END CATCH
