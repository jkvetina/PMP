--
-- SEQUENCES
--
/*
DROP SEQUENCE resource_id;
DROP SEQUENCE project_id;
DROP SEQUENCE task_id;
DROP SEQUENCE sprint_id;
DROP SEQUENCE skill_id;
*/
CREATE SEQUENCE resource_id     CACHE 100 START WITH 10000;
CREATE SEQUENCE project_id      CACHE 100 START WITH 100;
CREATE SEQUENCE task_id         CACHE 100 START WITH 100000;
CREATE SEQUENCE sprint_id       CACHE 100 START WITH 1000;
CREATE SEQUENCE skill_id        CACHE 100 START WITH 1000;



--
-- TABLES
--
/*
DROP TABLE tasks            CASCADE CONSTRAINTS PURGE;
DROP TABLE sprints          CASCADE CONSTRAINTS PURGE;
DROP TABLE resource_skills  CASCADE CONSTRAINTS PURGE;
DROP TABLE skills           CASCADE CONSTRAINTS PURGE;
DROP TABLE resources        CASCADE CONSTRAINTS PURGE;
DROP TABLE projects         CASCADE CONSTRAINTS PURGE;
*/

--
-- RESOURCES
--
CREATE TABLE resources (
    resource_id                 NUMBER(10)          CONSTRAINT nn_resources_id          NOT NULL,
    --
    person_name                 VARCHAR2(128)       CONSTRAINT nn_resources_name        NOT NULL,
    person_phone                NUMBER(20),
    person_mail                 VARCHAR2(128),
    description_                VARCHAR2(2000),
    is_active                   CHAR(1)             CONSTRAINT nn_resources_active      NOT NULL,
    --
    updated_by                  VARCHAR2(128),
    updated_at                  DATE,
    --
    CONSTRAINT pk_rescources
        PRIMARY KEY (resource_id)
);
--
COMMENT ON TABLE resources IS 'List of people active for projects';
--
COMMENT ON COLUMN resources.resource_id             IS '';
COMMENT ON COLUMN resources.person_name             IS '';
COMMENT ON COLUMN resources.person_phone            IS '';
COMMENT ON COLUMN resources.person_mail             IS '';
COMMENT ON COLUMN resources.description_            IS '';
COMMENT ON COLUMN resources.is_active               IS '';



--
-- SKILLS
--
CREATE TABLE skills (
    skill_code                  VARCHAR2(8)         CONSTRAINT nn_skills_code   NOT NULL,
    --
    skill_name                  VARCHAR2(64)        CONSTRAINT nn_skills_name   NOT NULL,
    --
    updated_by                  VARCHAR2(128),
    updated_at                  DATE,
    --
    CONSTRAINT pk_skills
        PRIMARY KEY (skill_code)
);
--
COMMENT ON TABLE skills IS 'List of skills for resources';
--
COMMENT ON COLUMN skills.skill_code                 IS '';
COMMENT ON COLUMN skills.skill_name                 IS '';



--
-- RESOURCE SKILLS
--
CREATE TABLE resource_skills (
    resource_id                 NUMBER(10)          CONSTRAINT nn_resource_skills_resource  NOT NULL,
    skill_code                  VARCHAR2(8)         CONSTRAINT nn_resource_skills_skill     NOT NULL,
    --
    updated_by                  VARCHAR2(128),
    updated_at                  DATE,
    --
    CONSTRAINT pk_resource_skills
        PRIMARY KEY (resource_id, skill_code),
    --
    CONSTRAINT fk_resource_skills_resource
        FOREIGN KEY (resource_id)
        REFERENCES resources (resource_id),
    --
    CONSTRAINT fk_resource_skills_skill
        FOREIGN KEY (skill_code)
        REFERENCES skills (skill_code)
);
--
COMMENT ON TABLE resource_skills IS 'List of skills assigned to resources';
--
COMMENT ON COLUMN resource_skills.resource_id       IS '';
COMMENT ON COLUMN resource_skills.skill_code        IS '';



