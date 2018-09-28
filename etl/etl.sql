--BEGIN;
\set ON_ERROR_STOP true
\timing

TRUNCATE TABLE  :FHIR_SCHEMA.Bundle CASCADE;
TRUNCATE TABLE  :FHIR_SCHEMA.Patient CASCADE;
TRUNCATE TABLE  :FHIR_SCHEMA.Encounter CASCADE;
TRUNCATE TABLE  :FHIR_SCHEMA.Condition CASCADE;
TRUNCATE TABLE  :FHIR_SCHEMA.Observation CASCADE;
TRUNCATE TABLE  :FHIR_SCHEMA.DiagnosticReport CASCADE;
TRUNCATE TABLE  :FHIR_SCHEMA.Procedure CASCADE;
TRUNCATE TABLE  :FHIR_SCHEMA.ImagingStudy CASCADE;
TRUNCATE TABLE  :FHIR_SCHEMA.Immunization CASCADE;
TRUNCATE TABLE  :FHIR_SCHEMA.CarePlan CASCADE;
TRUNCATE TABLE  :FHIR_SCHEMA.MedicationRequest CASCADE;
TRUNCATE TABLE  :FHIR_SCHEMA.Claim CASCADE;
TRUNCATE TABLE  :FHIR_SCHEMA.Organization CASCADE;


\i etl/pg_function.sql
\i etl/FHIRResources/Organization/etl.sql
\i etl/FHIRResources/Bundle/etl.sql
\i etl/FHIRResources/Patient/etl.sql
\i etl/FHIRResources/Encounter/etl.sql
\i etl/FHIRResources/Condition/etl.sql
\i etl/FHIRResources/Observation/etl.sql
\i etl/FHIRResources/DiagnosticReport/etl.sql
\i etl/FHIRResources/Procedure/etl.sql
\i etl/FHIRResources/ImagingStudy/etl.sql
\i etl/FHIRResources/Immunization/etl.sql
\i etl/FHIRResources/CarePlan/etl.sql
\i etl/FHIRResources/MedicationRequest/etl.sql
\i etl/FHIRResources/Claim/etl.sql
--ROLLBACK;
--COMMIT;
