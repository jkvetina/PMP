CREATE OR REPLACE VIEW p300_tasks AS
SELECT
    t.*,
    p.project_name
FROM tasks t
JOIN (
    SELECT
        s.sprint_id,
        p.project_name
    FROM sprints s
    JOIN projects p
        ON p.project_id     = p.project_id
    WHERE p.is_active       = 'Y'
        AND s.is_active     = 'Y'
) p
    ON p.sprint_id          = t.sprint_id;

