{% macro incremented_filter(ref_tables) %}
    where id is not null
    {% if is_incremental() %}
     and _loaded_ts_utc > (select max(_loaded_ts_utc) from {{this}} )
    {% endif %}

{% endmacro %}