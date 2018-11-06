SET FOREIGN_KEY_CHECKS=0; -- 임시 방편 disable foreign key checks

INSERT INTO fhir.encounters 
(
    ID
  , START
  , STOP
  , PATIENT
  , ENCOUNTERCLASS
  , CODE
  , DESCRIPTION
  , COST
  , REASONCODE
  , REASONDESCRIPTION
  , SERVICEPROVIDER
)
WITH
admissions AS (
    SELECT
      SUBJECT_ID
      , HADM_ID
      , ADMITTIME
      , DISCHTIME
      , DIAGNOSIS
      , ADMISSION_TYPE
      , DIAGNOSIS
    FROM mimic.ADMISSIONS
),
diagnosis AS (
    SELECT
        SUBJECT_ID
        , HADM_ID
        , ICD9_CODE
    FROM mimic.DIAGNOSES_ICD 
    WHERE SEQ_NUM = 0
),
row_to_insert AS (
    SELECT 
      ENCOUNTER as ID
      , INTM as START
      , OUDT as STOP
      , SUBJECT_ID as PATIENT
      , ADMISSION_TYPE as ENCOUNTERCLASS
      , ICD9_CODE as CODE
      , DIAGNOSIS as DESCRIPTION
      , 0 as COST
      , null as REASONCODE
      , null as REASONDESCRIPTION
      , null as SERVICEPROVIDER -- ?
    FROM admissions
)
SELECT 
    ID 
  , START
  , STOP
  , PATIENT
  , ENCOUNTERCLASS
  , CODE
  , DESCRIPTION
  , COST
  , REASONCODE
  , REASONDESCRIPTION
  , SERVICEPROVIDER
FROM row_to_insert;

SET FOREIGN_KEY_CHECKS=1;
