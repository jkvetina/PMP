prompt --application/shared_components/security/authentications/open_door_testing_only
begin
--   Manifest
--     AUTHENTICATION: OPEN_DOOR (TESTING ONLY)
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>116577013837797376
,p_default_application_id=>1000
,p_default_id_offset=>0
,p_default_owner=>'PMP_APEX'
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(118809821770536346)
,p_name=>'OPEN_DOOR (TESTING ONLY)'
,p_scheme_type=>'NATIVE_OPEN_DOOR'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_api.component_end;
end;
/
