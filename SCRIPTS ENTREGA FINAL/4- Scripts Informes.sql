####### CASO DE USO DE CREACIÓN DE EXÁMEN, RENDIDAA Y POSTERIOR CORRECCIÓN ######
USE virtual_classroom;

# Crea un exámen para una materia
INSERT INTO quizzes VALUES (null, 'Tema del exámen.', '2023-12-18T11:00:00', '01:30:00', 2, 'planned', 'Descripción del exámen: Este es el exámen final de la materia. Se aprueba con el 70%.');
#SELECT LAST_INSERT_ID();

# Agrega 10 preguntas a un exámen con la respectiva respuesta correcta.
CALL quiz_question_insertion(6, 'multiple_choice', 'INSERCIÓN MULTIPLEOPCIÓN 1', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_1_id);
CALL quiz_question_insertion(6, 'multiple_choice', 'INSERCIÓN MULTIPLEOPCIÓN 2', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_2_id);
CALL quiz_question_insertion(6, 'multiple_choice', 'INSERCIÓN MULTIPLEOPCIÓN 3', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_3_id);
CALL quiz_question_insertion(6, 'multiple_choice', 'INSERCIÓN MULTIPLEOPCIÓN 4', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_4_id);
CALL quiz_question_insertion(6, 'multiple_choice', 'INSERCIÓN MULTIPLEOPCIÓN 5', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_5_id);
CALL quiz_question_insertion(6, 'multiple_choice', 'INSERCIÓN MULTIPLEOPCIÓN 6', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_6_d);
CALL quiz_question_insertion(6, 'multiple_choice', 'INSERCIÓN MULTIPLEOPCIÓN 7', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_7_id);
CALL quiz_question_insertion(6, 'multiple_choice', 'INSERCIÓN MULTIPLEOPCIÓN 8', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_8_id);
CALL quiz_question_insertion(6, 'multiple_choice', 'INSERCIÓN MULTIPLEOPCIÓN 9', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_9_id);
CALL quiz_question_insertion(6, 'multiple_choice', 'INSERCIÓN MULTIPLEOPCIÓN 10', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_10_id);

# Crea un exámen de un alumno (rendido).
INSERT INTO student_quiz VALUES (null, 1, 6, null);
#SELECT LAST_INSERT_ID();

# Agrega las respuestas del alumno.
INSERT INTO student_quiz_responses VALUES (null, 6, 21, 10, null);
INSERT INTO student_quiz_responses VALUES (null, 6, 22, 11, null);
INSERT INTO student_quiz_responses VALUES (null, 6, 23, 12, null);
INSERT INTO student_quiz_responses VALUES (null, 6, 24, 13, null);
INSERT INTO student_quiz_responses VALUES (null, 6, 25, 14, null);
INSERT INTO student_quiz_responses VALUES (null, 6, 26, 15, null);
INSERT INTO student_quiz_responses VALUES (null, 6, 27, 16, null);
INSERT INTO student_quiz_responses VALUES (null, 6, 28, 17, null);
INSERT INTO student_quiz_responses VALUES (null, 6, 29, 18, null);
INSERT INTO student_quiz_responses VALUES (null, 6, 30, 19, null);

# Retorna las respuestas de un examen de alumno (student_quiz_id) con sus respectivas preguntas,
# Puede ser ordenado por nombre de columna pasando además el tercer parámetro como 'ASC' o 'DES'. Por defecto ordena ascendentemente.
CALL student_quiz_answers(6, 'question_id', 'ASC', @question_id, @question_type, @question_text, @student_option_answer_id, @student_text_answer, @is_correct);
SELECT (@question_id, @question_type, @question_text, @student_option_answer_id, @student_text_answer, @is_correct);

# Se le coloca nota al exámen del alumno.
UPDATE student_quiz SET score = 80 WHERE id = 6;