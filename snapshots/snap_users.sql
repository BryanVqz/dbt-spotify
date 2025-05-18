{% snapshot snap_users %}

{{
    config(
        target_database='spotify',
        target_schema='spotify_snapshots',
        unique_key='user_id',

        strategy='check',
        check_cols=['email']
    )
}}

select * from {{ ref('dim_users') }}

{% endsnapshot %}