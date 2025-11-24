-- Combine patient names and staff names into a single list.
use hospital;
SELECT name AS full_name, 'Patient' AS source
FROM patients
UNION ALL
SELECT staff_name AS full_name, 'Staff' AS source
FROM staff
ORDER BY full_name;


-- 2. Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
SELECT
    patient_id,
    name,
    satisfaction,
    'High Performer' AS category
FROM patients
WHERE satisfaction >= 90

UNION ALL

SELECT
    patient_id,
    name,
    satisfaction,
    'Low Performer' AS category
FROM patients
WHERE satisfaction < 50

ORDER BY satisfaction DESC;



-- 3.List all unique names from both patients and staff tables.
SELECT name AS full_name
FROM patients

UNION

SELECT staff_name AS full_name
FROM staff

ORDER BY full_name;



### Daily Challenge:

-- **Question:** Create a comprehensive personnel and patient list showing: identifier
--  (patient_id or staff_id), full name, type ('Patient' or 'Staff'), and associated 
-- service. Include only those in 'surgery' or 'emergency' services. Order by type, 
-- then service, then name.

-- Select patients in the specified services
SELECT
    patient_id AS identifier,
    name AS full_name,
    'Patient' AS type,
    service
FROM patients
WHERE service IN ('surgery', 'emergency')
UNION ALL
SELECT
    staff_id AS identifier,
    staff_name AS full_name,
    'Staff' AS type,
    service
FROM staff
WHERE service IN ('surgery', 'emergency')

ORDER BY
    type,
    service,
    full_name;