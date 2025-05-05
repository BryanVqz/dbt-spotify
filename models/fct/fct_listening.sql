{{
    config(
        materialized='table'
    )
}}

WITH listening_data AS (
    SELECT *
    FROM {{ ref('stg_listening') }}
    WHERE track_uri IS NOT NULL
)

,user_data AS (
    SELECT * FROM {{ ref('dim_users') }}
)

,track_data AS (
    SELECT * FROM {{ ref('dim_tracks') }}
)


SELECT 
    UD.user_id
    ,LD.timestamp
    ,LD.country
    ,TD.album_name
    ,TD.artist_name
    ,TD.track_id
    ,LD.ms_played
    ,LD.platform
    ,LD.reason_start
    ,LD.reason_end
    ,LD.shuffle
    ,LD.skipped
    ,LD.offline
    ,LD.incognito_mode
FROM listening_data LD
LEFT JOIN user_data UD ON LD.user = UD.user
LEFT JOIN track_data TD 
    ON LD.track_name = TD.track_name
    AND LD.album_name = TD.album_name
    AND LD.artist_name = TD.artist_name