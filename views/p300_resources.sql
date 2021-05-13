CREATE OR REPLACE VIEW p300_resources AS
SELECT
    r.*,
    t.tasks
FROM resources r
LEFT JOIN (
    SELECT
        t.resource_id,
        COUNT(*) AS tasks
    FROM tasks t
    --
    -- check status of sprint and project
    --
    GROUP BY t.resource_id
) t
    ON t.resource_id    = r.resource_id;

