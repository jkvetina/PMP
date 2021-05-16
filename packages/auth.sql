CREATE OR REPLACE PACKAGE BODY auth AS

    FUNCTION get_user_id
    RETURN apex_workspace_apex_users.email%TYPE AS
    BEGIN
        RETURN COALESCE(APEX_APPLICATION.G_USER, USER);
    END;



    FUNCTION get_app_id
    RETURN apex_applications.application_id%TYPE AS
    BEGIN
        RETURN COALESCE(APEX_APPLICATION.G_FLOW_ID, 0);
    END;



    FUNCTION get_page_id
    RETURN apex_application_pages.page_id%TYPE AS
    BEGIN
        RETURN NVL(APEX_APPLICATION.G_FLOW_STEP_ID, 0);
    END;



    FUNCTION is_developer
    RETURN CHAR AS
        PRAGMA UDF;
        --
        result_         CHAR;
    BEGIN
        SELECT valid_result INTO result_
        FROM apex_workspace_developers d
        JOIN apex_applications a
            ON a.workspace                  = d.workspace_name
        WHERE a.application_id              = auth.get_app_id()
            AND d.is_application_developer  = 'Yes'
            AND d.account_locked            = 'No'
            AND auth.get_user_id()          IN (d.user_name, d.email);
        --
        RETURN result_;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    END;



    FUNCTION is_owner_manager
    RETURN CHAR AS
        PRAGMA UDF;
        --
        result_         CHAR;
    BEGIN
        BEGIN
            SELECT valid_result INTO result_
            FROM user_roles r
            WHERE r.user_login      = auth.get_user_id()
                AND r.role_code     IN (role_owner, role_manager)
                AND ROWNUM          = 1;
            --
            RETURN result_;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL;
        END;

        -- check higher roles
        IF auth.is_developer() = valid_result THEN
            RETURN valid_result;
        END IF;
        --
        RETURN NULL;
    END;

END;
/
