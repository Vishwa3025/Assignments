CREATE TABLE departments (
    dep_id INTEGER PRIMARY KEY,
    dep_name VARCHAR(50) NOT NULL
);

CREATE TABLE teachers (
    teacher_id INTEGER PRIMARY KEY,
    teacher_name VARCHAR(100) NOT NULL,
    dept_id INTEGER REFERENCES departments(dep_id) NOT NULL
);

CREATE TABLE students (
    stu_id INTEGER PRIMARY KEY,
    stu_name VARCHAR(100) NOT NULL,
    dept_id INTEGER REFERENCES departments(dep_id) NOT NULL,
    semester INTEGER NOT NULL
);

CREATE TABLE subjects (
    sub_code VARCHAR(10) PRIMARY KEY,
    sub_name VARCHAR(100) NOT NULL
);

CREATE TABLE semester_enrollment (
    enrol_id INTEGER PRIMARY KEY,
    stu_id INTEGER REFERENCES students(stu_id) NOT NULL,
    sub_code VARCHAR(10) REFERENCES subjects(sub_code) NOT NULL,
    semester INTEGER NOT NULL,
	teacher_id INTEGER NOT NULL
);


INSERT INTO departments VALUES
    (1, 'CSE'),
    (2, 'ECE'),
    (3, 'IT');

INSERT INTO teachers VALUES
    (1, 'Gopi', 3),
    (2, 'Senthil', 1),
    (3, 'Shalini', 1),
    (4, 'Ashok', 2),
    (5, 'Arun', 2),
    (6, 'Meera', 3);
	
INSERT INTO students VALUES
    (101, 'tamil', 1, 1),
    (102, 'pranav', 1, 1),
    (201, 'sakthi', 2, 3),
    (202, 'ashwin', 2, 3),
    (301, 'meera', 3, 2),
    (302, 'sanjay', 3, 2);
	
INSERT INTO subjects VALUES
    ('CS8691', 'Artificial Intelligence'),
    ('CS8651', 'Internet Programming'),
    ('CS8592', 'Object Oriented Analysis and Design'),
    ('CS8501', 'Theory of Computation'),
    ('CS8591', 'Computer Networks'),
    ('CS8603', 'Python');
	
INSERT INTO semester_enrollment VALUES
    (1001, 302, 'CS8591', 2, 1),
    (1002, 202, 'CS8592', 3, 2),
    (1003, 102, 'CS8691', 1, 3),
    (1004, 301, 'CS8603', 2, 4),
    (1005, 201, 'CS8501', 3, 5),
    (1006, 101, 'CS8501', 1, 6);
	

