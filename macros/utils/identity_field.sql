{% macro identity_field() %}

    {{ return(adapter.dispatch('identity_field', packages = dbt_utils._get_utils_namespaces() + ['heap'])()) }}

{% endmacro %}

{% macro default__identity_field() %}
    "identity"
{% endmacro %}

{% macro snowflake__identity_field() %}
    identity
{% endmacro %}