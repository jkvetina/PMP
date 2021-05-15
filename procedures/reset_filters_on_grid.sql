CREATE OR REPLACE PROCEDURE reset_filters_on_grid (
    in_static_id            VARCHAR2
)
AS
    region_id               apex_application_page_regions.region_id%TYPE;
BEGIN
    -- convert static_id to region_id
    SELECT region_id
    INTO region_id
    FROM apex_application_page_regions
    WHERE application_id    = NV('APP_ID')
        AND page_id         = NV('APP_PAGE_ID')
        AND static_id       = in_static_id;
    --
    APEX_IG.RESET_REPORT (
        p_page_id           => NV('APP_PAGE_ID'),
        p_region_id         => region_id,
        p_report_id         => NULL
    );
EXCEPTION
WHEN NO_DATA_FOUND THEN
    NULL;
END;
/
