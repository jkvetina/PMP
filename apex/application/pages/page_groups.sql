prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 1000
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>116577013837797376
,p_default_application_id=>1000
,p_default_id_offset=>0
,p_default_owner=>'PMP_APEX'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(117057649627000412)
,p_group_name=>'DASHBOARD'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(117057451695999058)
,p_group_name=>'PROJECTS'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(117057536870999705)
,p_group_name=>'RESOURCES'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(118806484582264200)
,p_group_name=>'USER'
);
wwv_flow_api.component_end;
end;
/
