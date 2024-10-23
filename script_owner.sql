--- following commands are know about OWNER with details.

----------------------------------------------------------------------------
--- check and analysi with owner in our environment.

select resource_name, current_utilization, max_utilization, limit_value
from v$resource_limit
where resource_name in ( 'sessions', 'processes')
/
----------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------
---Check all schemas in environment.

set line 200
COLUMN size_mb FORMAT 999,999,999 HEAD 'Size_MB'
COLUMN owner for a30
select owner, sum(bytes/1024/1024) "SIZE_MB" 
from dba_segments 
where segment_type <> 'INDEX' and owner not in ('SYS', 'RECOVER_TRANSACTION', 'MDSYS', 'XDB', 'SYSTEM')--, --'APEX_030200')
group by owner 
order by 2 desc;
--------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------
---query about sessions and connections in our environment.

select resource_name, current_utilization, max_utilization, limit_value
from v$resource_limit
where resource_name in ( 'sessions', 'processes')
/
