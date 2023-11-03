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

CALL student_quiz_answers(2, 'question_id', 'ASC', @question_id, @question_type, @question_text, @student_option_answer_id, @student_text_answer, @is_correct);





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

CALL quiz_question_insertion(1, 'multiple_choice', 'PRUEBA DE INCERCIÓN MULTIPLEOPCIÓN', 'Opción 1', 'Opción 2', 'Opción 3', 'Opción 4', @question_id);