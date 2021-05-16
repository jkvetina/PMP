CREATE OR REPLACE VIEW p310_resources AS
SELECT
    r.resource_id,
    r.person_name,
    r.person_phone,
    r.person_mail,
    r.description_,
    r.is_active,
    s.skill_code,
    'SHOW'                  AS link_detail,
    r.person_name           AS resource__
FROM resources r
JOIN resource_skills s
    ON s.resource_id        = r.resource_id;

