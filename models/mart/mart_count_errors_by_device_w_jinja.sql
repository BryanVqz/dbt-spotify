/* list of devices with trackerror or unknown issues */
{%- set reasons = ['trackerror', 'unknown'] -%}

WITH listening_data AS (
    SELECT
        *
    FROM {{ ref('fct_listening') }}
)

,device_data AS (
    SELECT * FROM {{ ref('dim_devices') }}
)

SELECT
    DD.device_type,
    {%- for reason in reasons -%}
        SUM(CASE WHEN reason_end='{{ reason }}' THEN 1 ELSE 0 END) AS {{reason}}
        {%- if not loop.last %}, {% endif %}
    {% endfor -%}
FROM listening_data LD
LEFT JOIN device_data DD ON LD.device_id = DD.device_id
GROUP BY DD.device_type
HAVING
    {% for reason in reasons -%}
        SUM(CASE WHEN reason_end = '{{ reason }}' THEN 1 ELSE 0 END) > 0
        {%- if not loop.last %} OR {% endif %}
    {% endfor -%}
ORDER BY 2 DESC, 3 DESC