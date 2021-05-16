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
,p_last_upd_yyyymmddhh24miss=>'20210516193501'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118816127265809112)
,p_plug_name=>'Dashboard'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(116640167750910255)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(118816274966809113)
,p_region_id=>wwv_flow_api.id(118816127265809112)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'on'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(118816336432809114)
,p_chart_id=>wwv_flow_api.id(118816274966809113)
,p_seq=>10
,p_name=>'Tasks Todo'
,p_data_source_type=>'TABLE'
,p_query_table=>'P100_DASHBOARD_TASKS'
,p_include_rowid_column=>false
,p_items_value_column_name=>'TASKS_TODO'
,p_items_label_column_name=>'PROJECT_NAME'
,p_assigned_to_y2=>'off'
,p_stack_category=>'Tasks'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(118817024990809121)
,p_chart_id=>wwv_flow_api.id(118816274966809113)
,p_seq=>20
,p_name=>'Tasks Done'
,p_data_source_type=>'TABLE'
,p_query_table=>'P100_DASHBOARD_TASKS'
,p_include_rowid_column=>false
,p_items_value_column_name=>'TASKS_DONE'
,p_items_label_column_name=>'PROJECT_NAME'
,p_assigned_to_y2=>'off'
,p_stack_category=>'Tasks'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(118816883270809119)
,p_chart_id=>wwv_flow_api.id(118816274966809113)
,p_seq=>30
,p_name=>'Resources'
,p_data_source_type=>'TABLE'
,p_query_table=>'P100_DASHBOARD_TASKS'
,p_include_rowid_column=>false
,p_items_value_column_name=>'RESOURCES'
,p_items_label_column_name=>'PROJECT_NAME'
,p_assigned_to_y2=>'off'
,p_stack_category=>'Resources'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(118816771500809118)
,p_chart_id=>wwv_flow_api.id(118816274966809113)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(118816672541809117)
,p_chart_id=>wwv_flow_api.id(118816274966809113)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
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
