WITH device_data AS (
  SELECT * FROM {{ ref('stg_devices') }}
)

SELECT
    device_id
    ,platform
    ,device_type
FROM device_data
