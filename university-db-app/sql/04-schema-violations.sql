USE university_db;
-- Run each statement separately. Each is expected to fail.
INSERT INTO student (student_code,full_name,email,phone) VALUES ('S010','Test One','test1@example.com','0771234567');
INSERT INTO student (student_code,full_name) VALUES ('S011','Test Two');
INSERT INTO course (code,title,credits,lecturer_id) VALUES ('CS301','Test Course','three',1);
INSERT INTO student (student_code,full_name,email) VALUES ('S001','Test Three','test3@example.com');
INSERT INTO department (code,name) VALUES ('D0000000001','Too Long Code');
INSERT INTO enrollment (student_id,course_id,grade) VALUES (1,999,'A');
DELETE FROM department WHERE code='D01';
INSERT INTO course (code,title,credits,lecturer_id) VALUES ('CS302','Test Course',10,1);
-- Explicit schema change demo; execute, inspect, then undo:
ALTER TABLE student ADD COLUMN phone VARCHAR(15);
DESCRIBE student;
SELECT * FROM student;
ALTER TABLE student DROP COLUMN phone;
