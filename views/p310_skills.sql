CREATE OR REPLACE VIEW p310_skills AS
WITH r AS (
    SELECT
        s.skill_code,
        COUNT(*)                        AS resources,
        COUNT(DISTINCT t.project_id)    AS projects
    FROM resource_skills s
    JOIN resources r
        ON r.resource_id    = s.resource_id
        AND r.is_active     = 'Y'
    LEFT JOIN tasks t
        ON t.resource_id    = r.resource_id
    GROUP BY s.skill_code
)
SELECT
    s.*,
    NVL(r.resources, 0)     AS resources,
    NVL(r.projects, 0)      AS projects
FROM skills s
LEFT JOIN r
    ON r.skill_code         = s.skill_code;

