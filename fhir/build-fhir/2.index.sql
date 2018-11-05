CREATE UNIQUE INDEX idx_organizations_id ON fhir.organizations (id ASC);
CREATE UNIQUE INDEX idx_patients_id ON fhir.patients (id ASC);
-- CREATE UNIQUE INDEX idx_careplans_id ON fhir.careplans (id ASC);
CREATE UNIQUE INDEX idx_encounters_id ON fhir.encounters (id ASC);
CREATE UNIQUE INDEX idx_imaging_studies_id ON fhir.imaging_studies (id ASC);
CREATE UNIQUE INDEX idx_patientmapping_id ON fhir.PatientMappingTable (PAID ASC);
CREATE UNIQUE INDEX idx_encountermapping_id ON fhir.EncounterMappingTable (PAID ASC, INNO ASC);
CREATE UNIQUE INDEX idx_organizationmapping_id ON fhir.OrganizationMappingTable (DEPT ASC);
CREATE INDEX idx_codemapping_id ON fhir.CodeMappingTable (SOURCE ASC);
