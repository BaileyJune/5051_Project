USE [eServe]
GO
/****** Object:  StoredProcedure [dbo].[spStudent_Section]    Script Date: 3/24/2015 11:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create Procedure [dbo].[spStudent_Section]
		 (
		 @StudentID int,
		 @SectionID int
		 )
		 As
		 Insert into [Student_Section]
		 Select @StudentID,@SectionID
GO
