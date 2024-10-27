SELECT
id,
avg(beds)::int as avg_beds,
avg(price) as avg_price
FROM

{{ ref('host_listing_denormalize') }}

group by id