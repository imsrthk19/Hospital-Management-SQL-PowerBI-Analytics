-- =====================================================
-- Hospital Management Analytics Project
-- Step 3: Insert Sample Data
-- =====================================================

USE hospital_db;

-- =====================================================
-- 1. INSERT DEPARTMENTS
-- =====================================================

INSERT INTO departments
(department_id, department_name, location)
VALUES
(1,'Cardiology','Block A'),
(2,'Neurology','Block B'),
(3,'Orthopedics','Block C'),
(4,'General Medicine','Block D'),
(5,'Dermatology','Block E'),
(6,'ENT','Block F'),
(7,'Pediatrics','Block G'),
(8,'Gynecology','Block H');



-- =====================================================
-- 2. INSERT PATIENTS
-- =====================================================

INSERT INTO patients
(patient_id, patient_name, gender, age, phone, city, registration_date, insurance_provider)
VALUES
(1,'Rahul Sharma','Male',34,'9876543210','Mumbai','2025-01-05','Star Health'),
(2,'Priya Verma','Female',29,'9876543211','Delhi','2025-01-07','HDFC Ergo'),
(3,'Amit Patel','Male',42,'9876543212','Pune','2025-01-10','ICICI Lombard'),
(4,'Sneha Joshi','Female',37,'9876543213','Bangalore','2025-01-15','Niva Bupa'),
(5,'Rohan Gupta','Male',51,'9876543214','Hyderabad','2025-01-18','Care Health'),
(6,'Neha Kapoor','Female',31,'9876543215','Delhi','2025-01-22','Star Health'),
(7,'Arjun Singh','Male',46,'9876543216','Lucknow','2025-01-25','HDFC Ergo'),
(8,'Kavya Rao','Female',27,'9876543217','Chennai','2025-01-28','ICICI Lombard'),
(9,'Vikas Kumar','Male',39,'9876543218','Jaipur','2025-02-02','Care Health'),
(10,'Ananya Gupta','Female',33,'9876543219','Kolkata','2025-02-05','Star Health');



-- =====================================================
-- 3. INSERT DOCTORS
-- =====================================================

INSERT INTO doctors
(doctor_id, doctor_name, specialization, department_id, experience_years, consultation_fee)
VALUES
(101,'Dr. Mehta','Cardiologist',1,15,1000),
(102,'Dr. Singh','Neurologist',2,12,1200),
(103,'Dr. Rao','Orthopedic',3,10,900),
(104,'Dr. Shah','General Physician',4,18,700),
(105,'Dr. Verma','Dermatologist',5,8,800),
(106,'Dr. Khan','ENT Specialist',6,11,850),
(107,'Dr. Patel','Pediatrician',7,13,900),
(108,'Dr. Iyer','Gynecologist',8,16,1100);



-- =====================================================
-- 4. INSERT APPOINTMENTS
-- =====================================================

INSERT INTO appointments
(appointment_id, patient_id, doctor_id, appointment_date, appointment_status, consultation_fee)
VALUES
(1001,1,101,'2025-02-10','Completed',1000),
(1002,2,104,'2025-02-11','Completed',700),
(1003,3,103,'2025-02-12','Cancelled',900),
(1004,4,102,'2025-02-13','Completed',1200),
(1005,5,101,'2025-02-14','Completed',1000),
(1006,6,105,'2025-02-15','Completed',800),
(1007,7,106,'2025-02-16','Completed',850),
(1008,8,108,'2025-02-17','Completed',1100),
(1009,9,107,'2025-02-18','Cancelled',900),
(1010,10,104,'2025-02-19','Completed',700);



-- =====================================================
-- 5. INSERT ADMISSIONS
-- =====================================================

INSERT INTO admissions
(admission_id, patient_id, room_no, admission_date, discharge_date, diagnosis, admission_type)
VALUES
(201,1,'A101','2025-02-10','2025-02-15','Heart Disease','Emergency'),
(202,3,'C205','2025-02-12','2025-02-18','Fracture','Planned'),
(203,5,'A110','2025-02-14','2025-02-17','Chest Pain','Emergency'),
(204,7,'F302','2025-02-16','2025-02-20','Ear Infection','Planned'),
(205,8,'H402','2025-02-17','2025-02-22','Pregnancy','Planned');



-- =====================================================
-- 6. INSERT TREATMENTS
-- =====================================================

INSERT INTO treatments
(treatment_id, admission_id, doctor_id, treatment_name, treatment_date, treatment_cost)
VALUES
(301,201,101,'Angioplasty','2025-02-11',250000),
(302,202,103,'Bone Surgery','2025-02-13',90000),
(303,203,101,'Cardiac Treatment','2025-02-15',50000),
(304,204,106,'ENT Surgery','2025-02-17',30000),
(305,205,108,'Delivery Procedure','2025-02-19',120000);



-- =====================================================
-- 7. INSERT BILLING
-- =====================================================

INSERT INTO billing
(bill_id, patient_id, admission_id, medicine_cost, room_charge, insurance_amount, total_bill, payment_status)
VALUES
(401,1,201,15000,25000,50000,290000,'Paid'),
(402,3,202,8000,12000,20000,110000,'Paid'),
(403,5,203,5000,10000,15000,65000,'Pending'),
(404,7,204,4000,8000,10000,42000,'Paid'),
(405,8,205,10000,15000,30000,145000,'Pending');



-- =====================================================
-- VERIFY DATA
-- =====================================================

SELECT COUNT(*) AS Total_Departments FROM departments;

SELECT COUNT(*) AS Total_Patients FROM patients;

SELECT COUNT(*) AS Total_Doctors FROM doctors;

SELECT COUNT(*) AS Total_Appointments FROM appointments;

SELECT COUNT(*) AS Total_Admissions FROM admissions;

SELECT COUNT(*) AS Total_Treatments FROM treatments;

SELECT COUNT(*) AS Total_Bills FROM billing;