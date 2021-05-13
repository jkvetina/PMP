CREATE OR REPLACE TRIGGER skills__
FOR UPDATE OR INSERT OR DELETE ON skills
COMPOUND TRIGGER

    in_updated_by       CONSTANT skills.updated_by%TYPE     := COALESCE(APEX_APPLICATION.G_USER, USER);
    in_updated_at       CONSTANT skills.updated_at%TYPE     := SYSDATE;

    BEFORE EACH ROW IS
    BEGIN
        IF NOT DELETING THEN
            IF :NEW.skill_id IS NULL THEN
                :NEW.skill_id := skill_id.NEXTVAL;
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
