/*
*/
set serveroutput on size unlimited echo off

ACCEPT p_owner PROMPT "Owner: "
ACCEPT p_tables DEFAULT '.*' PROMPT "Table name. [ALL]: "
ACCEPT p_types DEFAULT 'P,U,R' PROMPT "Constraint type (P,U,R). [ALL]: "

PROMPT
PROMPT Disabled constraints (before)
SELECT c.owner, c.table_name, c.constraint_type, c.constraint_name
FROM dba_constraints c
WHERE regexp_like(c.owner, '^&p_owner.$', 'i')
  AND regexp_like(c.table_name, '^&p_tables.$', 'i')
  AND regexp_like(c.constraint_type, '^(' || replace('&p_types', ',', '|') || ')$', 'i')
  AND c.status = 'DISABLED'
  AND c.table_name not in (SELECT q.queue_table FROM dba_queues q WHERE q.owner = c.owner)
ORDER BY c.owner, c.table_name, decode(c.constraint_type, 'P', 1, 'U', 2, 'R', 3, 4), c.constraint_name
/
PROMPT
PROMPT Disabling constraints...
begin
  dbms_output.enable(null);
  for x in (SELECT '"' || c.owner || '"."' || c.table_name || '"' as table_name, '"' || c.constraint_name || '"' as constraint_name, c.constraint_type, t.iot_type
            FROM dba_constraints c, dba_tables t
            WHERE regexp_like(c.owner, '^&p_owner.$', 'i')
              AND regexp_like(c.table_name, '^&p_tables.$', 'i')
              AND regexp_like(c.constraint_type, '^(' || replace('&p_types', ',', '|') || ')$', 'i')
              AND c.owner = t.owner
              AND c.table_name = t.table_name
              AND t.table_name not in (SELECT queue_table FROM dba_queues WHERE owner = t.owner)
              AND c.status = 'ENABLED'
            ORDER BY decode(c.constraint_type, 'U', 1, 'R', 2, 'P', 3, 4), c.owner, c.table_name)
  loop
    begin
      if x.constraint_type = 'P' then
        if x.iot_type is null then
          execute immediate 'ALTER TABLE ' || x.table_name || ' DISABLE CONSTRAINT ' || x.constraint_name || ' CASCADE DROP INDEX';
        end if;
      else
        execute immediate 'ALTER TABLE ' || x.table_name || ' DISABLE CONSTRAINT ' || x.constraint_name;
      end if;
    exception
      when others then
        dbms_output.put_line(SQLERRM);
    end;
  end loop;
end;
/
PROMPT
PROMPT Still enabled constraints (after)
SELECT c.owner, c.table_name, c.constraint_type, c.constraint_name
FROM dba_constraints c
WHERE regexp_like(c.owner, '^&p_owner.$', 'i')
  AND regexp_like(c.table_name, '^&p_tables.$', 'i')
  AND regexp_like(c.constraint_type, '^(' || replace('&p_types', ',', '|') || ')$', 'i')
  AND c.status = 'ENABLED'
  AND c.table_name not in (SELECT q.queue_table FROM dba_queues q WHERE q.owner = c.owner)
ORDER BY c.owner, c.table_name, decode(c.constraint_type, 'P', 1, 'U', 2, 'R', 3, 4), c.constraint_name
/
undefine p_owner
undefine p_tables
undefine p_types
