prompt --application/shared_components/user_interface/lovs/lov_task_priority
begin
--   Manifest
--     LOV_TASK_PRIORITY
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
 p_id=>wwv_flow_api.id(117177267872764964)
,p_lov_name=>'LOV_TASK_PRIORITY'
,p_lov_query=>'.'||wwv_flow_api.id(117177267872764964)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(117177513294764965)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'HIGH'
,p_lov_return_value=>'HIGH'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(117177919188764966)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'LOW'
,p_lov_return_value=>'LOW'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(117178330697764967)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'NORMAL'
,p_lov_return_value=>'NORMAL'
);
wwv_flow_api.component_end;
end;
/
