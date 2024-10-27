-- selecting the only data which will be useful while
-- applying business logic. Breaking bigger tables into small tables.

select id,
listing_url,
name,
neighborhood_overview,
picture_url,
host_id,
host_url,
host_name,
host_since,
host_location,
host_response_time,
host_response_rate,
host_acceptance_rate,
host_is_superhost,
host_neighbourhood,
host_listings_count,
host_total_listings_count,
host_identity_verified,
neighbourhood_cleansed,
property_type,
room_type,
accommodates,
bathrooms_text as bathrooms,
beds,
price,
minimum_nights,
maximum_nights,
last_scraped as _loaded_ts_utc
from 
{{
    ref('listing_clean_airbnb')
}}