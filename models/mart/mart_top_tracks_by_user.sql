{{
    config(
        materialized='table'
    )
}}

WITH fct_listening AS (
    SELECT * FROM {{ ref('fct_listening') }}
)

,dim_users AS (
    SELECT * FROM {{ ref('dim_users') }}
)

,dim_tracks AS (
    SELECT * FROM {{ ref('dim_tracks') }}
)


SELECT 
   UD.user
   ,TD.track_name
   ,TD.artist_name
   ,COUNT(LD.track_id) AS track_reproduction
FROM fct_listening LD
LEFT JOIN dim_users UD ON LD.user_id = UD.user_id
LEFT JOIN dim_tracks TD ON LD.track_id = TD.track_id
WHERE LD.skipped_flag = 'false'
GROUP BY UD.user, TD.track_name, TD.artist_name
ORDER BY COUNT(LD.track_id) DESC, UD.user
