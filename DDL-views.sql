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