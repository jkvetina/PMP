CREATE OR REPLACE VIEW p100_dashboard_tasks AS
WITH w AS (
    SELECT
        p.project_id,
        COUNT(t.task_id)    AS tasks_waiting
    FROM projects p
    JOIN tasks t
        ON t.project_id     = p.project_id
        AND t.sprint_id     IS NULL
    GROUP BY p.project_id
)
SELECT
    p.project_id,
    p.project_name,
    MAX(w.tasks_waiting)    AS tasks_waiting,
    --
    SUM(CASE WHEN t.status = 'READY'        THEN 1 ELSE 0 END)  AS tasks_ready,
    SUM(CASE WHEN t.status = 'IN-PROGRESS'  THEN 1 ELSE 0 END)  AS tasks_in_progress,
    SUM(CASE WHEN t.status = 'COMPLETE'     THEN 1 ELSE 0 END)  AS tasks_complete,
    COUNT(DISTINCT t.resource_id)                               AS resources
FROM projects p
JOIN sprints s
    ON s.project_id     = p.project_id
    AND s.is_active     = 'Y'
JOIN tasks t
    ON t.project_id     = p.project_id
    AND t.sprint_id     = s.sprint_id
LEFT JOIN w
    ON w.project_id     = p.project_id
GROUP BY p.project_id, p.project_name;

