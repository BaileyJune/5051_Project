USE [eServe]
GO
/****** Object:  StoredProcedure [dbo].[spOpportunity_Section]    Script Date: 3/24/2015 11:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spOpportunity_Section]
		
		 (
		 @OpportunityID int,
		 @SectionID int
		 )
		 As
		 Insert into [Opportunity_Section]
		 Values ( @OpportunityID,@SectionID)
GO
