# Crea dos usuarios
CREATE USER app@localhost;
CREATE USER coderhouse@localhost;

# Setea una contraseña para cada usuario
ALTER USER app@localhost IDENTIFIED BY 'App123';
ALTER USER coderhouse@localhost IDENTIFIED BY 'Coder123';

# Da permisos de selección, inserción, actualización y eliminación de registros al usuario utilizado por la aplicación de Backend.
# Da permisos solo de selección al segundo usuario que tiene fines de auditoria.
GRANT SELECT, INSERT, UPDATE, DELETE ON virtual_classroom.* TO app@localhost;
GRANT SELECT ON virtual_classroom.* TO coderhouse@localhost;

#Musetra los respectivos permisos.
SHOW GRANTS FOR app@localhost;
SHOW GRANTS FOR coderhouse@localhost;