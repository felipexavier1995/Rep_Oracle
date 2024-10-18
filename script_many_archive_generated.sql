--- Query check how many archivelog in the environment in N's days.

/*
--- 

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';
COL "00:00" FOR 099
COL "01:00" FOR 099
COL "02:00" FOR 099
COL "03:00" FOR 099
COL "04:00" FOR 099
COL "05:00" FOR 099
COL "06:00" FOR 099
COL "07:00" FOR 099
COL "08:00" FOR 099
COL "09:00" FOR 099
COL "10:00" FOR 099
COL "11:00" FOR 099
COL "12:00" FOR 099
COL "13:00" FOR 099
COL "14:00" FOR 099
COL "15:00" FOR 099
COL "16:00" FOR 099
COL "17:00" FOR 099
COL "18:00" FOR 099
COL "19:00" FOR 099
COL "20:00" FOR 099
COL "21:00" FOR 099
COL "22:00" FOR 099
COL "23:00" FOR 099
COL DAY     FOR A3
COL "TOTAL" FOR 0999
COL "GB"    FOR 999,999
BREAK ON REPORT
COMPUTE SUM LABEL 'TOTAL:' AVG LABEL 'MEDIA:' OF TOTAL ON REPORT
COMPUTE SUM AVG OF GB ON REPORT
SELECT TRUNC(FIRST_TIME) "DATE"
     , TO_CHAR(FIRST_TIME, 'DY') "DAY",   COUNT(1) TOTAL
     , ROUND(SUM(BLOCKS*BLOCK_SIZE)/1024/1024/1024,1) AS "GB"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'00',1,0)) AS "00:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'01',1,0)) AS "01:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'02',1,0)) AS "02:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'03',1,0)) AS "03:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'04',1,0)) AS "04:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'05',1,0)) AS "05:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'06',1,0)) AS "06:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'07',1,0)) AS "07:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'08',1,0)) AS "08:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'09',1,0)) AS "09:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'10',1,0)) AS "10:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'11',1,0)) AS "11:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'12',1,0)) AS "12:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'13',1,0)) AS "13:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'14',1,0)) AS "14:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'15',1,0)) AS "15:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'16',1,0)) AS "16:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'17',1,0)) AS "17:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'18',1,0)) AS "18:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'19',1,0)) AS "19:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'20',1,0)) AS "20:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'21',1,0)) AS "21:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'22',1,0)) AS "22:00"
     , SUM(DECODE(TO_CHAR(FIRST_TIME, 'HH24'),'23',1,0)) AS "23:00"
FROM GV$ARCHIVED_LOG
WHERE FIRST_TIME > TRUNC(SYSDATE)-&DAYS
GROUP BY TRUNC(FIRST_TIME)
    , TO_CHAR(FIRST_TIME, 'DY')
ORDER BY 1
/
*/