-- Queries

-- 1.  Which teacher teaches which subject for each semester?

SELECT t.teacher_name, s.sub_name, se.semester
FROM teachers t
JOIN semester_enrollment se ON t.teacher_id = se.teacher_id
JOIN subjects s ON s.sub_code = se.sub_code;


-- 2. How many students are enrolled in semester 1

SELECT COUNT(*) AS num_students
FROM semester_enrollment
WHERE semester = 1;


-- 3. How many students are enrolled in the ECE department?

SELECT COUNT(*) AS num_students
FROM students
WHERE dept_id = (SELECT dep_id FROM departments WHERE dep_name = 'ECE');

-- 4. How many students are enrolled in semester 2 in the ECE and CSE departments?

SELECT d.dep_name, COUNT(*) AS num_students
FROM students s
JOIN departments d ON s.dept_id = d.dep_id
WHERE s.semester = 2 AND (d.dep_name = 'ECE' OR d.dep_name = 'CSE')
GROUP BY d.dep_name;


-- 5. Which teacher teaches the Python subject in semester 3?

SELECT t.teacher_name
FROM teachers t
JOIN semester_enrollment se ON t.teacher_id = se.teacher_id
JOIN subjects s ON se.sub_code = s.sub_code
WHERE s.sub_name = 'Python' AND se.semester = 3;


-- 6. From which department does the teacher named "Meera" belong?

SELECT d.dep_name
FROM teachers t
JOIN departments d ON t.dept_id = d.dep_id
WHERE t.teacher_name = 'Meera';


-- 7. In which semester is the student named "Arun" enrolled?

SELECT semester
FROM students
WHERE stu_name = 'Arun';

-- 8. In which department and semester is the student named "Arul" enrolled?

SELECT d.dep_name, s.semester
FROM students s
JOIN departments d ON s.dept_id = d.dep_id
WHERE s.stu_name = 'Arul';

 
-- 9. Teacher who taught Python for ECE students is from which department?

SELECT d.dep_name
FROM teachers t
JOIN semester_enrollment se ON t.teacher_id = se.teacher_id
JOIN subjects s ON se.sub_code = s.sub_code
JOIN departments d ON t.dept_id = d.dep_id
WHERE s.sub_name = 'Python' AND d.dep_name = 'ECE';
