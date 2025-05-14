{% macro clean_old_objects( database=target.database, schema=target.schema, days=7, run_flag=True ) %}

    {% set query %}
    select
        CASE WHEN table_type = 'VIEW' THEN table_type ELSE 'TABLE' END AS object_type,
        'DROP '|| object_type || ' {{database}}' || '.' || table_schema || '.' || table_name || ';'

    from {{ database }}.information_schema.tables
    where table_schema = upper('{{ schema }}')
        and last_altered <= current_date - {{ days }}
    {% endset %}
    
    {{ log('\n Generating DROP queries...', info=True) }}
    {% set drop_queries = run_query(query).columns[1].values() %}

    {% for query in drop_queries %}
        {% if run_flag %}
            {{ log(query, info=True) }}
        {% else %}
            {{ log('\n Dropping object with command: ' ~ query, info=True) }}
            {% do run_query(query) %}
        {% endif %}
    {% endfor %}

{% endmacro %}