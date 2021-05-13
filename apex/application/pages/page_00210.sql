prompt --application/pages/page_00210
begin
--   Manifest
--     PAGE: 00210
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>116577013837797376
,p_default_application_id=>1000
,p_default_id_offset=>0
,p_default_owner=>'PMP_APEX'
);
wwv_flow_api.create_page(
 p_id=>210
,p_user_interface_id=>wwv_flow_api.id(116725382918910484)
,p_name=>'Sprints'
,p_alias=>'SPRINTS'
,p_step_title=>'Sprints'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(117057451695999058)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'PMP_DEV'
,p_last_upd_yyyymmddhh24miss=>'20210513184900'
);
wwv_flow_api.component_end;
end;
/
