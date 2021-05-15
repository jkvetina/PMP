prompt --application/shared_components/user_interface/lovs/lov_projects
begin
--   Manifest
--     LOV_PROJECTS
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>116577013837797376
,p_default_application_id=>1000
,p_default_id_offset=>0
,p_default_owner=>'PMP_APEX'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(118339714721954853)
,p_lov_name=>'LOV_PROJECTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    p.project_name,',
'    p.project_id',
'FROM projects p',
'ORDER BY 1;',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_owner=>'PMP'
,p_return_column_name=>'PROJECT_ID'
,p_display_column_name=>'PROJECT_NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
);
wwv_flow_api.component_end;
end;
/
