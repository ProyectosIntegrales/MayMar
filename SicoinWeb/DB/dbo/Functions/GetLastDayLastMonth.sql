
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetLastDayLastMonth] 
(

)
RETURNS date
AS
BEGIN
declare @year varchar(4);
declare @month varchar(2);
declare @today date = DATEADD(MONTH, 0, getdate());

select @year = datepart(YEAR, @today);
select @month = datepart(MONTH, @today);

declare @first date = cast(@year + '-' + @month + '-1' AS date);
declare @last date = dateadd(DAY,-1,@first);

	-- Return the result of the function
	RETURN @last;

END

