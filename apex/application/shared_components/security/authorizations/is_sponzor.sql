prompt --application/shared_components/security/authorizations/is_sponzor
begin
--   Manifest
--     SECURITY SCHEME: IS_SPONZOR
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
 p_id=>wwv_flow_api.id(118811038434647571)
,p_name=>'IS_SPONZOR'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'RETURN auth.is_sponzor() = ''Y'';'
,p_error_message=>'AUTH_ERROR'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.component_end;
end;
/
