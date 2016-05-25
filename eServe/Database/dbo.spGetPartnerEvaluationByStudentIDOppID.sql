SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetPartnerEvaluationByStudentIDOppID]	
		@StudentID int, @OpportunityID int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select 
	s.FirstName + ' ' + s.LastName AS StudentName,
	eval.PartnerEvaluation AS Question1,
	o.Name as OrganizationName,
	cpp.FirstName + ' ' + cpp.LastName as SupervisorName
	from 
	vwGetStudentReflectionAndPartnerEvaluation eval
	INNER JOIN
		Student s
	ON
		s.StudentID = eval.studentID
	INNER JOIN 
		Opportunity o
	ON
		o.OpportunityID = eval.OpportunityID
	INNER JOIN
		CommunityPartnersPeople cpp
	ON 
		o.CPPID = cpp.CPPID
	WHERE eval.StudentID = @StudentID AND eval.OpportunityID = @OpportunityID

    -- Insert statements for procedure here
	
END
GO
