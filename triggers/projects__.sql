CREATE OR REPLACE TRIGGER projects__
FOR UPDATE OR INSERT OR DELETE ON projects
COMPOUND TRIGGER

    in_updated_by       CONSTANT projects.updated_by%TYPE   := COALESCE(APEX_APPLICATION.G_USER, USER);
    in_updated_at       CONSTANT projects.updated_at%TYPE   := SYSDATE;

    BEFORE EACH ROW IS
    BEGIN
        IF NOT DELETING THEN
            IF :NEW.project_id IS NULL THEN
                :NEW.project_id := project_id.NEXTVAL;
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
