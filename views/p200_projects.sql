CREATE OR REPLACE VIEW p200_projects AS
WITH t AS (
    SELECT
        t.project_id,
        COUNT(*)                                                    AS tasks,
        SUM(CASE WHEN t.status = 'READY'        THEN 1 ELSE 0 END)  AS tasks_ready,
        SUM(CASE WHEN t.status = 'IN-PROGRESS'  THEN 1 ELSE 0 END)  AS tasks_in_progress,
        SUM(CASE WHEN t.status = 'COMPLETE'     THEN 1 ELSE 0 END)  AS tasks_complete,
        SUM(CASE WHEN t.resource_id IS NOT NULL THEN 1 ELSE 0 END)  AS resources
    FROM tasks t
    LEFT JOIN sprints s
        ON s.sprint_id      = t.sprint_id
        AND s.is_active     = 'Y'
    GROUP BY t.project_id
),
s AS (
    SELECT
        s.project_id,
        COUNT(*)            AS sprints
    FROM sprints s
    WHERE s.is_active       = 'Y'
    GROUP BY s.project_id
)
--
SELECT
    p.*,
    NVL(s.sprints, 0)               AS sprints,
    NVL(t.tasks, 0)                 AS tasks,
    NVL(t.tasks_ready, 0)           AS tasks_ready,
    NVL(t.tasks_in_progress, 0)     AS tasks_in_progress,
    NVL(t.tasks_complete, 0)        AS tasks_complete,
    NVL(t.resources, 0)             AS resources
FROM projects p
LEFT JOIN s
    ON s.project_id         = p.project_id
LEFT JOIN t
    ON t.project_id         = p.project_id;

