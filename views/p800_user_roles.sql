CREATE OR REPLACE VIEW p800_user_roles AS
SELECT role_code
FROM (
    SELECT 'IS_OWNER_MANAGER'           AS role_code, auth.is_owner_manager()           AS is_active FROM DUAL UNION ALL
    SELECT 'IS_OWNER_MANAGER_SPONZOR'   AS role_code, auth.is_owner_manager_sponzor()   AS is_active FROM DUAL UNION ALL
    SELECT 'IS_RESOURCE'                AS role_code, auth.is_resource()                AS is_active FROM DUAL UNION ALL
    SELECT 'IS_DEVELOPER'               AS role_code, auth.is_developer()               AS is_active FROM DUAL
)
WHERE is_active = 'Y'
ORDER BY 1;

