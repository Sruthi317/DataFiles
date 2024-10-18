create database HealthCare

CREATE TABLE PatientDemographics(
Patient_id INT PRIMARY KEY,
Patient_name VARCHAR(255),
Age INT,
Gender VARCHAR(50),
Location VARCHAR(255)
);

CREATE TABLE vitals_fact (
Vitals_id INT PRIMARY KEY,
Patient_id INT,
heart_rate INT, -- In beats per minute
blood_pressure VARCHAR(10), -- Systolic/Diastolic
temperature DECIMAL(4, 2), -- In Celsius
reading_time TIMESTAMP
FOREIGN KEY (Patient_id) REFERENCES PatientDemographics(Patient_id)
);

CREATE TABLE MedicalHistory (
    History_id INT PRIMARY KEY,
    Patient_id INT,
    Condition VARCHAR(255) NOT NULL,
    DiagnosisDate DATE,
    Treatment TEXT,
    FOREIGN KEY (Patient_id) REFERENCES PatientDemographics(Patient_id)
);

CREATE TABLE Health_risk (
Risk_id INT PRIMARY KEY,
Patient_id INT,
Risk_type VARCHAR(255), -- e.g., "Heart Disease Risk"
Risk_score DECIMAL(4, 2), -- Risk score from 0 to 1
Assessment_time TIMESTAMP,
FOREIGN KEY (Patient_id) REFERENCES PatientDemographics(Patient_id)
);

use Healthcare

/* monitor patient's health metrics */

WITH LatestVitals AS (
    SELECT
        v.Patient_id,
        v.heart_rate,
        v.blood_pressure,
        v.temperature,
        v.reading_time,
        ROW_NUMBER() OVER (PARTITION BY v.Patient_id ORDER BY v.reading_time DESC) AS rn
    FROM vitals_fact v
)
SELECT
    p.Patient_id,
    p.Patient_name,
    lv.heart_rate,
    lv.blood_pressure,
    lv.temperature,
    lv.reading_time
FROM LatestVitals lv
JOIN PatientDemographics p ON lv.Patient_id = p.Patient_id
WHERE lv.rn = 1;

/* identify abnormal vitals */

SELECT
    p.Patient_id,
    p.Patient_name,
    v.heart_rate,
    v.blood_pressure,
    v.temperature,
    v.reading_time
FROM vitals_fact v
JOIN PatientDemographics p ON v.Patient_id = p.Patient_id
WHERE
    v.heart_rate < 60 OR v.heart_rate > 100 OR
    CAST(PARSENAME(v.blood_pressure, 2) AS INT) < 90 OR
    CAST(PARSENAME(v.blood_pressure, 1) AS INT) < 60 OR
    CAST(PARSENAME(v.blood_pressure, 2) AS INT) > 180 OR
    CAST(PARSENAME(v.blood_pressure, 1) AS INT) > 120 OR
    v.temperature < 36.5 OR v.temperature > 37.5;

/* calculate risk scores for health conditions */

;WITH RiskScores AS (
    SELECT
        v.Patient_id,
        COALESCE(SUM(
            CASE
                WHEN CAST(PARSENAME(v.blood_pressure, 2) AS INT) > 140 OR
                     CAST(PARSENAME(v.blood_pressure, 1) AS INT) > 90 THEN 2
                WHEN v.heart_rate > 100 THEN 1
                ELSE 0
            END
        ), 0) AS risk_score
    FROM vitals_fact v
    GROUP BY v.Patient_id
)
SELECT
    p.Patient_id,
    p.Patient_name,
    rs.risk_score,
    GETDATE() AS assessment_time
FROM RiskScores rs
JOIN PatientDemographics p ON rs.Patient_id = p.Patient_id;





