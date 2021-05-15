prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
--   Manifest
--     LIST: Desktop Navigation Menu
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>116577013837797376
,p_default_application_id=>1000
,p_default_id_offset=>0
,p_default_owner=>'PMP_APEX'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(116585610657910078)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(116735283957910581)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:100:&APP_SESSION.::&DEBUG.:100'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(117058200868032991)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Projects'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&APP_SESSION.::&DEBUG.:200'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(117059640798052881)
,p_list_item_display_sequence=>21
,p_list_item_link_text=>'Sprints'
,p_list_item_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.::::210'
,p_parent_list_item_id=>wwv_flow_api.id(117058200868032991)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(117059935195052882)
,p_list_item_display_sequence=>22
,p_list_item_link_text=>'Tasks'
,p_list_item_link_target=>'f?p=&APP_ID.:220:&SESSION.::&DEBUG.::::220'
,p_parent_list_item_id=>wwv_flow_api.id(117058200868032991)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(117058500860032992)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Resources'
,p_list_item_link_target=>'f?p=&APP_ID.:300:&APP_SESSION.::&DEBUG.:300'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(117058978715032993)
,p_list_item_display_sequence=>31
,p_list_item_link_text=>'Skills'
,p_list_item_link_target=>'f?p=&APP_ID.:310:&SESSION.::&DEBUG.::::310'
,p_parent_list_item_id=>wwv_flow_api.id(117058500860032992)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
