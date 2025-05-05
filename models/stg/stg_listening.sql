-- generating model for source('SPOTIFY', 'LISTENING_DATA_RAW')...
WITH raw_spotify_data AS (
    SELECT
    split_part(file_name, '/', 1)                       AS user
    ,data:ts::timestamp                                 AS timestamp
    ,data:conn_country::string                          AS country
    ,data:master_metadata_album_album_name::string      AS album_name
    ,data:master_metadata_album_artist_name::string     AS artist_name
    ,data:master_metadata_track_name::string            AS track_name
    ,data:ms_played::integer                            AS ms_played
    ,data:platform::string                              AS platform
    ,data:reason_start::string                          AS reason_start
    ,data:reason_end::string                            AS reason_end
    ,data:shuffle::boolean                              AS shuffle
    ,data:skipped::boolean                              AS skipped
    ,data:offline::boolean                              AS offline
    ,data:incognito_mode::boolean                       AS incognito_mode
    ,data:spotify_track_uri::string                     AS track_uri
    FROM {{ source('spotify','listening_raw') }}
    --spotify.raw.listening_data_raw
)

SELECT
    REPLACE(user, 'Spotify ', '')                                                       AS user 
    ,timestamp
    ,country
    ,album_name
    ,artist_name
    ,track_name
    ,ms_played
    ,platform
    ,reason_start
    ,reason_end
    ,CASE WHEN shuffle IS NULL THEN 'false' ELSE shuffle END                             AS shuffle_flag
    ,CASE WHEN skipped IS NULL THEN 'false' ELSE skipped END                             AS skipped_flag
    ,CASE WHEN offline IS NULL THEN 'false' ELSE offline END                             AS offline_flag
    ,CASE WHEN incognito_mode IS NULL THEN 'false' ELSE incognito_mode END               AS incognito_flag
FROM raw_spotify_data
WHERE track_uri IS NOT NULL