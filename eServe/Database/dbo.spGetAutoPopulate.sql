SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetAutoPopulate]	
		@CPID int, @CPPID int, @StudentID int, @OpportunityID int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	   -- Insert statements for procedure here
Select * from CommunityPartners
Select * from CommunityPartnersPeople
Select * from Opportunity
Select * from Student
Select * from SignUpFor

Select 
	cpp.CPID AS CPID,
	cp.OrganizationName AS OrganizationName,
	cpp.CPPID AS CPPID,
	cpp.FirstName AS SupervisorFirstName,
	cpp.LastName AS SupervisorLastName,
	s.FirstName AS StudentFirstName,
	s.LastName AS StudentLastName
FROM
	CommunityPartners cp
INNER Join
	CommunityPartnersPeople cpp
ON 
	cp.CPID = cpp.CPID
INNER JOIN
	Opportunity o 
ON
	cp.CPID = o.CPID 
INNER JOIN
	SignUpFor suf
ON
	suf.OpportunityID = o.OpportunityID
INNER JOIN
	Student s
ON
	s.StudentID = suf.StudentID
WHERE s.studentID = @StudentID AND o.OpportunityID = @OpportunityID AND cp.CPID = @CPID AND cpp.CPPID = @CPPID 
	
END
GO
