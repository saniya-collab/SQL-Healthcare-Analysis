CREATE TABLE hospital_data (
    hospital_name VARCHAR(50),
    location VARCHAR(50),
    department VARCHAR(50),
    doctors_count INT,
    patients_count INT,
    admission_date DATE,
    discharge_date DATE,
    medical_expenses NUMERIC
);

SELECT * from hospital_data;

--1. Total Number of Patients
--Find the total number of patients across all hospitals.

SELECT SUM(patients_count) AS total_patients 
FROM hospital_data;

--2. Average Number of Doctors per Hospital
--Retrieve the average count of doctors available in each hospital.

SELECT hospital_name, AVG(doctors_count) AS avg_doctors
FROM hospital_data
GROUP BY hospital_name;

--3. Top 3 Departments with the Highest Number of Patients
--Find the top 3 hospital departments that have the highest number of patients.

SELECT department, SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY department
ORDER BY total_patients DESC
LIMIT 3;

--4. Hospital with the Maximum Medical Expenses
--Identify the hospital that recorded the highest medical expenses.

SELECT hospital_name, SUM(medical_expenses) AS total_expenses
FROM hospital_data
GROUP BY hospital_name
ORDER BY total_expenses DESC
LIMIT 1;

--5. Daily Average Medical Expenses
--Calculate the average medical expenses per day for each hospital.

SELECT hospital_name, AVG(medical_expenses) AS avg_daily_expenses
FROM hospital_data
GROUP BY hospital_name;

--6. Longest Hospital Stay
--Find the patient with the longest stay by calculating the difference between Discharge Date and Admission date.

SELECT hospital_name, admission_date, discharge_date, 
       (discharge_date - admission_date) AS stay_duration
FROM hospital_data
ORDER BY stay_duration DESC
LIMIT 1;

--7. Total Patients Treated Per City
--Counts the total number of patients treated in each city.

SELECT location, SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY location;

--8. Average Length of Stay Per Department
--Calculatre the average number of days patients spend in each department.

SELECT department, AVG(discharge_date - admission_date) AS avg_stay_duration
FROM hospital_data
GROUP BY department;

--9. Department with the Lowest Number of Patients
--Find the department with the least number of patients.

SELECT department, SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY department
ORDER BY total_patients ASC
LIMIT 1;

--10. Monthly Medical Expenses Report
--Group the data by month and calculate the total medical expenses for each month.

SELECT TO_CHAR(admission_date, 'YYYY-MM') AS month, SUM(medical_expenses) AS total_expenses
FROM hospital_data
GROUP BY month
ORDER BY month;














