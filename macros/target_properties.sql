{% set database = target.database %}
{% set schema = target.schema %}

select
    table_type,
    table_schema,
    table_name,
    last_altered
from {{ database }}.information_schema.tables
where table_schema = upper('{{ schema }}')
order by last_altered desc
