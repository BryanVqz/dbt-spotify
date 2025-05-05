WITH user_data AS (
    SELECT DISTINCT user
    FROM {{ ref('stg_listening') }}
    WHERE track_uri IS NOT NULL
)

SELECT * FROM user_data