USE virtual_classroom;

# PRIMER TABLA
SELECT COUNT(id_log) FROM audits;
START TRANSACTION;

INSERT INTO audits VALUES (NULL, 'proof_entity', 1, 'INSERT', '2023-11-20 20:20', 'josias@localhost');
INSERT INTO audits VALUES (NULL, 'proof_entity', 2, 'INSERT', '2023-11-20 20:21', 'josias@localhost');
INSERT INTO audits VALUES (NULL, 'proof_entity', 3, 'INSERT', '2023-11-20 20:22', 'josias@localhost');
INSERT INTO audits VALUES (NULL, 'proof_entity', 4, 'INSERT', '2023-11-20 20:23', 'josias@localhost');
INSERT INTO audits VALUES (NULL, 'proof_entity', 5, 'INSERT', '2023-11-20 20:24', 'josias@localhost');

# ROLLBACK;
COMMIT;
SELECT COUNT(id_log) FROM audits;



# SEGUNDA TABLA
SELECT COUNT(id) FROM students;
START TRANSACTION;

INSERT INTO students VALUES(null, "Analía", "Escudero", "1994-05-20", "analia@mail.com", "Av. Siempre viva 123", "3000", "AR", "M");
INSERT INTO students VALUES(null, "Miguel", "Calderón", "1994-11-18", "miguel@mail.com", "Av. Siempre viva 123", "3000", "AR", "X");
INSERT INTO students VALUES(null, "Franco", "Calderón", "1997-11-05", "franco@mail.com", "Av. Siempre viva 123", "3000", "AR", "M");
INSERT INTO students VALUES(null, "Renata", "Escudero", "1961-04-20", "renata@mail.com", "Av. Siempre viva 123", "3000", "AR", "C");
SAVEPOINT sp1;

INSERT INTO students VALUES(null, "Carlos", "Mangualde", "1994-10-25", "carlos@mail.com", "Av. Siempre viva 123", "2500", "AR", "T");
INSERT INTO students VALUES(null, "Fabiana", "Barrera", "1994-05-20", "fabiana@mail.com", "Av. Siempre viva 123", "2500", "AR", "M");
INSERT INTO students VALUES(null, "Ayelén", "Barrera", "1994-11-18", "ayelen@mail.com", "Av. Siempre viva 123", "2500", "AR", "X");
INSERT INTO students VALUES(null, "Manuel", "Allamano", "1997-11-05", "manuel@mail.com", "Av. Siempre viva 123", "2500", "AR", "M");
SAVEPOINT sp2;

# ROLLBACK TO sp1;
# RELEASE SAVEPOINT sp2;

COMMIT;
SELECT COUNT(id) FROM students;