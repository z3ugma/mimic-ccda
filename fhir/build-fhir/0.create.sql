DROP DATABASE IF EXISTS fhir;
CREATE DATABASE fhir
  CHARACTER SET = 'utf8'
  COLLATE = 'utf8_general_ci';

DROP TABLE IF EXISTS fhir.organizations ;
CREATE TABLE fhir.organizations (
  id			    BINARY(16)    NOT NULL,
  active			VARCHAR(100)    NOT NULL,
  type			  VARCHAR(100)    NOT NULL,
  name        VARCHAR(200)    NOT NULL,
  telecome		VARCHAR(200)            NULL,
  address           VARCHAR(200)    NOT NULL,
  city              VARCHAR(200)    NOT NULL,
  state             VARCHAR(200)    NOT NULL,
  zip               VARCHAR(200)    NULL,
  COUNTRY             VARCHAR(200)    NOT NULL
)
;

-- DROP TABLE IF EXISTS fhir.allergies ;
-- CREATE TABLE fhir.allergies (
--   start			    DATE	        NOT NULL,
--   stop              DATE            NULL,
--   patient			BINARY(16)    NOT NULL,
--   encounter			BINARY(16)    NOT NULL,
--   code              VARCHAR(100)    NOT NULL,
--   description		TEXT            NOT NULL
-- )
-- ;

-- DROP TABLE IF EXISTS fhir.careplans ;
-- CREATE TABLE fhir.careplans (
--   id			    BINARY(16)    NOT NULL,
--   start			    DATE	        NOT NULL,
--   stop              DATE            NULL,
--   patient			BINARY(16)    NOT NULL,
--   encounter			BINARY(16)    NOT NULL,
--   code              VARCHAR(100)    NOT NULL,
--   description		TEXT            NOT NULL,
--   reasoncode        VARCHAR(100)    NOT NULL,
--   reasondescription	TEXT            NOT NULL
-- )
-- ;

DROP TABLE IF EXISTS fhir.conditions ;
CREATE TABLE fhir.conditions (
  start			    DATE	        NOT NULL,
  stop              DATE            NULL,
  patient			BINARY(16)    NOT NULL,
  encounter			BINARY(16)    NOT NULL,
  code              VARCHAR(100)    NOT NULL,
  description		TEXT            NOT NULL
)
;


DROP TABLE IF EXISTS fhir.encounters ;
CREATE TABLE fhir.encounters (
  id			    BINARY(16)    NOT NULL,
  start			    DATE	        NOT NULL,
  stop              DATE            NULL,
  patient			BINARY(16)    NOT NULL,
  encounterclass    BINARY(16)    NOT NULL,
  code              VARCHAR(100)    NOT NULL,
  description		TEXT            NOT NULL,
  cost              INTEGER         NOT NULL,
  reasoncode        VARCHAR(100)    NULL,
  reasondescription	TEXT            NULL,
  serviceprovider	BINARY(16)      NOT NULL
)
;

DROP TABLE IF EXISTS fhir.imaging_studies ;
CREATE TABLE fhir.imaging_studies (
  id			    BINARY(16)    NOT NULL,
  date			    DATE	        NOT NULL,
  patient			BINARY(16)    NOT NULL,
  encounter			BINARY(16)    NOT NULL,
  bodysitecode      VARCHAR(100)    NOT NULL,    
  bodysitedescription      VARCHAR(100)    NOT NULL,    
  modalitycode      VARCHAR(100)    NOT NULL,    
  modalitydescription      VARCHAR(100)    NOT NULL,    
  sopcode      VARCHAR(100)    NOT NULL,    
  sopdescription      VARCHAR(100)    NOT NULL,
  referrer BINARY(16)    NOT NULL
)
;

-- DROP TABLE IF EXISTS fhir.immunizations ;
-- CREATE TABLE fhir.immunizations (
--   date			    DATE	        NOT NULL,
--   patient			BINARY(16)    NOT NULL,
--   encounter			BINARY(16)    NOT NULL,
--   code              VARCHAR(100)    NOT NULL,
--   description		TEXT            NOT NULL,
--   cost              INTEGER         NOT NULL
-- )
-- ;

DROP TABLE IF EXISTS fhir.medications ;
CREATE TABLE fhir.medications (
  start			    DATE	        NOT NULL,
  stop              DATE            NULL,
  patient			BINARY(16)    NOT NULL,
  encounter			BINARY(16)    NOT NULL,
  code              VARCHAR(100)    NOT NULL,
  description		TEXT            NOT NULL,
  cost              INTEGER         NOT NULL,
  reasoncode        VARCHAR(100)    NOT NULL,
  reasondescription	TEXT            NOT NULL,
  requester BINARY(16)    NOT NULL
)
;

DROP TABLE IF EXISTS fhir.observations ;
CREATE TABLE fhir.observations (
  date			    DATE	        NOT NULL,
  patient			BINARY(16)    NOT NULL,
  encounter			BINARY(16)    NOT NULL,
  code              VARCHAR(100)    NOT NULL,
  description		TEXT            NOT NULL,
  value             VARCHAR(300)    NOT NULL,
  units             VARCHAR(300)    NULL,
  type              VARCHAR(300)    NOT NULL,
  performer   BINARY(16)    NOT NULL
)
;

DROP TABLE IF EXISTS fhir.patients ;
CREATE TABLE fhir.patients (
  id			    BINARY(16)    NOT NULL,
  birthdate			DATE	        NOT NULL,
  deathdate			DATE	        DEFAULT NULL,
  ssn			    VARCHAR(100)    NOT NULL,
  drivers		    VARCHAR(100)    NULL,
  passport		    VARCHAR(100)    NULL,
  prefix            VARCHAR(100)    NULL,
  first			    VARCHAR(200)    NOT NULL,
  last			    VARCHAR(200)    NOT NULL,
  suffix            VARCHAR(200)    NULL,
  maiden            VARCHAR(200)    NULL,
  marital           VARCHAR(100)    NULL,  
  race			    VARCHAR(200)    NOT NULL,
  ethnicity		    VARCHAR(200)    NOT NULL,
  gender		    VARCHAR(200)    NOT NULL,
  birthplace        VARCHAR(200)    NOT NULL,
  address           VARCHAR(200)    NOT NULL,
  city              VARCHAR(200)    NOT NULL,
  state             VARCHAR(200)    NOT NULL,
  zip               VARCHAR(200)    NULL
)
;

DROP TABLE IF EXISTS fhir.procedures ;
CREATE TABLE fhir.procedures (
  date			    DATE	        NOT NULL,
  patient			BINARY(16)    NOT NULL,
  encounter			BINARY(16)    NOT NULL,
  code              VARCHAR(100)    NOT NULL,
  description		TEXT            NOT NULL,
  cost              INTEGER         NOT NULL,
  reasoncode        VARCHAR(100)    NOT NULL,
  reasondescription	TEXT            NOT NULL,
  performer   BINARY(16)    NOT NULL
)
;

