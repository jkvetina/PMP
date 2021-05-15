CREATE OR REPLACE VIEW p210_resources AS
SELECT
    t.project_id,
    t.sprint_id,
    r.resource_id,
    r.person_name,
    r.person_phone,
    r.person_mail,
    r.description_,
    r.is_active
FROM resources r
JOIN tasks t
    ON t.resource_id        = r.resource_id;

