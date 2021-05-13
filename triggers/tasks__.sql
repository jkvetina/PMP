CREATE OR REPLACE TRIGGER tasks__
FOR UPDATE OR INSERT OR DELETE ON tasks
COMPOUND TRIGGER

    in_updated_by       CONSTANT tasks.updated_by%TYPE  := COALESCE(APEX_APPLICATION.G_USER, USER);
    in_updated_at       CONSTANT tasks.updated_at%TYPE  := SYSDATE;

    BEFORE EACH ROW IS
    BEGIN
        IF NOT DELETING THEN
            IF :NEW.task_id IS NULL THEN
                :NEW.task_id := task_id.NEXTVAL;
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
