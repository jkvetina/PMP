prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
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
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(116725382918910484)
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'PMP_DEV'
,p_last_upd_yyyymmddhh24miss=>'20210515175045'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118257844337838832)
,p_plug_name=>'SET_PROJECT_ID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(116638246310910251)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118257982613838833)
,p_name=>'P0_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(118257844337838832)
,p_prompt=>'Project Id'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROJECTS_ACTIVE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    p.project_name,',
'    p.project_id',
'FROM projects p',
'WHERE p.is_active = ''Y''',
'ORDER BY 1;',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(116701545089910395)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'N'
);
wwv_flow_api.component_end;
end;
/
