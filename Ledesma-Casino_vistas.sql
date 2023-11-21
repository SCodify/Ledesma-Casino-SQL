# Esta vista trae el listado de las novedades pendientes
CREATE OR REPLACE VIEW vw_novedades_pendientes AS (
	SELECT 
		id_novedad
        , descripcion
        , id_estado
	FROM Novedades
    WHERE id_estado = 1
);

# Esta vista trae la cantidad de novedades completadas por cada técnico, en base al orden id de la tabla Tecnicos
CREATE OR REPLACE VIEW vw_tecnico_novedades_completadas AS (
	SELECT 
		n.id_tecnico
        , COUNT(n.id_novedad)
	FROM Novedades AS n 
    JOIN Tecnicos AS t ON n.id_tecnico = t.id_tecnico
    JOIN Estados_novedades AS en ON n.id_estado = en.id_estado
    WHERE n.id_estado = 3
    GROUP BY n.id_tecnico
    ORDER BY n.id_tecnico ASC
);