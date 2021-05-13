CREATE OR REPLACE TRIGGER resource_skills__
FOR UPDATE OR INSERT OR DELETE ON resource_skills
COMPOUND TRIGGER

    in_updated_by       CONSTANT resource_skills.updated_by%TYPE    := COALESCE(APEX_APPLICATION.G_USER, USER);
    in_updated_at       CONSTANT resource_skills.updated_at%TYPE    := SYSDATE;

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
