{{
    config(
        materialized='table'
    )
}}

WITH track_data AS (
  SELECT DISTINCT
    track_id,
    track_name,
    album_name,
    artist_name
  FROM {{ ref('stg_listening') }}
)

SELECT * FROM track_data
