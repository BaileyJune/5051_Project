SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetStudentCourseOppDetailForFaculty]	
	@profID int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		te.OpportunityID,
		s.StudentID,
		s.FirstName + ' ' + s.LastName AS StudentName,
		o.Name AS OpportunityName,		
		sec.SectionName AS SectionName,
		te.HoursVolunteered AS HoursCompleted,
		te.PartnerApprovedHours AS HoursApproved
	FROM
		Student s 
	INNER JOIN
		TimeEntries te 
	ON
		s.StudentID = te.StudentID 
	INNER JOIN
		Opportunity o 
	ON
		o.OpportunityID = te.OpportunityID 
	INNER JOIN
		Opportunity_Section os 
	ON
		os.OpportunityID = te.OpportunityID 
	INNER JOIN
		Section sec
	ON
		sec.SectionID = os.SectionID
	WHERE
		sec.ProfessorID = @profID
END
GO
