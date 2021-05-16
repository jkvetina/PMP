CREATE OR REPLACE PACKAGE BODY grid AS

    FUNCTION is_item_in_url (
        in_item_name            VARCHAR2
    )
    RETURN BOOLEAN
    AS
    BEGIN
        RETURN INSTR(OWA_UTIL.GET_CGI_ENV('QUERY_STRING'), LOWER(in_item_name) || '=') > 0;
    END;



    FUNCTION get_region_id (
        in_static_id            apex_application_page_regions.static_id%TYPE
    )
    RETURN apex_application_page_regions.region_id%TYPE
    AS
        region_id               apex_application_page_regions.region_id%TYPE;
    BEGIN
        -- convert static_id to region_id
        SELECT MIN(region_id)
        INTO region_id
        FROM apex_application_page_regions
        WHERE application_id    = auth.get_app_id()
            AND page_id         = auth.get_page_id()
            AND static_id       = in_static_id;
        --
        RETURN region_id;
    END;



    PROCEDURE reset_filters (
        in_static_id            VARCHAR2
    )
    AS
    BEGIN
        APEX_IG.RESET_REPORT (
            p_page_id           => auth.get_page_id(),
            p_region_id         => grid.get_region_id(in_static_id),
            p_report_id         => NULL
        );
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        NULL;
    END;



    PROCEDURE set_filters (
        in_static_id            VARCHAR2,
        in_column_name          VARCHAR2,
        in_filter_value         VARCHAR2,
        in_operator             VARCHAR2,
        in_check_item           VARCHAR2    := NULL
    )
    AS
    BEGIN
        -- ignore filter if item was not passed in url or filtered value is empty
        IF in_filter_value IS NULL THEN
            RETURN;
        ELSIF in_check_item IS NOT NULL AND NOT is_item_in_url(in_check_item) THEN
            RETURN;
        END IF;
        --
        APEX_IG.ADD_FILTER (
            p_page_id           => auth.get_page_id(),
            p_region_id         => grid.get_region_id(in_static_id),
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

END;
/
