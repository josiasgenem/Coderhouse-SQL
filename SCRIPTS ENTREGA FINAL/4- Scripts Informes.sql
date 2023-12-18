# Agrega 10 preguntas a un exámen con la respectiva respuesta correcta.
CALL quiz_question_insertion(1, 'multiple_choice', 'INCERCIÓN MULTIPLEOPCIÓN 1', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_id);
CALL quiz_question_insertion(1, 'multiple_choice', 'INCERCIÓN MULTIPLEOPCIÓN 2', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_id);
CALL quiz_question_insertion(1, 'multiple_choice', 'INCERCIÓN MULTIPLEOPCIÓN 3', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_id);
CALL quiz_question_insertion(1, 'multiple_choice', 'INCERCIÓN MULTIPLEOPCIÓN 4', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_id);
CALL quiz_question_insertion(1, 'multiple_choice', 'INCERCIÓN MULTIPLEOPCIÓN 5', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_id);
CALL quiz_question_insertion(1, 'multiple_choice', 'INCERCIÓN MULTIPLEOPCIÓN 6', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_id);
CALL quiz_question_insertion(1, 'multiple_choice', 'INCERCIÓN MULTIPLEOPCIÓN 7', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_id);
CALL quiz_question_insertion(1, 'multiple_choice', 'INCERCIÓN MULTIPLEOPCIÓN 8', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_id);
CALL quiz_question_insertion(1, 'multiple_choice', 'INCERCIÓN MULTIPLEOPCIÓN 9', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_id);
CALL quiz_question_insertion(1, 'multiple_choice', 'INCERCIÓN MULTIPLEOPCIÓN 10', 'Opción correcta', 'Opción 2', 'Opción 3', 'Opción 4', @question_id);



# Retorna las respuestas de un examen de alumno (student_quiz_id) con sus respectivas preguntas,
# Puede ser ordenado por nombre de columna pasando además el tercer parámetro como 'ASC' o 'DES'. Por defecto ordena ascendentemente.
CALL student_quiz_answers(2, 'question_id', 'ASC', @question_id, @question_type, @question_text, @student_option_answer_id, @student_text_answer, @is_correct);
SELECT (@question_id, @question_type, @question_text, @student_option_answer_id, @student_text_answer, @is_correct);