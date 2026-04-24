-- =============================
-- PHẦN I: TẠO DATABASE + TABLE
-- =============================

DROP DATABASE IF EXISTS course_online;
CREATE DATABASE course_online;
USE course_online;

-- Student
CREATE TABLE student(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(255) NOT NULL,
    birthday DATE,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Teacher
CREATE TABLE teacher(
	teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Course
CREATE TABLE course(
	course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    description VARCHAR(255) NOT NULL,
    number_of_lesson INT NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

-- Enrollment
CREATE TABLE enrollment(
	enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- Score
CREATE TABLE score(
	score_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    middle_score INT NOT NULL,
    final_score INT NOT NULL,
    UNIQUE(student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- =============================
-- PHẦN II: THÊM DỮ LIỆU
-- =============================

-- Student
INSERT INTO student(fullname, birthday, email) VALUES
('Nguyen Van A', '2003-01-01', 'a@gmail.com'),
('Tran Thi B', '2003-02-02', 'b@gmail.com'),
('Le Van C', '2003-03-03', 'c@gmail.com'),
('Pham Thi D', '2003-04-04', 'd@gmail.com'),
('Hoang Van E', '2003-05-05', 'e@gmail.com');

-- Teacher
INSERT INTO teacher(fullname, email) VALUES
('Teacher 1', 't1@gmail.com'),
('Teacher 2', 't2@gmail.com'),
('Teacher 3', 't3@gmail.com'),
('Teacher 4', 't4@gmail.com'),
('Teacher 5', 't5@gmail.com');

-- Course
INSERT INTO course(course_name, description, number_of_lesson, teacher_id) VALUES
('SQL Basic', 'Hoc SQL co ban', 10, 1),
('Java Core', 'Lap trinh Java', 15, 2),
('Web HTML', 'HTML CSS', 8, 3),
('Python', 'Python tu co ban', 12, 4),
('Database', 'He quan tri CSDL', 14, 5);

-- Enrollment
INSERT INTO enrollment(student_id, course_id) VALUES
(1,1),
(1,2),
(2,1),
(3,3),
(4,4),
(5,5);

-- Score
INSERT INTO score(student_id, course_id, middle_score, final_score) VALUES
(1,1,8,9),