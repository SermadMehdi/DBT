{% snapshot servicenow_actual_cmn_location_stg %}
    {{
        config(
          target_schema='staging',
          strategy='check',
          unique_key='sys_id_value',
          check_cols=['time_zone_value','full_name_value','sys_created_on_value','sys_updated_on_value','sys_updated_by_value','street_value','phone_value','city_value','name_value','sys_tags_value','stock_room_value','parent_value','company_value','contact_value','fax_phone_value','zip_value','phone_territory_value','latitude_value','lat_long_error_value','sys_mod_count_value','country_value','longitude_value','state_value','sys_created_by_value','cmn_location_type_value','u_smart_hands_group_value','primary_location_value','u_csmc_group_value','u_security_group_value','type_value','u_location_signature_value','u_criticality_value','u_top_location_value','u_data_centre_value','duplicate_value','u_ict_support_group_value','u_customer_access_value','life_cycle_stage_value','coordinates_retrieved_on_value','primary_value','u_email_value','managed_by_group_value','sys_class_name_value','life_cycle_stage_status_value','consumer_value','u_facility_manager_group_value','u_guided_tour_approvals_value','cmn_location_source_value','u_cmms_group_value','account_value'],
          post_hook =[ delete_processed('servicenow_actual_cmn_location_lnd')],
          tags=['servicenow']
        )
    }}
SELECT *
FROM (
    SELECT
    ROW_NUMBER() OVER (PARTITION BY sys_id_value ORDER BY Load_dt DESC) AS row_num,
    CAST( time_zone_value AS varchar ( 30 )  ) AS time_zone_value ,
    CAST( full_name_value AS varchar ( 200 )  ) AS full_name_value ,
    {{ convert_timezone('sys_created_on_value') }} AS sys_created_on_value ,
    {{ convert_timezone('sys_updated_on_value') }} AS sys_updated_on_value ,
    CAST( sys_updated_by_value AS varchar ( 50 )  ) AS sys_updated_by_value ,
    CAST( sys_id_value AS varchar ( 100 )  ) AS sys_id_value ,
    CAST( street_value AS varchar ( 200 )  ) AS street_value ,
    CAST( phone_value AS varchar ( 30 )  ) AS phone_value ,
    CAST( city_value AS varchar ( 70 )  ) AS city_value ,
    CAST( name_value AS varchar ( 100 )  ) AS name_value ,
    CAST( sys_tags_value AS varchar ( 30 )  ) AS sys_tags_value ,
    CAST( stock_room_value AS bit  ) AS stock_room_value ,
    CAST( parent_value AS varchar ( 100 )  ) AS parent_value ,
    CAST( company_value AS varchar ( 100 )  ) AS company_value ,
    CAST( contact_value AS varchar ( 30 )  ) AS contact_value ,
    CAST( fax_phone_value AS varchar ( 50 )  ) AS fax_phone_value ,
    CAST( zip_value AS varchar ( 10 )  ) AS zip_value ,
    CAST( phone_territory_value AS varchar ( 30 )  ) AS phone_territory_value ,
    CAST( latitude_value AS varchar ( 30 )  ) AS latitude_value ,
    CAST( lat_long_error_value AS varchar ( 30 )  ) AS lat_long_error_value ,
    CAST( sys_mod_count_value AS int  ) AS sys_mod_count_value ,
    CAST( country_value AS varchar ( 100 )  ) AS country_value ,
    CAST( longitude_value AS varchar ( 30 )  ) AS longitude_value ,
    CAST( state_value AS varchar ( 20 )  ) AS state_value ,
    CAST( sys_created_by_value AS varchar ( 50 )  ) AS sys_created_by_value ,
    CAST( cmn_location_type_value AS varchar ( 50 )  ) AS cmn_location_type_value ,
    CAST( u_smart_hands_group_value AS varchar ( 100 )  ) AS u_smart_hands_group_value ,
    CAST( primary_location_value AS varchar ( 50 )  ) AS primary_location_value ,
    CAST( u_csmc_group_value AS varchar ( 50 )  ) AS u_csmc_group_value ,
    CAST( u_security_group_value AS varchar ( 50 )  ) AS u_security_group_value ,
    CAST( type_value AS varchar ( 30 )  ) AS type_value ,
    CAST( u_location_signature_value AS varchar ( 1000 )  ) AS u_location_signature_value ,
    CAST( u_criticality_value AS varchar ( 30 )  ) AS u_criticality_value ,
    CAST( u_top_location_value AS varchar ( 50 )  ) AS u_top_location_value ,
    CAST( u_data_centre_value AS bit  ) AS u_data_centre_value ,
    CAST( duplicate_value AS bit  ) AS duplicate_value ,
    CAST( u_ict_support_group_value AS varchar ( 50 )  ) AS u_ict_support_group_value ,
    CAST( u_customer_access_value AS varchar ( 100 )  ) AS u_customer_access_value ,
    CAST( life_cycle_stage_value AS varchar ( 30 )  ) AS life_cycle_stage_value ,
    {{ convert_timezone('coordinates_retrieved_on_value') }} AS coordinates_retrieved_on_value ,
    CAST( primary_value AS bit  ) AS primary_value ,
    CAST( u_email_value AS varchar ( 200 )  ) AS u_email_value ,
    CAST( managed_by_group_value AS varchar ( 50 )  ) AS managed_by_group_value ,
    CAST( sys_class_name_value AS varchar ( 50 )  ) AS sys_class_name_value ,
    CAST( life_cycle_stage_status_value AS varchar ( 50 )  ) AS life_cycle_stage_status_value ,
    CAST( consumer_value AS varchar ( 50 )  ) AS consumer_value ,
    CAST( u_facility_manager_group_value AS varchar ( 50 )  ) AS u_facility_manager_group_value ,
    CAST( u_guided_tour_approvals_value AS varchar ( 50 )  ) AS u_guided_tour_approvals_value ,
    CAST( cmn_location_source_value AS varchar ( 50 )  ) AS cmn_location_source_value ,
    CAST( u_cmms_group_value AS varchar ( 50 )  ) AS u_cmms_group_value ,
    CAST( account_value AS varchar ( 100 )  ) AS account_value ,
    Source_File ,
    {{ convert_timezone('Load_dt') }} AS Load_dt
FROM
    {{ source('staging','servicenow_actual_cmn_location_lnd') }}
)AS Subquery
WHERE row_num = 1;
{% endsnapshot %}