--
-- PROJECTS
--
CREATE TABLE projects (
    project_id                  NUMBER(10)          CONSTRAINT nn_projects_id           NOT NULL,
    --
    project_name                VARCHAR2(256)       CONSTRAINT nn_projects_name         NOT NULL,
    description_                VARCHAR2(2000),
    status                      VARCHAR2(30)        CONSTRAINT nn_projects_status       NOT NULL,
    is_active                   CHAR(1)             CONSTRAINT nn_projects_active       NOT NULL,
    --
    owner_id                    NUMBER(10),
    manager_id                  NUMBER(10),
    --
    updated_by                  VARCHAR2(128),
    updated_at                  DATE,
    --
    CONSTRAINT pk_projects
        PRIMARY KEY (project_id),
    --
    CONSTRAINT fk_projects_owner
        FOREIGN KEY (owner_id)
        REFERENCES resources (resource_id),
    --
    CONSTRAINT fk_projects_manager
        FOREIGN KEY (manager_id)
        REFERENCES resources (resource_id)
);
--
COMMENT ON TABLE projects IS 'List of projects';
--
COMMENT ON COLUMN projects.project_id               IS '';
COMMENT ON COLUMN projects.project_name             IS '';
COMMENT ON COLUMN projects.description_             IS '';
COMMENT ON COLUMN projects.status                   IS '';
COMMENT ON COLUMN projects.is_active                IS 'Availability representation/flag of Status column';
COMMENT ON COLUMN projects.owner_id                 IS '';
COMMENT ON COLUMN projects.manager_id               IS '';



--
-- SPRINTS
--
CREATE TABLE sprints (
    sprint_id                   NUMBER(10)          CONSTRAINT nn_sprints_id        NOT NULL,
    --
    sprint_name                 VARCHAR2(30)        CONSTRAINT nn_sprints_name      NOT NULL,
    project_id                  NUMBER(10)          CONSTRAINT nn_sprints_project   NOT NULL,
    start_at                    DATE                CONSTRAINT nn_sprints_start     NOT NULL,
    end_at                      DATE                CONSTRAINT nn_sprints_end       NOT NULL,
    is_active                   CHAR(1)             CONSTRAINT nn_sprints_active    NOT NULL,
    --
    updated_by                  VARCHAR2(128),
    updated_at                  DATE,
    --
    CONSTRAINT pk_sprints
        PRIMARY KEY (sprint_id),
    --
    CONSTRAINT uq_sprints_start
        UNIQUE (sprint_id, start_at),
    --
    CONSTRAINT fk_sprints_project
        FOREIGN KEY (project_id)
        REFERENCES projects (project_id),
    --
    CONSTRAINT ch_sprints_start_end
        CHECK (end_at >= start_at)
);
--
COMMENT ON TABLE sprints IS 'List of fixed development periods';
--
COMMENT ON COLUMN sprints.sprint_id                 IS '';
COMMENT ON COLUMN sprints.sprint_name               IS 'Name used in LOV for easy sprint change';
COMMENT ON COLUMN sprints.project_id                IS '';
COMMENT ON COLUMN sprints.start_at                  IS '';
COMMENT ON COLUMN sprints.end_at                    IS '';
COMMENT ON COLUMN sprints.is_active                 IS '';



--
-- TASKS
--
CREATE TABLE tasks (
    task_id                     NUMBER(10)          CONSTRAINT nn_tasks_id              NOT NULL,
    --
    task_title                  VARCHAR2(256)       CONSTRAINT nn_tasks_title           NOT NULL,
    description_                VARCHAR2(2000)      CONSTRAINT nn_tasks_description     NOT NULL,
    status                      VARCHAR2(30)        CONSTRAINT nn_tasks_status          NOT NULL,
    priority_                   VARCHAR2(30)        CONSTRAINT nn_tasks_priority        NOT NULL,
    --
    project_id                  NUMBER(10),
    resource_id                 NUMBER(10),
    sprint_id                   NUMBER(10),
    estimate                    NUMBER(4),
    --
    updated_by                  VARCHAR2(128),
    updated_at                  DATE,
    --
    CONSTRAINT pk_tasks
        PRIMARY KEY (task_id),
    --
    CONSTRAINT fk_tasks_project
        FOREIGN KEY (project_id)
        REFERENCES projects (project_id),
    --
    CONSTRAINT fk_tasks_resource
        FOREIGN KEY (resource_id)
        REFERENCES resources (resource_id),
    --
    CONSTRAINT fk_tasks_sprint
        FOREIGN KEY (sprint_id)
        REFERENCES sprints (sprint_id)
);
--
COMMENT ON TABLE tasks IS 'List of tasks related to projects';
--
COMMENT ON COLUMN tasks.task_id                     IS '';
COMMENT ON COLUMN tasks.task_title                  IS '';
COMMENT ON COLUMN tasks.description_                IS '';
COMMENT ON COLUMN tasks.status                      IS '';
COMMENT ON COLUMN tasks.priority_                   IS '';
COMMENT ON COLUMN tasks.project_id                  IS '';
COMMENT ON COLUMN tasks.resource_id                 IS '';
COMMENT ON COLUMN tasks.sprint_id                   IS '';
COMMENT ON COLUMN tasks.estimate                    IS '';



--
-- TRIGGERS
--
@"./triggers/tasks__.sql"
@"./triggers/sprints__.sql"
@"./triggers/resource_skills__.sql"
@"./triggers/skills__.sql"
@"./triggers/resources__.sql"
@"./triggers/projects__.sql"

