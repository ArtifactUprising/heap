{% macro heap_users() %}

    {{ return(adapter.dispatch('heap_users', packages = dbt_utils._get_utils_namespaces() + ['heap'])()) }}

{% endmacro %}

{% macro default__heap_users() %}

{%
    set window_clause = "partition by user_id order by last_modified rows
        between unbounded preceding and unbounded following"
%}

--this is only done because heap has a bug where it inserts duplicate records for users.

select distinct

    lower(user_id) as user_id,
    lower(last_value(
        {{heap.identity_field()}}
                ) over ( {{window_clause}} )) as user_identity,
    last_value(lower(email)) over ( {{window_clause}} ) as email,
    min(joindate) over ( {{window_clause}} ) as joindate
    
from {{var('users_table')}}

{% endmacro %}