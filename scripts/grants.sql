--
-- GRANT TABLES AND VIEWS DYNAMICALLY
--
DECLARE
    in_owner    CONSTANT all_tables.owner%TYPE := 'PMP';
    in_apex     CONSTANT all_tables.owner%TYPE := 'PMP_APEX';
    --
    v_grants    VARCHAR2(2000);
    v_sql       VARCHAR2(2000);
BEGIN
    -- create grants
    FOR c IN (
        SELECT t.object_name, t.object_type
        FROM all_objects t
        WHERE t.owner           = in_owner
            AND t.object_type   IN ('TABLE', 'VIEW')
        ORDER BY t.object_type, t.object_name
    ) LOOP
        -- desired grants
        v_grants := CASE c.object_type
            WHEN 'TABLE'    THEN 'SELECT, UPDATE, INSERT, DELETE'
            WHEN 'VIEW'     THEN 'SELECT'
            END;

        -- revoke all first
        v_sql := 'REVOKE ALL ON ' ||
            LOWER(in_owner || '.' || RPAD(c.object_name, 30)) ||
            ' FROM ' || LOWER(in_apex);
        --
        EXECUTE IMMEDIATE v_sql;

        -- create grant finally
        v_sql := 'GRANT ' || v_grants || ' ON ' ||
            LOWER(in_owner || '.' || RPAD(c.object_name, 30)) ||
            ' TO ' || LOWER(in_apex);
        --
        DBMS_OUTPUT.PUT_LINE(v_sql || ';');
        EXECUTE IMMEDIATE v_sql;
    END LOOP;

    -- drop existing synonyms
    --
    --

    -- create synonyms in apex schema
    FOR c IN (
        SELECT t.object_name, t.object_type
        FROM all_objects t
        WHERE t.owner           = in_owner
            AND t.object_type   IN ('TABLE', 'VIEW')
        ORDER BY t.object_type, t.object_name
    ) LOOP
        v_sql := 'CREATE OR REPLACE SYNONYM ' ||
            LOWER(in_apex || '.' || RPAD(c.object_name, 30)) ||
            ' FOR ' || LOWER(in_owner || '.' || c.object_name);
        --
        DBMS_OUTPUT.PUT_LINE(v_sql || ';');
        EXECUTE IMMEDIATE v_sql;
    END LOOP;
END;
/



--
-- GRANT PROCEDURES MANUALLY
--
GRANT EXECUTE ON            pmp.resources_skills_update         TO pmp_apex;
GRANT EXECUTE ON            pmp.set_sprint_boundaries           TO pmp_apex;
GRANT EXECUTE ON            pmp.auth                            TO pmp_apex;
GRANT EXECUTE ON            pmp.apex                            TO pmp_apex;
GRANT EXECUTE ON            pmp.grid                            TO pmp_apex;
--
CREATE OR REPLACE SYNONYM   pmp_apex.resources_skills_update    FOR pmp.resources_skills_update;
CREATE OR REPLACE SYNONYM   pmp_apex.set_sprint_boundaries      FOR pmp.set_sprint_boundaries;
CREATE OR REPLACE SYNONYM   pmp_apex.auth                       FOR pmp.auth;
CREATE OR REPLACE SYNONYM   pmp_apex.apex                       FOR pmp.apex;
CREATE OR REPLACE SYNONYM   pmp_apex.grid                       FOR pmp.grid;

