--create a new table with calculation of ride length and day of the week

SELECT * INTO PortfolioProject..trips_2022_analysis
FROM(
	SELECT 
		ride_id, 
		rideable_type, 
		DATENAME(dw, started_at) AS day_of_week,
		DATENAME(m, started_at) AS month,
		started_at, ended_at, 
		DATEDIFF(minute, started_at, ended_at) AS ride_length_min,
		member_casual
	FROM PortfolioProject..trips_2022)b



--most popular days of the week for each subscription type

SELECT
	member_casual,
    day_of_week,
    COUNT(*) as cnt
FROM
    PortfolioProject..trips_2022_analysis
GROUP By
	member_casual,
    day_of_week
ORDER BY 
	member_casual,
	cnt desc

--most popular months for each subscription type

SELECT
	member_casual,
    month,
    COUNT(*) as cnt
FROM
    PortfolioProject..trips_2022_analysis
GROUP By
	member_casual,
    month
ORDER BY
	member_casual,
	cnt desc

--calculate average ride length by subscription type

SELECT 
	member_casual, 
	AVG(ride_length_min) AS avg_ride_length_min
FROM
	PortfolioProject..trips_2022_analysis
GROUP BY
	member_casual

--calculate average ride length by subscription type and month

SELECT 
	member_casual, 
	month,
	AVG(ride_length_min) AS avg_ride_length_min
FROM
	PortfolioProject..trips_2022_analysis
GROUP BY
	member_casual,
	month
ORDER BY
	member_casual,
	avg_ride_length_min desc

--calculate average ride length by subscription type and day of the week

SELECT 
	member_casual, 
	day_of_week,
	AVG(ride_length_min) AS avg_ride_length_min
FROM
	PortfolioProject..trips_2022_analysis
GROUP BY
	member_casual,
	day_of_week
ORDER BY
	member_casual,
	avg_ride_length_min desc


