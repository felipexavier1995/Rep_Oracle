--- The following have more commands with description. 

/* 
--- Command for view all the REDO's Log in instance.

clear col
set pages 200
set lines 1000
select GROUP#, MEMBER from v$logfile
/

*/
--------------------------------------------------------
/*
-- current, inactive or active.

set pages 400
set lines 200
COL OPERATION FORMAT A10 TRUNC
COL GB_COPIADOS FORMAT 9,999,999.99
SELECT * FROM V$LOG;

*/
--------------------------------------------------------
/*
--- The following, we can exachange a status of a logfile.

alter system switch logfile;

*/
--------------------------------------------------------
/*
--- with command, we can view if archive with status enabled or disabled.

archieve log list;

*/
--------------------------------------------------------
/*
--- show path of all archivelos

SHOW PARAMETER DB_RECOVERY_FILE_DEST

*/
--------------------------------------------------------
/*
--- We can view of size archivelog.

set feed off
select lf.group#, THREAD# ,member,bytes/1024/1024 mb
from v$logfile lf, v$log l
where lf.group# = l.group#
order by lf.group#, member
/

*/
