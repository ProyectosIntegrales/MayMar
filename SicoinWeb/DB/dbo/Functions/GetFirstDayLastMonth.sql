
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetFirstDayLastMonth] 
(

)
RETURNS date
AS
BEGIN
	-- Declare the return variable here
declare @year varchar(4);
declare @month varchar(2);
declare @today date = getdate();

select @year = datepart(YEAR, @today);
select @month = datepart(MONTH, @today);

if @month = 1 
begin
set @month = 12;
set @year = @year -1;
end
else 
set @month = @month -1;

declare @first date = cast(@year + '-' + @month + '-1' AS date);


	-- Return the result of the function
	RETURN @first;

END

