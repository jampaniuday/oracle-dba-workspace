set termout off feedback off
variable v_sys_users varchar2(4000);
variable v_sys_users_regexp varchar2(4000);
exec :v_sys_users := 'SYS,SYSTEM,SYSMAN,XDB,XDK,WIRELESS,MDSYS,MDDATA,ZABBIX,SCOTT,DBSNMP,OLAPSYS,CTXSYS,EXFSYS,APPQOSSYS,WCRSYS,WMSYS,ANONYMOUS,FLOWS_FILES,ORACLE_OCM,ORDDATA,ORDPLUGINS,ORDSYS,OUTLN,SI_INFORMTN_SCHEMA,DIP,XS$NULL,SPATIAL_CSW_ADMIN_USR,SPATIAL_WFS_ADMIN_USR,OWBSYS,OWBSYS_AUDIT,TSMSYS,C$MDLICHEM70,C$MDLICHEM80,C$MDLICHEM91,C$MDLICHESH51,APEX_PUBLIC_USER,APEX_040200,APEX_040100,APEX_030200,PUBLIC,XS$NULL,GGS,MAVERICKR,DBANALYST';
exec :v_sys_users_regexp := '^(' || replace(replace(:v_sys_users, ',', '|'), '$', '\$') || ')$';
set termout on feedback on
