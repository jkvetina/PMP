CREATE OR REPLACE TRIGGER projects__
FOR UPDATE OR INSERT OR DELETE ON projects
COMPOUND TRIGGER

    in_updated_by       CONSTANT user_roles.updated_by%TYPE     := auth.get_user_login();
    in_updated_at       CONSTANT user_roles.updated_at%TYPE     := SYSDATE;



    BEFORE EACH ROW IS
    BEGIN
        IF NOT DELETING THEN
            -- check resource status
            IF :NEW.owner_id IS NOT NULL THEN
                BEGIN
                    SELECT r.resource_id
                    INTO :NEW.owner_id
                    FROM resources r
                    WHERE r.resource_id     = :NEW.owner_id
                        AND r.is_active     = 'Y';
                EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    apex.raise_error('INACTIVE_OWNER');
                END;
            END IF;
            --
            IF :NEW.manager_id IS NOT NULL THEN
                BEGIN
                    SELECT r.resource_id
                    INTO :NEW.manager_id
                    FROM resources r
                    WHERE r.resource_id     = :NEW.manager_id
                        AND r.is_active     = 'Y';
                EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    apex.raise_error('INACTIVE_MANAGER');
                END;
            END IF;

            -- proceed
            IF :NEW.project_id IS NULL THEN
                :NEW.project_id := project_id.NEXTVAL;
            END IF;
            --
            :NEW.is_active      := CASE :NEW.status WHEN 'INACTIVE' THEN 'N' ELSE 'Y' END;
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
