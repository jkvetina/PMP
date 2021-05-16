CREATE OR REPLACE PROCEDURE set_sprint_boundaries AS
    next_start  sprints.start_at%TYPE;
    next_end    sprints.end_at%TYPE;
BEGIN
    -- calculate next sprint
    SELECT
        min_start,
        NEXT_DAY(min_start, 'MONDAY') - 1 + 7
    INTO next_start, next_end
    FROM (
        SELECT NVL(MAX(s.end_at) + 1, TRUNC(SYSDATE)) AS min_start
        FROM sprints s
        WHERE s.project_id = apex.get_item('P0_PROJECT_ID')
    );
    --
    apex.set_item('P210_NEXT_START',  TO_CHAR(next_start, 'YYYY-MM-DD'));
    apex.set_item('P210_NEXT_END',    TO_CHAR(next_end,   'YYYY-MM-DD'));
EXCEPTION
WHEN apex.app_exception THEN
    RAISE;
WHEN OTHERS THEN
    apex.raise_error('UNHANDLED_ERROR');
END;
/
