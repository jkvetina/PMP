prompt --application/pages/page_00100
begin
--   Manifest
--     PAGE: 00100
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
 p_id=>100
,p_user_interface_id=>wwv_flow_api.id(116725382918910484)
,p_name=>'Dashboard'
,p_alias=>'HOME'
,p_step_title=>'Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(117057649627000412)
,p_step_template=>wwv_flow_api.id(118353195933943148)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(118801843615136462)
,p_last_updated_by=>'PMP_DEV'
,p_last_upd_yyyymmddhh24miss=>'20210516105124'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(233790742579895253)
,p_plug_name=>'Project Management'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(116621177557910220)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.component_end;
end;
/
