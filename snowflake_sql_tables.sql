desc database demo;


create or replace storage integration airbnb_project
type = external_stage
storage_provider = 'S3'
enabled= True
storage_aws_role_arn = 'arn:aws:iam::533267281673:role/demo_role'
storage_allowed_locations = ('s3://demo-requests/');

desc integration airbnb_project;


// creating file format
create or replace file format airbnb_file_format
type = 'CSV'
field_delimiter = ','
skip_header = 1
null_if = ('NULL','null')
empty_field_as_null = TRUE
field_optionally_enclosed_by = '"';


//creating stage
create or replace stage airbnb_stage
storage_integration = airbnb_project
file_format = airbnb_file_format
url = 's3://demo-requests/';

list @airbnb_stage;
//creating tables reviews and listings
create or replace table reviews(
listing_id int,
id int,
date varchar(30),
reviewer_id int,
reviewer_name varchar(60),
comments string
);

create or replace table listings(
    id int,
	listing_url string,
	last_scraped varchar(30),
	name string,
	neighborhood_overview string,
	picture_url string,
	host_id int,
	host_url string,
	host_name string,
	host_since varchar(30),
	host_location varchar(90),
	host_response_time varchar(45),
	host_response_rate varchar(30),
	host_acceptance_rate varchar(30),
	host_is_superhost varchar(10),
	host_neighbourhood varchar(70),
	host_listings_count int,
	host_total_listings_count int,
	host_identity_verified varchar(10),
	neighbourhood_cleansed varchar(45),
	property_type varchar(45),
	room_type varchar(30),
	accommodates int, 
	bathrooms_text varchar(45),
	beds int,
	price varchar(20),
	minimum_nights int,
	maximum_nights int
);

//loading data from stage files
copy into demo.demo_schema.reviews
from @demo.demo_schema.airbnb_stage
file_format = (format_name = airbnb_file_format)
files = ('reviews.csv')
on_error = continue;
select * from reviews;


copy into demo.demo_schema.listings
from (select
s.$1,
s.$2,
s.$4,
s.$6,
s.$8,
s.$9,
s.$10,
s.$11,
s.$12,
s.$13,
s.$14,
s.$16,
s.$17,
s.$18,
s.$19,
s.$22,
s.$23,
s.$24,
s.$27,
s.$29,
s.$33,
s.$34,
s.$35,
s.$37,
s.$39,
s.$41,
s.$42,
s.$43 from @demo.demo_schema.airbnb_stage s)
file_format = (format_name = airbnb_file_format)
files = ('listings.csv')
on_error = continue;

select * from listings;




select * from host_report;
