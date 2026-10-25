-- Step 1: Create a table to store patient visit information
-- Uses VARCHAR2 (text), INTEGER (whole numbers), FLOAT (decimals), and TIMESTAMP (date and time)
CREATE TABLE patient_visits (
  visit_id       INTEGER PRIMARY KEY,
  first_name     VARCHAR2(50),
  last_name      VARCHAR2(50),
  gender         VARCHAR2(10),
  age            INTEGER,
  weight_lbs     FLOAT,
  temperature_f  NUMBER(4,1),
  visit_date     TIMESTAMP,
  department     VARCHAR2(50),
  insurance      VARCHAR2(50)
);
-- Step 2: Insert 12 rows of sample patient visit data
INSERT INTO patient_visits VALUES (1, 'Maria', 'Lopez', 'F', 34, 142.5, 98.6, TIMESTAMP '2026-01-05 09:15:00', 'Family Medicine', 'Aetna');
INSERT INTO patient_visits VALUES (2, 'James', 'Carter', 'M', 58, 210.3, 99.1, TIMESTAMP '2026-01-06 10:30:00', 'Cardiology', 'Medicare');
INSERT INTO patient_visits VALUES (3, 'Aisha', 'Khan', 'F', 27, 128.0, 98.4, TIMESTAMP '2026-01-07 14:00:00', 'Family Medicine', 'Cigna');
INSERT INTO patient_visits VALUES (4, 'Robert', 'Chen', 'M', 45, 185.7, 100.2, TIMESTAMP '2026-01-08 08:45:00', 'Urgent Care', 'UnitedHealthcare');
INSERT INTO patient_visits VALUES (5, 'Linda', 'Brooks', 'F', 67, 160.2, 98.9, TIMESTAMP '2026-01-09 11:00:00', 'Cardiology', 'Medicare');
INSERT INTO patient_visits VALUES (6, 'David', 'Nguyen', 'M', 39, 175.4, 98.7, TIMESTAMP '2026-01-12 13:30:00', 'Orthopedics', 'Aetna');
INSERT INTO patient_visits VALUES (7, 'Sarah', 'Patel', 'F', 22, 119.8, 99.5, TIMESTAMP '2026-01-13 15:45:00', 'Urgent Care', 'Medicaid');
INSERT INTO patient_visits VALUES (8, 'Michael', 'Rivera', 'M', 71, 190.1, 98.2, TIMESTAMP '2026-01-14 09:00:00', 'Cardiology', 'Medicare');
INSERT INTO patient_visits VALUES (9, 'Emily', 'Johnson', 'F', 31, 135.6, 98.6, TIMESTAMP '2026-01-15 10:15:00', 'OB/GYN', 'Cigna');
INSERT INTO patient_visits VALUES (10, 'Kevin', 'Brown', 'M', 50, 220.9, 101.0, TIMESTAMP '2026-01-16 16:20:00', 'Urgent Care', 'UnitedHealthcare');
INSERT INTO patient_visits VALUES (11, 'Grace', 'Kim', 'F', 84, 115.3, 98.0, TIMESTAMP '2026-01-19 08:30:00', 'Family Medicine', 'Medicare');
INSERT INTO patient_visits VALUES (12, 'Anthony', 'Russo', 'M', 19, 165.0, 98.8, TIMESTAMP '2026-01-20 12:00:00', 'Orthopedics', 'Medicaid');

-- Check that all 12 rows were added
SELECT * FROM patient_visits;

-- Step 3: Update Aisha Khan's insurance from Cigna to Blue Cross
UPDATE patient_visits
SET insurance = 'Blue Cross'
WHERE visit_id = 3;

-- Check the change
SELECT * FROM patient_visits WHERE visit_id = 3;

-- Step 4: Add a new column to track whether a follow-up visit is needed
ALTER TABLE patient_visits ADD follow_up_needed VARCHAR2(3);

-- Fill in the new column: patients with a temperature of 100 or higher need a follow-up
UPDATE patient_visits SET follow_up_needed = 'Yes' WHERE temperature_f >= 100;
UPDATE patient_visits SET follow_up_needed = 'No' WHERE temperature_f < 100;

-- Check the new column
SELECT * FROM patient_visits;

-- Step 5: Delete any patient visits for patients under age 21
DELETE FROM patient_visits WHERE age < 21;

-- Check that the row was removed (should now show 11 rows)
SELECT * FROM patient_visits;

-- Save all changes to the table permanently
COMMIT;

-- Step 6.1: Select specific columns from the HR employees table, limited to the first 100 rows
SELECT employee_id, first_name, last_name, job_id, salary, hire_date
FROM hr.employees
ORDER BY employee_id
FETCH FIRST 100 ROWS ONLY;
