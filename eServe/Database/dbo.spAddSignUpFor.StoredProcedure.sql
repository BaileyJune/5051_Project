USE [eServe]
GO
/****** Object:  StoredProcedure [dbo].[spAddSignUpFor]    Script Date: 3/24/2015 11:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create Procedure [dbo].[spAddSignUpFor]
		 
		 @OpportunityId int,
		 @StudentID int,
		 @CPPID int
		 
		 As
		 Insert into [SignUpFor]
		 (OpportunityId,StudentID,CPPID)
		 Values
		 ( @OpportunityId,@StudentID,@CPPID)
GO
