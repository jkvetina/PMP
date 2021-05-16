CREATE OR REPLACE PACKAGE grid AS

    FUNCTION get_region_id (
        in_static_id            apex_application_page_regions.static_id%TYPE
    )
    RETURN apex_application_page_regions.region_id%TYPE;



    PROCEDURE reset_filters (
        in_static_id            VARCHAR2
    );



    PROCEDURE set_filters (
        in_static_id            VARCHAR2,
        in_column_name          VARCHAR2,
        in_filter_value         VARCHAR2,
        in_operator             VARCHAR2,
        in_check_item           VARCHAR2    := NULL
    );

END;
/
