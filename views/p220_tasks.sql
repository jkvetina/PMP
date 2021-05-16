CREATE OR REPLACE VIEW p220_tasks AS
SELECT
    t.*,
    p.project_name,
    p.status            AS project_status,
    s.sprint_name       AS sprint__,
    r.person_name       AS resource__,
    --
    CASE WHEN p.is_active  = 'Y' THEN 'IU' END AS auth_management,
    --
    CASE WHEN t.resource_id = auth.get_resource_id() THEN 'U' END AS auth_resource
FROM tasks t
JOIN projects p
    ON p.project_id     = t.project_id
LEFT JOIN sprints s
    ON s.sprint_id      = t.sprint_id
    AND s.is_active     = 'Y'
LEFT JOIN resources r
    ON r.resource_id    = t.resource_id
WHERE t.project_id      = NVL(apex.get_item('P0_PROJECT_ID'), t.project_id);

