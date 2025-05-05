{{
    config(
        materialized='table'
    )
}}

WITH users_data AS (
    SELECT * FROM {{ ref('stg_users') }}
)

,user_data AS (
    SELECT * FROM {{ ref('seed_users') }}
)

SELECT DISTINCT 
    ROW_NUMBER() OVER (ORDER BY T2.user) AS user_id
    ,T1.user
    ,T2.email
FROM users_data T1
LEFT JOIN user_data T2 ON T1.user = T2.user