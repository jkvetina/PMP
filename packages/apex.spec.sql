CREATE OR REPLACE PACKAGE apex AS

    app_exception_code      CONSTANT PLS_INTEGER        := -20000;
    app_exception           EXCEPTION;
    --
    PRAGMA EXCEPTION_INIT(app_exception, app_exception_code);



    PROCEDURE set_item (
        in_name             VARCHAR2,
        in_value            VARCHAR2        := NULL
    );



    FUNCTION get_item (
        in_name             VARCHAR2
    )
    RETURN VARCHAR2;



    FUNCTION get_error_message (
        p_error             APEX_ERROR.T_ERROR
    )
    RETURN APEX_ERROR.T_ERROR_RESULT;



    PROCEDURE raise_error (
        in_message          VARCHAR2
    );

END;
/
