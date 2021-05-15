CREATE OR REPLACE VIEW p310_skills_assigned AS
SELECT
    s.resource_id,
    k.skill_code,
    k.skill_name
FROM resource_skills s
JOIN resources r
    ON r.resource_id    = s.resource_id
JOIN skills k
    ON k.skill_code     = s.skill_code;

