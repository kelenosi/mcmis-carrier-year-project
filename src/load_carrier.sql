

-- Turn on timing so you can see how long each load takes
\timing on

-- Optional: echo which DB you're on
\conninfo


-- ====================================================================================
-- 2) LOAD MOTOR CARRIER CENSUS FILE
-- ====================================================================================

\echo '===================================================================='
\echo 'Loading Motor Carrier Census File into staging.motor_carrier_census_raw ...'
\echo '===================================================================='

TRUNCATE TABLE staging.motor_carrier_census_raw;

-- Adjust the path below to your Motor_Carrier_Census_File.csv location
COPY staging.motor_carrier_census_raw
FROM 'C:/path/to/Motor_Carrier_Census_File.csv'C:\Users\k_1db\OneDrive\Documents\ComputerScience\Data_Mining\wk13_proj_presentations\data\mcmis\Company_Census_File.csv
WITH (
    FORMAT csv,
    HEADER true
);

\echo 'Rows loaded into staging.motor_carrier_census_raw:'
SELECT COUNT(*) AS rows_loaded FROM staging.motor_carrier_census_raw;


