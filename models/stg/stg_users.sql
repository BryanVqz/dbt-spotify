WITH user_data AS (
    SELECT DISTINCT user
    FROM {{ ref('stg_listening') }}
    WHERE user IS NOT NULL
)

SELECT *
FROM user_data