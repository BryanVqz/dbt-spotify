WITH track_data AS (
    SELECT DISTINCT
        track_name
        ,album_name
        ,artist_name
    FROM {{ ref('stg_listening') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['artist_name', 'album_name', 'track_name']) }} AS track_id
    ,track_name
    ,album_name
    ,artist_name
FROM track_data