select 
id,
listing_url,
date(last_scraped) as last_scraped,
name,
neighborhood_overview,
picture_url,
host_id,
host_url,
host_name,
date(host_since) as host_since,
host_location,
host_response_time,
case
    when host_response_rate = 'N/A' then NULL
    else cast(trim(host_response_rate,'%') as INT) end as host_response_rate,
case
    when host_acceptance_rate = 'N/A' then NULL
    else cast(trim(host_acceptance_rate,'%') as INT) end as host_acceptance_rate,
case
    when host_is_superhost = 'f' then false
    else true end::boolean as host_is_superhost,
host_neighbourhood,
host_listings_count,
host_total_listings_count,
case
    when host_identity_verified = 'f' then false
    else true end::boolean as host_identity_verified,
neighbourhood_cleansed,
property_type,
room_type,
accommodates,
bathrooms_text,
beds,
case
    when price = 'null' then NULL
    else cast(replace(trim(price,'$'),',','') as float) end as price,
minimum_nights,
maximum_nights
FROM
{{ source('airbnb','listings') }}
