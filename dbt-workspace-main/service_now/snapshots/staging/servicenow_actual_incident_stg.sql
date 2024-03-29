{% snapshot servicenow_actual_incident_stg %}
    {{
        config(
          target_schema='staging',
          strategy='check',
          unique_key='sys_id_value',
          check_cols=['resolved_by_value','approval_set_value','problem_id_value','work_end_value','delivery_task_value','delivery_plan_value','short_description_value','reassignment_count_value','caused_by_value','time_worked_value','made_sla_value','number_value','sys_class_name_value','watch_list_value','additional_assignee_list_value','category_value','severity_value','due_date_value','sys_tags_value','upon_approval_value','follow_up_value','company_value','active_value','comments_value','sys_domain_path_value','calendar_duration_value','sys_created_on_value','approval_history_value','work_notes_value','rfc_value','sys_mod_count_value','escalation_value','assigned_to_value','order_value','sys_updated_on_value','caller_id_value','assignment_group_value','closed_at_value','approval_value','sys_created_by_value','user_input_value','description_value','upon_reject_value','impact_value','work_notes_list_value','sys_updated_by_value','child_incidents_value','work_start_value','cmdb_ci_value','correlation_display_value','location_value','parent_incident_value','business_duration_value','opened_by_value','incident_state_value','knowledge_value','priority_value','expected_start_value','parent_value','comments_and_work_notes_value','contact_type_value','subcategory_value','sla_due_value','sys_domain_value','calendar_stc_value','urgency_value','group_list_value','correlation_id_value','notify_value','closed_by_value','activity_due_value','close_notes_value','close_code_value','opened_at_value','business_stc_value','state_value','resolved_at_value','reopen_count_value','business_service_value','promoted_by_value','origin_table_value','skills_value','proposed_by_value','lessons_learned_value','u_drill_value','contract_value','u_vendor_value','rejection_goto_value','wf_activity_value','major_incident_state_value','universal_request_value','trigger_rule_value','service_offering_value','reopened_by_value','variables_value','u_vendor_reference_value','u_record_url_value','u_event_type_value','u_dcs_alarm_value','timeline_value','promoted_on_value','hold_reason_value','task_effective_number_value','proposed_on_value','actions_taken_value','route_reason_value','u_scenario_value','business_impact_value','reopened_time_value','cause_value','origin_id_value','u_affected_users_value','overview_value','u_affected_customers_value','u_caused_by_change_value'],
          post_hook =[ delete_processed('servicenow_actual_incident_lnd')],
          tags=['servicenow']
        )
    }}
