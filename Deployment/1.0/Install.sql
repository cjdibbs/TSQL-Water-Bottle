
drop trigger bw_schema_watch on database
go
drop assembly BottledWater
go
-- path need to be adjusted to your local env
create assembly BottledWater 
from 'C:\Users\cjdibbs.NBI\Documents\GitHub\TSQL-Water-Bottle\BottledWater.Sql\bin\Debug\BottledWater.Sql.dll' 
with PERMISSION_SET = EXTERNAL_ACCESS;
go
-- this does catch the changes to a single table, that will need to be done in another trigger, but it works
Create Trigger bw_schema_watch 
on DATABASE 
after CREATE_TABLE,ALTER_TABLE,DROP_TABLE 
AS EXTERNAL NAME BottledWater.CLRTriggers.Log4Net;