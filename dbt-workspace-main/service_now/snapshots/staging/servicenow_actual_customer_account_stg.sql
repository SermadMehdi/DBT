{% snapshot servicenow_actual_customer_account_stg %}
    {{
        config(
          target_schema='staging',
          strategy='check',
          unique_key='sys_id_value',
          check_cols=['banner_image_light_value','country_value','parent_value','notes_value','minority_ownership_status_value','stock_symbol_value','discount_value','active_escalation_value','sys_updated_on_value','u_notification_email_value','apple_icon_value','number_value','sys_updated_by_value','fiscal_year_value','sso_source_value','sys_created_on_value','contact_value','rural_based_status_value','stock_price_value','u_subject_close_value','state_value','banner_image_value','sys_created_by_value','longitude_value','zip_value','profits_value','assumed_name_value','u_customer_code_value','tax_id_value','u_alarm_close_value','incorporated_on_value','u_subject_raised_value','u_display_name_value','phone_value','fax_phone_value','name_value','banner_text_value','account_code_value','coordinates_retrieved_on_value','u_overlay_colour_value','primary_value','identification_number_value','u_alarm_raised_value','city_value','latitude_value','industry_value','sys_class_name_value','manufacturer_value','account_parent_value','tribal_affiliation_status_value','business_structure_value','market_cap_value','num_employees_value','rank_tier_value','street_value','vendor_value','trademark_value','lat_long_error_value','theme_value','email_value','vendor_type_value','website_value','revenue_per_year_value','u_alarm_update_value','publicly_traded_value','sys_mod_count_value','u_assignment_group_value','sys_tags_value','u_alarm_contacts_value','u_subject_update_value','women_ownership_status_value','partner_value','registration_code_value','vendor_manager_value','u_location_value','account_path_value','primary_contact_value','legal_entity_name_value','u_account_colour_value','customer_value'],
          post_hook =[ delete_processed('servicenow_actual_customer_account_lnd')],
          tags=['servicenow']
        )
    }}
