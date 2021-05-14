CREATE OR REPLACE VIEW p300_resources AS
WITH t AS (
    SELECT
        t.resource_id,
        COUNT(DISTINCT p.project_id)                                AS projects,
        COUNT(*)                                                    AS tasks,
        SUM(CASE WHEN t.status = 'READY'        THEN 1 ELSE 0 END)  AS tasks_ready,
        SUM(CASE WHEN t.status = 'IN-PROGRESS'  THEN 1 ELSE 0 END)  AS tasks_in_progress,
        SUM(CASE WHEN t.status = 'COMPLETE'     THEN 1 ELSE 0 END)  AS tasks_complete,
        SUM(CASE WHEN t.resource_id IS NOT NULL THEN 1 ELSE 0 END)  AS resources
    FROM tasks t
    JOIN sprints s
        ON s.sprint_id      = t.sprint_id
    JOIN projects p
        ON p.project_id     = t.project_id
    WHERE s.is_active       = 'Y'
        AND p.is_active     = 'Y'
    GROUP BY t.resource_id
),
s AS (
    SELECT *
    FROM resource_skills r
    PIVOT (
        COUNT(skill_code)
        FOR skill_code IN (
            'DEPL'      AS skill_depl,
            'DEVOPS'    AS skill_devops,
            'ARCH'      AS skill_arch,
            'CC'        AS skill_cc,
            'T'         AS skill_t,
            'DEV'       AS skill_dev,
            'BA'        AS skill_ba,
            'PM'        AS skill_pm
        )
    )
)
SELECT
    r.*,
    --
    CASE WHEN s.skill_depl      > 0 THEN 'Y' ELSE 'N' END AS skill_depl,
    CASE WHEN s.skill_devops    > 0 THEN 'Y' ELSE 'N' END AS skill_devops,
    CASE WHEN s.skill_arch      > 0 THEN 'Y' ELSE 'N' END AS skill_arch,
    CASE WHEN s.skill_cc        > 0 THEN 'Y' ELSE 'N' END AS skill_cc,
    CASE WHEN s.skill_t         > 0 THEN 'Y' ELSE 'N' END AS skill_t,
    CASE WHEN s.skill_dev       > 0 THEN 'Y' ELSE 'N' END AS skill_dev,
    CASE WHEN s.skill_ba        > 0 THEN 'Y' ELSE 'N' END AS skill_ba,
    CASE WHEN s.skill_pm        > 0 THEN 'Y' ELSE 'N' END AS skill_pm,
    --
    NVL(t.projects, 0)              AS projects,
    NVL(t.tasks, 0)                 AS tasks,
    NVL(t.tasks_ready, 0)           AS tasks_ready,
    NVL(t.tasks_in_progress, 0)     AS tasks_in_progress,
    NVL(t.tasks_complete, 0)        AS tasks_complete
FROM resources r
LEFT JOIN t
    ON t.resource_id    = r.resource_id
LEFT JOIN s
    ON s.resource_id    = r.resource_id;

