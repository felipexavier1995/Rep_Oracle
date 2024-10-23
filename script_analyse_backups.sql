--- command we can analyse all backup for any day.

--- command for execute a backup in our databse system.(PS: execute inside RMAN tools)
backup archivelog all


------------------------------------------------------------------------------------------

set pages 200
set lines 200
COL OPERATION FORMAT A10 TRUNC
COL GB_COPIADOS FORMAT 9,999,999.99
col BEGIN for a15
col END for a15
col status for a10
prompt Status do backup DATABASE
SELECT TO_CHAR(start_time, 'DD/MM HH24:MI') Start_backup,
       TO_CHAR(end_time, 'DD/MM HH24:MI') End_backup,
       operation,
       OBJECT_TYPE,
       status,
       OUTPUT_DEVICE_TYPE DEVICE,
       mbytes_processed MB_COPIADOS,
       OUTPUT_DEVICE_TYPE
  FROM V$RMAN_STATUS
 WHERE start_time > SYSDATE - &day                       --- Here I can put any day.
   AND OPERATION in ('BACKUP', 'RESTORE', 'ARCHIVE')
 ORDER BY END_TIME DESC
/
------------------------------------------------------------------------------------------
--- command just for know  incremental backup.

set pages 9999
set lines 200
COL OPERATION FORMAT A10 TRUNC
COL GB_COPIADOS FORMAT 9,999,999.99
col STATUS for a50
col inicio for a15
col final for a15
col status for a15
col begin for a20
col end for a20
prompt Verificar o backup do banco de dados
SELECT TO_CHAR(start_time,'DD/MM HH24:MI dy') BEGIN, TO_CHAR(end_time,'DD/MM HH24:MI dy') END, SESSION_STAMP,operation,OBJECT_TYPE, status,OUTPUT_DEVICE_TYPE DEVICE, mbytes_processed MB_COPIADOS,OUTPUT_DEVICE_TYPE
FROM   V$RMAN_STATUS
WHERE start_time > SYSDATE -14
AND OPERATION='BACKUP'
AND OBJECT_TYPE='DB INCR'
ORDER  BY start_time ASC
/
