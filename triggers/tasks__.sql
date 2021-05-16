CREATE OR REPLACE TRIGGER tasks__
FOR UPDATE OR INSERT OR DELETE ON tasks
COMPOUND TRIGGER

    in_updated_by       CONSTANT user_roles.updated_by%TYPE     := auth.get_user_login();
    in_updated_at       CONSTANT user_roles.updated_at%TYPE     := SYSDATE;



    BEFORE EACH ROW IS
    BEGIN
        IF NOT DELETING THEN
            -- check sprint status
            IF :NEW.project_id IS NOT NULL THEN
                BEGIN
                    SELECT p.project_id
                    INTO :NEW.project_id
                    FROM projects p
                    WHERE p.project_id      = :NEW.project_id
                        AND p.is_active     = 'Y';
                EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    apex.raise_error('INACTIVE_PROJECT');
                END;
            END IF;

            -- check sprint status
            IF :NEW.sprint_id IS NOT NULL THEN
                BEGIN
                    SELECT s.sprint_id
                    INTO :NEW.sprint_id
                    FROM sprints s
                    WHERE s.sprint_id       = :NEW.sprint_id
                        AND s.is_active     = 'Y';
                EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    apex.raise_error('INACTIVE_SPRINT');
                END;
            END IF;

            -- fill in missing project_id
            IF :NEW.project_id IS NULL AND :NEW.sprint_id IS NOT NULL THEN
                SELECT s.project_id
                INTO :NEW.project_id
                FROM sprints s
                WHERE s.sprint_id = :NEW.sprint_id;
            END IF;

            -- check resource status
            IF :NEW.resource_id IS NOT NULL THEN
                BEGIN
                    SELECT r.resource_id
                    INTO :NEW.resource_id
                    FROM resources r
                    WHERE r.resource_id     = :NEW.resource_id
                        AND r.is_active     = 'Y';
                EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    apex.raise_error('INACTIVE_RESOURCE');
                END;
            END IF;

            -- assign sequence if needed
            IF :NEW.task_id IS NULL THEN
                :NEW.task_id := task_id.NEXTVAL;
            END IF;
            --
            :NEW.updated_by     := in_updated_by;
            :NEW.updated_at     := in_updated_at;
        END IF;
    EXCEPTION
    WHEN apex.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        apex.raise_error('UNHANDLED_ERROR');
    END BEFORE EACH ROW;

END;
/
