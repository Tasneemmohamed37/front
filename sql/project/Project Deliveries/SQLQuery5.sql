USE [Examination_System]
GO

/****** Object:  StoredProcedure [dbo].[StudentModelAnswer]    Script Date: 9/3/2023 2:08:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[StudentModelAnswer]
    @Std_Id INT,
    @Exam_ID INT
As
BEGIN TRY
	IF NOT EXISTS (SELECT * FROM [dbo].[EXAM] WHERE [Exam_ID] = @Exam_ID)
	    BEGIN
            SELECT 'The exam does not exist' AS 'ErrMessage'
        END
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
       
			declare @QuestNombers int
			select @QuestNombers = count(Std_Score) from  Stud_Exa_Answer  WHERE [Exam_ID] = @Exam_ID AND [Std_ID] = @Std_Id

            -- Calculate the grade in percentage
            DECLARE @GradePercentage DECIMAL(5, 2);
            SELECT @GradePercentage = (@TotalCorrectAnswers / @QuestNombers)* 100

			declare @IsPassed varchar(3)
			set @IsPassed = iif(@GradePercentage >= 60 , 'YES','NO')
	
            -- Return the grade percentage
            SELECT @Std_Id AS Std_Id,'get total score: ' + CAST(@GradePercentage AS VARCHAR) + ' For Exam: ' + CAST(@Exam_ID AS VARCHAR) AS Result

			INSERT INTO  [dbo].[Stud_Result] ([Std_ID] , [Exam_ID] ,[Result] ,[PassedORnot] )
			VALUES (@Std_Id , @Exam_ID , @GradePercentage , @IsPassed );

        END
 
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS errorMessage
END CATCH
GO

