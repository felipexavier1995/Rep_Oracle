-- command for alter any job
--check, drop and view Jobs.

----------------------------------------------------------------------------------------------------------
-- Checking any job if it's enable.
clear col
set lines 200 pages 200
col OWNER for a10
col JOB_NAME for a40
col ENABLED for a10
select OWNER,JOB_NAME, ENABLED, CLIENT_ID from dba_scheduler_jobs where job_name like ('%insert_data%'); -- Here we can swith that name.
----------------------------------------------------------------------------------------------------------
