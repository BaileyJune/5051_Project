USE [eServe]
GO
/****** Object:  StoredProcedure [dbo].[spGetSectionInfo]    Script Date: 3/24/2015 11:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetSectionInfo]
 @SectionID int ,
 @QuarterID int
 as
 Begin
   Select SectionID,QuarterID,NumberOfSlots,SectionName from Section 
   where SectionID = @SectionID
   and  QuarterID = @QuarterID
   End

GO
