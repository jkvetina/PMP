CREATE OR REPLACE TRIGGER sprints__
FOR UPDATE OR INSERT OR DELETE ON sprints
COMPOUND TRIGGER

    in_updated_by       CONSTANT sprints.updated_by%TYPE    := COALESCE(APEX_APPLICATION.G_USER, USER);
    in_updated_at       CONSTANT sprints.updated_at%TYPE    := SYSDATE;

    BEFORE EACH ROW IS
    BEGIN
        IF NOT DELETING THEN
            IF :NEW.sprint_id IS NULL THEN
                :NEW.sprint_id := sprint_id.NEXTVAL;
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
