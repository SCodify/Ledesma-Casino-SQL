START TRANSACTION;

DELETE FROM Turnos
WHERE id_turno = 1;

#ROLLBACK;
#COMMIT;

#INSERT INTO Turnos (id_turno, fecha_turno, id_tipo_turno, id_novedad, id_tecnico) VALUES (1, '2023-01-27', 4, 979, 5);

START TRANSACTION;

INSERT INTO Novedades (id_novedad, titulo, descripcion, id_tipo, id_estado, id_tecnico) 
VALUES (1001, 'id ante ipsum primis in', 'tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis', '2023-01-20', 8, 3, 10);
INSERT INTO Novedades (id_novedad, titulo, descripcion, id_tipo, id_estado, id_tecnico) 
VALUES (1002, 'vestibulum ante ipsum', 'curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est', '2023-05-06', 4, 2, 11);
INSERT INTO Novedades (id_novedad, titulo, descripcion, id_tipo, id_estado, id_tecnico) 
VALUES (1003, 'eget massa tempor', 'ultrices vel augue ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit', '2023-02-23', 8, 1, 3);
INSERT INTO Novedades (id_novedad, titulo, descripcion, id_tipo, id_estado, id_tecnico) 
VALUES (1004, 'quisque arcu libero at', 'maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus', '2023-01-02', 7, 1, 5);

SAVEPOINT primeros_cuatro;

INSERT INTO Novedades (id_novedad, titulo, descripcion, id_tipo, id_estado, id_tecnico) 
VALUES (1005, 'pulvinar phasellus sit amet', 'lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim', '2023-01-28', 6, 4, 3);
INSERT INTO Novedades (id_novedad, titulo, descripcion, id_tipo, id_estado, id_tecnico) 
VALUES (1006, 'in faucibus', 'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum', '2023-06-06', 3, 1, 10);
INSERT INTO Novedades (id_novedad, titulo, descripcion, id_tipo, id_estado, id_tecnico) 
VALUES (1007, 'iaculis diam erat', ' aenean  rdiet sapien platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris', '2023-07-26', 3, 3, 7);
INSERT INTO Novedades (id_novedad, titulo, descripcion, id_tipo, id_estado, id_tecnico) 
VALUES (1008, 'ut suscipit a feugiatn', 'dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue', '2023-05-29', 7, 4, 9);

SAVEPOINT ultimos_cuatro;

ROLLBACK TO primeros_cuatro;

COMMIT;





