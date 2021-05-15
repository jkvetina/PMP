CREATE OR REPLACE VIEW p200_sprints_chart AS
SELECT
    s.sprint_id,
    s.project_id,
    s.start_at,
    (s.end_at + 1) - (1 / 86400) AS end_at,
    --
    TO_CHAR(s.start_at, 'YYYY-MM-DD') || ' - ' || TO_CHAR(s.end_at, 'YYYY-MM-DD') AS sprint_name,
    --
    CASE WHEN s.tasks > 0
        THEN (s.tasks_in_progress + s.tasks_complete) / s.tasks
        END AS progress,
    --    
    TRUNC(SYSDATE) - 7                                  AS all_start,
    MAX(s.end_at) OVER (PARTITION BY s.project_id) + 7  AS all_end
FROM p200_sprints s
WHERE s.end_at          > TRUNC(SYSDATE) - 7
    AND s.is_active     = 'Y';

