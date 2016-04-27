USE [eServe]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteStudentOpportunityRegistration]    Script Date: 3/24/2015 11:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[spDeleteStudentOpportunityRegistration]
	@StudentId int, @OpportunityId int
AS
Begin
  SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[SignUpFor]
	WHERE StudentID=@StudentID 
	AND OpportunityID=@OpportunityID	

End


GO
