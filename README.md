# 🏥 Hospital Management Analytics System

## 📌 Project Overview

The **Hospital Management Analytics System** is a data analytics project designed to analyze healthcare operations using **SQL and Power BI**.

The project focuses on managing hospital-related data including patients, doctors, appointments, admissions, treatments, and billing information. SQL is used to perform data analysis and generate meaningful insights, while Power BI is used to build interactive dashboards for data visualization and decision-making.

---

## 🎯 Business Objectives

The main objectives of this project are:

- Analyze patient admission trends
- Monitor doctor performance
- Track appointment patterns
- Measure hospital bed occupancy
- Analyze treatment costs and revenue
- Identify patient readmission trends
- Calculate average length of hospital stay
- Improve operational efficiency through data-driven insights

---

# 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| MySQL | Database creation and SQL analysis |
| SQL | Data extraction and business insights |
| Power BI | Interactive dashboards and visualization |
| Microsoft Excel | Data preparation and analysis |
| Git & GitHub | Version control |

---

## 📂 Project Structure

Hospital-Management-SQL-PowerBI-Analytics

│
├── Dataset
│   ├── patients.csv
│   ├── doctors.csv
│   ├── appointments.csv
│   ├── treatments.csv
│   └── billing.csv
│
├── SQL
│   ├── 01_Create_Database.sql
│   ├── 02_Create_Tables.sql
│   ├── 03_Insert_Data.sql
│   ├── 04_Analysis_Queries.sql
│   └── 05_Dashboard_KPIs.sql
│
├── Power-BI
│   └── Hospital_Dashboard.pbix
│
├── Images
│   ├── database_schema.png
│   └── dashboard.png
│
├── README.md
└── LICENSE


---

# 🗄️ Database Design

The database is designed using a relational model containing multiple interconnected entities.

## Main Tables

### 👤 Patients Table
Stores patient information:

- Patient ID
- Patient Name
- Gender
- Age
- City
- Registration Date


### 👨‍⚕️ Doctors Table

Stores doctor details:

- Doctor ID
- Doctor Name
- Specialization
- Department


### 📅 Appointments Table

Stores appointment information:

- Appointment ID
- Patient ID
- Doctor ID
- Appointment Date
- Appointment Status


### 🏥 Admissions Table

Stores hospitalization details:

- Admission Date
- Discharge Date
- Room Information
- Length of Stay


### 💊 Treatments Table

Stores treatment-related information:

- Treatment ID
- Patient ID
- Doctor ID
- Treatment Type
- Treatment Cost

---

# 📊 SQL Analysis Performed

The project includes SQL analysis using:

✔ Database Design  
✔ Table Relationships  
✔ Primary & Foreign Keys  
✔ Joins  
✔ Aggregate Functions  
✔ GROUP BY & HAVING  
✔ Subqueries  
✔ Common Table Expressions (CTEs)  
✔ Window Functions  
✔ Views  


---

# 📈 Power BI Dashboard

The Power BI dashboard provides interactive visual analysis of hospital performance.

## Dashboard Insights:

### 🧑 Patient Analysis

- Total patient count
- Patient demographics
- Admission trends
- Monthly patient registrations


### 👨‍⚕️ Doctor Performance

- Doctor-wise patient handling
- Department performance
- Appointment statistics


### 💰 Financial Analysis

- Treatment cost analysis
- Department-wise revenue
- Cost distribution


### 🏥 Hospital Operations

- Bed occupancy analysis
- Average length of stay
- Readmission analysis


---

# 📷 Dashboard Preview
(Add screenshots after completing Power BI dashboard)


---

# 🔍 Key Insights Generated

The project helps identify:

- Departments with maximum patient visits
- Doctors managing the highest number of appointments
- Treatment categories with higher costs
- Admission trends over time
- Areas for improving hospital efficiency

---

# 🚀 How to Run the Project

# # 1. Clone Repository

git clone https://github.com/imsrthk19/Hospital-Management-Analytics.git

01_create_database.sql
02_create_tables.sql
03_insert_sample_data.sql
04_analysis_queries.sql

# # 2. Setup Database

Open MySQL Workbench and execute SQL files in order:

01_create_database.sql
02_create_tables.sql
03_insert_sample_data.sql
04_analysis_queries.sql

# # 3. Open Power BI Dashboard

Open:
PowerBI/Hospital_Analytics_Dashboard.pbix

using Microsoft Power BI Desktop.


📚 Skills Demonstrated
SQL Query Writing
Data Modeling
Database Management
Data Cleaning
Exploratory Data Analysis
Business Intelligence
Dashboard Development
Healthcare Analytics

👨‍💻 Author
Sarthak Srivastava
B.Tech Computer Science
GLA University, Mathura

GitHub:
https://github.com/imsrthk19

LinkedIn:
https://www.linkedin.com/in/sarthaksrivastava-2358a12a1/

⭐ If you find this project useful, consider giving it a star!

```bash