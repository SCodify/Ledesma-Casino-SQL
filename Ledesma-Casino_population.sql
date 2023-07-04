USE DB_vitacora;

INSERT INTO Tipos_novedades (id_tipo, tipo)
VALUES 
(1, 'falla'),
(2, 'informativo'),
(3, 'urgente'),
(4, 'ABM'),
(5, 'importante'),
(6, 'recordatorio'),
(7, 'fuera de servicio'),
(8, 'queda para ver');

INSERT INTO Estados_novedades (id_estado, estado)
VALUES
(1, 'pendiente'),
(2, 'en proceso'),
(3, 'completo');

INSERT INTO Novedades (id_novedad, titulo, descripcion, id_tipo, id_estado)
VALUES 
(1,'Máquina 23656', 'Se se le combia memoria de juego. Queda operativa y en servicio.',1,3),
(2,'Visiata de sala', 'Llegaron repuestos (billtero y botones). Se dieron de baja en el sistema, falta cambiar.',2,1),
(3,'Impresora 13604','Se cambio impresora y el modelo no es compatible con la máquina. Se pide nueva impresora a proveedores.',5,2);

INSERT INTO Turnos (id_turno, turno, fecha_turno, id_novedad)
VALUES 
(1,'mañana','2023-07-01',1),
(2,'mañana','2023-07-01',2),
(3,'tarde','2023-07-01',3);

## select * FROM Tipos_novedades; --OK
## select * FROM Estados_novedades; --OK
## select * FROM Novedades; -- ERROR 1136: El recuento de columnas no coincide con el recuento de valores de la fila 3.
## select * FROM Turnos;
