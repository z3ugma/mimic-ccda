# MIMIC-FHIR

This repository contains an Extract-Transform-Load (ETL) process for mapping the [MIMIC-III database](mimic.physionet.org) to the [FHIR](https://www.hl7.org/fhir). This process involves both transforming the structure of the database (i.e. the relational schema), but also standardizing the many concepts in the MIMIC-III database to a standard vocabulary.

# "WHERE IS ..."

Below in the README, we provide two sections. The first section, _FHIR Resources_, lists the FHIR resources which have been populated from MIMIC-III. You can use this section to figure out what data generated each FHIR Resources. For example, we can see that the FHIR Resource _patient_ was populated using data from the _patients_ table in MIMIC-III.

The second section, _MIMIC TABLES EQUIVALENCE_, lists all the tables in MIMIC-III, and shows where the data now exists in the FHIR Resources. For example, we can see that the MIMIC-III table _patients_ was used to populate the FHIR Resources _patient_.

# FHIR Resources

Currently supported FHIR Resources:

- Bundle
- Patient
- Encounter
- Condition
- Observation
- DiagnosticReport
- Procedure
- ImagingStudy
- Immunization
- CarePlan
- MedicationRequest
- Claim

# MIMIC TABLES EQUIVALENCE

TBD

- [patients](https://mimic.physionet.org/mimictables/patients/)
  - [Patient](etl/fhir/patient)
- [admissions](https://mimic.physionet.org/mimictables/admissions/)
- [transfers](https://mimic.physionet.org/mimictables/transfers/)
- [icustays](https://mimic.physionet.org/mimictables/icustays/)
- [service](https://mimic.physionet.org/mimictables/services/)
- [prescriptions](https://mimic.physionet.org/mimictables/prescriptions/)
- [inputevents_cv](https://mimic.physionet.org/mimictables/inputevents_cv/)
- [inputevents_mv](https://mimic.physionet.org/mimictables/inputevents_mv/)
- [outputevents](https://mimic.physionet.org/mimictables/outputevents/)
- [labevents](https://mimic.physionet.org/mimictables/labevents/)
- [microbiologyevents](https://mimic.physionet.org/mimictables/microbiologyevents/)
- [chartevents](https://mimic.physionet.org/mimictables/chartevents/)
- [drgcodes](https://mimic.physionet.org/mimictables/drgcodes/)
- [datetimeevents](https://mimic.physionet.org/mimictables/datetimeevents/)
- [procedure_icd](https://mimic.physionet.org/mimictables/procedures_icd/)
- [procedureevents_mv](https://mimic.physionet.org/mimictables/procedureevents_mv/)
- [cptevents](https://mimic.physionet.org/mimictables/cptevents/)
- [diagnosis_icd](https://mimic.physionet.org/mimictables/diagnoses_icd/)
- [notevents](https://mimic.physionet.org/mimictables/noteevents/)
- [caregivers](https://mimic.physionet.org/mimictables/caregivers/)
- [callout](https://mimic.physionet.org/mimictables/callout/)

# Remarks

- This repository is largely rely on [mimic-omop](https://github.com/MIT-LCP/mimic-omop) project which is for ETL from MIMIC-III database to OMOP CDM.
