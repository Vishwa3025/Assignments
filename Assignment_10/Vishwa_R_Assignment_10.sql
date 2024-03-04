CREATE TABLE Patients (
  patient_id INT PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender VARCHAR(1) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  email_address VARCHAR(25) UNIQUE,
  medical_history VARCHAR(100)
);

CREATE TABLE MedicalDepartments (
  department_ID INT PRIMARY KEY NOT NULL,
  department_name VARCHAR(25) NOT NULL UNIQUE,
  department_head VARCHAR(20)
);


CREATE TABLE Doctors (
  doctor_id INT PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  specialty VARCHAR(25) NOT NULL,
  department_id INT REFERENCES MedicalDepartments(department_id),
  phone_number VARCHAR(20) NOT NULL,
  email_address VARCHAR(25) UNIQUE
);

CREATE TABLE Appointments (
  appointment_id INT PRIMARY KEY,
  patient_id INT REFERENCES Patients(patient_id) NOT NULL,
  doctor_id INT REFERENCES Doctors(doctor_id) NOT NULL,
  appointment_date DATE NOT NULL,
  appointment_time TIME NOT NULL
);

CREATE TABLE MedicalRecords (
  record_id INT PRIMARY KEY,
  patient_id INT NOT NULL REFERENCES Patients(patient_id),
  doctor_id INT NOT NULL REFERENCES Doctors(doctor_id),
  visit_date DATE NOT NULL,
  diagnosis VARCHAR(20) NOT NULL,
  treatment_prescribed VARCHAR(100), 
  follow_up_instructions VARCHAR(100)
);
	

-- Inserting into Patients table
INSERT INTO Patients (patient_id, name, date_of_birth, gender, phone_number, email_address, medical_history, age)
VALUES 
  (1, 'John Doe', '1995-06-15', 'M', '1234567890', 'john.doe@example.com', 'Asthma', 29),
  (2, 'Jane Smith', '1988-09-22', 'F', '9876543210', 'jane.smith@example.com', 'Diabetes', 36),
  (3, 'Sam Wilson', '1972-04-10', 'M', '8765432109', 'sam.wilson@example.com', 'Hypertension', 52),
  (4, 'Emily Johnson', '1990-12-03', 'F', '7654321098', 'emily.johnson@example.com', 'Migraine', 34),
  (5, 'Daniel Brown', '1985-02-28', 'M', '6543210987', 'daniel.brown@example.com', 'None', 39);

  
-- Inserting into Doctors table
INSERT INTO Doctors (doctor_id, name, specialty, department_id, phone_number, email_address, consulting_fee)
VALUES 
  (105, 'Emma Turner', 'Ophthalmologist', 5, '5432109876', 'emma@email.com', 1700),
  (104, 'Michael Davis', 'Gynecologist', 4, '6543210987', 'michael@email.com', 100),
  (103, 'Olivia White', 'Orthopedic Surgeon', 3, '7654321098', 'white@email.com', 2000),
  (102, 'William Lee', 'Neurologist', 2, '8765432109', 'william@email.com', 800),
  (101, 'Sophia Rodriguez', 'Dermatologist', 1, '9876543210', 'sophia@email.com', 1800);


-- Inserting into Appointments table
INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, appointment_time)
VALUES 
  (1003 , 3, 102, '2023-08-15', '14:30:00'),
  (1001 , 1, 103, '2023-09-20', '09:45:00'),
  (1004 , 4, 104, '2024-01-10', '16:00:00'),
  (1002 , 2, 105, '2024-02-28', '11:15:00'),
  (1005 , 5, 101, '2024-04-05', '13:00:00');

-- Inserting into MedicalDepartments table
INSERT INTO MedicalDepartments (department_id, department_name, department_head)
VALUES 
  (1, 'Dermatology', 'Sophia Rodriguez'),
  (2, 'Neurology', 'William Lee'),
  (3, 'Orthopedics', 'Olivia White'),
  (4, 'Gynecology', 'Michael Davis'),
  (5, 'Ophthalmology', 'Emma Turner');

-- Inserting into MedicalRecords table
INSERT INTO MedicalRecords (record_id, patient_id, doctor_id, visit_date, diagnosis, treatment_prescribed, follow_up_instructions)
VALUES 
  (905, 5, 102, '2023-09-01', 'None', 'General Checkup', 'No follow-up needed'),
  (902, 2, 103, '2023-10-18', 'Hypertension', 'Prescribed medication', 'Follow-up in 3 months'),
  (904, 4, 104, '2024-02-15', 'Migraine', 'Pain relief medication', 'Follow-up in 2 weeks'),
  (901, 1, 105, '2024-03-05', 'Asthma', 'Inhaler prescribed', 'Follow-up in 1 month'),
  (903, 3, 101, '2024-05-15', 'Diabetes', 'Insulin treatment', 'Follow-up in 3 months');


-- Queries
-- 1. Retrieve all appointments scheduled for a specific doctor on a given date:

SELECT * 
FROM Appointments 
WHERE doctor_id = 105 AND appointment_date = '2024-02-28';



SELECT AVG(age) AS average_age
FROM Patients
WHERE patient_id IN (
    SELECT patient_id
    FROM Appointments
    WHERE doctor_id IN (
        SELECT doctor_id
        FROM Doctors
        WHERE department_id = 1  -- Replace 1 with the actual department_id for Dermatology
    )
);


-- 3. Update the diagnosis and treatment for a particular medical record:

UPDATE MedicalRecords
SET diagnosis = 'Fever', treatment_prescribed = 'checkup'
WHERE record_id = 901;



-- 4. Delete a patient record and all associated appointments and medical records:

DELETE FROM Patients
WHERE patient_id = 103;

DELETE FROM Appointments
WHERE patient_id = 103;

DELETE FROM MedicalRecords
WHERE patient_id = 103;


-- 5. Retrieve all appointments scheduled for a specific doctor on a given date, including the consultation fee:

SELECT A.*, D.name AS doctor_name, D.specialty, D.department_id, D.phone_number AS doctor_phone, D.consulting_fee, D.email_address AS doctor_email
FROM Appointments A
JOIN Doctors D ON A.doctor_id = D.doctor_id
WHERE A.doctor_id = 103 AND A.appointment_date = '2023-09-20';


-- 6. Find the total number of patients seen by each doctor and the total revenue generated by each doctor:

SELECT D.doctor_id, D.name AS doctor_name, COUNT(DISTINCT A.patient_id) AS total_patients, SUM(D.consulting_fee) AS total_revenue
FROM Doctors D
LEFT JOIN Appointments A ON D.doctor_id = A.doctor_id
GROUP BY D.doctor_id, D.name;



-- 7. Identify patients with a specific medical condition (e.g., diabetes, hypertension) and the total cost incurred by them:

SELECT P.*, MR.diagnosis, MR.treatment_prescribed
FROM Patients P
JOIN MedicalRecords MR ON P.patient_id = MR.patient_id
WHERE MR.diagnosis = 'Diabetes' OR MR.diagnosis = 'Hypertension';




