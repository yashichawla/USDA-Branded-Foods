CREATE TABLE IF NOT EXISTS public.branded_food
(
    fdc_id bigint NOT NULL,
    brand_owner text COLLATE pg_catalog."default",
    brand_name text COLLATE pg_catalog."default",
    gtin_upc text COLLATE pg_catalog."default",
    ingredients text COLLATE pg_catalog."default",
    serving_size double precision,
    serving_size_unit text COLLATE pg_catalog."default",
    branded_food_category text COLLATE pg_catalog."default",
    data_source text COLLATE pg_catalog."default",
    modified_date text COLLATE pg_catalog."default",
    available_date text COLLATE pg_catalog."default",
    market_country text COLLATE pg_catalog."default",
    CONSTRAINT branded_food_pkey PRIMARY KEY (fdc_id),
    CONSTRAINT branded_food_fdc_id_fkey FOREIGN KEY (fdc_id)
        REFERENCES public.food (fdc_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

CREATE TABLE IF NOT EXISTS public.food
(
    fdc_id integer NOT NULL,
    data_type text COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    food_category_id integer NOT NULL,
    publication_date text COLLATE pg_catalog."default",
    market_country text COLLATE pg_catalog."default",
    microbe_data text COLLATE pg_catalog."default",
    CONSTRAINT food_pkey PRIMARY KEY (fdc_id)
)

CREATE TABLE IF NOT EXISTS public.food_attribute
(
    id bigint NOT NULL,
    fdc_id bigint,
    food_attribute_type_id bigint,
    name text COLLATE pg_catalog."default",
    value integer,
    CONSTRAINT food_attribute_pkey PRIMARY KEY (id),
    CONSTRAINT food_attribute_fdc_id_fkey FOREIGN KEY (fdc_id)
        REFERENCES public.branded_food (fdc_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT food_attribute_food_attribute_type_id_fkey FOREIGN KEY (food_attribute_type_id)
        REFERENCES public.food_attribute_type (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

CREATE TABLE IF NOT EXISTS public.food_attribute_type
(
    id double precision NOT NULL,
    name text COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    CONSTRAINT food_attribute_type_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.food_nutrient
(
    id integer NOT NULL,
    fdc_id integer,
    nutrient_id integer,
    amount double precision,
    derivation_id double precision,
    CONSTRAINT food_nutrient_pkey PRIMARY KEY (id),
    CONSTRAINT food_nutrient_fdc_id_fkey FOREIGN KEY (fdc_id)
        REFERENCES public.food (fdc_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT food_nutrient_nutrient_id_fkey FOREIGN KEY (nutrient_id)
        REFERENCES public.nutrient (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

CREATE TABLE IF NOT EXISTS public.food_update_log_entry
(
    id integer NOT NULL,
    description text COLLATE pg_catalog."default",
    last_updated date,
    CONSTRAINT food_update_log_entry_pkey PRIMARY KEY (id),
    CONSTRAINT food_update_log_entry_id_fkey FOREIGN KEY (id)
        REFERENCES public.branded_food (fdc_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

CREATE TABLE IF NOT EXISTS public.measure_unit
(
    id integer NOT NULL,
    name text COLLATE pg_catalog."default",
    CONSTRAINT measure_unit_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.microbe
(
    id integer NOT NULL,
    foodid integer,
    method text COLLATE pg_catalog."default",
    microbe_code text COLLATE pg_catalog."default",
    min_value integer,
    uom text COLLATE pg_catalog."default",
    CONSTRAINT microbe_pkey PRIMARY KEY (id),
    CONSTRAINT microbe_foodid_fkey FOREIGN KEY (foodid)
        REFERENCES public.food (fdc_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

CREATE TABLE IF NOT EXISTS public.nutrient
(
    id integer NOT NULL,
    name text COLLATE pg_catalog."default",
    unit_name text COLLATE pg_catalog."default",
    nutrient_nbr double precision,
    nutrient_rank double precision,
    CONSTRAINT nutrient_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.nutrient_incoming_name
(
    id integer NOT NULL,
    name text COLLATE pg_catalog."default",
    nutrient_id integer,
    CONSTRAINT nutrient_incoming_name_pkey PRIMARY KEY (id),
    CONSTRAINT nutrient_incoming_name_nutrient_id_fkey FOREIGN KEY (nutrient_id)
        REFERENCES public.nutrient (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

CREATE TABLE IF NOT EXISTS public.performance_metrics
(
    id integer NOT NULL DEFAULT nextval('performance_metrics_id_seq'::regclass),
    model_name character varying(255) COLLATE pg_catalog."default",
    metric_name character varying(255) COLLATE pg_catalog."default",
    data_count double precision,
    metric_value double precision,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT performance_metrics_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.predictions
(
    id integer NOT NULL DEFAULT nextval('predictions_id_seq'::regclass),
    model_name character varying(255) COLLATE pg_catalog."default",
    input_data jsonb,
    predicted_value text COLLATE pg_catalog."default",
    actual_value text COLLATE pg_catalog."default",
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT predictions_pkey PRIMARY KEY (id)
)
	