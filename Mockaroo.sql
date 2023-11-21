-- Procedimiento almacenado básico
-- Procedimeinto almacenado con párametros de salida
-- Procedimiento almacenado con párametros de entrada
-- Procedimeinto almacenado con párametros de entrada y salida
  
DELIMITER $$
  
CREATE PROCEDURE nombre_del_sp
BEGIN
	SELECT id, name FROM mi_tabla;
END $$

DELIMITER $$
  
CREATE PROCEDURE nombre_del_sp (IN param1 CHAR(40))
BEGIN
	SELECT * FROM mi_tabla WHERE nombre LIKE param1;
END $$

CREATE PROCEDURE nombre_del_sp (OUT total CHAR(40))
BEGIN
	SELECT COUNT(*) INTO mi_tabla FROM products
    WHERE habilitado = TRUE;
END $$

DELIMITER ;

CREATE PROCEDURE sp_get_gamea ()
BEGIN
	SELECT * FROM gamers_model.game;
END

CREATE PROCEDURE nombre_sp (IN condicion INTEGER)
BEGIN
	IF condicion = 1 THEN
		SELECT * FROM
	END IF;
END


CREATE PROCEDURE nombre_sp (IN condicion INTEGER)
BEGIN
	IF condicion = 1 THEN
		SELECT * FROM tabla1
	ELSE
		SELECT * FROM tabla2
	END IF
END

-- Declaracion de variables
SET @ordenamiento = 'id'

-- convertir string a clausula 
PREPARE ejecutar FROM @clausula; 
EXECUTE ejecutar;
DEALLOCATE PREPARE ejecutar; 


-- implementar prepare y execute
CREATE PROCEDURE `sp_get_games_order` (IN field CHAR(20))
BEGIN
    
END

DELIMITER $$
CREATE PROCEDURE `sp_get_games_order` (IN field CHAR(20))
BEGIN
	IF field <> '' THEN
		SET @game_order = CONCAT('ORDER BY', ' ', field);
	ELSE
		SET @game_order = '';
	END IF;
    
    SET @consulta = CONCAT('SELECT * FROM gamers_model.game', ' ', @game_order);
    
    
    PREPARE mi_select FROM @consutla;
    EXECUTE mi_select:
    DEALLOCATE PREPARE mi_select;
    
END $$

DELIMITER ;

-- Formas de ejecutar un sp
CALL `sp_get_games_order` ('name')


-- Solucion

CREATE PROCEDURE `tarea_en_clase` (IN p_char VARCHAR(50), OUT p_error VARCHAR(50))
BEGIN
	IF (p_char IS NULL OR p_char LIKE '') THEN
		SET p_error = "ERROR DE DATOS";
        SELECT p_error;
	ELSE
		INSERT INTO prueba SET description = p_char;
        SELECT * FROM prueba ORDER BY id DESC;
	END IF
END


DELIMITER //

CREATE PROCEDURE `sp_insert_level` (IN id_level INT, IN description VARCHAR(20))
BEGIN
	IF (description <> '') THEN
		INSERT INTO LEVEL_GAME (id_level, description) VALUES (id_level, description);
			SELECT
				id_level
                , description
			FROM LEVEL_GAME
            ORDER BY id_level desc;
	ELSE
		SELECT 'Error: no se pudo crear el nivel deseado';
	END IF;
    
END //

DELIMITER ;
