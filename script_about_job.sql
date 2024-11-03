-- command for alter any job
--check, drop and view Jobs.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Checking any job if it's enable.
clear col
set lines 200 pages 200
col OWNER for a10
col JOB_NAME for a40
col ENABLED for a10
select OWNER,JOB_NAME, ENABLED, CLIENT_ID from dba_scheduler_jobs where job_name like ('%insert_data%'); -- Here we can swith that name.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Checking if a job stoped
set lines 200 pages 200
col owner for a15
col log_date for a35
col job_name for a20
col start_date for a20
col repeat_interval for a20
col last_start_date for a20
col next_run_date for a20
col status for a10
select log_date, owner, job_name, status
from dba_scheduler_job_log
where job_name like '%JOB_INSERIR_DADO%' and status in ('STOPPED');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Checking of a job stated
  set lines 200 pages 200
col owner for a15
col log_date for a35
col job_name for a20
col start_date for a20
col repeat_interval for a20
col last_start_date for a20
col next_run_date for a20
col status for a10
select log_date, owner, job_name, status
from dba_scheduler_job_log
where job_name like '%JOB-EM-QUESTAO%' and status in ('START');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Checking what if running in 24hrs.
select
    log_date, owner, job_name, status
  from dba_scheduler_job_log
  where
    log_date > sysdate-(1/24) and
    owner in ('SYS', 'SYSTEM', 'WMSYS', 'XDB') 
    and status in ('STOPPED','FAILED');
