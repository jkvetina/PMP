CREATE OR REPLACE TRIGGER tasks__
FOR UPDATE OR INSERT OR DELETE ON tasks
COMPOUND TRIGGER

    in_updated_by       CONSTANT user_roles.updated_by%TYPE     := auth.get_user_login();
    in_updated_at       CONSTANT user_roles.updated_at%TYPE     := SYSDATE;
    --
    is_sponzor          CHAR;
    is_developer        CONSTANT BOOLEAN                        := auth.is_developer() = 'Y';



    BEFORE STATEMENT IS
    BEGIN
        BEGIN
            SELECT 'Y'
            INTO is_sponzor
            FROM user_roles r
            WHERE r.user_login      = in_updated_by
                AND r.role_code     = 'SPONZOR';
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL;
        END;
    EXCEPTION
    WHEN apex.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        apex.raise_error('UNHANDLED_ERROR');
    END BEFORE STATEMENT;



    BEFORE EACH ROW IS
    BEGIN
        --
        -- @TODO: this is too complex now, move it to package
        --
        IF NOT DELETING THEN
            -- check sprint status
            IF :NEW.project_id IS NOT NULL AND NOT is_developer THEN
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
            IF :NEW.sprint_id IS NOT NULL AND NOT is_developer THEN
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
            IF :NEW.resource_id IS NOT NULL AND NOT is_developer THEN
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

            -- check if new task is created by project owner/manager
            IF INSERTING AND NOT is_developer THEN
                BEGIN
                    SELECT in_updated_by
                    INTO :NEW.updated_by
                    FROM projects p
                    WHERE p.project_id      = :NEW.project_id
                        AND auth.get_resource_id(in_updated_by) IN (p.owner_id, p.manager_id);
                EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    -- check for sponzor thingy
                    IF is_sponzor IS NULL THEN
                        apex.raise_error('PERMISSION_ISSUE');
                    END IF;
                END;
            END IF;

            --
            -- @TODO: we should also check updates/deletes
            --

            -- sponzors cant assign/change sprint
            IF is_sponzor = 'Y' AND :NEW.sprint_id IS NOT NULL THEN
                apex.raise_error('CANT_ASSIGN_SPRINT');
            ELSIF is_sponzor = 'Y' AND UPDATING AND :NEW.sprint_id != :OLD.sprint_id THEN
                apex.raise_error('CANT_CHANGE_SPRINT');
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
