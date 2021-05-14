CREATE OR REPLACE VIEW p300_tasks AS
SELECT
    t.*,
    p.project_name,
    s.start_at,
    s.end_at
FROM tasks t
JOIN sprints s
    ON s.sprint_id      = t.sprint_id
JOIN projects p
    ON p.project_id     = t.project_id
WHERE p.is_active       = 'Y'
    AND s.is_active     = 'Y';

