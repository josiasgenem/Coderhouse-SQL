# Crea dos usuarion
CREATE USER josias@localhost;
CREATE USER coderhouse@localhost;

# Setea una contraseña para cada usuario
ALTER USER josias@localhost IDENTIFIED BY 'Josias123';
ALTER USER coderhouse@localhost IDENTIFIED BY 'Coder123';

# Da permisos de selección al primer usuario. Y da permisos de selección, inserción, y modificación de registros al segundo usuario.
# Ninguno puede eliminar registros.
GRANT SELECT ON virtual_classroom.* TO josias@localhost;
GRANT SELECT, INSERT, UPDATE ON virtual_classroom.* TO coderhouse@localhost;

#Musetra los respectivos permisos.
SHOW GRANTS FOR josias@localhost;
SHOW GRANTS FOR coderhouse@localhost;