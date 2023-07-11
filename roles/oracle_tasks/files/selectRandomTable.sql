set colsep ,
set headsep off
set pagesize 0
set trimspool on
set linesize 2
set numwidth 5
set echo off
set feed off
SET TERM OFF
set trim on trims on
set newpage none
set underline off 
set lines 1000
set pages 250
set echo off
Set serveroutput on size 1000000
column random_date  format a30
spool "/tmp/gathered_data.csv";
SELECT * FROM random_table FETCH FIRST 100 ROWS ONLY
/
spool off;
exit