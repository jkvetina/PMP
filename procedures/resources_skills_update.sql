CREATE OR REPLACE PROCEDURE resources_skills_update (
    in_action           CHAR,
    in_resource_id      resources.resource_id%TYPE,
    in_user_login       resources.user_login%TYPE,
    in_person_name      resources.person_name%TYPE,
    in_person_phone     resources.person_phone%TYPE,
    in_person_mail      resources.person_mail%TYPE,
    in_description_     resources.description_%TYPE,
    in_is_active        resources.is_active%TYPE,
    in_skill_depl       CHAR,
    in_skill_devops     CHAR,
    in_skill_arch       CHAR,
    in_skill_cc         CHAR,
    in_skill_t          CHAR,
    in_skill_dev        CHAR,
    in_skill_ba         CHAR,
    in_skill_pm         CHAR
) AS
    r_resource          resources%ROWTYPE;
    r_skill_map         resource_skills%ROWTYPE;
BEGIN
    -- delete resource and mapped skills
    IF in_action = 'D' THEN
        DELETE FROM resource_skills s
        WHERE s.resource_id = in_resource_id;
        --
        DELETE FROM resources r
        WHERE r.resource_id = in_resource_id;
        --
        RETURN;
    END IF;

    -- prepare resource
    r_resource.resource_id      := in_resource_id;
    r_resource.user_login       := in_user_login;
    r_resource.person_name      := in_person_name;
    r_resource.person_phone     := in_person_phone;
    r_resource.person_mail      := in_person_mail;
    r_resource.description_     := in_description_;
    r_resource.is_active        := in_is_active;
    --
    IF r_resource.resource_id IS NULL THEN
        r_resource.resource_id := resource_id.NEXTVAL;
    END IF;
    --
    UPDATE resources r
    SET ROW = r_resource
    WHERE r.resource_id = r_resource.resource_id;
    --
    IF SQL%ROWCOUNT = 0 THEN
        INSERT INTO resources
        VALUES r_resource;
    END IF;

    -- prepare skills
    r_skill_map.resource_id     := r_resource.resource_id;
    --
    FOR c IN (
        -- assume skills wont change that much, we could do dynamic SQL if they do
        -- we could also store them as columns, this is kind of half way
        SELECT 'DEPL'   AS skill_code, in_skill_depl    AS value FROM DUAL UNION ALL
        SELECT 'DEVOPS' AS skill_code, in_skill_devops  AS value FROM DUAL UNION ALL
        SELECT 'ARCH'   AS skill_code, in_skill_arch    AS value FROM DUAL UNION ALL
        SELECT 'CC'     AS skill_code, in_skill_cc      AS value FROM DUAL UNION ALL
        SELECT 'T'      AS skill_code, in_skill_t       AS value FROM DUAL UNION ALL
        SELECT 'DEV'    AS skill_code, in_skill_dev     AS value FROM DUAL UNION ALL
        SELECT 'BA'     AS skill_code, in_skill_ba      AS value FROM DUAL UNION ALL
        SELECT 'PM'     AS skill_code, in_skill_pm      AS value FROM DUAL
    ) LOOP
        r_skill_map.skill_code := c.skill_code;
        --
        IF c.value = 'Y' THEN
            BEGIN
                INSERT INTO resource_skills s
                VALUES r_skill_map;
            EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                NULL;
            END;
        ELSE
            DELETE FROM resource_skills s
            WHERE s.resource_id     = r_skill_map.resource_id
                AND s.skill_code    = r_skill_map.skill_code;
        END IF;        
    END LOOP;
EXCEPTION
WHEN OTHERS THEN
    --
    -- @TODO: log errors
    --
    RAISE;
END;
/
