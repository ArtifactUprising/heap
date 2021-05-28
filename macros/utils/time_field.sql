{% macro time_field(field_name) %}

    {{ return(adapter.dispatch('time_field', packages = dbt_utils._get_utils_namespaces() + ['heap'])(field_name)) }}

{% endmacro %}

{% macro default__time_field(field_name) %}
    "time" as {{field_name}}
{% endmacro %}

{% macro snowflake__time_field(field_name) %}
    time as {{field_name}}
{% endmacro %}
