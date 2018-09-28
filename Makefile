MIMIC_SCHEMA=mimiciii
FHIR_SCHEMA=fhir
MIMIC="host=localhost dbname=mimic user=postgres options=--search_path=$(MIMIC_SCHEMA)"
FHIR="host=localhost dbname=mimic user=postgres options=--search_path=$(FHIR_SCHEMA)"

runetl: sequence concept load

# buildfhir:

sequence: 
	psql $(MIMIC) --set=FHIR_SCHEMA="$(FHIR_SCHEMA)"  -f mimic/build-mimic/postgres_create_mimic_id.sql

concept:
	python etl/load_table.py $(MIMIC_SCHEMA)

load: 
	psql $(MIMIC) --set=FHIR_SCHEMA="$(FHIR_SCHEMA)" -f etl/etl.sql 

# export:

# purgeresult:

