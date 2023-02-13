
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetLastDayOfMonth] 
(
 @year varchar(4),
 @month varchar(2)
)
RETURNS date
AS
BEGIN
	-- Declare the return variable here

if @month = 12 
begin
set @month = 1;
set @year = @year +1;
end
else 
set @month = @month +1;

declare @firstNextMonth date = cast(@year + '-' + @month + '-1' AS date);
declare @lastThisMonth date = dateadd(day,-1,@firstNextMonth)

	-- Return the result of the function
	RETURN @lastThisMonth;

END

