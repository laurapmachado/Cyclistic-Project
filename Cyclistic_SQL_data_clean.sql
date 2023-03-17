--Unite all month tables into one year table

SELECT * INTO trips_2022
FROM (
	SELECT * FROM tripdata_2022_01
	UNION 
	SELECT * FROM tripdata_2022_02
	UNION 
	SELECT * FROM tripdata_2022_03
	UNION 
	SELECT * FROM tripdata_2022_04
	UNION 
	SELECT * FROM tripdata_2022_05
	UNION 
	SELECT * FROM tripdata_2022_06
	UNION 
	SELECT * FROM tripdata_2022_07
	UNION 
	SELECT * FROM tripdata_2022_08
	UNION 
	SELECT * FROM tripdata_2022_09
	UNION 
	SELECT * FROM tripdata_2022_10
	UNION 
	SELECT * FROM tripdata_2022_11
	UNION 
	SELECT * FROM tripdata_2022_12 )a


--check for data types

SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
     TABLE_NAME   = 'tripdata_2022_09'

--change data types

ALTER TABLE tripdata_2022_04
ALTER COLUMN start_station_id nvarchar(4000);

ALTER TABLE tripdata_2022_07
ALTER COLUMN start_station_id nvarchar(4000);

ALTER TABLE tripdata_2022_10
ALTER COLUMN start_station_id nvarchar(4000);

ALTER TABLE tripdata_2022_11
ALTER COLUMN start_station_id nvarchar(4000);

ALTER TABLE tripdata_2022_08
ALTER COLUMN end_station_id nvarchar(4000);

ALTER TABLE tripdata_2022_09
ALTER COLUMN end_station_id nvarchar(4000);

ALTER TABLE tripdata_2022_11
ALTER COLUMN end_station_id nvarchar(4000);

ALTER TABLE tripdata_2022_12
ALTER COLUMN end_station_id nvarchar(4000);


--order table by start date

SELECT * FROM trips_2022
ORDER BY started_at

--check for inconsistencies in tha data

SELECT DISTINCT rideable_type
FROM trips_2022

SELECT DISTINCT member_casual
FROM trips_2022



