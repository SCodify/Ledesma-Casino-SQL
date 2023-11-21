USE DB_vitacora;

DELIMITER $$

# Esta función nos permite consultar la cantidad de novedades según su estado, ya sea 1 "pendiente", 2 "en proceso", 3 "completo" o 4 "sin estado".
CREATE FUNCTION cantidad_de_novedades_segun_estado(estado INT) 
RETURNS INT
DETERMINISTIC

BEGIN
	DECLARE resultado INT; 
	SET resultado = (
		SELECT COUNT(*)
		FROM Novedades 
		WHERE id_estado = estado
	);
    RETURN resultado;
END$$

# Esta función nos permite consultar la cantidad de novedades por turno, ya sea 1 "mañana", 2 "tarde", 3 "noche" o 4 "intermedio".
CREATE FUNCTION cantidad_de_novedades_por_turno(tipo_de_turno INT) 
RETURNS INT
DETERMINISTIC

BEGIN
	DECLARE contador INT;
	SET contador = 0;
  	SELECT COUNT(t.id_tipo_turno) INTO contador
  	FROM Turnos AS t
	JOIN Tipo_turnos AS tt ON t.id_tipo_turno = tt.id_tipo_turno 
	JOIN Novedades AS n ON t.id_novedad = n.id_novedad 
	WHERE t.id_tipo_turno = tipo_de_turno;
	RETURN contador;
END$$

DELIMITER ;