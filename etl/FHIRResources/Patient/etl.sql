INSERT INTO fhir.patients 
(
    ID,
    BIRTHDATE,
    DEATHDATE,
    SSN,
    DRIVERS,
    PASSPORT,
    PREFIX,
    FIRST,
    LAST,
    SUFFIX,
    MAIDEN,
    MARITAL,
    RACE,
    ETHNICITY,
    GENDER,
    BIRTHPLACE,
    ADDRESS,
    CITY,
    STATE,
    ZIP
)
WITH
patients AS (
    SELECT
        ROW_ID
        , SUBJECT_ID
        , GENDER
        , DOB
        , DOD
        , DOD_HOSP
        , DOD_SSN
        -- , EXPIRE_FLAG
    FROM mimic.PATIENTS
),
admissions as (
    SELECT
        distinct SUBJECT_ID
        , ADMITTIME
        , ETHNICITY
    FROM mimic.ADMISSIONS
)
patient_id_mapper AS (
    SELECT
        SUBJECT_ID,
        PATIENT
    FROM fhir.PatientMappingTable
),
row_to_insert AS (
    SELECT 
        PATIENT as ID,
        DOB as BIRTHDATE,
        DOD as DEATHDATE,
        '00000000' as SSN,
        null as DRIVERS,
        null as PASSPORT,
        null as PREFIX,
        'First' as FIRST,
        'Last' as LAST,
        null as SUFFIX,
        null as MAIDEN,
        null as MARITAL,
        '0000-0' as RACE, -- Asian
        '0000-0' as ETHNICITY, -- Not Hispanic or Latino
        GENDER,
        '' as BIRTHPLACE,
        '' as ADDRESS,
        '' as CITY,
        '' as STATE,
        null as ZIP
    FROM patients
    LEFT JOIN admissions USING (SUBJECT_ID)
    LEFT JOIN patient_id_mapper USING (SUBJECT_ID)
)
SELECT 
    distinct ID,
    BIRTHDATE,
    DEATHDATE,
    SSN,
    DRIVERS,
    PASSPORT,
    PREFIX,
    FIRST,
    LAST,
    SUFFIX,
    MAIDEN,
    MARITAL,
    RACE,
    ETHNICITY,
    GENDER,
    BIRTHPLACE,
    ADDRESS,
    CITY,
    STATE,
    ZIP
FROM row_to_insert;
