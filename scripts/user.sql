--SELECT * FROM dba_tablespaces ORDER BY 1;

--
-- TABLE OWNER
--
CREATE USER pmp
    IDENTIFIED BY "SUPer-secret-password-123"
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON data;
--
GRANT CREATE SESSION                    TO pmp;
GRANT ALTER  SESSION                    TO pmp;
GRANT CREATE TABLE                      TO pmp;
GRANT CREATE VIEW                       TO pmp;
GRANT CREATE MATERIALIZED VIEW          TO pmp;
GRANT CREATE SEQUENCE                   TO pmp;
GRANT CREATE SYNONYM                    TO pmp;
GRANT CREATE PROCEDURE                  TO pmp;
GRANT CREATE TRIGGER                    TO pmp;
--
GRANT EXECUTE ON DBMS_SESSION           TO pmp;
GRANT EXECUTE ON DBMS_SCHEDULER         TO pmp;
GRANT EXECUTE ON DBMS_PROFILER          TO pmp;
GRANT EXECUTE ON DBMS_ERRLOG            TO pmp;
--
GRANT SELECT ON v$sql                   TO pmp;
GRANT SELECT ON v$sql_cursor            TO pmp;
GRANT SELECT ON v$session               TO pmp;
--GRANT SELECT ON v$session_longops       TO pmp;



--
-- APEX USER
--
CREATE USER pmp_apex
    IDENTIFIED BY "SUPer-secret-password-123"
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON data;
--
GRANT CREATE SESSION                    TO pmp_apex;
GRANT ALTER  SESSION                    TO pmp_apex;
GRANT CREATE SYNONYM                    TO pmp_apex;

