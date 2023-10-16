{% macro convert_timezone(datetime_field) %}
  CONVERT(datetime2, {{ datetime_field }}, 126)
  AT TIME ZONE 'AUS Eastern Standard Time'
  {{ log("Convert timezone called " ~ datetime_field ~ " .................. [OK]", info=True ) }}
{% endmacro %}