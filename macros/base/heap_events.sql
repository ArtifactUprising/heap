{% macro heap_events() %}

    {{ return(adapter.dispatch('heap_events', packages = dbt_utils._get_utils_namespaces() + ['heap'])()) }}

{% endmacro %}


{% macro default__heap_events() %}

select 
    
    *,
    {{heap.time_field('event_time')}}
    
from {{var('events_table')}}

{% endmacro %}