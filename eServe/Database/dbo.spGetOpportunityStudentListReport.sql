USE [eServe]
GO
/****** Object:  StoredProcedure [dbo].[spGetCommunityPartners]    Script Date: 3/24/2015 11:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetOpportunityStudentListReport]	
	@QuarterID int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
select
	o.OpportunityID AS OpportunityID,
	o.Name AS OpportunityName,
	cp.OrganizationName AS OrganizationName,
	ot.Name AS OpportunityTypeName,
	sec.SectionName AS SectionName,
	c.ShortName AS CourseShortName,
	q.ShortName AS QuarterShortName,
	p.FirstName + ' ' + p.LastName AS ProfessorName,
	s.FirstName + ' ' + s.LastName AS StudentName,
	s.EmailID AS StudentEmail,
	te.PartnerApprovedHours AS PartnerApprovedHours
from
	Section sec
INNER JOIN
	Quarter q
ON 
	sec.QuarterID = q.QuarterID
INNER JOIN
	Class c
ON 
	c.CourseID = sec.CourseID 
INNER JOIN
	Professor p
ON
	p.ProfessorID = sec.ProfessorID
INNER JOIN
	Student_Section ss
ON
	ss.SectionID = sec.SectionID
INNER JOIN
	Student s
ON 
	s.StudentID = ss.StudentID
INNER JOIN
	SignUpFor suf
ON
	suf.StudentID = ss.StudentID
INNER JOIN
	Opportunity o 
ON
	o.OpportunityID = suf.OpportunityID
INNER JOIN
	CommunityPartners cp
ON 
	cp.CPID = o.CPID
INNER JOIN
	OpportunityType ot
ON
	ot.TypeID = o.TypeID
INNER JOIN
	TimeEntries te
ON
	te.StudentID = ss.StudentID
WHERE q.QuarterID = @QuarterID
	
END

GO
