USE DB_vitacora;

DELIMITER $$

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

#CREATE FUNCTION cantidad_de_novedades_por_turno(tipo_de_turno INT) 
#RETURNS INT
#DETERMINISTIC
#BEGIN
#	DECLARE resultado INT; 
#	SET resultado = (
#		SELECT t.id_turno, COUNT(t.tipo_turno) AS contar
#		FROM 
#			Turnos AS t
#			JOIN Tipo_turnos AS tt ON t.tipo_turno = tt.tipo_turno 
#			JOIN Novedades AS n ON t.id_novedad = n.id_novedad 
#		
#	);
#    RETURN resultado;
#END$$

DELIMITER ;