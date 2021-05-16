CREATE OR REPLACE PACKAGE BODY apex AS

    PROCEDURE set_item (
        in_name             VARCHAR2,
        in_value            VARCHAR2        := NULL
    ) AS
    BEGIN
        IF in_name IS NOT NULL THEN
            APEX_UTIL.SET_SESSION_STATE (
                p_name      => in_name,
                p_value     => in_value,
                p_commit    => FALSE
            );
        END IF;
    END;



    FUNCTION get_item (
        in_name             VARCHAR2
    )
    RETURN VARCHAR2 AS
    BEGIN
        IF in_name IS NOT NULL THEN
            RETURN APEX_UTIL.GET_SESSION_STATE(in_name);
        END IF;
        --
        RETURN NULL;
    END;



    FUNCTION get_error_message (
        p_error             APEX_ERROR.T_ERROR
    )
    RETURN APEX_ERROR.T_ERROR_RESULT
    AS
        out_result          APEX_ERROR.T_ERROR_RESULT;
    BEGIN
        out_result := APEX_ERROR.INIT_ERROR_RESULT(p_error => p_error);
        --
        out_result.display_location := apex_error.c_inline_in_notification;
        --
        IF p_error.ora_sqlcode = apex.app_exception_code THEN
            out_result.message := APEX_ERROR.GET_FIRST_ORA_ERROR_TEXT (
                p_error => p_error
            ) || ' [FRIENDLY_MESSAGE]';
        END IF;
        --
        RETURN out_result;
    END;



    PROCEDURE raise_error (
        in_message          VARCHAR2
    )
    AS
    BEGIN
        --
        -- @TODO: log this message
        --
        RAISE_APPLICATION_ERROR(apex.app_exception_code, in_message, TRUE);
    END;

END;
/
