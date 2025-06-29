-- Drop the table if it already exists --
DROP TABLE IF EXISTS Hospital_data;

-- Create the employees table --
CREATE TABLE HOSPITAL_DATA (
	HOSPITAL_NAME VARCHAR(50) NOT NULL,
	hospital_LOCATION VARCHAR(20) NOT NULL,
	DEPARTMENT VARCHAR(20) NOT NULL,
	DOCTERS_COUNT INT NOT NULL,
	PATIENTS_COUNT INT NOT NULL,
	ADMISSION_DATE DATE,
	DISCHARGE_DATE DATE,
	MEDICAL_EXPENSES DECIMAL(10, 2)
);


--IMPORT CSV FILE 
copy 
Hospital_data(Hospital_Name, Hospital_Location, Department, Doctors_Count,	Patients_Count,	Admission_Date,	Discharge_Date,	Medical_Expenses)
from ‪C:\Users\91767\Downloads\Hospital_Data.csv
delimiter','
csv header;

--1. Total Number of Patients--
Select Sum(patients_count) as total_patients
from Hospital_data ;


--2. Average Number of Doctors per Hospital--
Select Avg(docters_count) as avreage_docters
from Hospital_data ;


--Top 3 Departments with the Highest Number of Patients--
Select  distinct department, sum(patients_count) as Total_patients
from Hospital_data 
group by department
order by Total_patients desc
limit 3;


--4. Hospital with the Maximum Medical Expenses--
Select  hospital_name, hospital_location, medical_expenses
from Hospital_data
order by medical_expenses desc
limit 1;

 
--5. Daily Average Medical Expenses--
WITH
  daily_totals AS (
    SELECT
      DATE (admission_date) AS order_date,
      SUM(medical_expenses) AS daily_expenses
    FROM
      Hospital_data
    GROUP BY
      order_date
  )
SELECT
  AVG(daily_expenses) AS avg_daily_expenses
FROM
  daily_totals;


--6. Longest Hospital Stay--
SELECT hospital_name, hospital_location,
  admission_date,
  discharge_date,
  (discharge_date::date - admission_date::date) AS day_difference
FROM
  Hospital_data
  order by day_difference desc
  limit 1;
  


--7. Total Patients Treated Per City--
Select distinct hospital_location, sum(patients_count) as No_of_patients
from Hospital_data 
group by hospital_location
order by No_of_patients desc
;


--8. Average Length of Stay Per Department--
SELECT
  department,
  AVG((admission_date::date - discharge_date::date)) AS avg_day_difference
FROM
  Hospital_data
GROUP BY
  department;


--9. Identify the Department with the Lowest Number of Patients--
Select  distinct department, sum(patients_count) as Lowest_dept_patient
from Hospital_data 
group by department
order by Lowest_dept_patient asc
limit 1;

--10. Monthly Medical Expenses Report--
SELECT
  DATE_TRUNC('month', admission_date) AS month,
  SUM(medical_expenses) AS total_amount
FROM
  Hospital_data
GROUP BY
  month
ORDER BY
  month;
  