
SET FOREIGN_KEY_CHECKS=0; -- 임시 방편 disable foreign key checks

INSERT INTO fhir.observations 
(
    DATE
    , PATIENT
    , ENCOUNTER
    , CODE
    , DESCRIPTION
    , VALUE
    , UNITS
    , TYPE
    , PERFORMER 
)
WITH lab as 
(
    SELECT 
        SUBJECT_ID
        , HADM_ID
        , ITEMID
        , CHARTTIME
        , VALUENUM 
        , VALUEUOM 
    FROM mimic.LABEVENTS
),
lab_meta as (
    SELECT
        ITEMID
        , LABEL
        , LOINC_CODE
    FROM mimic.D_LABITEMS
),
row_to_insert AS (
    SELECT 
        EX_DTTM as DATE
        , SUBJECT_ID as PATIENT
        , HADM_ID as ENCOUNTER
        , LOINC_CODE as CODE
        , ILABEL as DESCRIPTION
        , ifnull(VALUE, VALUENUM) as VALUE
        , VALUEUOM as UNITS
        , CASE
            WHEN VALUE is null THEN 'string'
            ELSE 'numeric'
        END as TYPE
        , null as PERFORMER --?
    FROM lab
    LEFT JOIN lab_meta USING (ITEMID)
)
SELECT 
    DATE
    , PATIENT
    , ENCOUNTER
    , CODE
    , DESCRIPTION
    , VALUE
    , UNITS
    , TYPE
    , PERFORMER
FROM row_to_insert;

SET FOREIGN_KEY_CHECKS=1;
