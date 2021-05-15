CREATE OR REPLACE VIEW p300_projects AS
WITH t AS (
    SELECT
        t.project_id,
        t.resource_id,
        COUNT(*)                                                    AS tasks,
        SUM(CASE WHEN t.status = 'READY'        THEN 1 ELSE 0 END)  AS tasks_ready,
        SUM(CASE WHEN t.status = 'IN-PROGRESS'  THEN 1 ELSE 0 END)  AS tasks_in_progress,
        SUM(CASE WHEN t.status = 'COMPLETE'     THEN 1 ELSE 0 END)  AS tasks_complete
    FROM tasks t
    LEFT JOIN sprints s
        ON s.sprint_id      = t.sprint_id
        AND s.is_active     = 'Y'
    GROUP BY t.project_id, t.resource_id
)
--
SELECT
    t.resource_id,
    r.person_name                   AS resource__,
    p.*,
    NVL(t.tasks, 0)                 AS tasks,
    NVL(t.tasks_ready, 0)           AS tasks_ready,
    NVL(t.tasks_in_progress, 0)     AS tasks_in_progress,
    NVL(t.tasks_complete, 0)        AS tasks_complete
FROM projects p
JOIN t
    ON t.project_id         = p.project_id
JOIN resources r
    ON r.resource_id        = t.resource_id
WHERE p.is_active           = 'Y';

