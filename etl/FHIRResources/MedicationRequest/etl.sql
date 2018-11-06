SET FOREIGN_KEY_CHECKS=0; -- 임시 방편 disable foreign key checks

INSERT INTO fhir.medications 
(
    START
    , STOP
    , PATIENT
    , ENCOUNTER
    , CODE
    , DESCRIPTION
    , COST
    , REASONCODE
    , REASONDESCRIPTION
    , REQUESTER
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
diagnosis_meta AS (
    SELECT
        ICD9_CODE
        , LONG_TITLE
    FROM mimic.D_ICD_DIAGNOSES
),
medication AS (
    SELECT
        SUBJECT_ID
        , HADM_ID
        , FORMULARY_DRUG_CD
        , DRUG
        , PROD_STRENGTH
        , STARTDATE
        , ENDDATE
    FROM mimic.PRESCRIPTIONS
),
row_to_insert AS (
    SELECT
        STARTDATE as START
        , ENDDATE as STOP
        , SUBJECT_ID as PATIENT
        , HADM_ID as ENCOUNTER
        , FORMULARY_DRUG_CD as CODE
        , CONCAT(DRUG, ' ', PROD_STRENGTH) as DESCRIPTION
        , 0 as COST
        , ICD9_CODE as REASONCODE
        , LONG_TITLE as REASONDESCRIPTION
        , null as REQUESTER --?
    FROM medication
    LEFT JOIN diagnosis USING (SUBJECT_ID, HADM_ID)
    LEFT JOIN diagnosis_meta USING (ICD9_CODE)
)
SELECT 
    START
    , STOP
    , PATIENT
    , ENCOUNTER
    , CODE
    , DESCRIPTION
    , COST
    , REASONCODE
    , REASONDESCRIPTION
    , REQUESTER
FROM row_to_insert;

SET FOREIGN_KEY_CHECKS=1;
