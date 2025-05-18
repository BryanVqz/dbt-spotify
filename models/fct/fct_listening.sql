{{ config(
    materialized='incremental'
) }}

WITH max_listening_timestamp AS (
    SELECT MAX(listening_timestamp) AS max_ts FROM {{ this }}
),

listening_data AS (
    SELECT * FROM {{ ref('stg_listening') }}
    {% if is_incremental() %}
    WHERE listening_timestamp >= (SELECT max_ts FROM max_listening_timestamp)
    {% endif %}
)

,user_data AS (
    SELECT * FROM {{ ref('dim_users') }}
)

,track_data AS (
    SELECT * FROM {{ ref('dim_tracks') }}
)

,country_data AS (
    SELECT * FROM {{ ref('dim_countries') }}
)

,device_data AS (
    SELECT * FROM {{ ref('dim_devices') }}
)

SELECT
    UD.user_id
    ,LD.listening_timestamp
    ,CD.country_id
    ,TD.track_id
    ,DD.device_id
    ,{{ms_to_sec('ms_played')}} AS seconds_played
    ,LD.reason_start
    ,LD.reason_end
    ,LD.shuffle_flag
    ,LD.skipped_flag
    ,LD.offline_flag
    ,LD.incognito_flag
FROM listening_data LD
LEFT JOIN user_data UD 
    ON LD.user = UD.user
LEFT JOIN track_data TD 
    ON LD.track_name = TD.track_name
    AND LD.album_name = TD.album_name
    AND LD.artist_name = TD.artist_name
LEFT JOIN country_data CD 
    ON LD.country = CD.country
LEFT JOIN device_data DD
    ON LD.platform = DD.platform