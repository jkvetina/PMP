CREATE OR REPLACE PACKAGE auth AS

    role_owner          CONSTANT user_roles.role_code%TYPE      := 'OWNER';
    role_sponzor        CONSTANT user_roles.role_code%TYPE      := 'SPONZOR';
    role_manager        CONSTANT user_roles.role_code%TYPE      := 'MANAGER';
    --
    valid_result        CONSTANT CHAR                           := 'Y';



    FUNCTION get_user_login
    RETURN apex_workspace_apex_users.email%TYPE;



    FUNCTION get_resource_id
    RETURN resources.resource_id%TYPE;



    FUNCTION get_app_id
    RETURN apex_applications.application_id%TYPE;



    FUNCTION get_page_id
    RETURN apex_application_pages.page_id%TYPE;



    FUNCTION is_developer
    RETURN CHAR;



    FUNCTION is_owner_manager
    RETURN CHAR;



    FUNCTION is_owner_manager_sponzor
    RETURN CHAR;



    FUNCTION is_sponzor
    RETURN CHAR;



    FUNCTION is_resource
    RETURN CHAR;

END;
/
