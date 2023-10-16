{% snapshot servicenow_actual_sys_user_group_stg %}
    {{
        config(
          target_schema='staging',
          strategy='check',
          unique_key='sys_id_value',
          check_cols=['active_value','type_value','sys_created_on_value','email_value','description_value','sys_updated_by_value','include_members_value','manager_value','exclude_manager_value','sys_mod_count_value','default_assignee_value','sys_created_by_value','name_value','sys_updated_on_value','sys_tags_value','roles_value','cost_center_value','parent_value','source_value','points_value','u_home_dashboard_value','vendors_value','average_daily_fte_value','hourly_rate_value'],
          post_hook =[ delete_processed('servicenow_actual_sys_user_group_lnd')],
          tags=['servicenow']
        )
    }}
SELECT *
FROM (
    SELECT
    ROW_NUMBER() OVER (PARTITION BY sys_id_value ORDER BY Load_dt DESC) AS row_num,
    CAST( active_value AS bit  ) AS active_value ,
    CAST( type_value AS varchar ( 200 )  ) AS type_value ,
    {{ convert_timezone('sys_created_on_value') }} AS sys_created_on_value ,
    CAST( email_value AS varchar ( 200 )  ) AS email_value ,
    CAST( description_value AS varchar ( 2000 )  ) AS description_value ,
    CAST( sys_updated_by_value AS varchar ( 50 )  ) AS sys_updated_by_value ,
    CAST( sys_id_value AS varchar ( 50 )  ) AS sys_id_value ,
    CAST( include_members_value AS bit  ) AS include_members_value ,
    CAST( manager_value AS varchar ( 50 )  ) AS manager_value ,
    CAST( exclude_manager_value AS bit  ) AS exclude_manager_value ,
    CAST( sys_mod_count_value AS int  ) AS sys_mod_count_value ,
    CAST( default_assignee_value AS varchar ( 30 )  ) AS default_assignee_value ,
    CAST( sys_created_by_value AS varchar ( 50 )  ) AS sys_created_by_value ,
    CAST( name_value AS varchar ( 200 )  ) AS name_value ,
    {{ convert_timezone('sys_updated_on_value') }} AS sys_updated_on_value ,
    CAST( sys_tags_value AS varchar ( 30 )  ) AS sys_tags_value ,
    CAST( roles_value AS varchar ( 100 )  ) AS roles_value ,
    CAST( cost_center_value AS varchar ( 30 )  ) AS cost_center_value ,
    CAST( parent_value AS varchar ( 50 )  ) AS parent_value ,
    CAST( source_value AS varchar ( 30 )  ) AS source_value ,
    CAST( points_value AS float  ) AS points_value ,
    CAST( u_home_dashboard_value AS varchar ( 50 )  ) AS u_home_dashboard_value ,
    CAST( vendors_value AS varchar ( 200 )  ) AS vendors_value ,
    CAST( average_daily_fte_value AS varchar ( 100 )  ) AS average_daily_fte_value ,
    CAST( hourly_rate_value AS varchar ( 50 )  ) AS hourly_rate_value ,
    Source_File ,
    {{ convert_timezone('Load_dt') }} AS Load_dt
  FROM
    {{ source('staging','servicenow_actual_sys_user_group_lnd') }}
)AS Subquery
WHERE row_num = 1;
{% endsnapshot %}