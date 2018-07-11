-- ======================================
-- SQL*Plus script: creschema.sql
-- Creates the schema for all case tables
-- Mastering Oracle SQL and SQL*Plus
-- Lex de Haan
-- Apress, 2005
-- ======================================

set trimspool on
spool creschema.txt

-- connect / as sysdba

prompt Drop user BOOK ...
------ ==================
drop user clase cascade;

prompt Create user BOOK ...
------ ====================
create user clase
default   tablespace users
temporary tablespace temp
identified by clase;

prompt Grant some system privileges ...
------ ================================
grant create session, alter session,
      unlimited tablespace,
      create table, create view,
      create materialized view,
      create procedure,
      create sequence,
      create synonym,
      create trigger,
      create type
to    clase;
grant execute on dbms_lock to clase;

prompt Connect to the new schema ...
------ =============================
connect clase/clase
set feedback off

prompt Create the case tables ...
------ ==========================
@@crecase

prompt Populate the case tables ...
------ ============================
@@popcase

prompt End of creschema procedure.
------ ===========================

spool off
set feedback on
