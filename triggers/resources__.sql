CREATE OR REPLACE TRIGGER resources__
FOR UPDATE OR INSERT OR DELETE ON resources
COMPOUND TRIGGER

    in_updated_by       CONSTANT resources.updated_by%TYPE  := COALESCE(APEX_APPLICATION.G_USER, USER);
    in_updated_at       CONSTANT resources.updated_at%TYPE  := SYSDATE;

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
    WHEN OTHERS THEN
        RAISE;
    END BEFORE EACH ROW;

END;
/
