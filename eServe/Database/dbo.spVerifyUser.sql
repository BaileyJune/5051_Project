SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spVerifyUser]	
	@email varchar(50), @password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ul.Email as Email,
		ul.Password as Password,
		ul.RoleID as RoleID
	FROM
		UserLogin ul
	WHERE	
		ul.Email = @email AND ul.Password = HASHBYTES('MD5', @password)
END
GO