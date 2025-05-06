-- ms played have a positive amount, so the total amount should always be >= 0.
-- Therefore return records where this isn't true to make the test fail.

SELECT * FROM {{ ref( 'fct_listening' )}}
WHERE ms_played < 0