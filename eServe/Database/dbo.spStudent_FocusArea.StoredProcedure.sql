USE [eServe]
GO
/****** Object:  StoredProcedure [dbo].[spStudent_FocusArea]    Script Date: 3/24/2015 11:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create Procedure [dbo].[spStudent_FocusArea]
		 (
		 @FocusAreaID int,
		 @StudentID int
		 )
		 As
		 Insert into [Student_FocusArea]
		 Select @FocusAreaID,@StudentID
GO
