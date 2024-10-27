select 
listing_id,
id,
DATE(date) as date,
reviewer_id,
reviewer_name,
comments
FROM
{{ source('airbnb','reviews') }}