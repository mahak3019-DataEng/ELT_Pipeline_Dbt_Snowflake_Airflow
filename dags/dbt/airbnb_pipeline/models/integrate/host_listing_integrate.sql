SELECT
host_id  as id,
host_url as url,
host_name as name,
host_since as date_of_registeration,
host_response_time as response_time,
host_response_rate as response_rate,
host_acceptance_rate as acceptance_rate,
host_is_superhost as is_superhost,
host_neighbourhood as neighbourhood,
host_listings_count as listings_count,
host_total_listings_count as total_listings_count,
host_identity_verified as identity_verified,
_loaded_ts_utc
from 
{{ ref('listing_normalize_airbnb') }}
{{ incremented_filter('listing_normalize_airbnb') }}