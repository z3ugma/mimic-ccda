-- from caregivers to organizations
INSERT INTO fhir.organizations 
(
    ID,
    ACTIVE,
    TYPE,
    NAME,
    TELECOME,
    ADDRESS,
    CITY,
    STATE,
    ZIP,
    COUNTRY
)
WITH
dept AS (
    SELECT
        CGID
        , LABEL as NAME
        , DESCRIPTION
    FROM asancv.dept_cd
),
row_to_insert AS (
    SELECT 
        CGID as ID, -- null????
        TRUE as ACTIVE,
        LABEL as TYPE,
        DESCRIPTION as NAME,
        null as TELECOME,
        '' as ADDRESS,
        '' as CITY,
        '' as STATE,
        '' as ZIP,
        '' as COUNTRY
    FROM mimic.CAREGIVERS
)
SELECT 
    ID,
    ACTIVE,
    TYPE,
    NAME,
    TELECOME,
    ADDRESS,
    CITY,
    STATE,
    ZIP,
    COUNTRY
FROM row_to_insert;
