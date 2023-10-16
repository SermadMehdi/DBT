-- models/test.sql

{{ config(
  materialized='table'
) }}

WITH mydata AS (
  SELECT
    load_dt AS loadingtime FROM staging.servicenow_actual_change_request_lnd
)
SELECT * FROM mydata
