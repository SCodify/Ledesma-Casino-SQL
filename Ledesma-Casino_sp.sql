USE db_vitacora;

DELIMITER $$

CREATE PROCEDURE `sp_insert_tipo_novedad` (IN tipo VARCHAR(30))
BEGIN
	IF( tipo <> '' AND tipo IS NOT NULL) THEN
		INSERT INTO Tipos_novedades (tipo) VALUES (tipo);
			SELECT * FROM Tipos_novedades
			ORDER BY Tipos_novedades.id_tipo DESC;
	ELSE
		SELECT 'ERROR: no se puede cargar el nuevo tipo de novedad';
	END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE `sp_cambiar_estado_tecnico` (IN id_tecnico INT, IN nuevo_estado INT)
BEGIN
	UPDATE Tecnicos
    SET id_estado = nuevo_estado
    WHERE Tecnicos.id_tecnico = id_tecnico;
    SELECT * FROM Tecnicos;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE `sp_cambio_estado_novedad` (IN id_novedad INT, IN nuevo_estado INT)
BEGIN
	UPDATE Novedades
    SET id_estado = nuevo_estado
    WHERE Novedades.id_novedad = id_novedad;
    SELECT * FROM Novedades
    ORDER BY Novedades.id_novedad ASC;
END $$

DELIMITER ;