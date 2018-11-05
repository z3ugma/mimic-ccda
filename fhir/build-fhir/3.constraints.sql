
----------------
--Allergies   --
----------------

-- ALTER TABLE fhir.allergies DROP CONSTRAINT IF EXISTS allergy_fk_patient_id;
-- ALTER TABLE fhir.allergies
-- ADD CONSTRAINT allergy_fk_patient_id
--   FOREIGN KEY (patient)
--   REFERENCES patients(id);

-- ALTER TABLE fhir.allergies DROP CONSTRAINT IF EXISTS allergy_fk_encounter_id;
-- ALTER TABLE fhir.allergies
-- ADD CONSTRAINT allergy_fk_encounter_id
--   FOREIGN KEY (encounter)
--   REFERENCES encounters(id);


----------------
--CarePlans   --
----------------

-- ALTER TABLE fhir.careplans DROP CONSTRAINT IF EXISTS careplans_fk_patient_id;
-- ALTER TABLE fhir.careplans
-- ADD CONSTRAINT careplans_fk_patient_id
--   FOREIGN KEY (patient)
--   REFERENCES patients(id);

-- ALTER TABLE fhir.careplans DROP CONSTRAINT IF EXISTS careplans_fk_encounter_id;
-- ALTER TABLE fhir.careplans
-- ADD CONSTRAINT careplans_fk_encounter_id
--   FOREIGN KEY (encounter)
--   REFERENCES encounters(id);


----------------
--Conditions   --
----------------

ALTER TABLE fhir.conditions DROP CONSTRAINT IF EXISTS conditions_fk_patient_id;
ALTER TABLE fhir.conditions
ADD CONSTRAINT conditions_fk_patient_id
  FOREIGN KEY (patient)
  REFERENCES patients(id);

ALTER TABLE fhir.conditions DROP CONSTRAINT IF EXISTS conditions_fk_encounter_id;
ALTER TABLE fhir.conditions
ADD CONSTRAINT conditions_fk_encounter_id
  FOREIGN KEY (encounter)
  REFERENCES encounters(id);

----------------
--Encounters   --
----------------

ALTER TABLE fhir.encounters DROP CONSTRAINT IF EXISTS encounters_fk_patient_id;
ALTER TABLE fhir.encounters
ADD CONSTRAINT encounters_fk_patient_id
  FOREIGN KEY (patient)
  REFERENCES patients(id);


ALTER TABLE fhir.encounters DROP CONSTRAINT IF EXISTS encounters_fk_organization_id;
ALTER TABLE fhir.encounters
ADD CONSTRAINT encounters_fk_organization_id
  FOREIGN KEY (serviceprovider)
  REFERENCES organizations(id);
  
---------------------
--Imaging Studies  --
---------------------

ALTER TABLE fhir.imaging_studies DROP CONSTRAINT IF EXISTS imaging_studies_fk_patient_id;
ALTER TABLE fhir.imaging_studies
ADD CONSTRAINT imaging_studies_fk_patient_id
  FOREIGN KEY (patient)
  REFERENCES patients(id);

ALTER TABLE fhir.imaging_studies DROP CONSTRAINT IF EXISTS imaging_studies_fk_encounter_id;
ALTER TABLE fhir.imaging_studies
ADD CONSTRAINT imaging_studies_fk_encounter_id
  FOREIGN KEY (encounter)
  REFERENCES encounters(id);


ALTER TABLE fhir.imaging_studies DROP CONSTRAINT IF EXISTS imaging_studies_fk_referrer_id;
ALTER TABLE fhir.imaging_studies
ADD CONSTRAINT imaging_studies_fk_referrer_id
  FOREIGN KEY (referrer)
  REFERENCES organizations(id);

---------------------
--Immunizations    --
---------------------

-- ALTER TABLE fhir.immunizations DROP CONSTRAINT IF EXISTS immunizations_fk_patient_id;
-- ALTER TABLE fhir.immunizations
-- ADD CONSTRAINT immunizations_fk_patient_id
--   FOREIGN KEY (patient)
--   REFERENCES patients(id);

-- ALTER TABLE fhir.immunizations DROP CONSTRAINT IF EXISTS immunizations_fk_encounter_id;
-- ALTER TABLE fhir.immunizations
-- ADD CONSTRAINT immunizations_fk_encounter_id
--   FOREIGN KEY (encounter)
--   REFERENCES encounters(id);


---------------------
--Medications    --
---------------------

ALTER TABLE fhir.medications DROP CONSTRAINT IF EXISTS medications_fk_patient_id;
ALTER TABLE fhir.medications
ADD CONSTRAINT medications_fk_patient_id
  FOREIGN KEY (patient)
  REFERENCES patients(id);

ALTER TABLE fhir.medications DROP CONSTRAINT IF EXISTS medications_fk_encounter_id;
ALTER TABLE fhir.medications
ADD CONSTRAINT medications_fk_encounter_id
  FOREIGN KEY (encounter)
  REFERENCES encounters(id);

ALTER TABLE fhir.medications DROP CONSTRAINT IF EXISTS medications_fk_organization_id;
ALTER TABLE fhir.medications
ADD CONSTRAINT medications_fk_organization_id
  FOREIGN KEY (requester)
  REFERENCES organizations(id);

---------------------
--Observations    --
---------------------

ALTER TABLE fhir.observations DROP CONSTRAINT IF EXISTS observations_fk_patient_id;
ALTER TABLE fhir.observations
ADD CONSTRAINT observations_fk_patient_id
  FOREIGN KEY (patient)
  REFERENCES patients(id);

ALTER TABLE fhir.observations DROP CONSTRAINT IF EXISTS observations_fk_encounter_id;
ALTER TABLE fhir.observations
ADD CONSTRAINT observations_fk_encounter_id
  FOREIGN KEY (encounter)
  REFERENCES encounters(id);

ALTER TABLE fhir.observations DROP CONSTRAINT IF EXISTS observations_fk_organization_id;
ALTER TABLE fhir.observations
ADD CONSTRAINT observations_fk_organization_id
  FOREIGN KEY (performer)
  REFERENCES organizations(id);

---------------------
--Procedures       --
---------------------

ALTER TABLE fhir.procedures DROP CONSTRAINT IF EXISTS procedures_fk_patient_id;
ALTER TABLE fhir.procedures
ADD CONSTRAINT procedures_fk_patient_id
  FOREIGN KEY (patient)
  REFERENCES patients(id);

ALTER TABLE fhir.procedures DROP CONSTRAINT IF EXISTS procedures_fk_encounter_id;
ALTER TABLE fhir.procedures
ADD CONSTRAINT procedures_fk_encounter_id
  FOREIGN KEY (encounter)
  REFERENCES encounters(id);

ALTER TABLE fhir.procedures DROP CONSTRAINT IF EXISTS procedures_fk_organization_id;
ALTER TABLE fhir.procedures
ADD CONSTRAINT procedures_fk_organization_id
  FOREIGN KEY (performer)
  REFERENCES organizations(id);
