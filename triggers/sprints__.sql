CREATE OR REPLACE TRIGGER sprints__
FOR UPDATE OR INSERT OR DELETE ON sprints
COMPOUND TRIGGER

    in_updated_by       CONSTANT user_roles.updated_by%TYPE     := auth.get_user_login();
    in_updated_at       CONSTANT user_roles.updated_at%TYPE     := SYSDATE;
    --
    is_developer        CONSTANT BOOLEAN                        := auth.is_developer() = 'Y';

    -- collection to store new/changed rows
    TYPE r_rows
        IS RECORD (
            sprint_id           sprints.sprint_id%TYPE,
            project_id          sprints.project_id%TYPE,
            start_at            sprints.start_at%TYPE,
            end_at              sprints.end_at%TYPE
        );
    --
    TYPE t_rows
        IS TABLE OF r_rows;
    --
    changed_rows        t_rows := t_rows();



    BEFORE EACH ROW IS
    BEGIN
        IF NOT DELETING THEN
            -- check if new sprint is created by project owner/manager
            IF INSERTING AND NOT is_developer THEN
                BEGIN
                    SELECT in_updated_by
                    INTO :NEW.updated_by
                    FROM projects p
                    WHERE p.project_id      = :NEW.project_id
                        AND auth.get_resource_id(in_updated_by) IN (p.owner_id, p.manager_id);
                EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    apex.raise_error('PERMISSION_ISSUE');
                END;
            END IF;

            -- proceed
            IF :NEW.sprint_id IS NULL THEN
                :NEW.sprint_id := sprint_id.NEXTVAL;
            END IF;
            --
            :NEW.updated_by     := in_updated_by;
            :NEW.updated_at     := in_updated_at;
            --
            :NEW.sprint_name    := TO_CHAR(:NEW.start_at, 'YYYY-MM-DD') || ' - ' || TO_CHAR(:NEW.end_at, 'YYYY-MM-DD');

            -- append new/changed row
            changed_rows.EXTEND(1);
            changed_rows(changed_rows.LAST) := r_rows (
                :NEW.sprint_id,
                :NEW.project_id,
                :NEW.start_at,
                :NEW.end_at
            );
        END IF;
    EXCEPTION
    WHEN apex.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        apex.raise_error('UNHANDLED_ERROR');
    END BEFORE EACH ROW;



    AFTER STATEMENT IS
        results     PLS_INTEGER;
    BEGIN
        -- check period overlaps for all new/changed rows
        IF changed_rows.COUNT > 0 THEN
            FOR i IN changed_rows.FIRST .. changed_rows.LAST LOOP
                SELECT COUNT(*) INTO results
                FROM sprints s
                WHERE s.project_id       = changed_rows(i).project_id
                    AND s.sprint_id     != changed_rows(i).sprint_id
                    AND (
                        changed_rows(i).start_at    BETWEEN s.start_at AND s.end_at
                        OR changed_rows(i).end_at   BETWEEN s.start_at AND s.end_at
                    );
                --
                IF results > 0 THEN
                    apex.raise_error('SPRINT_OVERLAPS');
                END IF;
            END LOOP;
        END IF;
    EXCEPTION
    WHEN apex.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        apex.raise_error('UNHANDLED_ERROR');
    END AFTER STATEMENT;

END;
/
