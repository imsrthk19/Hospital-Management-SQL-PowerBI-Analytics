-- =====================================================
-- Hospital Management Analysis Project
-- =====================================================

-- Step 2: Create Database Tables:

-- Select database
USE hospital_db;



-- =====================================================
-- 1. PATIENTS TABLE: Stores patient personal information
-- =====================================================
CREATE TABLE patients
(
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    registration_date DATE
);



-- =====================================================
-- 2. DOCTORS TABLE: Stores doctor details
-- =====================================================

CREATE TABLE doctors
(
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    department VARCHAR(100)
);



-- =====================================================
-- 3. APPOINTMENTS TABLE: Stores patient doctor appointments
-- =====================================================

CREATE TABLE appointments
(
    appointment_id INT PRIMARY KEY,

    patient_id INT,

    doctor_id INT,

    appointment_date DATE,

    status VARCHAR(20),

    consultation_fee DECIMAL(10,2),


    -- Relationship with patients table
    FOREIGN KEY(patient_id)
    REFERENCES patients(patient_id),


    -- Relationship with doctors table
    FOREIGN KEY(doctor_id)
    REFERENCES doctors(doctor_id)

);



-- =====================================================
-- 4. ADMISSIONS TABLE: Stores hospital admission details
-- =====================================================

CREATE TABLE admissions
(
    admission_id INT PRIMARY KEY,

    patient_id INT,

    admission_date DATE,

    discharge_date DATE,

    diagnosis VARCHAR(100),

    treatment_cost DECIMAL(12,2),


    -- Relationship with patients table

    FOREIGN KEY(patient_id)
    REFERENCES patients(patient_id)

);


-- Verify Tables Created
SHOW TABLES;