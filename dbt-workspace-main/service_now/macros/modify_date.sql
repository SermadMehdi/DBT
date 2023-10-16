-- macros/modify_date.sql

{% macro modify_date(table, columns) %}
WITH modified_columns AS (
  SELECT
    {% for column in columns %}
      {{ column }} AS {{ column }},
      {{ column }} + INTERVAL '11 hours' AS modified_{{ column }}
    {% endfor %}
  FROM {{ table }}
)

SELECT *
FROM modified_columns
{% endmacro %}
