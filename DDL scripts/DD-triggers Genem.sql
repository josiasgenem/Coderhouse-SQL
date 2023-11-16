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