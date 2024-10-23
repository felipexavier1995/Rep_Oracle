--- command about tablespace.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- with it script we will know alls tablespaces_names 
set linesize 500
COLUMN FILE_NAME FORMAT A60
COLUMN TABLESPACE_NAME FORMAT A20
COLUMN BYTES FORMAT 99,999,999,999,999
COLUMN USER_BYTES FORMAT 99,999,999,999,999
COLUMN DUMMY NOPRINT
--
--   BREAK ON TABLESPACE_NAME
--   COMPUTE SUM of BYTES USER_BYTES on TABLESPACE_NAME
--
-- BREAK ON BYTES SKIP1 ON TABLESPACE_NAME
--
  COMPUTE SUM OF BYTES USER_BYTES ON DUMMY
  BREAK ON DUMMY;
--
SELECT NULL DUMMY, FILE_NAME,
       FILE_ID,
       TABLESPACE_NAME,
       BYTES,
       USER_BYTES,
       AUTOEXTENSIBLE
FROM DBA_DATA_FILES
WHERE TABLESPACE_NAME LIKE UPPER('%&TABLESPACE%') ---Here we can write any thing (PS:If tablespaces exist)
ORDER BY BYTES, FILE_NAME
/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- with script, we can see with more details in each tablespaces.
  
clear columns
column tablespace format a25
column total_mb format 999,999,999.99
column used_mb format 999,999,999,999.99
column free_mb format 999,999,999.99
column pct_used format 999.99
column graph format a22 heading "GRAPH (X=5%)"
column status format a7
compute sum of total_mb on report
compute sum of used_mb on report
compute sum of free_mb on report
break on report
set lines 200 pages 100
select  total.ts tablespace,
        DECODE(total.mb,null,'OFFLINE',dbat.status) status,
                total.mb total_mb,
                NVL(total.mb - free.mb,total.mb) used_mb,
                NVL(free.mb,0) free_mb,
        DECODE(total.mb,NULL,0,NVL(ROUND((total.mb - free.mb)/(total.mb)*100,2),100)) pct_used,
                CASE WHEN (total.mb IS NULL) THEN '['||RPAD(LPAD('OFFLINE',13,'-'),20,'-')||']'
                ELSE '['|| DECODE(free.mb,
                             null,'XXXXXXXXXXXXXXXXXXXX',
                             NVL(RPAD(LPAD('X',trunc((100-ROUND( (free.mb)/(total.mb) * 100, 2))/5),'X'),20,'-'),
                               '--------------------'))||']'
         END as GRAPH
from
                (select tablespace_name ts, sum(bytes)/1024/1024 mb from dba_data_files group by tablespace_name) total,
                (select tablespace_name ts, sum(bytes)/1024/1024 mb from dba_free_space group by tablespace_name) free,
        dba_tablespaces dbat
where total.ts=free.ts(+) and
      total.ts=dbat.tablespace_name
UNION ALL
select  sh.tablespace_name,
        'TEMP',
                SUM(sh.bytes_used+sh.bytes_free)/1024/1024 total_mb,
                SUM(sh.bytes_used)/1024/1024 used_mb,
                SUM(sh.bytes_free)/1024/1024 free_mb,
        ROUND(SUM(sh.bytes_used)/SUM(sh.bytes_used+sh.bytes_free)*100,2) pct_used,
        '['||DECODE(SUM(sh.bytes_free),0,'XXXXXXXXXXXXXXXXXXXX',
              NVL(RPAD(LPAD('X',(TRUNC(ROUND((SUM(sh.bytes_used)/SUM(sh.bytes_used+sh.bytes_free))*100,2)/5)),'X'),20,'-'),
                '--------------------'))||']'
FROM v$temp_space_header sh
GROUP BY tablespace_name
order by 6
/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Here, we have a script for alter any datafile.

--- The name 'RECURSOS_HUMANOS' are name tablespaces.
--- Add more 1 megabyte for that tablespace.
ALTER TABLESPACE RECURSOS_HUMANOS
ADD DATAFILE 'RH_02' SIZE 1M;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




