CREATE SCHEMA virtual_classroom;
USE virtual_classroom;

CREATE TABLE countries(
	code VARCHAR(3) NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    currency VARCHAR(32),
    capital VARCHAR(50),
    continent VARCHAR(20) NOT NULL
);

CREATE TABLE countries_subdivisions(
	country_code VARCHAR(3) NOT NULL,
    code VARCHAR(3) NOT NULL,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    
    FOREIGN KEY (country_code) REFERENCES countries(code)
);

CREATE INDEX countries_subdivisions_index ON countries_subdivisions(code);

CREATE TABLE students(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    birthdate DATE,
    email VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(50),
    cp VARCHAR(15),
    country_code VARCHAR(3) NOT NULL,
    country_subdivision_code VARCHAR(3) NOT NULL,
    FOREIGN KEY (country_code) REFERENCES countries(code),
    FOREIGN KEY (country_subdivision_code) REFERENCES countries_subdivisions(code)
);

CREATE TABLE teachers(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    birthdate DATE,
    email VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(50),
    cp VARCHAR(15),
    country_code VARCHAR(3) NOT NULL,
    country_subdivision_code VARCHAR(3) NOT NULL,
    professions VARCHAR(50),
    salary MEDIUMINT,
    FOREIGN KEY (country_code) REFERENCES countries(code),
    FOREIGN KEY (country_subdivision_code) REFERENCES countries_subdivisions(code)
);

CREATE TABLE tutors(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    birthdate DATE,
    email VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(50),
    cp VARCHAR(15),
    country_code VARCHAR(3) NOT NULL,
    country_subdivision_code VARCHAR(3) NOT NULL,
    professions VARCHAR(50),
    salary MEDIUMINT,
    FOREIGN KEY (country_code) REFERENCES countries(code),
    FOREIGN KEY (country_subdivision_code) REFERENCES countries_subdivisions(code)
);

CREATE TABLE courses(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    start_date_time DATETIME,
    duration_days SMALLINT NOT NULL,
    status ENUM('planning', 'planned', 'in-course', 'finished') DEFAULT 'planning',
    price MEDIUMINT,
    description VARCHAR(300)
);

CREATE TABLE subjects(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    start_date_time DATETIME,
    lessons_quantity TINYINT NOT NULL,
    week_day_1 ENUM('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'),
    day_time_1 TIME,
    week_day_2 ENUM('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'),
    day_time_2 TIME,
    week_day_3 ENUM('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'),
    day_time_3 TIME,
    week_day_4 ENUM('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'),
    day_time_4 TIME,
    week_day_5 ENUM('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'),
    day_time_5 TIME,
    next_lesson_id INT,
    status ENUM('planning', 'planned', 'in-course', 'finished') DEFAULT 'planning',
    description VARCHAR(300)
);

CREATE TABLE lessons(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    topic VARCHAR(50) NOT NULL,
    start_date_time DATETIME,
    duration_time TIME,
    subject_id INT NOT NULL,
    status ENUM('planning', 'planned', 'in-course', 'finished') DEFAULT 'planning',
    description VARCHAR(300),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

CREATE TABLE quizzes(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    topic VARCHAR(50) NOT NULL,
    start_date_time DATETIME,
    duration_time TIME NOT NULL,
    subject_id INT NOT NULL,
    status ENUM('planning', 'planned', 'in-course', 'finished') DEFAULT 'planning',
    description VARCHAR(300),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

CREATE TABLE certifications(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    img_href VARCHAR(300),
    exp_timedate DATETIME,
    status ENUM('planning', 'planned', 'in-course', 'finished') DEFAULT 'planning',
    observations VARCHAR(200),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE payment_types(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    payment_type VARCHAR(100),
    details VARCHAR(200)
);

CREATE TABLE course_subjects(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

CREATE TABLE course_students(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    student_id INT NOT NULL,
    student_status ENUM('registered', 'regular', 'paused', 'suspended') DEFAULT 'registered',
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE subject_students(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subject_id INT NOT NULL,
    student_id INT NOT NULL,
    student_status ENUM('registered', 'regular', 'paused', 'suspended', 'transferred') DEFAULT 'registered',
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE subject_teachers(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subject_id INT NOT NULL UNIQUE,
    teacher_id INT NOT NULL,
    teacher_status ENUM('designated', 'active', 'suspended', 'replaced') DEFAULT 'designated',
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

CREATE TABLE subject_tutors(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subject_id INT NOT NULL,
    tutor_id INT NOT NULL,
    tutor_status ENUM('designated', 'active', 'suspended', 'replaced') DEFAULT 'designated',
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    FOREIGN KEY (tutor_id) REFERENCES tutors(id)
);

CREATE TABLE lesson_present_students(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    lesson_id INT NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (lesson_id) REFERENCES lessons(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE student_payments(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    amount MEDIUMINT NOT NULL,
    payment_type_id INT NOT NULL,
    code CHAR(12),
    date_time DATETIME,
    status ENUM('rejected', 'paid') DEFAULT 'rejected',
    concepts VARCHAR(300) NOT NULL,
    observations VARCHAR(200),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (payment_type_id) REFERENCES payment_types(id)
);

CREATE TABLE teachers_salary_payments(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    amount MEDIUMINT NOT NULL,
    code CHAR(12),
    date_time DATETIME,
    status ENUM('sent') DEFAULT 'sent',
    concepts VARCHAR(300) NOT NULL,
    observations VARCHAR(200),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

CREATE TABLE tutors_salary_payments(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tutor_id INT NOT NULL,
    amount MEDIUMINT NOT NULL,
    code CHAR(12),
    date_time DATETIME,
    status ENUM('sent') DEFAULT 'sent',
    concepts VARCHAR(300) NOT NULL,
    observations VARCHAR(200),
    FOREIGN KEY (tutor_id) REFERENCES tutors(id)
);

CREATE TABLE quizzes_questions(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT NOT NULL,
    question VARCHAR(300) NOT NULL,
    question_type ENUM('true_false', 'multiple_choice', 'text') DEFAULT 'text',
    correct_answer VARCHAR(300),
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
);

CREATE TABLE quizzes_answers_options(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    question_id INT,
    option_answer VARCHAR(300) NOT NULL,
    FOREIGN KEY (question_id) REFERENCES quizzes_questions(id)
);


# Corregir para que la conjunción (student_id + quiz_id) sean valores únicos.
CREATE TABLE student_quiz(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    quiz_id INT NOT NULL,
    score TINYINT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
);

CREATE TABLE student_quiz_responses(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_quiz_id INT NOT NULL,
    quiz_question_id INT NOT NULL,
    option_answer_id INT DEFAULT NULL,
    text_answer VARCHAR(300) DEFAULT NULL,
    FOREIGN KEY (student_quiz_id) REFERENCES student_quiz(id),
    FOREIGN KEY (quiz_question_id) REFERENCES quizzes_questions(id)
);

# --------- AUDITS ---------

CREATE TABLE audits(
    id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    entity VARCHAR(50) NOT NULL,
    entity_id INT NOT NULL,
    reg_action VARCHAR(10),
    action_dt DATETIME,
    action_by VARCHAR(100)
);