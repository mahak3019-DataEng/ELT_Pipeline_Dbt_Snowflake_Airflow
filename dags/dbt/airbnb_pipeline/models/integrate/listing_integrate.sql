-- What is Incremental materialization?
-- Incremental materialization is a type of materialization strategy 
-- where dbt builds upon existing data rather than recreating it entirely each time the model runs.

-- point 2: It involves updating or appending new data to an existing dataset 
-- based on changes in the source data or incremental logic defined in your dbt model.


SELECT
id,
listing_url as url,
name,
neighborhood_overview,
picture_url,
neighbourhood_cleansed,
property_type,
room_type,
accommodates,
bathrooms,
beds,
price,
minimum_nights,
maximum_nights,
host_id,
_loaded_ts_utc
from 
{{ ref('listing_normalize_airbnb')}}
{{ incremented_filter('listing_normalize_airbnb')}}
