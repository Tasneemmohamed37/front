-- ============== 1 set exam for course ===========


EXEC	[dbo].[Ist_Set_Exam]
		@InstEmail = N'inst1@ex.com',
		@Password = N'inst111',
		@Crs_ID = 1,
		@Ex_NO = 4,
		@Ex_Duration = 30,
		@Exam_Type = N'exam',
		@Num_TF_Questions = 2,
		@Num_MCQ_Questions = 6,
		@Num_Text_Questions = 2


-- ================== 2 student answer exam  ================================

EXEC	 [dbo].[StudentExamAnswers]
		@Std_Id = 1,
		@Stu_Password = N'123456',
		@Exam_ID = 4,
		@Question_ID = 13,
		@Student_answer = N'False'



EXEC	 [dbo].[StudentExamAnswers]
		@Std_Id = 1,
		@Stu_Password = N'123456',
		@Exam_ID = 4,
		@Question_ID = 15,
		@Student_answer = N'Java'


EXEC	[dbo].[StudentExamAnswers]
		@Std_Id = 1,
		@Stu_Password = N'123456',
		@Exam_ID = 4,
		@Question_ID = 17,
		@Student_answer = N'True'


EXEC	 [dbo].[StudentExamAnswers]
		@Std_Id = 1,
		@Stu_Password = N'123456',
		@Exam_ID = 4,
		@Question_ID = 18,
		@Student_answer = N'True'



EXEC	 [dbo].[StudentExamAnswers]
		@Std_Id = 1,
		@Stu_Password = N'123456',
		@Exam_ID = 4,
		@Question_ID = 19,
		@Student_answer = N'bundling of data, along with the methods that operate on that data, into a single unit'


EXEC	[dbo].[StudentExamAnswers]
		@Std_Id = 1,
		@Stu_Password = N'123456',
		@Exam_ID = 4,
		@Question_ID = 22,
		@Student_answer = N' class base_classname :access derived_classname{ /*define class body*/ };'


EXEC	 [dbo].[StudentExamAnswers]
		@Std_Id = 1,
		@Stu_Password = N'123456',
		@Exam_ID = 4,
		@Question_ID = 27,
		@Student_answer = N' class derived_classname : base_classname{ /*define class body*/ };'


EXEC	  [dbo].[StudentExamAnswers]
		@Std_Id = 1,
		@Stu_Password = N'123456',
		@Exam_ID = 4,
		@Question_ID = 28,
		@Student_answer = N' Copy an object for type casting'


EXEC	 [dbo].[StudentExamAnswers]
		@Std_Id = 1,
		@Stu_Password = N'123456',
		@Exam_ID = 4,
		@Question_ID = 29,
		@Student_answer = N' Copy an object so that it can be passed to a function'


EXEC	 [dbo].[StudentExamAnswers]
		@Std_Id = 1,
		@Stu_Password = N'123456',
		@Exam_ID = 4,
		@Question_ID = 33,
		@Student_answer = N' It does not support pointers'



-- ==================== 3 mark exam  and get total degree ===================================
EXEC	[dbo].[StudentModelAnswer]
		@Std_Id = 1,
		@Exam_ID = 4




