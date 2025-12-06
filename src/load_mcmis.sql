SELECT pid,
       state,
       wait_event_type,
       wait_event,
       now() - query_start AS runtime,
       query
FROM pg_stat_activity
WHERE datname = 'fmcsa_mcmis'
  AND state <> 'idle'
ORDER BY query_start;


-- Turn on timing so you can see how long each load takes
\timing on

-- Optional: echo which DB you're on
\conninfo

-- ====================================================================================
-- 1) LOAD CRASH FILE
-- ====================================================================================

\echo '===================================================================='
\echo 'Loading Crash File into staging.crash_file_raw ...'
\echo '===================================================================='

-- Clear the table first (optional but recommended for repeatable loads)
TRUNCATE TABLE staging.crash_file_raw;

-- Adjust the path below to your actual Crash_File.csv location
COPY staging.crash_file_raw
FROM 'C:/path/to/Crash_File.csv'
WITH (
    FORMAT csv,
    HEADER true
);

\echo 'Rows loaded into staging.crash_file_raw:'
SELECT COUNT(*) AS rows_loaded FROM staging.crash_file_raw;


-- ====================================================================================
-- 2) LOAD MOTOR CARRIER CENSUS FILE
-- ====================================================================================

\echo '===================================================================='
\echo 'Loading Motor Carrier Census File into staging.motor_carrier_census_raw ...'
\echo '===================================================================='

TRUNCATE TABLE staging.motor_carrier_census_raw;

-- Adjust the path below to your Motor_Carrier_Census_File.csv location
COPY staging.motor_carrier_census_raw
FROM 'C:/path/to/Motor_Carrier_Census_File.csv'
WITH (
    FORMAT csv,
    HEADER true
);

\echo 'Rows loaded into staging.motor_carrier_census_raw:'
SELECT COUNT(*) AS rows_loaded FROM staging.motor_carrier_census_raw;


-- ====================================================================================
-- 3) LOAD VEHICLE INSPECTION FILE
-- ====================================================================================

\echo '===================================================================='
\echo 'Loading Vehicle Inspection File into staging.vehicle_inspection_file_raw ...'
\echo '===================================================================='

TRUNCATE TABLE staging.vehicle_inspection_file_raw;

-- Adjust the path below to your Vehicle_Inspection_File.csv location
COPY staging.vehicle_inspection_file_raw
FROM 'C:/path/to/Vehicle_Inspection_File.csv'
WITH (
    FORMAT csv,
    HEADER true
);

\echo 'Rows loaded into staging.vehicle_inspection_file_raw:'
SELECT COUNT(*) AS rows_loaded FROM staging.vehicle_inspection_file_raw;


-- ====================================================================================
-- 4) SUMMARY
-- ====================================================================================

\echo '===================================================================='
\echo 'Summary row counts after load:'
\echo '===================================================================='

SELECT 'staging.crash_file_raw'               AS table_name, COUNT(*) AS rows_loaded FROM staging.crash_file_raw
UNION ALL
SELECT 'staging.motor_carrier_census_raw'     AS table_name, COUNT(*) AS rows_loaded FROM staging.motor_carrier_census_raw
UNION ALL
SELECT 'staging.vehicle_inspection_file_raw'  AS table_name, COUNT(*) AS rows_loaded FROM staging.vehicle_inspection_file_raw;

\echo 'Done.'
