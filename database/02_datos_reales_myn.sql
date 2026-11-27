INSERT INTO rol (nombre_rol) VALUES ('Gerencia'), ('Operario'), ('Profesional');

INSERT INTO usuario (id_rol, nombre, correo, contrasena, cargo, valor_hora, estado) VALUES
(1, 'Andres Granados', 'a.granados2218@gmail.com', 'hash_admin123', 'Gerente General', 65000.00, 'ACTIVO'),
(2, 'Operario Planta Llenado', 'operario@mynsas.com', 'hash_op123', 'Operario Común', 15000.00, 'ACTIVO'),
(3, 'Analista Microbiologia', 'calidad@mynsas.com', 'hash_prof123', 'Profesional Químico', 50000.00, 'ACTIVO');

INSERT INTO materia_prima (nombre, unidad_medida, valor_unitario) VALUES
('Emulsion: Shampoo Capilar (Granel)', 'Kilogramo', 1000.00),
('Emulsion: Crema Facial', 'Kilogramo', 18000.00),
('Emulsion: Fotoprotector SPF50', 'Kilogramo', 24000.00);

INSERT INTO maquina (nombre_maquina, valor_hora_maquina, estado) VALUES
('Llenadora Tolva - Bomba Industrial', 45000.00, 'DISPONIBLE'),
('Llenadora Tolva - Caida Libre', 32000.00, 'DISPONIBLE');

INSERT INTO tipo_envase (tipo_material, nombre_material, tamano_envase, embalaje, etiquetado, sellado, estado, valor_envase) VALUES
('Envase y Tapa', 'Frasco PET + Tapa Rosca + Liner', '20ml', 'Caja Corrugada + Plegadiza', '2 Etiquetas', 'Termoencogido', 'ACTIVO', 850.00),
('Tubo Colapsible', 'Tubo Laminado Cosmetic', '100ml', 'Caja Plegadiza', 'Etiquetado Maquina', 'Sellado Termico', 'ACTIVO', 1100.00);

INSERT INTO tipo_almacenamiento (nombre, estado) VALUES ('Estiba Seca', 'ACTIVO'), ('Cuarto Frio', 'ACTIVO');

INSERT INTO almacenamiento (id_tipo_almacenamiento, nombre_bodega, capacidad, valor_dia, estado) VALUES
(1, 'Bodega Central M&N - Estibas', 500, 15000.00, 'DISPONIBLE');

INSERT INTO cotizacion (id_usuario, cliente_nombre, cliente_nit_cc, producto_nombre, proceso, grupo_producto, categoria_producto, estado, subtotal_general, iva, total_general) VALUES
(1, 'Epidermique', '900845123-4', 'Shampoo Capilar', 'Producción en una sola presentación', 'EMULSIONES', 'SHAMPOO', 'APROBADA', 336780000.00, 63988200.00, 400768200.00);

INSERT INTO detalle_cotizacion (
    id_cotizacion, id_materia_prima, id_usuario_comun, id_usuario_profesional, id_maquina, id_tipo_envase, id_almacenamiento,
    capacidad_unidad, cantidad_mp, valor_mp, unidades_producir,
    horas_trabajador_comun, valor_trabajador_comun, horas_trabajador_prof, valor_trabajador_prof,
    horas_maquina, valor_maquina, valor_envase, dias_almacenamiento, valor_almacenamiento, subtotal_linea
) VALUES (
    1, 1, 2, 3, 1, 1, 1,
    20, 5200, 5200000.00, 260000,
    40, 600000.00, 8, 400000.00,
    24, 1080000.00, 221000000.00, 0, 0.00, 336780000.00
);