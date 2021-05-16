CREATE OR REPLACE VIEW p210_sprints_chart AS
SELECT
    s.sprint_id,
    s.sprint_name,
    s.project_id,
    s.start_at,
    (s.end_at + 1) - (1 / 86400) AS end_at,
    --
    CASE WHEN s.tasks > 0
        THEN (s.tasks_in_progress + s.tasks_complete) / s.tasks
        END AS progress,
    --    
    TRUNC(SYSDATE) - 7                                  AS all_start,
    MAX(s.end_at) OVER (PARTITION BY s.project_id) + 7  AS all_end
FROM p210_sprints s
WHERE s.project_id      = apex.get_item('P0_PROJECT_ID')
    AND s.is_active     = 'Y';

