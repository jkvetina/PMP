CREATE OR REPLACE VIEW p200_sprints AS
SELECT
    s.*,
    t.tasks
FROM sprints s
LEFT JOIN (
    SELECT
        t.sprint_id,
        COUNT(*) AS tasks
    FROM tasks t
    GROUP BY t.sprint_id
) t
    ON t.sprint_id      = s.sprint_id;

