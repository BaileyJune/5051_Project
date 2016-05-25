SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetStudentEvaluationByStudentIDOppID]	
		@StudentID int, @OpportunityID int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT 
	cp.OrganizationName AS OrganizationName,
	suf.StudentEvaluation AS Comments
	FROM 
		SignUpFor suf
	INNER JOIN
		Opportunity o
	ON
		o.OpportunityID = suf.OpportunityID
	INNER JOIN
		CommunityPartners cp
	ON 
		o.CPID = cp.CPID
	WHERE eval.StudentID = @StudentID AND eval.OpportunityID = @OpportunityID

    -- Insert statements for procedure here
	
END
GO
