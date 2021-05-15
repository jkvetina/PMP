CREATE OR REPLACE PROCEDURE set_filters_on_grid (
    in_static_id            VARCHAR2,
    in_column_name          VARCHAR2,
    in_filter_value         VARCHAR2,
    in_operator             VARCHAR2,
    in_check_item           VARCHAR2    := NULL
)
AS
    region_id               apex_application_page_regions.region_id%TYPE;
BEGIN
    -- ignore filter if item was not passed in url or filtered value is empty
    IF in_check_item IS NOT NULL AND (INSTR(OWA_UTIL.GET_CGI_ENV('QUERY_STRING'), LOWER(in_check_item) || '=') = 0 OR in_filter_value IS NULL) THEN
        RETURN;
    END IF;

    -- convert static_id to region_id
    SELECT region_id
    INTO region_id
    FROM apex_application_page_regions
    WHERE application_id    = NV('APP_ID')
        AND page_id         = NV('APP_PAGE_ID')
        AND static_id       = in_static_id;
    --
    APEX_IG.ADD_FILTER (
        p_page_id           => NV('APP_PAGE_ID'),
        p_region_id         => region_id,
        p_column_name       => in_column_name,
        p_filter_value      => in_filter_value,
        p_operator_abbr     => in_operator,
        p_is_case_sensitive => FALSE,
        p_report_id         => NULL
    );
EXCEPTION
WHEN NO_DATA_FOUND THEN
    NULL;
END;
/
