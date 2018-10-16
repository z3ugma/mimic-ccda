DROP TABLE IF EXISTS fhir.PatientMappingTable;

CREATE TABLE fhir.PatientMappingTable (
    SUBJECT_ID int NOT NULL UNIQUE,
    PATIENT BINARY(16) NOT NULL UNIQUE
)
;

INSERT INTO fhir.PatientMappingTable
(
    SUBJECT_ID,
    PATIENT
)
WITH 
row_to_insert as 
(
    select distinct SUBJECT_ID as SUBJECT_ID
    from mimic.PATIENT
)
SELECT 
    SUBJECT_ID,
    unhex(replace(uuid(),'-','')) as PATIENT
FROM row_to_insert
;


DROP TABLE IF EXISTS fhir.EncounterMappingTable;

CREATE TABLE fhir.EncounterMappingTable (
    HADM_ID int(5) NOT NULL UNIQUE,
    ENCOUNTER BINARY(16) NOT NULL UNIQUE
)
;

INSERT INTO fhir.EncounterMappingTable
(
    HADM_ID,
    ENCOUNTER
)
WITH 
row_to_insert as 
(
    select distinct HADM_ID as HADM_ID
    from mimic.ADMISSIONS
)
SELECT 
    HADM_ID,
    unhex(replace(uuid(),'-','')) as ENCOUNTER
FROM row_to_insert;



DROP TABLE IF EXISTS fhir.OrganizationMappingTable;

CREATE TABLE fhir.OrganizationMappingTable (
    CGID int NOT NULL UNIQUE,
    ORGANIZATION BINARY(16) NOT NULL UNIQUE
)
;

INSERT INTO fhir.OrganizationMappingTable
(
    CGID,
    ORGANIZATION
)
WITH 
row_to_insert as 
(
    select distinct CGID as CGID
    from mimic.CAREGIVERS
)
SELECT 
    CGID,
    unhex(replace(uuid(),'-','')) as ORGANIZATION
FROM row_to_insert;

DROP TABLE IF EXISTS fhir.CodeMappingTable;


CREATE TABLE fhir.CodeMappingTable (
    CATEGORY int(1) NULL,
    SOURCE varchar(10) NOT NULL,
    STANDARD varchar(100) NOT NULL
)
;
