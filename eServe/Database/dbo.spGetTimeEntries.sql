SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetTimeEntries]	
		@StudentID int, @OpportunityID int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	   -- Insert statements for procedure here
	SELECT 
		te.WorkDateEntry AS WorkDate,
		te.HoursVolunteered AS HoursVolunteered,
		te.PartnerApprovedHours AS PartnerApprovedHours
	FROM
		TimeEntries te
	
	WHERE te.StudentID = @StudentID AND te.OpportunityID = @OpportunityID
	
END
GO
