CREATE OR REPLACE TRIGGER resources__
FOR UPDATE OR INSERT OR DELETE ON resources
COMPOUND TRIGGER

    in_updated_by       CONSTANT user_roles.updated_by%TYPE     := auth.get_user_login();
    in_updated_at       CONSTANT user_roles.updated_at%TYPE     := SYSDATE;



    BEFORE EACH ROW IS
    BEGIN
        IF NOT DELETING THEN
            IF :NEW.resource_id IS NULL THEN
                :NEW.resource_id := resource_id.NEXTVAL;
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
