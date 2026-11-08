USE university_db;
-- Redundancy count: Dr. Perera's email appears in 3 rows
SELECT COUNT(*) AS copies FROM registration_flat WHERE lecturer_email='perera@uni.lk';
-- Update anomaly: update only one row, then inspect conflicting lecturer emails
UPDATE registration_flat SET lecturer_email='perera.new@uni.lk' WHERE student_id='S001' AND course_code='CS101';
SELECT DISTINCT lecturer_name, lecturer_email FROM registration_flat WHERE lecturer_name='Dr. Perera';
-- Insert anomaly: expected to fail because student_id is part of the primary key and is missing
INSERT INTO registration_flat (course_code,course_title,credits,lecturer_name,lecturer_email,department_code,department_name)
VALUES ('CS301','Software Engineering',3,'Dr. Fernando','fernando@uni.lk','D01','Computer Science');
-- Delete anomaly: removes the only record that stores CS201 details
DELETE FROM registration_flat WHERE student_id='S004';
SELECT * FROM registration_flat WHERE course_code='CS201';
