-- The purpose of this layer is to denormalize the data into dimensions and facts. 
-- It is capable of producing fully denormalized wide tables. 
-- The star schema is a common feature in most engagements. 
-- Use cases and visualization tooling to drive wide tables. 
-- For this instance, we developed a denormalized table to analyze hosts and their listings, including beds and prices.


select h.id,
l.id as listing_id,
l.beds as beds,
l.price as price

FROM

{{ ref('host_listing_integrate') }} as h 
inner join
{{ ref('listing_integrate') }} as l
on
h.id = l.host_id