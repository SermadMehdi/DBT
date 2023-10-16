-- models/test.sql

{{ config(
  materialized='table'
) }}

{% set columns_list = ["load_dt", "opened_at_value"] %}

{{ modify_date('staging.servicenow_actual_change_request_lnd', columns_list) }}
