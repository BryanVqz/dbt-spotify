-- ms played have a positive amount, so the total amount should always be >= 0.
-- Therefore return records where this isn't true to make the test fail.
{% test not_negative(model, column_name) %}
    SELECT * FROM {{ model }}
    WHERE {{ column_name }} < 0
{% endtest %}