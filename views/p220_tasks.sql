CREATE OR REPLACE VIEW p220_tasks AS
SELECT
    t.*,
    s.sprint_name       AS sprint__,
    r.person_name       AS resource__
FROM tasks t
LEFT JOIN sprints s
    ON s.sprint_id      = t.sprint_id
    AND s.is_active     = 'Y'
LEFT JOIN resources r
    ON r.resource_id    = t.resource_id
WHERE t.project_id      = APEX_UTIL.GET_SESSION_STATE('P0_PROJECT_ID');

