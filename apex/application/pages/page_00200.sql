prompt --application/pages/page_00200
begin
--   Manifest
--     PAGE: 00200
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
 p_id=>200
,p_user_interface_id=>wwv_flow_api.id(116725382918910484)
,p_name=>'Projects'
,p_alias=>'PROJECTS'
,p_step_title=>'Projects'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(117057451695999058)
,p_step_template=>wwv_flow_api.id(118353195933943148)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'PMP_DEV'
,p_last_upd_yyyymmddhh24miss=>'20210515195907'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117065606992133430)
,p_plug_name=>'Projects'
,p_region_name=>'PROJECTS'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(116640167750910255)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'P200_PROJECTS'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Projects'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117065811025133432)
,p_name=>'PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117065948938133433)
,p_name=>'PROJECT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Project Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>256
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117066073312133434)
,p_name=>'DESCRIPTION_'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION_'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117066234484133436)
,p_name=>'OWNER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OWNER_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(118333506065192720)
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_lov_null_text=>'-'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117066382929133437)
,p_name=>'MANAGER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MANAGER_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Manager'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(118333506065192720)
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_lov_null_text=>'-'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117066467618133438)
,p_name=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117066579595133439)
,p_name=>'UPDATED_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_AT'
,p_data_type=>'DATE'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117066645211133440)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117066711076133441)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117142457302571840)
,p_name=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_ACTIVE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Is Active'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'Y'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117142890937571844)
,p_name=>'SPRINTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPRINTS'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Sprints'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.::P0_PROJECT_ID:&PROJECT_ID.'
,p_link_text=>'&SPRINTS.'
,p_link_attributes=>'style="font-weight: bold;"'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117142946143571845)
,p_name=>'TASKS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASKS'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Tasks'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_link_target=>'f?p=&APP_ID.:220:&SESSION.::&DEBUG.::P220_FILTER_SPRINT,P220_FILTER_RESOURCE,P220_FILTER_STATUS:,,'
,p_link_text=>'&TASKS.'
,p_link_attributes=>'style="font-weight: bold;"'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117143093526571846)
,p_name=>'RESOURCES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESOURCES'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Resources'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_link_target=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:::'
,p_link_text=>'&RESOURCES.'
,p_link_attributes=>'style="font-weight: bold;"'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117143134562571847)
,p_name=>'TASKS_READY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASKS_READY'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'[Ready]'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117143215376571848)
,p_name=>'TASKS_IN_PROGRESS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASKS_IN_PROGRESS'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'[In Progress]'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(117665223468022434)
,p_name=>'TASKS_COMPLETE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASKS_COMPLETE'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'[Complete]'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118258709290838841)
,p_name=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STATUS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:ACTIVE;ACTIVE,INACTIVE;INACTIVE'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'ACTIVE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(117065757428133431)
,p_internal_uid=>117065757428133431
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(117118822899469449)
,p_interactive_grid_id=>wwv_flow_api.id(117065757428133431)
,p_static_id=>'1171189'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(117119076933469450)
,p_report_id=>wwv_flow_api.id(117118822899469449)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117119557583469452)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(117065811025133432)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117120402149469455)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(117065948938133433)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>197
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117121330440469459)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(117066073312133434)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>262
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117123170749469466)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(117066234484133436)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>213
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117124067423469469)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(117066382929133437)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>210
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117124977016469473)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(117066467618133438)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117125876406469476)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(117066579595133439)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117126740168469479)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(117066645211133440)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117209357004132257)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(117142457302571840)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117537945689824756)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(117142890937571844)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117538857842824774)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(117142946143571845)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117539722378824778)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(117143093526571846)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117633820861638550)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(117143134562571847)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117634700040638559)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(117143215376571848)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>158
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117734945218488260)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(117665223468022434)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(118502772670439626)
,p_view_id=>wwv_flow_api.id(117119076933469450)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(118258709290838841)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117066836787133442)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(117065606992133430)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Projects - Save Interactive Grid Data'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'PROJECTS'
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
