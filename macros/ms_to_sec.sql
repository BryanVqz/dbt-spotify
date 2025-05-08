{% macro ms_to_sec(column_name, decimal_places=2) %}
    round({{column_name}} / 3600, {{decimal_places}})
{% endmacro %}