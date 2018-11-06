SET FOREIGN_KEY_CHECKS=0; -- 임시 방편 disable foreign key checks

INSERT INTO fhir.conditions 
(
    START
    , STOP
    , PATIENT
    , ENCOUNTER
    , CODE
    , DESCRIPTION
)
WITH
diagnosis AS (
    SELECT
        SUBJECT_ID
        , HADM_ID
        , ICD9_CODE
    FROM mimic.DIAGNOSES_ICD 
    WHERE SEQ_NUM = 0
),
admisson AS (
    SELECT 
        SUBJECT_ID
        , HADM_ID
        , ADMITTIME
        , DISCHTIME
    FROM mimic.ADMISSIONS
),
diagnosis_meta AS (
    SELECT
        ICD9_CODE
        , LONG_TITLE
    FROM mimic.D_ICD_DIAGNOSES
),
row_to_insert AS (
    SELECT 
        ADMITTIME as START
        , DISCHTIME as STOP
        , SUBJECT_ID as PATIENT
        , HADM_ID as ENCOUNTER
        , ICD9_CODE as CODE
        , LONG_TITLE AS DESCRIPTION
    FROM diagnosis
    LEFT JOIN diagnosis_meta USING (ICD9_CODE)
    LEFT JOIN admisson using(SUBJECT_ID, HADM_ID)
)
SELECT 
    START
    , STOP
    , PATIENT
    , ENCOUNTER
    , CODE
    , DESCRIPTION
FROM row_to_insert
WHERE CODE IS NOT NULL; -- fixme

SET FOREIGN_KEY_CHECKS=1;
