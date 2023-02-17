-- Merge all the tables of 2018,2019,2020 into one table called hotels --
with hotels as (
select * from hotel_bookings.`2018`
union
select * from hotel_bookings.`2019`
union
select * from hotel_bookings.`2020`)

-- Calculate the revenue per year and hotel type --
select
arrival_date_year,
ï»¿hotel,
ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr),2) as revenue 
from hotels
group by ï»¿hotel,arrival_date_year;

-- Use left joins to aggregate the market segment and meal cost into hotels table --
select * from hotels
left join hotel_bookings.market_segment
on hotels.market_segment = market_segment.market_segment
left join hotel_bookings.meal_cost
on  hotels.meal = meal_cost.meal;
