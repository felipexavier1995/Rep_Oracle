-- The following a query about validation the Datadade.
-- Where we can seen database name / instance, hostname, status, time sartup at moment.



/*
-- Query.

alter session set nls_date_format='dd/mm/yy:hh24:mi:ss';
set pagesize 5555
set linesize 500
col host_name for a20
select sysdate, startup_time, host_name, instance_name, status, v.sessions_current, v.sessions_highwater
from v$instance, v$license v
/


*/
