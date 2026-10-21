DROP TABLE IF EXISTS Hospital_Data;
CREATE TABLE Hospital_Data(
    Hospital_Name VARCHAR(100),
    Location VARCHAR(100),
    Department VARCHAR(100),
    Doctors_Count INTEGER,
    Patients_Count INTEGER,
    Admission_Date DATE,
    Discharge_Date DATE,
    Medical_Expenses NUMERIC(12,2)
);

SELECT * FROM Hospital_Data;

COPY Hospital_Data (Hospital_Name, Location, Department, Doctors_Count, Patients_Count,
	Admission_Date,Discharge_Date,Medical_Expenses)
FROM 'C:\Users\sahil\OneDrive\Desktop\sanchit\SQL\SQL Assignment\Hospital_data.csv'
CSV HEADER;

-- Q1 total number of patient
SELECT SUM(Patients_Count) AS total_patients
FROM Hospital_Data;

-- Q2 average number of doctors per hospital
SELECT Hospital_Name, AVG(Doctors_Count) AS average_doctors
FROM Hospital_Data
GROUP BY Hospital_Name
ORDER BY average_doctors ASC;

-- Q3 Top 3 Departments with the Highest Number of Patients 
SELECT Department, SUM(Patients_Count) AS total_patients
FROM Hospital_Data
GROUP BY Department
ORDER BY total_patients DESC
LIMIT 3;

-- Q4 Hospital with the Maximum Medical Expenses 
SELECT Hospital_Name, SUM(Medical_Expenses) AS total_medical_expenses
FROM Hospital_Data
GROUP BY Hospital_Name
ORDER BY total_medical_expenses DESC
LIMIT 1;

-- Q5 Daily Average Medical Expenses 








-- Q6 Longest Hospital Stay 
SELECT Hospital_Name, Location, Department, Admission_Date, Discharge_Date,
    (Discharge_Date - Admission_Date) AS Length_of_Stay_Days
FROM Hospital_Data
ORDER BY Length_of_Stay_Days DESC
LIMIT 1;

-- Q7 Total Patients Treated Per City 
SELECT Location AS city, SUM(Patients_Count) AS total_patients
FROM Hospital_Data
GROUP BY Location
ORDER BY total_patients DESC;

-- Q8 Average Length of Stay Per Department 










-- Q9 Identify the Department with the Lowest Number of Patients 
SELECT Department, SUM(Patients_Count) AS total_patients
FROM Hospital_Data
GROUP BY Department
ORDER BY total_patients ASC
LIMIT 1;

-- Q10: Monthly Medical Expenses Report

SELECT
    TO_CHAR(Admission_Date, 'YYYY-MM') AS month,
    ROUND(SUM(Medical_Expenses), 2) AS total_medical_expenses
FROM Hospital_Data
GROUP BY TO_CHAR(Admission_Date, 'YYYY-MM')
ORDER BY month;
