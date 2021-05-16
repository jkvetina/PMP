CREATE OR REPLACE PACKAGE BODY auth AS

    FUNCTION get_user_login
    RETURN apex_workspace_apex_users.email%TYPE AS
    BEGIN
        -- if user login is email, then convert to lowercase
        RETURN COALESCE(CASE
                WHEN INSTR(APEX_APPLICATION.G_USER, '@') > 0
                    THEN LOWER(APEX_APPLICATION.G_USER)
                ELSE APEX_APPLICATION.G_USER
                END,
            USER);
    END;



    FUNCTION get_resource_id (
        in_user_login       resources.user_login%TYPE := NULL
    )
    RETURN resources.resource_id%TYPE
    AS
        out_id      resources.resource_id%TYPE;
    BEGIN
        SELECT r.resource_id
        INTO out_id
        FROM resources r
        WHERE r.user_login = COALESCE(in_user_login, auth.get_user_login());
        --
        RETURN out_id;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
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
        result_         CHAR;
    BEGIN
        IF auth.get_user_login() = USER THEN
            RETURN valid_result;
        END IF;
        --
        SELECT valid_result INTO result_
        FROM apex_workspace_developers d
        JOIN apex_applications a
            ON a.workspace                  = d.workspace_name
        WHERE a.application_id              = auth.get_app_id()
            AND d.is_application_developer  = 'Yes'
            AND d.account_locked            = 'No'
            AND auth.get_user_login()       IN (d.user_name, d.email);
        --
        RETURN result_;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    END;



    FUNCTION is_owner_manager
    RETURN CHAR AS
        result_         CHAR;
    BEGIN
        BEGIN
            SELECT valid_result INTO result_
            FROM user_roles r
            WHERE r.user_login      = auth.get_user_login()
                AND r.role_code     IN (auth.role_owner, auth.role_manager)
                AND r.is_active     = 'Y'
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



    FUNCTION is_owner_manager_sponzor
    RETURN CHAR AS
        result_         CHAR;
    BEGIN
        BEGIN
            SELECT valid_result INTO result_
            FROM user_roles r
            WHERE r.user_login      = auth.get_user_login()
                AND r.role_code     IN (auth.role_owner, auth.role_manager, auth.role_sponzor)
                AND r.is_active     = 'Y'
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



    FUNCTION is_sponzor
    RETURN CHAR AS
        result_         CHAR;
    BEGIN
        BEGIN
            SELECT valid_result INTO result_
            FROM user_roles r
            WHERE r.user_login      = auth.get_user_login()
                AND r.role_code     = auth.role_sponzor
                AND r.is_active     = 'Y'
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



    FUNCTION is_resource
    RETURN CHAR AS
        result_         CHAR;
    BEGIN
        BEGIN
            SELECT valid_result INTO result_
            FROM resources r
            WHERE r.user_login      = auth.get_user_login()
                AND r.is_active     = 'Y'
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
