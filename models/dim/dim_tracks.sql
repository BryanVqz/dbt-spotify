{{
    config(
        materialized='table'
    )
}}

WITH track_data AS (
  SELECT *
  FROM {{ ref('stg_tracks') }}
)

SELECT * FROM track_data