SELECT *
FROM (
    SELECT
    ROW_NUMBER() OVER (PARTITION BY sys_id_value ORDER BY Load_dt DESC) AS row_num,
    CAST( resolved_by_value AS varchar ( 50 )  ) AS resolved_by_value ,
    {{ convert_timezone('approval_set_value') }} AS approval_set_value ,
    CAST( problem_id_value AS varchar ( 50 )  ) AS problem_id_value ,
    {{ convert_timezone('work_end_value') }} AS work_end_value ,
    CAST( delivery_task_value AS varchar ( 50 )  ) AS delivery_task_value ,
    CAST( delivery_plan_value AS varchar ( 50 )  ) AS delivery_plan_value ,
    CAST( short_description_value AS varchar ( 500 )  ) AS short_description_value ,
    CAST( reassignment_count_value AS int  ) AS reassignment_count_value ,
    CAST( caused_by_value AS varchar ( 100 )  ) AS caused_by_value ,
    CAST( time_worked_value AS varchar ( 30 )  ) AS time_worked_value ,
    CAST( made_sla_value AS bit  ) AS made_sla_value ,
    CAST( number_value AS varchar ( 30 )  ) AS number_value ,
    CAST( sys_class_name_value AS varchar ( 30 )  ) AS sys_class_name_value ,
    CAST( watch_list_value AS varchar ( 2000 )  ) AS watch_list_value ,
    CAST( additional_assignee_list_value AS varchar ( 50 )  ) AS additional_assignee_list_value ,
    CAST( category_value AS varchar ( 50 )  ) AS category_value ,
    CAST( severity_value AS int  ) AS severity_value ,
    {{ convert_timezone('due_date_value') }} AS due_date_value ,
    CAST( sys_tags_value AS varchar ( 30 )  ) AS sys_tags_value ,
    CAST( upon_approval_value AS varchar ( 50 )  ) AS upon_approval_value ,
    {{ convert_timezone('follow_up_value') }} AS follow_up_value ,
    CAST( company_value AS varchar ( 50 )  ) AS company_value ,
    CAST( active_value AS bit  ) AS active_value ,
    CAST( comments_value AS varchar ( 30 )  ) AS comments_value ,
    CAST( sys_domain_path_value AS varchar ( 10 )  ) AS sys_domain_path_value ,
    {{ convert_timezone('calendar_duration_value') }} AS calendar_duration_value ,
    {{ convert_timezone('sys_created_on_value') }} AS sys_created_on_value ,
    CAST( approval_history_value AS varchar ( 30 )  ) AS approval_history_value ,
    CAST( work_notes_value AS varchar ( 30 )  ) AS work_notes_value ,
    CAST( rfc_value AS varchar ( 50 )  ) AS rfc_value ,
    CAST( sys_mod_count_value AS int  ) AS sys_mod_count_value ,
    CAST( escalation_value AS int  ) AS escalation_value ,
    CAST( assigned_to_value AS varchar ( 50 )  ) AS assigned_to_value ,
    CAST( order_value AS float  ) AS order_value ,
    {{ convert_timezone('sys_updated_on_valuee') }} AS sys_updated_on_value ,
    CAST( caller_id_value AS varchar ( 50 )  ) AS caller_id_value ,
    CAST( assignment_group_value AS varchar ( 50 )  ) AS assignment_group_value ,
    {{ convert_timezone('closed_at_value') }} AS closed_at_value ,
    CAST( approval_value AS varchar ( 50 )  ) AS approval_value ,
    CAST( sys_created_by_value AS varchar ( 50 )  ) AS sys_created_by_value ,
    CAST( user_input_value AS varchar ( 100 )  ) AS user_input_value ,
    CAST( description_value AS varchar ( MAX )  ) AS description_value ,
    CAST( upon_reject_value AS varchar ( 30 )  ) AS upon_reject_value ,
    CAST( impact_value AS int  ) AS impact_value ,
    CAST( work_notes_list_value AS varchar ( 2000 )  ) AS work_notes_list_value ,
    CAST( sys_updated_by_value AS varchar ( 50 )  ) AS sys_updated_by_value ,
    CAST( child_incidents_value AS int  ) AS child_incidents_value ,
    {{ convert_timezone('work_start_value') }} AS work_start_value ,
    CAST( cmdb_ci_value AS varchar ( 50 )  ) AS cmdb_ci_value ,
    CAST( sys_id_value AS varchar ( 50 )  ) AS sys_id_value ,
    CAST( correlation_display_value AS varchar ( 30 )  ) AS correlation_display_value ,
    CAST( location_value AS varchar ( 50 )  ) AS location_value ,
    CAST( parent_incident_value AS varchar ( 50 )  ) AS parent_incident_value ,
    {{ convert_timezone('business_duration_value') }} AS business_duration_value ,
    CAST( opened_by_value AS varchar ( 50 )  ) AS opened_by_value ,
    CAST( incident_state_value AS int  ) AS incident_state_value ,
    CAST( knowledge_value AS bit  ) AS knowledge_value ,
    CAST( priority_value AS int  ) AS priority_value ,
    {{ convert_timezone('expected_start_value') }} AS expected_start_value ,
    CAST( parent_value AS varchar ( 50 )  ) AS parent_value ,
    CAST( comments_and_work_notes_value AS varchar ( 30 )  ) AS comments_and_work_notes_value ,
    CAST( contact_type_value AS varchar ( 50 )  ) AS contact_type_value ,
    CAST( subcategory_value AS varchar ( 30 )  ) AS subcategory_value ,
    {{ convert_timezone('sla_due_value') }} AS sla_due_value ,
    CAST( sys_domain_value AS varchar ( 30 )  ) AS sys_domain_value ,
    CAST( calendar_stc_value AS float  ) AS calendar_stc_value ,
    CAST( urgency_value AS int  ) AS urgency_value ,
    CAST( group_list_value AS varchar ( 30 )  ) AS group_list_value ,
    CAST( correlation_id_value AS varchar ( 30 )  ) AS correlation_id_value ,
    CAST( notify_value AS int  ) AS notify_value ,
    CAST( closed_by_value AS varchar ( 50 )  ) AS closed_by_value ,
    {{ convert_timezone('activity_due_value') }} AS activity_due_value ,
    CAST( close_notes_value AS varchar ( MAX )  ) AS close_notes_value ,
    CAST( close_code_value AS varchar ( 50 )  ) AS close_code_value ,
    {{ convert_timezone('opened_at_value') }} AS opened_at_value ,
    CAST( business_stc_value AS float  ) AS business_stc_value ,
    CAST( state_value AS int  ) AS state_value ,
    {{ convert_timezone('resolved_at_value') }} AS resolved_at_value ,
    CAST( reopen_count_value AS int  ) AS reopen_count_value ,
    CAST( business_service_value AS varchar ( 50 )  ) AS business_service_value ,
    CAST( promoted_by_value AS varchar ( 30 )  ) AS promoted_by_value ,
    CAST( origin_table_value AS varchar ( 30 )  ) AS origin_table_value ,
    CAST( skills_value AS varchar ( 30 )  ) AS skills_value ,
    CAST( proposed_by_value AS varchar ( 50 )  ) AS proposed_by_value ,
    CAST( lessons_learned_value AS varchar ( 30 )  ) AS lessons_learned_value ,
    CAST( u_drill_value AS bit  ) AS u_drill_value ,
    CAST( contract_value AS varchar ( 30 )  ) AS contract_value ,
    CAST( u_vendor_value AS varchar ( 50 )  ) AS u_vendor_value ,
    CAST( rejection_goto_value AS varchar ( 30 )  ) AS rejection_goto_value ,
    CAST( wf_activity_value AS varchar ( 30 )  ) AS wf_activity_value ,
    CAST( major_incident_state_value AS varchar ( 50 )  ) AS major_incident_state_value ,
    CAST( universal_request_value AS varchar ( 30 )  ) AS universal_request_value ,
    CAST( trigger_rule_value AS varchar ( 30 )  ) AS trigger_rule_value ,
    CAST( service_offering_value AS varchar ( 30 )  ) AS service_offering_value ,
    CAST( reopened_by_value AS varchar ( 50 )  ) AS reopened_by_value ,
    CAST( variables_value AS varchar ( 30 )  ) AS variables_value ,
    CAST( u_vendor_reference_value AS varchar ( 50 )  ) AS u_vendor_reference_value ,
    CAST( u_record_url_value AS varchar ( 500 )  ) AS u_record_url_value ,
    CAST( u_event_type_value AS varchar ( 100 )  ) AS u_event_type_value ,
    CAST( u_dcs_alarm_value AS varchar ( 30 )  ) AS u_dcs_alarm_value ,
    CAST( timeline_value AS varchar ( 30 )  ) AS timeline_value ,
    {{ convert_timezone('promoted_on_value') }} AS promoted_on_value ,
    CAST( hold_reason_value AS float  ) AS hold_reason_value ,
    CAST( task_effective_number_value AS varchar ( 30 )  ) AS task_effective_number_value ,
    {{ convert_timezone('proposed_on_value') }} AS proposed_on_value ,
    CAST( actions_taken_value AS varchar ( 30 )  ) AS actions_taken_value ,
    CAST( route_reason_value AS float  ) AS route_reason_value ,
    CAST( u_scenario_value AS varchar ( 1000 )  ) AS u_scenario_value ,
    CAST( business_impact_value AS varchar ( 30 )  ) AS business_impact_value ,
    {{ convert_timezone('reopened_time_value') }} AS reopened_time_value ,
    CAST( cause_value AS varchar ( 30 )  ) AS cause_value ,
    CAST( origin_id_value AS varchar ( 50 )  ) AS origin_id_value ,
    CAST( u_affected_users_value AS varchar ( 10 )  ) AS u_affected_users_value ,
    CAST( overview_value AS varchar ( 30 )  ) AS overview_value ,
    CAST( u_affected_customers_value AS varchar ( 1000 )  ) AS u_affected_customers_value ,
    CAST( u_caused_by_change_value AS bit  ) AS u_caused_by_change_value ,
    Source_File ,
    {{ convert_timezone('Load_dt') }} AS Load_dt
  FROM
    {{ source('staging','servicenow_actual_incident_lnd') }}
)AS Subquery
WHERE row_num = 1;
{% endsnapshot %}