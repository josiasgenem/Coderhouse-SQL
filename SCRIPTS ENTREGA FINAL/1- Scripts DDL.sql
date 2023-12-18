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
    subject_id INT NOT NULL,
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


# --------- VIEWS ---------

CREATE OR REPLACE VIEW students_by_countries AS
    (
        SELECT c.name AS country, count(s.id) AS students
        FROM countries c
        JOIN students s
        ON c.code = s.country_code
        GROUP BY c.name
    );

CREATE OR REPLACE VIEW subjects_by_courses AS
	(
		SELECT c.name AS course, s.name AS subject
		FROM courses c
		JOIN course_subjects cs
		ON c.id = cs.course_id
		JOIN subjects s
		ON cs.subject_id = s.id
	);
    
CREATE OR REPLACE VIEW teacher_by_subject AS
	(
		SELECT s.name AS subject, concat(firstname, ' ', lastname) AS teacher, st.teacher_status
        FROM subjects s
        JOIN subject_teachers st
        ON s.id = st.subject_id
        JOIN teachers t
        ON t.id = st.teacher_id
    );

CREATE OR REPLACE VIEW tutors_by_subject AS
	(
		SELECT s.name AS subject, concat(firstname, ' ', lastname) AS tutor, st.tutor_status
        FROM subjects s
        JOIN subject_tutors st
        ON s.id = st.subject_id
        JOIN tutors t
        ON t.id = st.tutor_id
    );
    
CREATE OR REPLACE VIEW students_by_subject AS
	(
		SELECT s.name AS subject, concat(firstname, ' ', lastname) AS student, ss.student_status
        FROM subjects s
        JOIN subject_students ss
        ON s.id = ss.subject_id
        JOIN students st
        ON st.id = ss.student_id
    );
    

# --------- FUNCTIONS ---------
    
USE virtual_classroom;

DROP FUNCTION IF EXISTS convert_to_dollars;

DELIMITER //
CREATE FUNCTION convert_to_dollars (pesos FLOAT, pesos_x_dollar FLOAT) RETURNS VARCHAR(20) DETERMINISTIC NO SQL
BEGIN
	DECLARE dollars FLOAT;
	DECLARE result VARCHAR(20);
    
    SET dollars = pesos / pesos_x_dollar;
    SET result = CONCAT('USD', dollars);
	RETURN result;
END //
DELIMITER ;


DROP FUNCTION IF EXISTS quiz_media;

DELIMITER //
CREATE FUNCTION quiz_media (quiz_id INT) RETURNS FLOAT DETERMINISTIC
BEGIN
	DECLARE sum BIGINT;
    DECLARE qty INT;
    DECLARE media FLOAT;
    
    SET sum = (SELECT SUM(score) FROM student_quiz q WHERE quiz_id = q.quiz_id);
	SET qty = (SELECT COUNT(score) FROM student_quiz q WHERE quiz_id = q.quiz_id);
    SET media = sum / qty;
    
	RETURN media;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS is_correct_answer;

DELIMITER //
CREATE FUNCTION is_correct_answer (correct_answer_id INT, student_answer_id INT) RETURNS BOOLEAN DETERMINISTIC NO SQL
BEGIN
	DECLARE result BOOLEAN;
	
    IF correct_answer_id = NULL THEN
		SET result = NULL;
    ELSEIF correct_answer_id = student_answer_id THEN
		SET result = TRUE;
	ELSE
		SET result = FALSE;
	END IF;
    RETURN result;
END //
DELIMITER ;

# SELECT convert_to_dollars(10000, 800) AS dollars;
# SELECT quiz_media(1);


# --------- STORE PROCEDURES ---------

USE virtual_classroom;

# Retorna las respuestas de un examen de alumno (student_quiz_id) con sus respectivas preguntas,
# Puede ser ordenado por nombre de columna pasando además el tercer parámetro como 'ASC' o 'DES'. Por defecto ordena ascendentemente
DROP PROCEDURE IF EXISTS student_quiz_answers;

DELIMITER //
CREATE PROCEDURE student_quiz_answers (
	IN student_quiz_id INT,
    IN sort_field VARCHAR(30),
    IN sort_order CHAR(3),
    OUT question_id INT,
    OUT question_type VARCHAR(300),
    OUT question_text VARCHAR(300),
    OUT student_option_answer_id VARCHAR(300),
    OUT student_text_answer VARCHAR(300),
    OUT is_correct BOOLEAN
)
BEGIN
    IF sort_order = 'DES' THEN
		SET @sql_order = CONCAT('ORDER BY ', sort_field, ' DESC');
	ELSE
		SET @sql_order = CONCAT('ORDER BY ', sort_field, ' ASC');
	END IF;
    
	SELECT
        qq.id AS question_id,
        qq.question_type,
        qq.question AS question_text,
        sqr.option_answer_id,
        sqr.text_answer,
        is_correct_answer(qq.correct_answer, sqr.option_answer_id) AS is_correct
	FROM student_quiz_responses sqr
	JOIN quizzes_questions qq
	ON sqr.quiz_question_id = qq.id
	WHERE sqr.student_quiz_id = student_quiz_id
	ORDER BY question_id DESC;
