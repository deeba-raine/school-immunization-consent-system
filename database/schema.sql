-- =============================================================
-- SIP-APP: School Immunization Program Application
-- Database Schema — PostgreSQL
-- Toronto Public Health
-- =============================================================

-- Run this file with:
-- psql -U your_username -d sip_app -f schema.sql

-- -------------------------------------------------------------
-- Table: schools
-- -------------------------------------------------------------
CREATE TABLE schools (
    school_id   SERIAL PRIMARY KEY,
    school_name VARCHAR(100) NOT NULL
);

-- -------------------------------------------------------------
-- Table: parents
-- -------------------------------------------------------------
CREATE TABLE parents (
    parent_id         SERIAL PRIMARY KEY,
    parent_first_name VARCHAR(60) NOT NULL,
    parent_last_name  VARCHAR(60) NOT NULL,
    parent_phone      VARCHAR(15) NOT NULL,
    parent_email      VARCHAR(60) NOT NULL
);

-- -------------------------------------------------------------
-- Table: students
-- -------------------------------------------------------------
CREATE TABLE students (
    student_id         SERIAL PRIMARY KEY,
    student_first_name VARCHAR(60) NOT NULL,
    student_last_name  VARCHAR(60) NOT NULL,
    health_card_number CHAR(10),
    gender             VARCHAR(20),
    date_of_birth      DATE        NOT NULL,
    grade              VARCHAR(5),
    class              VARCHAR(5),
    teacher_name       VARCHAR(60),
    school_id          INT         NOT NULL REFERENCES schools(school_id),
    parent_id          INT         NOT NULL REFERENCES parents(parent_id)
);

-- -------------------------------------------------------------
-- Table: nurses
-- -------------------------------------------------------------
CREATE TABLE nurses (
    nurse_id         SERIAL PRIMARY KEY,
    nurse_first_name VARCHAR(60) NOT NULL,
    nurse_last_name  VARCHAR(60) NOT NULL,
    nurse_email      VARCHAR(60) NOT NULL
);

-- -------------------------------------------------------------
-- Table: consent_submissions
-- Master table tying everything together
-- -------------------------------------------------------------
CREATE TABLE consent_submissions (
    consent_id     SERIAL PRIMARY KEY,
    student_id     INT         NOT NULL REFERENCES students(student_id),
    parent_id      INT         NOT NULL REFERENCES parents(parent_id),
    submitted_at   TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    consent_status VARCHAR(20) NOT NULL DEFAULT 'pending'
                   CHECK (consent_status IN ('pending', 'submitted', 'withdrawn')),
    is_current     BOOLEAN     NOT NULL DEFAULT TRUE
);

-- -------------------------------------------------------------
-- Table: vaccination_history
-- One row per vaccine type reported by parent
-- -------------------------------------------------------------
CREATE TABLE vaccination_history (
    vaccination_history_id SERIAL PRIMARY KEY,
    consent_id             INT         NOT NULL REFERENCES consent_submissions(consent_id),
    vaccine_type           VARCHAR(60) NOT NULL
                           CHECK (vaccine_type IN ('meningococcal', 'hpv', 'hepatitis_b')),
    vaccine_brand          VARCHAR(50) NOT NULL
                           CHECK (vaccine_brand IN (
                               'menactra', 'menveo', 'menquadfi', 'nimenrix',
                               'gardasil', 'gardasil_9', 'cervarix',
                               'engerix', 'recombivax_hb', 'twinrix', 'pediarix',
                               'unknown', 'other'
                           )),
    date_received          DATE
);

-- -------------------------------------------------------------
-- Table: health_history
-- -------------------------------------------------------------
CREATE TABLE health_history (
    health_history_id         SERIAL PRIMARY KEY,
    consent_id                INT     NOT NULL REFERENCES consent_submissions(consent_id),
    allergy                   BOOLEAN NOT NULL DEFAULT FALSE,
    allergy_details           TEXT,
    vaccine_reaction          BOOLEAN NOT NULL DEFAULT FALSE,
    vaccine_reaction_details  TEXT,
    fainting_history          BOOLEAN NOT NULL DEFAULT FALSE,
    fainting_details          TEXT,
    weak_immune_system        BOOLEAN NOT NULL DEFAULT FALSE,
    immune_system_details     TEXT,
    medical_condition         BOOLEAN NOT NULL DEFAULT FALSE,
    medical_condition_details TEXT
);

-- -------------------------------------------------------------
-- Table: consent_decisions
-- -------------------------------------------------------------
CREATE TABLE consent_decisions (
    consent_decision_id     SERIAL PRIMARY KEY,
    consent_id              INT          NOT NULL REFERENCES consent_submissions(consent_id),
    consent_meningococcal   BOOLEAN      NOT NULL,
    consent_hpv             BOOLEAN      NOT NULL,
    consent_hepatitis_b     BOOLEAN      NOT NULL,
    relationship_to_student VARCHAR(20)  NOT NULL
                            CHECK (relationship_to_student IN ('parent', 'legal_guardian')),
    signature               VARCHAR(120) NOT NULL,
    consent_date            DATE         NOT NULL
);