CREATE OR REPLACE TRIGGER user_roles__
FOR UPDATE OR INSERT OR DELETE ON user_roles
COMPOUND TRIGGER

    in_updated_by       CONSTANT user_roles.updated_by%TYPE     := COALESCE(APEX_APPLICATION.G_USER, USER);
    in_updated_at       CONSTANT user_roles.updated_at%TYPE     := SYSDATE;

    BEFORE EACH ROW IS
    BEGIN
        IF NOT DELETING THEN
            :NEW.updated_by     := in_updated_by;
            :NEW.updated_at     := in_updated_at;
        END IF;
    EXCEPTION
    WHEN OTHERS THEN
        RAISE;
    END BEFORE EACH ROW;

END;
/
