USE [eServe]
GO
/****** Object:  StoredProcedure [dbo].[spGetCommunityPartnerAlertview]    Script Date: 3/24/2015 11:11:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetCommunityPartnerAlertview]
As
Begin
Select
AlertID, 
Message 
from CommunityPartnerAlert
End

GO
