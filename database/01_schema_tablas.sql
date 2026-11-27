CREATE TABLE rol (
    id_rol INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE usuario (
    id_usuario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_rol INTEGER NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    cargo VARCHAR(80) NOT NULL,
    valor_hora NUMERIC(12,2) NOT NULL DEFAULT 0,
    intentos_fallidos INTEGER DEFAULT 0,
    estado VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol),
    CHECK (valor_hora >= 0)
);

CREATE TABLE materia_prima (
    id_materia_prima INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    unidad_medida VARCHAR(30) NOT NULL,
    valor_unitario NUMERIC(12,2) NOT NULL DEFAULT 0,
    CHECK (valor_unitario >= 0)
);

CREATE TABLE maquina (
    id_maquina INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_maquina VARCHAR(100) NOT NULL,
    valor_hora_maquina NUMERIC(12,2) NOT NULL DEFAULT 0,
    estado VARCHAR(20) NOT NULL DEFAULT 'DISPONIBLE',
    CHECK (valor_hora_maquina >= 0)
);

CREATE TABLE tipo_envase (
    id_tipo_envase INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo_material VARCHAR(50) NOT NULL,
    nombre_material VARCHAR(100) NOT NULL,
    tamano_envase VARCHAR(50) NOT NULL,
    embalaje VARCHAR(80),
    etiquetado VARCHAR(80),
    sellado VARCHAR(80),
    estado VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',
    valor_envase NUMERIC(12,2) NOT NULL DEFAULT 0,
    CHECK (valor_envase >= 0)
);

CREATE TABLE tipo_almacenamiento (
    id_tipo_almacenamiento INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'ACTIVO'
);

CREATE TABLE almacenamiento (
    id_almacenamiento INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_tipo_almacenamiento INTEGER NOT NULL,
    nombre_bodega VARCHAR(80) NOT NULL,
    capacidad INTEGER NOT NULL,
    valor_dia NUMERIC(12,2) NOT NULL DEFAULT 0,
    estado VARCHAR(20) NOT NULL DEFAULT 'DISPONIBLE',
    FOREIGN KEY (id_tipo_almacenamiento) REFERENCES tipo_almacenamiento(id_tipo_almacenamiento),
    CHECK (capacidad > 0),
    CHECK (valor_dia >= 0)
);

CREATE TABLE cotizacion (
    id_cotizacion INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    cliente_nombre VARCHAR(150) NOT NULL,
    cliente_nit_cc VARCHAR(30) NOT NULL,
    producto_nombre VARCHAR(150) NOT NULL,
    proceso VARCHAR(80) NOT NULL,
    grupo_producto VARCHAR(50) NOT NULL,
    categoria_producto VARCHAR(50) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(30) NOT NULL DEFAULT 'PENDIENTE',
    porcentaje_indirecto NUMERIC(5,2) NOT NULL DEFAULT 15.00,
    porcentaje_rentabilidad NUMERIC(5,2) NOT NULL DEFAULT 20.00,
    subtotal_general NUMERIC(14,2) NOT NULL DEFAULT 0,
    iva NUMERIC(14,2) NOT NULL DEFAULT 0,
    total_general NUMERIC(14,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE detalle_cotizacion (
    id_detalle INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cotizacion INTEGER NOT NULL,
    id_materia_prima INTEGER NOT NULL,
    id_usuario_comun INTEGER,
    id_usuario_profesional INTEGER,
    id_maquina INTEGER,
    id_tipo_envase INTEGER NOT NULL,
    id_almacenamiento INTEGER,
    capacidad_unidad NUMERIC(10,2) NOT NULL,
    cantidad_mp NUMERIC(10,2) NOT NULL,
    valor_mp NUMERIC(14,2) NOT NULL DEFAULT 0,
    unidades_producir INTEGER NOT NULL,
    horas_trabajador_comun NUMERIC(6,2) DEFAULT 0,
    valor_trabajador_comun NUMERIC(14,2) DEFAULT 0,
    horas_trabajador_prof NUMERIC(6,2) DEFAULT 0,
    valor_trabajador_prof NUMERIC(14,2) DEFAULT 0,
    horas_maquina NUMERIC(6,2) DEFAULT 0,
    valor_maquina NUMERIC(14,2) DEFAULT 0,
    valor_envase NUMERIC(14,2) DEFAULT 0,
    dias_almacenamiento INTEGER DEFAULT 0,
    valor_almacenamiento NUMERIC(14,2) DEFAULT 0,
    subtotal_linea NUMERIC(14,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (id_cotizacion) REFERENCES cotizacion(id_cotizacion),
    FOREIGN KEY (id_materia_prima) REFERENCES materia_prima(id_materia_prima),
    FOREIGN KEY (id_usuario_comun) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_usuario_profesional) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_maquina) REFERENCES maquina(id_maquina),
    FOREIGN KEY (id_tipo_envase) REFERENCES tipo_envase(id_tipo_envase),
    FOREIGN KEY (id_almacenamiento) REFERENCES almacenamiento(id_almacenamiento)
);