-- =====================================================
-- Hospital Management Analytics Project
-- Step 4 : Business Analysis Queries
-- =====================================================

USE hospital_db;

-- =====================================================
-- PATIENT ANALYSIS
-- =====================================================

-- 1. Total Patients

SELECT
COUNT(*) AS Total_Patients
FROM patients;


-- 2. Patient Distribution by City

SELECT
city,
COUNT(*) AS Total_Patients
FROM patients
GROUP BY city
ORDER BY Total_Patients DESC;


-- 3. Gender Distribution

SELECT
gender,
COUNT(*) AS Total_Patients
FROM patients
GROUP BY gender;


-- 4. Average Patient Age

SELECT
ROUND(AVG(age),2) AS Average_Age
FROM patients;


-- 5. Patients by Insurance Provider

SELECT
insurance_provider,
COUNT(*) AS Total_Patients
FROM patients
GROUP BY insurance_provider
ORDER BY Total_Patients DESC;


-- =====================================================
-- DOCTOR ANALYSIS
-- =====================================================

-- 6. Total Doctors

SELECT
COUNT(*) AS Total_Doctors
FROM doctors;


-- 7. Doctors with Department

SELECT d.doctor_name, d.specialization,
dp.department_name
FROM doctors d
JOIN departments dp
ON d.department_id = dp.department_id;


-- 8. Doctor-wise Appointment Count

SELECT
d.doctor_name,
COUNT(a.appointment_id) AS Total_Appointments
FROM doctors d
LEFT JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY Total_Appointments DESC;


-- 9. Doctor-wise Revenue

SELECT
d.doctor_name,
SUM(a.consultation_fee) AS Revenue
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
WHERE a.appointment_status='Completed'
GROUP BY d.doctor_name
ORDER BY Revenue DESC;


-- =====================================================
-- APPOINTMENT ANALYSIS
-- =====================================================

-- 10. Total Appointments

SELECT
COUNT(*) AS Total_Appointments
FROM appointments;


-- 11. Appointment Status

SELECT
appointment_status,
COUNT(*) AS Total
FROM appointments
GROUP BY appointment_status;


-- 12. Appointment Completion Rate

SELECT
ROUND(
SUM(CASE
WHEN appointment_status='Completed' THEN 1
ELSE 0
END)*100/COUNT(*),2)
AS Completion_Rate
FROM appointments;


-- 13. Average Consultation Fee

SELECT
ROUND(AVG(consultation_fee),2)
AS Average_Consultation_Fee
FROM appointments;


-- =====================================================
-- ADMISSION ANALYSIS
-- =====================================================

-- 14. Total Admissions

SELECT
COUNT(*) AS Total_Admissions
FROM admissions;


-- 15. Average Length of Stay

SELECT
ROUND(
AVG(DATEDIFF(discharge_date,admission_date)),2
)
AS Average_Stay_Days
FROM admissions;


-- 16. Diagnosis Analysis

SELECT
diagnosis,
COUNT(*) AS Cases
FROM admissions
GROUP BY diagnosis
ORDER BY Cases DESC;


-- 17. Admission Type Analysis

SELECT
admission_type,
COUNT(*) AS Patients
FROM admissions
GROUP BY admission_type;


-- =====================================================
-- TREATMENT ANALYSIS
-- =====================================================

-- 18. Total Treatment Cost

SELECT
SUM(treatment_cost)
AS Total_Treatment_Cost
FROM treatments;


-- 19. Average Treatment Cost

SELECT
ROUND(AVG(treatment_cost),2)
AS Average_Treatment_Cost
FROM treatments;


-- 20. Most Expensive Treatments

SELECT
treatment_name,
SUM(treatment_cost) AS Total_Cost
FROM treatments
GROUP BY treatment_name
ORDER BY Total_Cost DESC;


-- =====================================================
-- BILLING ANALYSIS
-- =====================================================

-- 21. Total Hospital Revenue

SELECT
SUM(total_bill)
AS Total_Revenue
FROM billing;


-- 22. Payment Status Analysis

SELECT
payment_status,
COUNT(*) AS Bills
FROM billing
GROUP BY payment_status;


-- 23. Insurance Contribution

SELECT
SUM(insurance_amount)
AS Insurance_Claim
FROM billing;


-- 24. Average Bill Amount

SELECT
ROUND(AVG(total_bill),2)
AS Average_Bill
FROM billing;


-- =====================================================
-- BUSINESS ANALYSIS USING JOINS
-- =====================================================

-- 25. Complete Patient Treatment Details

SELECT

p.patient_name,

d.doctor_name,

dp.department_name,

t.treatment_name,

t.treatment_cost,

b.total_bill

FROM patients p

JOIN admissions a
ON p.patient_id=a.patient_id

JOIN treatments t
ON a.admission_id=t.admission_id

JOIN doctors d
ON t.doctor_id=d.doctor_id

JOIN departments dp
ON d.department_id=dp.department_id

JOIN billing b
ON a.admission_id=b.admission_id;


-- =====================================================
-- REVENUE BY DEPARTMENT
-- =====================================================

SELECT

dp.department_name,

SUM(a.consultation_fee)
AS Revenue

FROM departments dp

JOIN doctors d
ON dp.department_id=d.department_id

JOIN appointments a
ON d.doctor_id=a.doctor_id

WHERE a.appointment_status='Completed'

GROUP BY dp.department_name

ORDER BY Revenue DESC;


-- =====================================================
-- TOP 5 DOCTORS BY REVENUE
-- =====================================================

SELECT

d.doctor_name,

SUM(a.consultation_fee)
AS Revenue

FROM doctors d

JOIN appointments a
ON d.doctor_id=a.doctor_id

WHERE a.appointment_status='Completed'

GROUP BY d.doctor_name

ORDER BY Revenue DESC

LIMIT 5;


-- =====================================================
-- RANK DOCTORS USING WINDOW FUNCTION
-- =====================================================

SELECT

doctor_name,

Revenue,

RANK() OVER(ORDER BY Revenue DESC)
AS Doctor_Rank

FROM
(
SELECT

d.doctor_name,

SUM(a.consultation_fee)
AS Revenue

FROM doctors d

JOIN appointments a
ON d.doctor_id=a.doctor_id

GROUP BY d.doctor_name

)t;

