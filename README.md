# MIMIC-C-CDA

This repository contains an Extract-Transform-Load (ETL) process for mapping the [MIMIC-IV database](mimic.physionet.org) to C-CDA clinical document architecture. This process involves both transforming the structure of the database (i.e. the relational schema), but also standardizing the many concepts in the MIMIC-IV database to a standard vocabulary.

### MIMIC Concepts
- [patients](https://mimic.physionet.org/mimictables/patients/)
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

- This repository is based on [mimic-omop](https://github.com/MIT-LCP/mimic-omop) project which is for ETL from MIMIC-III database to OMOP CDM.
- This repository is based on mimic-FHIR
