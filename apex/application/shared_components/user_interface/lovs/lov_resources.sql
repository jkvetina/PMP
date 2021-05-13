prompt --application/shared_components/user_interface/lovs/lov_resources
begin
--   Manifest
--     LOV_RESOURCES
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
 p_id=>wwv_flow_api.id(117128425878517015)
,p_lov_name=>'LOV_RESOURCES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    r.person_name,',
'    r.resource_id',
'FROM resources r',
'ORDER BY 1;',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'PMP'
,p_return_column_name=>'RESOURCE_ID'
,p_display_column_name=>'PERSON_NAME'
);
wwv_flow_api.component_end;
end;
/
