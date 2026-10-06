create database mobile;
use mobile;

#  show all table data 
select * from user;

# how many unique users are there
select count(distinct(user_id))as unique_user from user;

# how many total sessions are there 
select count(distinct(session_id)) from user;

# how many total records/events are there
select  count(*) as total_events from user;

# which event type occurs most frequently
select event_type,count(*) as event_occurs from user
group by event_type
order by event_occurs desc;

# which app featured used most
select event_target,count(*) as usage_count from user
group by event_target
order by usage_count desc
limit 10;

# which device os is most commonly used
select device_os ,count(*) as usage_count
from user
group by device_os
order by usage_count desc
limit 1;

# which network type is most commonly used
select network_type,count(*) as usage_count from user
group by network_type
order by usage_count desc;

# what is the average session duration
 select avg(session_duration_sec) from user;
 
# what is the average session duration for subscribed vs non-subscribed users
select is_subscribed,avg(session_duration_sec) from user
group by is_subscribed;
 
# which app version has the highest number of users
select app_version,count(distinct(user_id)) as total_users from user
group by app_version
order by total_users desc;

# Does push notification status affect session duration
select push_enabled,avg(session_duration_sec) from user
group by push_enabled;

# which countries have the higest number of users
select location_country,count(distinct(user_id)) from user
group by location_country
order by count(user_id) desc
limit 10;
       
# which cities have the higest number of users
select location_city,count(distinct(user_id)) from user
group by location_city
order by count(user_id) desc
limit 20;

# what is the average battery level by device os
select device_os,avg(battery_level) from user
group by device_os
order by avg(battery_level) desc;

# what is the average memory usage by device os
select device_os,avg(memory_usage_mb) from user
group by device_os
order by avg(memory_usage_mb) desc;

# which device models have the higest number of users
select device_model,count(distinct(user_id)) from user
group by device_model
order by count(user_id) desc
limit 10;

# what is the average session duration by network type 
select network_type,avg(session_duration_sec0) from user
group by network_type;

#  how many subscribed and non-subscribed users are there
select is_subscribed,count(distinct user_id) from user
group by is_subscribed;

# which feature are most used by subscribed users
select event_target,count(*) as usage_count from user 
where is_subscribed = 'true'
group by event_target
order by usage_count desc
limit 10;

# which feature are most used by non-subscribed users
select event_target,count(*) as usage_count from user 
where is_subscribed = 'false'
group by event_target
order by usage_count desc
limit 10;

# which country has the highest average session duration
select location_country,avg(session_duration_sec) from user
group by location_country
order by avg(session_duration_sec) desc
limit 10;

# which app version has the higest average session duration
select app_version,avg(session_duration_sec) from user
group by app_version
order by avg(session_duration_sec) desc
limit 10;

#find users who have used more than 5 different features
select user_id,count(distinct event_target) from user
group by user_id
having count(distinct (event_target))>5
order by count(event_target)desc;

# find users having more than 3 sessions
select user_id,count( distinct session_id) from user
group by user_id
having count(distinct session_id)>3
order by count(session_id) desc ;

# find the top 10 users by total session duration
select user_id,sum(session_duration_sec) from user
group by user_id
order by sum(session_duration_sec) desc
limit 10;

# find the most active users based on event count
select user_id ,count(*) as event_count from user
group by user_id
order by event_count desc
limit 10;

# compare average session duration betweeen push-enabled and push-disabled users by subscription status
select is_subscribed,push_enabled,avg(session_duration_sec) from user
group by is_subscribed,push_enabled
order by is_subscribed,push_enabled desc;

# find top 5 countries by number of sessions
select location_country ,count(session_duration_sec) from user
group by location_country
order by count(session_duration_sec) desc 
limit 5; 

# find the top 10 features within each subscription status
select is_subscribed, event_target,count(*) as usage_count from user
group by is_subscribed,event_target
order by usage_count,is_subscribed desc
limit 10;

# which device os has the highest average session duration

select device_os,avg(session_duration_sec)as average_session from user
group by device_os
order by average_session desc
limit 1;