END //
DELIMITER ;

# CALL student_quiz_answers(2, 'question_id', 'ASC', @question_id, @question_type, @question_text, @student_option_answer_id, @student_text_answer, @is_correct);





# Agrega una pregunta a un exámen con la respectiva respuesta correcta.
DROP PROCEDURE IF EXISTS quiz_question_insertion;

DELIMITER //
CREATE PROCEDURE quiz_question_insertion (
	IN quiz_id INT,
    IN question_type ENUM('true_false', 'multiple_choice', 'text'),
    IN question_text VARCHAR(300),
    IN correct_answer_text VARCHAR(300),
    IN option_answer_1 VARCHAR(300),
    IN option_answer_2 VARCHAR(300),
    IN option_answer_3 VARCHAR(300),
    
    OUT question_id INT
)
BEGIN
	INSERT INTO quizzes_questions VALUE(NULL, quiz_id, question_text, question_type, NULL);
    SET @question_id = (SELECT LAST_INSERT_ID());
    IF question_type = 'true_false' OR question_type = 'multiple_choice' THEN
		INSERT INTO quizzes_answers_options VALUE(NULL, @question_id, correct_answer_text);
        SET @correct_answer_id = (SELECT LAST_INSERT_ID());
        UPDATE quizzes_questions SET correct_answer = @correct_answer_id WHERE id = @question_id;
        
        IF option_answer_1 IS NOT NULL THEN
			INSERT INTO quizzes_answers_options VALUE(NULL, @question_id, option_answer_1);
        END IF;
        IF option_answer_2 IS NOT NULL THEN
			INSERT INTO quizzes_answers_options VALUE(NULL, @question_id, option_answer_2);
        END IF;
        IF option_answer_3 IS NOT NULL THEN
			INSERT INTO quizzes_answers_options VALUE(NULL, @question_id, option_answer_3);
        END IF;
    END IF;
    
END //
DELIMITER ;

# CALL quiz_question_insertion(1, 'multiple_choice', 'PRUEBA DE INCERCIÓN MULTIPLEOPCIÓN', 'Opción 1', 'Opción 2', 'Opción 3', 'Opción 4', @question_id);


# --------- TRIGGERS ---------

# CERTIFICATIONS TRIGGERS
DELIMITER //

CREATE TRIGGER tr_insert_certification_aud
AFTER INSERT ON certifications
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'certification', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_update_certification_aud
AFTER UPDATE ON certifications
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'certification', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_delete_certification_aud
BEFORE DELETE ON certifications
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'certification', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END //

DELIMITER ;


# COURSES TRIGGERS
DELIMITER //

CREATE TRIGGER tr_insert_course_aud
AFTER INSERT ON courses
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'course', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_update_course_aud
AFTER UPDATE ON courses
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'course', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_delete_course_aud
BEFORE DELETE ON courses
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'course', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END //

DELIMITER ;


# LESSONS TRIGGERS
DELIMITER //

CREATE TRIGGER tr_insert_lesson_aud
AFTER INSERT ON lessons
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'lesson', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_update_lesson_aud
AFTER UPDATE ON lessons
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'lesson', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_delete_lesson_aud
BEFORE DELETE ON lessons
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'lesson', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END //

DELIMITER ;


# QUIZZES TRIGGERS
DELIMITER //

CREATE TRIGGER tr_insert_quiz_aud
AFTER INSERT ON quizzes
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'quiz', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_update_quiz_aud
AFTER UPDATE ON quizzes
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'quiz', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_delete_quiz_aud
BEFORE DELETE ON quizzes
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'quiz', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END //

DELIMITER ;


# STUDENTS TRIGGERS
DELIMITER //

CREATE TRIGGER tr_insert_student_aud
AFTER INSERT ON students
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'student', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_update_student_aud
AFTER UPDATE ON students
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'student', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_delete_student_aud
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'student', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END //

DELIMITER ;


# TEACHERS TRIGGERS
DELIMITER //

CREATE TRIGGER tr_insert_teacher_aud
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'teacher', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_update_teacher_aud
AFTER UPDATE ON teachers
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'teacher', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_delete_teacher_aud
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'teacher', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END //

DELIMITER ;


# TUTORS TRIGGERS
DELIMITER //

CREATE TRIGGER tr_insert_tutor_aud
AFTER INSERT ON tutors
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'tutor', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_update_tutor_aud
AFTER UPDATE ON tutors
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'tutor', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END //

CREATE TRIGGER tr_delete_tutor_aud
BEFORE DELETE ON tutors
FOR EACH ROW
BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'tutor', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END //

DELIMITER ;