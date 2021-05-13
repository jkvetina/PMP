prompt --application/shared_components/user_interface/lovs/lov_task_status
begin
--   Manifest
--     LOV_TASK_STATUS
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
 p_id=>wwv_flow_api.id(117175502657752784)
,p_lov_name=>'LOV_TASK_STATUS'
,p_lov_query=>'.'||wwv_flow_api.id(117175502657752784)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(117175889089752798)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'READY'
,p_lov_return_value=>'READY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(117176213938752799)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'IN-PROGRESS'
,p_lov_return_value=>'IN-PROGRESS'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(117176615637752800)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'COMPLETE'
,p_lov_return_value=>'COMPLETE'
);
wwv_flow_api.component_end;
end;
/