SELECT *
FROM (
    SELECT
    ROW_NUMBER() OVER (PARTITION BY sys_id_value ORDER BY Load_dt DESC) AS row_num,
    CAST( sys_id_value AS varchar ( 50 )  ) AS sys_id_value ,
    CAST( banner_image_light_value AS varchar ( 30 )  ) AS banner_image_light_value ,
    CAST( country_value AS varchar ( 10 )  ) AS country_value ,
    CAST( parent_value AS varchar ( 30 )  ) AS parent_value ,
    CAST( notes_value AS varchar ( 30 )  ) AS notes_value ,
    CAST( minority_ownership_status_value AS varchar ( 30 )  ) AS minority_ownership_status_value ,
    CAST( stock_symbol_value AS varchar ( 30 )  ) AS stock_symbol_value ,
    CAST( discount_value AS varchar ( 50 )  ) AS discount_value ,
    CAST( active_escalation_value AS varchar ( 30 )  ) AS active_escalation_value ,
    {{ convert_timezone('sys_updated_on_value') }} AS sys_updated_on_value ,
    CAST( u_notification_email_value AS varchar ( 100 )  ) AS u_notification_email_value ,
    CAST( apple_icon_value AS varchar ( 30 )  ) AS apple_icon_value ,
    CAST( number_value AS varchar ( 50 )  ) AS number_value ,
    CAST( sys_updated_by_value AS varchar ( 50 )  ) AS sys_updated_by_value ,
    {{ convert_timezone('fiscal_year_value') }} AS fiscal_year_value ,
    CAST( sso_source_value AS varchar ( 30 )  ) AS sso_source_value ,
    {{ convert_timezone('sys_created_on_value') }} AS sys_created_on_value ,
    CAST( contact_value AS varchar ( 50 )  ) AS contact_value ,
    CAST( rural_based_status_value AS varchar ( 30 )  ) AS rural_based_status_value ,
    CAST( stock_price_value AS varchar ( 30 )  ) AS stock_price_value ,
    CAST( u_subject_close_value AS varchar ( 100 )  ) AS u_subject_close_value ,
    CAST( state_value AS varchar ( 20 )  ) AS state_value ,
    CAST( banner_image_value AS varchar ( 30 )  ) AS banner_image_value ,
    CAST( sys_created_by_value AS varchar ( 50 )  ) AS sys_created_by_value ,
    CAST( longitude_value AS varchar ( 50 )  ) AS longitude_value ,
    CAST( zip_value AS varchar ( 10 )  ) AS zip_value ,
    CAST( profits_value AS varchar ( 30 )  ) AS profits_value ,
    CAST( assumed_name_value AS varchar ( 30 )  ) AS assumed_name_value ,
    CAST( u_customer_code_value AS varchar ( 50 )  ) AS u_customer_code_value ,
    CAST( tax_id_value AS varchar ( 50 )  ) AS tax_id_value ,
    CAST( u_alarm_close_value AS varchar ( 1000 )  ) AS u_alarm_close_value ,
    {{ convert_timezone('incorporated_on_value') }} AS incorporated_on_value ,
    CAST( u_subject_raised_value AS varchar ( 100 )  ) AS u_subject_raised_value ,
    CAST( u_display_name_value AS varchar ( 30 )  ) AS u_display_name_value ,
    CAST( phone_value AS varchar ( 30 )  ) AS phone_value ,
    CAST( fax_phone_value AS varchar ( 30 )  ) AS fax_phone_value ,
    CAST( name_value AS varchar ( 100 )  ) AS name_value ,
    CAST( banner_text_value AS varchar ( 30 )  ) AS banner_text_value ,
    CAST( account_code_value AS varchar ( 10 )  ) AS account_code_value ,
    {{ convert_timezone('coordinates_retrieved_on_value') }} AS coordinates_retrieved_on_value ,
    CAST( u_overlay_colour_value AS float  ) AS u_overlay_colour_value ,
    CAST( primary_value AS bit  ) AS primary_value ,
    CAST( identification_number_value AS varchar ( 30 )  ) AS identification_number_value ,
    CAST( u_alarm_raised_value AS varchar ( 1000 )  ) AS u_alarm_raised_value ,
    CAST( city_value AS varchar ( 100 )  ) AS city_value ,
    CAST( latitude_value AS varchar ( 50 )  ) AS latitude_value ,
    CAST( industry_value AS varchar ( 30 )  ) AS industry_value ,
    CAST( sys_class_name_value AS varchar ( 50 )  ) AS sys_class_name_value ,
    CAST( manufacturer_value AS bit  ) AS manufacturer_value ,
    CAST( account_parent_value AS varchar ( 50 )  ) AS account_parent_value ,
    CAST( tribal_affiliation_status_value AS varchar ( 30 )  ) AS tribal_affiliation_status_value ,
    CAST( business_structure_value AS varchar (30 )  ) AS business_structure_value ,
    CAST( market_cap_value AS varchar ( 10 )  ) AS market_cap_value ,
    CAST( num_employees_value AS float  ) AS num_employees_value ,
    CAST( rank_tier_value AS varchar ( 30 )  ) AS rank_tier_value ,
    CAST( street_value AS varchar ( 100 )  ) AS street_value ,
    CAST( vendor_value AS bit  ) AS vendor_value ,
    CAST( trademark_value AS varchar ( 30 )  ) AS trademark_value ,
    CAST( lat_long_error_value AS varchar ( 30 )  ) AS lat_long_error_value ,
    CAST( theme_value AS varchar ( 50 )  ) AS theme_value ,
    CAST( email_value AS varchar ( 100 )  ) AS email_value ,
    CAST( vendor_type_value AS varchar ( 30 )  ) AS vendor_type_value ,
    CAST( website_value AS varchar ( 100 )  ) AS website_value ,
    CAST( revenue_per_year_value AS varchar ( 30 )  ) AS revenue_per_year_value ,
    CAST( u_alarm_update_value AS varchar ( 1000 )  ) AS u_alarm_update_value ,
    CAST( publicly_traded_value AS bit  ) AS publicly_traded_value ,
    CAST( sys_mod_count_value AS int  ) AS sys_mod_count_value ,
    CAST( u_assignment_group_value AS varchar ( 50 )  ) AS u_assignment_group_value ,
    CAST( sys_tags_value AS varchar ( 50 )  ) AS sys_tags_value ,
    CAST( u_alarm_contacts_value AS varchar ( 50 )  ) AS u_alarm_contacts_value ,
    CAST( u_subject_update_value AS varchar ( 100 )  ) AS u_subject_update_value ,
    CAST( women_ownership_status_value AS varchar ( 30 )  ) AS women_ownership_status_value ,
    CAST( partner_value AS bit  ) AS partner_value ,
    CAST( registration_code_value AS varchar ( 50 )  ) AS registration_code_value ,
    CAST( vendor_manager_value AS varchar ( 30 )  ) AS vendor_manager_value ,
    CAST( u_location_value AS varchar ( 100 )  ) AS u_location_value ,
    CAST( account_path_value AS varchar ( 30 )  ) AS account_path_value ,
    CAST( primary_contact_value AS varchar ( 100 )  ) AS primary_contact_value ,
    CAST( legal_entity_name_value AS varchar ( 50 )  ) AS legal_entity_name_value ,
    CAST( u_account_colour_value AS varchar ( 50 )  ) AS u_account_colour_value ,
    CAST( customer_value AS bit  ) AS customer_value ,
    Source_File ,
    {{ convert_timezone('Load_dt') }} AS Load_dt
 FROM
    {{ source('staging','servicenow_actual_customer_account_lnd') }}
)AS Subquery
WHERE row_num = 1;
{% endsnapshot %}