{% macro limit_data_in_dev(column_name, number_of_days_data=2) -%}

    {% if  target.name == 'dev' -%}

        where {{ column_name }} >= dateadd(DAY, - {{ number_of_days_data }}, current_timestamp )

    {%- endif %}

{%- endmacro %}