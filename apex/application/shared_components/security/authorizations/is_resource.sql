prompt --application/shared_components/security/authorizations/is_resource
begin
--   Manifest
--     SECURITY SCHEME: IS_RESOURCE
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>116577013837797376
,p_default_application_id=>1000
,p_default_id_offset=>0
,p_default_owner=>'PMP_APEX'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(118801843615136462)
,p_name=>'IS_RESOURCE'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'RETURN auth.is_resource() = ''Y'';',
''))
,p_error_message=>'AUTH_ERROR'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.component_end;
end;
/
