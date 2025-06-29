#  Hospital Data SQL Project

## 📊 Overview

This SQL project provides insights into hospital operations such as patient volume, staff distribution, medical expenses, and length of stay. The dataset covers various departments across different hospital locations and includes SQL queries for effective healthcare data analysis.

---

## Files

- Hospital_Data.sql: Main SQL script that contains:
  - Table creation
  - Data import using `COPY`
  - Analytical SQL queries

---

##  Database Schema

**Table: `HOSPITAL_DATA`**

| Column Name       | Data Type     | Description                         |
|-------------------|---------------|-------------------------------------|
| `HOSPITAL_NAME`     | `VARCHAR(50)`   | Name of the hospital                |
| `HOSPITAL_LOCATION` | `VARCHAR(20)`   | City/location of the hospital       |
| `DEPARTMENT`        | `VARCHAR(20)`   | Medical department                  |
| `DOCTERS_COUNT`     | `INT`           | Number of doctors                   |
| `PATIENTS_COUNT`    | `INT`           | Number of patients                  |
| `ADMISSION_DATE`    | `DATE`          | Patient admission date              |
| `DISCHARGE_DATE`    | `DATE`          | Patient discharge date              |
| `MEDICAL_EXPENSES`  | `DECIMAL(10,2)` | Total medical expenses incurred     |

---

##  Data Import

To load data from a CSV file into the `HOSPITAL_DATA` table:

```sql
COPY Hospital_data(Hospital_Name, Hospital_Location, Department, Doctors_Count, Patients_Count, Admission_Date, Discharge_Date, Medical_Expenses)
FROM 'C:\\Users\\91767\\Downloads\\Hospital_Data.csv'
DELIMITER ','
CSV HEADER;
