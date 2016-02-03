
drop trigger bw_schema_watch on database
go
drop assembly BottledWater
go
create assembly BottledWater 
from 'C:\Users\cjdibbs.NBI\Documents\GitHub\TSQL-Water-Bottle\BottledWater\BottledWater.Sql\bin\Debug\BottledWater.Sql.dll' 
with PERMISSION_SET = EXTERNAL_ACCESS;
go
Create Trigger bw_schema_watch 
on DATABASE 
after CREATE_TABLE,ALTER_TABLE,DROP_TABLE 
AS EXTERNAL NAME BottledWater.CLRTriggers.Log4Net;