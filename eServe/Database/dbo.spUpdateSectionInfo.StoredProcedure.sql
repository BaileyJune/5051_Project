USE [eServe]
GO
/****** Object:  StoredProcedure [dbo].[spUpdateSectionInfo]    Script Date: 3/24/2015 11:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spUpdateSectionInfo]
   @SectionID int,
   @NumberOfSlots int
   as
   Begin
   Update Section Set NumberOfSlots = @NumberOfSlots
   where SectionID = @SectionID

   End

GO
