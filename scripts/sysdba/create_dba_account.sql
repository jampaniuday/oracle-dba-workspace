/*
*/
define schema=&1
define password=&2

CREATE USER "&schema." IDENTIFIED BY "&password"
/
GRANT "CONNECT" TO "&schema."
/
GRANT "DBA" TO "&schema."
/
GRANT "EXECUTE_CATALOG_ROLE" TO "&schema."
/
GRANT "EXP_FULL_DATABASE" TO "&schema."
/
GRANT "IMP_FULL_DATABASE" TO "&schema."
/
GRANT "SELECT_CATALOG_ROLE" TO "&schema."
/
ALTER USER "&schema." DEFAULT ROLE ALL
/
GRANT ALTER ANY MATERIALIZED VIEW TO "&schema."
/
GRANT ALTER SESSION TO "&schema."
/
GRANT CREATE DATABASE LINK TO "&schema."
/
GRANT CREATE JOB TO "&schema."
/
GRANT CREATE MATERIALIZED VIEW TO "&schema."
/
GRANT CREATE PROCEDURE TO "&schema."
/
GRANT CREATE SEQUENCE TO "&schema."
/
GRANT CREATE SYNONYM TO "&schema."
/
GRANT CREATE TABLE TO "&schema."
/
GRANT CREATE TRIGGER TO "&schema."
/
GRANT CREATE TYPE TO "&schema."
/
GRANT CREATE VIEW TO "&schema."
/
GRANT DEBUG ANY PROCEDURE TO "&schema."
/
GRANT DEBUG CONNECT SESSION TO "&schema."
/
GRANT SELECT ANY TABLE TO "&schema."
/
GRANT SELECT ANY TRANSACTION TO "&schema."
/
GRANT UNLIMITED TABLESPACE TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_COMPARISON" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_COMPARISON_COLUMNS" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_COMPARISON_ROW_DIF" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_COMPARISON_SCAN" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_COMPARISON_SCAN_SUMMARY" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_COMPARISON_SCAN_VALUES" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_CONSTRAINTS" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_CONS_COLUMNS" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_DB_LINKS" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_INDEXES" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_REGISTERED_ARCHIVED_LOG" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_SCHEDULER_JOBS" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_TABLES" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_TAB_COLUMNS" TO "&schema."
/
GRANT SELECT ON "SYS"."DBA_USERS" TO "&schema."
/
GRANT EXECUTE ON "SYS"."DBMS_CRYPTO" TO "&schema."
/
GRANT EXECUTE ON "SYS"."DBMS_FLASHBACK" TO "&schema."
/
GRANT EXECUTE ON "SYS"."DBMS_LOCK" TO "&schema."
/
GRANT EXECUTE ON "SYS"."DBMS_REFRESH" TO "&schema."
/
GRANT EXECUTE ON "SYS"."DBMS_TRANSFORM" TO "&schema."
/
GRANT EXECUTE ON "SYS"."DBMS_FILE_TRANSFER" TO "&schema."
/
GRANT SELECT ON "SYS"."GV_$SESSION" TO "&schema."
/
GRANT SELECT ON "SYS"."GV_$SESSION_LONGOPS" TO "&schema."
/
GRANT SELECT ON "SYS"."V_$DATABASE" TO "&schema."
/
GRANT SELECT ON "SYS"."V_$INSTANCE" TO "&schema."
/
GRANT SELECT ON "SYS"."V_$SESSION" TO "&schema."
/
GRANT SELECT ON "SYS"."V_$SESSION_LONGOPS" TO "&schema."
/