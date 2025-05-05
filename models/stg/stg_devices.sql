WITH device_data AS (
    SELECT DISTINCT
        platform
    FROM {{ ref('stg_listening') }}
    WHERE platform IS NOT NULL
)

SELECT
    platform
    ,{{ dbt_utils.generate_surrogate_key(['platform']) }}  AS device_id
    ,CASE
        WHEN lower(platform) LIKE '%tv%' OR lower(platform) LIKE '%_tv%'THEN 'TV System'
        WHEN lower(platform) LIKE '%web_player%' OR lower(platform) LIKE '%webplayer%' THEN 'Web Player'
        WHEN lower(platform) LIKE '%android%' THEN 'Android OS'
        WHEN lower(platform) LIKE '%os x%' OR lower(platform) LIKE '%osx%' THEN 'Mac System'
        WHEN lower(platform) LIKE '%amazon%' THEN 'Amazon Device'
        WHEN lower(platform) LIKE '%google%' THEN 'Google Device'
        WHEN lower(platform) LIKE '%ios%' OR lower(platform) LIKE '%applewatch%' THEN 'iOS Device'
        WHEN lower(platform) LIKE '%cast%' THEN 'Cast'
        WHEN lower(platform) LIKE '%windows%' THEN 'Windows System'
        ELSE 'Other'
    END AS device_type
FROM device_data