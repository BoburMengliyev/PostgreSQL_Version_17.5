CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birth_year INT NOT NULL,
	email VARCHAR(100)
);

CREATE TABLE courses(
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL,
	category VARCHAR(50),
	price NUMERIC(8,2)
);

CREATE TABLE enrollments(
	enrollment_id SERIAL PRIMARY KEY,
	student_id INT REFERENCES students(student_id),
	course_id INT REFERENCES courses(course_id),
	enroll_date DATE NOT NULL
);

INSERT INTO students (first_name, last_name, birth_year, email) VALUES 
('Ali', 'Rahmon', 2000, 'ali@email.com'),
('Zarina', 'Sharipova', 1999, 'zarina@email.com'),
('Omar', 'Saidov', 2001, 'omar@email.com'),
('Nilufar', 'Umarova', 2002, 'nilufar@email.com'),
('Karim', 'Hamidov', 2000, 'karim@email.com');

INSERT INTO courses (course_name, category, price) VALUES 
('Python Basics', 'Programming', 150),
('Web Design', 'Design', 200),
('English A1', 'Language', 100),
('Excel Advanced', 'Office', 120),
('C# Fundamentals', 'Programming', 250);

INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES 
(1, 1, '2024-04-01'),
(2, 2, '2024-04-05'),
(3, 3, '2024-04-10'),
(4, 1, '2024-04-12'),
(5, 5, '2024-04-15');

SELECT DISTINCT category FROM courses;

SELECT * FROM students 
ORDER BY birth_year ASC;

SELECT * FROM courses 
LIMIT 3 OFFSET 0;

SELECT student_id FROM students 
WHERE student_id IN(1, 3, 5);

SELECT * FROM courses 
WHERE price BETWEEN 100 AND 300;

SELECT COUNT(*) FROM courses;

SELECT AVG(price) FROM courses;

SELECT MIN(price) FROM courses;

SELECT MAX(price) FROM courses;

SELECT SUM(price) FROM courses;