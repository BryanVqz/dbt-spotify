WITH country_data AS (
    SELECT DISTINCT
        country_id
        ,country
    FROM {{ ref('stg_listening') }}
    WHERE country IS NOT NULL
)

SELECT * FROM country_data