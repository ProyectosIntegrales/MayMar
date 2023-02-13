
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAbandonosLastMonth] 
	-- Add the parameters for the stored procedure here
	@year varchar(4),
	@month varchar(2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM vInventario 
	WHERE Fechaab >= CAST(@year + '-' + @month + '-1' as date) AND Fechaab <= dbo.GetLastDayOfMonth(@year, @month)
	AND Remanente > 0;

END

