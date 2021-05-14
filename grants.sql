GRANT SELECT, UPDATE, INSERT, DELETE ON pmp.tasks               TO pmp_apex;
GRANT SELECT, UPDATE, INSERT, DELETE ON pmp.sprints             TO pmp_apex;
GRANT SELECT, UPDATE, INSERT, DELETE ON pmp.resource_skills     TO pmp_apex;
GRANT SELECT, UPDATE, INSERT, DELETE ON pmp.skills              TO pmp_apex;
GRANT SELECT, UPDATE, INSERT, DELETE ON pmp.resources           TO pmp_apex;
GRANT SELECT, UPDATE, INSERT, DELETE ON pmp.projects            TO pmp_apex;
--
GRANT SELECT ON pmp.p200_projects               TO pmp_apex;
GRANT SELECT ON pmp.p200_sprints                TO pmp_apex;
GRANT SELECT ON pmp.p200_sprints_chart          TO pmp_apex;
GRANT SELECT ON pmp.p300_resources              TO pmp_apex;
GRANT SELECT ON pmp.p300_tasks                  TO pmp_apex;
GRANT SELECT ON pmp.p310_skills                 TO pmp_apex;



--
-- RUN AS SYS
--
CREATE SYNONYM pmp_apex.tasks                   FOR pmp.tasks;
CREATE SYNONYM pmp_apex.sprints                 FOR pmp.sprints;
CREATE SYNONYM pmp_apex.resource_skills         FOR pmp.resource_skills;
CREATE SYNONYM pmp_apex.skills                  FOR pmp.skills;
CREATE SYNONYM pmp_apex.resources               FOR pmp.resources;
CREATE SYNONYM pmp_apex.projects                FOR pmp.projects;
--
CREATE SYNONYM pmp_apex.p200_projects           FOR pmp.p200_projects;
CREATE SYNONYM pmp_apex.p200_sprints            FOR pmp.p200_sprints;
CREATE SYNONYM pmp_apex.p200_sprints_chart      FOR pmp.p200_sprints_chart;
CREATE SYNONYM pmp_apex.p300_resources          FOR pmp.p300_resources;
CREATE SYNONYM pmp_apex.p300_tasks              FOR pmp.p300_tasks;
CREATE SYNONYM pmp_apex.p310_skills             FOR pmp.p310_skills;


