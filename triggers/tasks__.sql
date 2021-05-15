CREATE OR REPLACE TRIGGER tasks__
FOR UPDATE OR INSERT OR DELETE ON tasks
COMPOUND TRIGGER

    in_updated_by       CONSTANT tasks.updated_by%TYPE  := COALESCE(APEX_APPLICATION.G_USER, USER);
    in_updated_at       CONSTANT tasks.updated_at%TYPE  := SYSDATE;



    BEFORE EACH ROW IS
    BEGIN
        IF NOT DELETING THEN
            -- get project_id and check inactive project or sprint
            BEGIN
                SELECT s.project_id
                INTO :NEW.project_id
                FROM sprints s
                JOIN projects p
                    ON p.project_id     = s.project_id
                WHERE s.sprint_id       = :NEW.sprint_id
                    AND s.is_active     = 'Y'
                    AND p.is_active     = 'Y';
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                IF INSERTING THEN
                    RAISE_APPLICATION_ERROR(-20000, 'INACTIVE_PROJECT_OR_SPRINT');
                END IF;
            END;

            -- check resource status
            BEGIN
                SELECT r.resource_id
                INTO :NEW.resource_id
                FROM resources r
                WHERE r.resource_id     = :NEW.resource_id
                    AND r.is_active     = 'Y';
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20000, 'INACTIVE_RESOURCE');
            END;

            -- assign sequence if needed
            IF :NEW.task_id IS NULL THEN
                :NEW.task_id := task_id.NEXTVAL;
            END IF;
            --
            :NEW.updated_by     := in_updated_by;
            :NEW.updated_at     := in_updated_at;
        END IF;
    EXCEPTION
    WHEN OTHERS THEN
        RAISE;
    END BEFORE EACH ROW;

END;
/
