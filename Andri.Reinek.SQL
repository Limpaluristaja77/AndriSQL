CREATE DATABASE areinek;
USE areinek;

CREATE TABLE student (
    id BIGINT PRIMARY KEY,
    firstname VARCHAR(256),
    lastname VARCHAR(256)
);

CREATE TABLE stgroup (
    code VARCHAR(8) PRIMARY KEY,
    description VARCHAR(256)
);

CREATE TABLE course (
    code VARCHAR(8) PRIMARY KEY,
    description VARCHAR(256)
);


INSERT INTO stgroup (code, description) VALUES
('GRP001', 'Group 1'),
('GRP002', 'Group 2');


INSERT INTO course (code, description) VALUES
('CS101', 'Computer Science'),
('MA202', 'Mathematics');


INSERT INTO student (id, firstname, lastname) VALUES
(1, 'Timo', 'Truu'),
(2, 'Priidu', 'Prilli'),
(3, 'Toomas', 'Maasikas'),
(4, 'Roobert', 'Burc'),
(5, 'Piima', 'Mehike'),
(6, 'Krooda', 'Kreek');

ALTER TABLE student
ADD COLUMN groupcode CHAR(8),
ADD COLUMN birthdate DATE;

UPDATE student
SET groupcode = 'GRP001', birthdate = '2000-01-01'
WHERE id = 1;

UPDATE student
SET groupcode = 'GRP002', birthdate = '1999-02-15'
WHERE id = 2;

ALTER TABLE student
ADD CONSTRAINT fk_groupcode
FOREIGN KEY (groupcode) REFERENCES stgroup(code);

UPDATE student
SET groupcode = 'GRP001'
WHERE id = 3;

UPDATE student
SET groupcode = 'GRP002'
WHERE id = 4;

CREATE TABLE student_course (
    student_id BIGINT,
    course_code CHAR(8),
    PRIMARY KEY (student_id, course_code),
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_code) REFERENCES course(code)
);

INSERT INTO student_course (student_id, course_code) VALUES
(1, 'CS101'),
(2, 'MA202'),
(3, 'CS101'),
(4, 'MA202');

CREATE TABLE comment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    studentid BIGINT,
    comment VARCHAR(256),
    FOREIGN KEY (studentid) REFERENCES student(id)
);

INSERT INTO comment (studentid, comment) VALUES
(1, 'Tubli poiss!'),
(2, 'Pask oled!'),
(3, 'Saada kuule end!'),
(4, 'Väga hea töö!'),
(5, 'Head oskused!'),
(6, 'Väga tubli klassis!');

SELECT
    comment.studentid AS id,
    student.firstname AS firstname,
    student.lastname AS lastname,
    comment.comment AS comment
FROM
    student
    JOIN comment ON student.id = comment.studentid;
    
    CREATE VIEW comments AS
SELECT
    comment.studentid AS id,
    student.firstname AS firstname,
    student.lastname AS lastname,
    comment.comment AS comment
FROM
    student
    JOIN comment ON student.id = comment.studentid;
    
    INSERT INTO comment (studentid, comment) VALUES (1, 'Väga hea!');
    
    
 
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES
(7, 'Markus', 'Tapp', 'GRP001', '2001-03-12'),
(8, 'Villu', 'Pillu', 'GRP002', '2000-07-25'),
(9, 'Türa', 'Jüra', 'GRP001', '1999-10-15'),
(10, 'Marken', 'Tammik', 'GRP002', '2001-06-05'),
(11, 'Nikita', 'Luud', 'GRP001', '2002-04-20'),
(12, 'Markus', 'Toomas', 'GRP002', '2000-11-12'),
(13, 'Deisy', 'Milki', 'GRP001', '2001-09-09'),
(14, 'Joonas', 'Tiit', 'GRP002', '1999-05-14'),
(15, 'Mia', 'Lind', 'GRP001', '2000-12-30'),
(16, 'Tiina', 'Kurt', 'GRP002', '2002-03-21'),
(17, 'Oliver', 'Tomson', 'GRP001', '2001-07-16'),
(18, 'Paul', 'Roos', 'GRP002', '2000-10-10'),
(19, 'Martin', 'Nuzza', 'GRP001', '2002-01-22'),
(20, 'Rita', 'Riit', 'GRP002', '2001-08-18');


INSERT INTO comment (studentid, comment) VALUES
(7, 'Väge heaaaa'),
(8, 'Veel parem'),
(9, 'Väga heaaaaaa'),
(10, 'Tubliiii'),
(11, 'Yeeeee'),
(12, 'YEHHAA');



    
    



