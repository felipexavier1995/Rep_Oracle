-- Following script is about check log environment and your LOGs.
-- From the operational system always path /u01/app/oracle/diag/rdbms/<instance_name>/...


/*
-- Query

SET LINES 900
COL NAME FOR A30
COL VALUE FOR A80
SELECT NAME, VALUE FROM  V$DIAG_INFO;

/*
