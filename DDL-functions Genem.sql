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


SELECT convert_to_dollars(10000, 800) AS dollars;
SELECT quiz_media(1);