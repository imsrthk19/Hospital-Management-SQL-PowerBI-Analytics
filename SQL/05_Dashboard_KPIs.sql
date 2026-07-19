-- =====================================================
-- Hospital Management Analytics Project
-- Step 5 : Dashboard KPI Queries
-- Purpose: Power BI Dashboard Metrics
-- =====================================================


USE hospital_db;



-- =====================================================
-- PAGE 1 : HOSPITAL OVERVIEW
-- =====================================================


-- KPI 1 : Total Patients

SELECT 
COUNT(*) AS Total_Patients
FROM patients;



-- KPI 2 : Total Doctors

SELECT
COUNT(*) AS Total_Doctors
FROM doctors;



-- KPI 3 : Total Departments

SELECT
COUNT(*) AS Total_Departments
FROM departments;



-- KPI 4 : Total Appointments

SELECT
COUNT(*) AS Total_Appointments
FROM appointments;



-- KPI 5 : Total Admissions

SELECT
COUNT(*) AS Total_Admissions
FROM admissions;



-- KPI 6 : Total Revenue

SELECT
SUM(total_bill) AS Total_Revenue
FROM billing;



-- =====================================================
-- PAGE 2 : PATIENT ANALYTICS
-- =====================================================


-- Patient Distribution by City

SELECT

city,

COUNT(*) AS Patient_Count

FROM patients

GROUP BY city

ORDER BY Patient_Count DESC;



-- Gender Distribution

SELECT

gender,

COUNT(*) AS Patient_Count

FROM patients

GROUP BY gender;



-- Age Group Analysis

SELECT

CASE

WHEN age < 30 THEN 'Below 30'

WHEN age BETWEEN 30 AND 50 THEN '30-50'

ELSE 'Above 50'

END AS Age_Group,

COUNT(*) AS Patients

FROM patients

GROUP BY Age_Group;



-- Insurance Provider Analysis

SELECT

insurance_provider,

COUNT(*) AS Patients

FROM patients

GROUP BY insurance_provider;



-- =====================================================
-- PAGE 3 : DOCTOR PERFORMANCE
-- =====================================================


-- Doctor-wise Patient Count

SELECT

d.doctor_name,

COUNT(a.patient_id) AS Patients_Handled

FROM doctors d

LEFT JOIN appointments a

ON d.doctor_id=a.doctor_id

GROUP BY d.doctor_name

ORDER BY Patients_Handled DESC;



-- Doctor Revenue

SELECT

d.doctor_name,

SUM(a.consultation_fee) AS Revenue

FROM doctors d

JOIN appointments a

ON d.doctor_id=a.doctor_id

WHERE a.appointment_status='Completed'

GROUP BY d.doctor_name

ORDER BY Revenue DESC;



-- Department Revenue

SELECT

dp.department_name,

SUM(a.consultation_fee) AS Revenue

FROM departments dp

JOIN doctors d

ON dp.department_id=d.department_id

JOIN appointments a

ON d.doctor_id=a.doctor_id

WHERE a.appointment_status='Completed'

GROUP BY dp.department_name

ORDER BY Revenue DESC;



-- =====================================================
-- PAGE 4 : APPOINTMENT ANALYSIS
-- =====================================================


-- Appointment Status

SELECT

appointment_status,

COUNT(*) AS Total

FROM appointments

GROUP BY appointment_status;



-- Appointment Completion Rate

SELECT

ROUND(

SUM(

CASE

WHEN appointment_status='Completed'

THEN 1

ELSE 0

END

)*100/COUNT(*),2)

AS Completion_Rate

FROM appointments;



-- Monthly Appointment Trend

SELECT

MONTHNAME(appointment_date) AS Month,

COUNT(*) AS Appointments

FROM appointments

GROUP BY

MONTH(appointment_date),

MONTHNAME(appointment_date)

ORDER BY MONTH(appointment_date);



-- =====================================================
-- PAGE 5 : HOSPITAL OPERATIONS
-- =====================================================


-- Average Length of Stay

SELECT

ROUND(

AVG(

DATEDIFF(discharge_date, admission_date)

),2)

AS Average_Stay_Days

FROM admissions;



-- Diagnosis Analysis

SELECT

diagnosis,

COUNT(*) AS Cases

FROM admissions

GROUP BY diagnosis

ORDER BY Cases DESC;



-- Admission Type Analysis

SELECT

admission_type,

COUNT(*) AS Admissions

FROM admissions

GROUP BY admission_type;



-- =====================================================
-- PAGE 6 : FINANCIAL ANALYSIS
-- =====================================================


-- Revenue Components

SELECT

SUM(total_bill) AS Total_Revenue,

SUM(medicine_cost) AS Medicine_Cost,

SUM(room_charge) AS Room_Charges,

SUM(insurance_amount) AS Insurance_Claim

FROM billing;



-- Payment Status

SELECT

payment_status,

COUNT(*) AS Bills

FROM billing

GROUP BY payment_status;



-- Average Bill Value

SELECT

ROUND(AVG(total_bill),2)

AS Average_Bill

FROM billing;



-- =====================================================
-- BUSINESS INSIGHTS
-- =====================================================


-- Highest Revenue Department

SELECT

dp.department_name,

SUM(a.consultation_fee) AS Revenue

FROM departments dp

JOIN doctors d

ON dp.department_id=d.department_id

JOIN appointments a

ON d.doctor_id=a.doctor_id

WHERE a.appointment_status='Completed'

GROUP BY dp.department_name

ORDER BY Revenue DESC

LIMIT 1;



-- Top Doctor by Revenue

SELECT

d.doctor_name,

SUM(a.consultation_fee) AS Revenue

FROM doctors d

JOIN appointments a

ON d.doctor_id=a.doctor_id

WHERE a.appointment_status='Completed'

GROUP BY d.doctor_name

ORDER BY Revenue DESC

LIMIT 1;



-- Most Expensive Treatment

SELECT

treatment_name,

MAX(treatment_cost) AS Cost

FROM treatments

GROUP BY treatment_name

ORDER BY Cost DESC

LIMIT 1;
