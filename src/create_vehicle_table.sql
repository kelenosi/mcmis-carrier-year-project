DROP TABLE IF EXISTS core.dim_vehicle CASCADE;

CREATE TABLE core.dim_vehicle (
    vehicle_id         BIGSERIAL PRIMARY KEY,
    vin_raw            VARCHAR(50) NOT NULL,   -- original from source
    vin_clean          VARCHAR(17) NOT NULL,   -- cleaned (17-char, uppercase)
    vin_valid          BOOLEAN NOT NULL DEFAULT false,

    -- Common decoded attributes from NHTSA VPIC
    model_year         VARCHAR(10),
    make               VARCHAR(100),
    model              VARCHAR(100),
    body_class         VARCHAR(100),
    vehicle_type       VARCHAR(100),
    gvwr               VARCHAR(100),
    fuel_type          VARCHAR(100),
    engine_cylinders   VARCHAR(50),
    engine_displacement VARCHAR(50),
    brake_system       VARCHAR(100),
    drive_type         VARCHAR(50),
    manufacturer       VARCHAR(100),

    -- Metadata
    decode_source      VARCHAR(50) DEFAULT 'NHTSA_VPIC',
    decode_success     BOOLEAN NOT NULL DEFAULT false,
    decode_error_msg   TEXT,
    decoded_at         TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),

    CONSTRAINT dim_vehicle_vin_clean_uk UNIQUE (vin_clean)
);
