-- Tabla de Estados
CREATE TABLE FIDE_ESTADO_TB (
    id_estado INT PRIMARY KEY,
    v_estado VARCHAR(50),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100)
);

-- Tabla de Estado Civil
CREATE TABLE FIDE_ESTADO_CIVIL_TB (
    id_estado_civil INT PRIMARY KEY ,
    id_estado INT,
    v_nombre VARCHAR(50),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado) 
);

-- Tabla de Parentesco
CREATE TABLE FIDE_PARENTESCO_TB (
    id_parentesco INT PRIMARY KEY ,
    id_estado INT,
    v_parentesco VARCHAR(50),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);

-- Tabla de Productos
CREATE TABLE FIDE_PRODUCTO_TB (
    id_producto INT PRIMARY KEY,
    id_estado INT,
    v_nombre VARCHAR(100),
    v_monto DECIMAL(10,2),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);

-- Tabla de Línea de Crédito
CREATE TABLE FIDE_LINEA_DE_CREDITO_TB (
    id_linea_credito INT PRIMARY KEY,
    id_estado INT,
    v_linea VARCHAR(100),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);

CREATE TABLE FIDE_PLAZO_TB (
    id_plazo INT PRIMARY KEY ,
    id_estado INT,
    v_plazo VARCHAR(50),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);

-- Tabla de Cargos Administrativos
CREATE TABLE FIDE_CARGOS_ADMINISTRATIVOS_TB (
    id_cargo_administrativo INT PRIMARY KEY,
    id_estado INT,
    v_cargo DECIMAL(10,2),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);

-- Tabla de Países
CREATE TABLE FIDE_PAIS_TB (
    id_pais INT PRIMARY KEY,
    id_estado INT,
    v_nombre_pais VARCHAR(100),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);

-- Tabla de Provincias
CREATE TABLE FIDE_PROVINCIA_TB (
    id_provincia INT PRIMARY KEY,
    id_pais INT,
    id_estado INT,
    v_nombre_provincia VARCHAR(100),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_pais) REFERENCES FIDE_PAIS_TB(id_pais),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);

-- Tabla de Cantones
CREATE TABLE FIDE_CANTON_TB (
    id_canton INT PRIMARY KEY,
    id_provincia INT,
    id_estado INT,
    v_nombre_canton VARCHAR(100),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_provincia) REFERENCES FIDE_PROVINCIA_TB(id_provincia),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);

-- Tabla de Distritos
CREATE TABLE FIDE_DISTRITO_TB (
    id_distrito INT PRIMARY KEY,
    id_canton INT,
    id_estado INT,
    v_nombre_distrito VARCHAR(100),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_canton) REFERENCES FIDE_CANTON_TB(id_canton),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);

-- Tabla de Direcciones
CREATE TABLE FIDE_DIRECCION_TB (
    id_direccion INT PRIMARY KEY,
    id_distrito INT,
    id_canton INT,
    id_provincia INT,
    id_pais INT,
    id_estado INT,
    v_descripcion VARCHAR(255),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_distrito) REFERENCES FIDE_DISTRITO_TB(id_distrito),
    FOREIGN KEY (id_canton) REFERENCES FIDE_CANTON_TB(id_canton),
    FOREIGN KEY (id_provincia) REFERENCES FIDE_PROVINCIA_TB(id_provincia),
    FOREIGN KEY (id_pais) REFERENCES FIDE_PAIS_TB(id_pais),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);

-- Tabla de Beneficiarios
CREATE TABLE FIDE_BENEFICIARIOS_TB (
    id_beneficiario INT PRIMARY KEY,
    id_estado_civil INT,
    id_direccion INT,
    id_estado INT,
    id_parentesco INT,
    v_cedula VARCHAR(20),
    v_nombre VARCHAR(100),
    v_apellido VARCHAR(100),
    v_correo VARCHAR(100),
    v_fecha DATE,
    v_telefono VARCHAR(20),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_estado_civil) REFERENCES FIDE_ESTADO_CIVIL_TB(id_estado_civil),
    FOREIGN KEY (id_direccion) REFERENCES FIDE_DIRECCION_TB(id_direccion),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado),
    FOREIGN KEY (id_parentesco) REFERENCES FIDE_PARENTESCO_TB(id_parentesco)
);

-- Tabla de Asociados
CREATE TABLE FIDE_ASOCIADO_TB (
    id_asociado INT PRIMARY KEY ,
    id_beneficiario INT,
    id_estado_civil INT,
    id_direccion INT,
    id_estado INT,
    v_cedula VARCHAR(20),
    v_nombre VARCHAR(100),
    v_apellido VARCHAR(100),
    v_correo VARCHAR(100),
    v_fecha DATE,
    v_telefono VARCHAR(20),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_beneficiario) REFERENCES FIDE_BENEFICIARIOS_TB(id_beneficiario),
    FOREIGN KEY (id_estado_civil) REFERENCES FIDE_ESTADO_CIVIL_TB(id_estado_civil),
    FOREIGN KEY (id_direccion) REFERENCES FIDE_DIRECCION_TB(id_direccion),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);


-- Tabla de Excedentes
CREATE TABLE FIDE_EXCEDENTES_TB (
    id_excedente INT PRIMARY KEY,
    id_asociado INT,
    id_producto INT,
    id_estado INT,
    v_excedente DECIMAL(10,2),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_asociado) REFERENCES FIDE_ASOCIADO_TB(id_asociado),
    FOREIGN KEY (id_producto) REFERENCES FIDE_PRODUCTO_TB(id_producto),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);



-- Tabla de Gestión de Crédito
CREATE TABLE FIDE_GESTION_DE_CREDITO_TB (
    id_gestion_credito INT PRIMARY KEY,
    id_asociado INT,
    id_plazo INT,
    id_linea_credito INT,
    id_cargo_administrativo INT,
    id_estado INT,
    v_monto DECIMAL(10,2),
    v_tasa DECIMAL(5,2),
    v_cuota DECIMAL(10,2),
    v_poliza DECIMAL(10,2),
    v_total_mensual DECIMAL(10,2),
    v_refinanciamiento DECIMAL(10,2),
    v_adelanto_intereses DECIMAL(10,2),
    v_desembolso DECIMAL(10,2),
    v_fecha DATE,
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_asociado) REFERENCES FIDE_ASOCIADO_TB(id_asociado),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado),
    FOREIGN KEY (id_plazo) REFERENCES FIDE_PLAZO_TB(id_plazo),
    FOREIGN KEY (id_linea_credito) REFERENCES FIDE_LINEA_DE_CREDITO_TB(id_linea_credito),
    FOREIGN KEY (id_cargo_administrativo) REFERENCES FIDE_CARGOS_ADMINISTRATIVOS_TB(id_cargo_administrativo)
);

-- Tabla de Rebajo de Planilla
CREATE TABLE FIDE_REBAJO_PLANILLA_TB (
    id_planilla INT PRIMARY KEY,
    id_gestion_credito INT,
    id_asociado INT,
    id_producto INT,
    id_estado INT,
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_producto) REFERENCES FIDE_PRODUCTO_TB(id_producto),
    FOREIGN KEY (id_asociado) REFERENCES FIDE_ASOCIADO_TB(id_asociado),
    FOREIGN KEY (id_gestion_credito) REFERENCES FIDE_GESTION_DE_CREDITO_TB(id_gestion_credito),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);

-- Tabla de Gestión de Facturas
CREATE TABLE FIDE_GESTION_FACTURA_TB (
    id_gestion_factura INT PRIMARY KEY,
    id_gestion_credito INT,
    id_asociado INT,
    id_estado INT,
    v_pago DECIMAL(10,2),
    v_factura VARCHAR(50),
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_asociado) REFERENCES FIDE_ASOCIADO_TB(id_asociado),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);



-- Tabla de Gestión de Reportes
CREATE TABLE FIDE_GESTION_DE_REPORTE_TB (
    id_gestion_reporte INT PRIMARY KEY,
    id_gestion_credito INT,
    id_producto INT,
    id_planilla INT,
    id_asociado INT,
    id_gestion_factura INT,
    id_estado INT,
    v_created_by VARCHAR2(100),
    v_creation_date DATE,
    v_last_update_by VARCHAR2(100),
    v_last_update_date DATE,
    v_accion VARCHAR2(100),
    FOREIGN KEY (id_asociado) REFERENCES FIDE_ASOCIADO_TB(id_asociado),
    FOREIGN KEY (id_producto) REFERENCES FIDE_PRODUCTO_TB(id_producto),
    FOREIGN KEY (id_gestion_credito) REFERENCES FIDE_GESTION_DE_CREDITO_TB(id_gestion_credito),
    FOREIGN KEY (id_gestion_factura) REFERENCES FIDE_GESTION_FACTURA_TB(id_gestion_factura),
    FOREIGN KEY (id_planilla) REFERENCES FIDE_REBAJO_PLANILLA_TB(id_planilla),
    FOREIGN KEY (id_estado) REFERENCES FIDE_ESTADO_TB(id_estado)
);



--Secuencias
CREATE SEQUENCE ID_ESTADO_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_ESTADO_CIVIL_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_PARENTESCO_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_PRODUCTO_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_LINEA_CREDITO_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_PLAZO_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_CARGO_ADMINISTRATIVO_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_PAIS_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_PROVINCIA_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_CANTON_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_DISTRITO_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_DIRECCION_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_BENEFICIARIO_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_ASOCIADO_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_EXCEDENTE_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_GESTION_CREDITO_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_PLANILLA_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_GESTION_FACTURA_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ID_GESTION_REPORTE_SEQ START WITH 1 INCREMENT BY 1;


--Triggers inserts y updates
CREATE OR REPLACE TRIGGER FIDE_ESTADO_TB_INSERT_TRG
BEFORE INSERT ON FIDE_ESTADO_TB
FOR EACH ROW
BEGIN
    :NEW.ID_ESTADO := ID_ESTADO_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_ESTADO_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_ESTADO_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_ESTADO_CIVIL_TB_INSERT_TRG
BEFORE INSERT ON FIDE_ESTADO_CIVIL_TB
FOR EACH ROW
BEGIN
    :NEW.ID_ESTADO_CIVIL := ID_ESTADO_CIVIL_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_ESTADO_CIVIL_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_ESTADO_CIVIL_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;


CREATE OR REPLACE TRIGGER FIDE_PARENTESCO_TB_INSERT_TRG
BEFORE INSERT ON FIDE_PARENTESCO_TB
FOR EACH ROW
BEGIN
    :NEW.ID_PARENTESCO := ID_PARENTESCO_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_PARENTESCO_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_PARENTESCO_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_PRODUCTO_TB_INSERT_TRG
BEFORE INSERT ON FIDE_PRODUCTO_TB
FOR EACH ROW
BEGIN
    :NEW.ID_PRODUCTO := ID_PRODUCTO_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_PRODUCTO_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_PRODUCTO_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_LINEA_DE_CREDITO_TB_INSERT_TRG
BEFORE INSERT ON FIDE_LINEA_DE_CREDITO_TB
FOR EACH ROW
BEGIN
    :NEW.ID_LINEA_CREDITO := ID_LINEA_CREDITO_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_LINEA_DE_CREDITO_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_LINEA_DE_CREDITO_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_PLAZO_TB_INSERT_TRG
BEFORE INSERT ON FIDE_PLAZO_TB
FOR EACH ROW
BEGIN
    :NEW.ID_PLAZO := ID_PLAZO_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_PLAZO_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_PLAZO_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_CARGOS_ADMINISTRATIVOS_TB_INSERT_TRG
BEFORE INSERT ON FIDE_CARGOS_ADMINISTRATIVOS_TB
FOR EACH ROW
BEGIN
    :NEW.ID_CARGO_ADMINISTRATIVO := ID_CARGO_ADMINISTRATIVO_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_CARGOS_ADMINISTRATIVOS_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_CARGOS_ADMINISTRATIVOS_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_PAIS_TB_INSERT_TRG
BEFORE INSERT ON FIDE_PAIS_TB
FOR EACH ROW
BEGIN
    :NEW.ID_PAIS := ID_PAIS_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_PAIS_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_PAIS_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_PROVINCIA_TB_INSERT_TRG
BEFORE INSERT ON FIDE_PROVINCIA_TB
FOR EACH ROW
BEGIN
    :NEW.ID_PROVINCIA := ID_PROVINCIA_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_PROVINCIA_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_PROVINCIA_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_CANTON_TB_INSERT_TRG
BEFORE INSERT ON FIDE_CANTON_TB
FOR EACH ROW
BEGIN
    :NEW.ID_CANTON := ID_CANTON_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_CANTON_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_CANTON_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_DISTRITO_TB_INSERT_TRG
BEFORE INSERT ON FIDE_DISTRITO_TB
FOR EACH ROW
BEGIN
    :NEW.ID_DISTRITO := ID_DISTRITO_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_DISTRITO_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_DISTRITO_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_DIRECCION_TB_INSERT_TRG
BEFORE INSERT ON FIDE_DIRECCION_TB
FOR EACH ROW
BEGIN
    :NEW.ID_DIRECCION := ID_DIRECCION_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_DIRECCION_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_DIRECCION_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_BENEFICIARIOS_TB_INSERT_TRG
BEFORE INSERT ON FIDE_BENEFICIARIOS_TB
FOR EACH ROW
BEGIN
    :NEW.ID_BENEFICIARIO := ID_BENEFICIARIO_SEQ.NEXTVAL;
    :NEW.V_FECHA := SYSTIMESTAMP;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_BENEFICIARIOS_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_BENEFICIARIOS_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_ASOCIADO_TB_INSERT_TRG
BEFORE INSERT ON FIDE_ASOCIADO_TB
FOR EACH ROW
BEGIN
    :NEW.ID_ASOCIADO := ID_ASOCIADO_SEQ.NEXTVAL;
    :NEW.V_FECHA := SYSTIMESTAMP;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_ASOCIADO_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_ASOCIADO_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;


CREATE OR REPLACE TRIGGER FIDE_EXCEDENTES_TB_INSERT_TRG
BEFORE INSERT ON FIDE_EXCEDENTES_TB
FOR EACH ROW
BEGIN
    :NEW.ID_EXCEDENTE := ID_EXCEDENTE_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_EXCEDENTES_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_EXCEDENTES_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;


CREATE OR REPLACE TRIGGER FIDE_GESTION_DE_CREDITO_TB_INSERT_TRG
BEFORE INSERT ON FIDE_GESTION_DE_CREDITO_TB
FOR EACH ROW
BEGIN
    :NEW.ID_GESTION_CREDITO := ID_GESTION_CREDITO_SEQ.NEXTVAL;
    :NEW.V_FECHA := SYSTIMESTAMP;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_GESTION_DE_CREDITO_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_GESTION_DE_CREDITO_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_REBAJO_PLANILLA_TB_INSERT_TRG
BEFORE INSERT ON FIDE_REBAJO_PLANILLA_TB
FOR EACH ROW
BEGIN
    :NEW.ID_PLANILLA := ID_PLANILLA_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_REBAJO_PLANILLA_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_REBAJO_PLANILLA_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;


CREATE OR REPLACE TRIGGER FIDE_GESTION_FACTURA_TB_INSERT_TRG
BEFORE INSERT ON FIDE_GESTION_FACTURA_TB
FOR EACH ROW
BEGIN
    :NEW.ID_GESTION_FACTURA := ID_GESTION_FACTURA_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_GESTION_FACTURA_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_GESTION_FACTURA_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

CREATE OR REPLACE TRIGGER FIDE_GESTION_DE_REPORTE_TB_INSERT_TRG
BEFORE INSERT ON FIDE_GESTION_DE_REPORTE_TB
FOR EACH ROW
BEGIN
    :NEW.ID_GESTION_REPORTE := ID_GESTION_REPORTE_SEQ.NEXTVAL;
    :NEW.V_CREATION_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_CREATED_BY := USER;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'INSERTADO';
END;

CREATE OR REPLACE TRIGGER FIDE_GESTION_DE_REPORTE_TB_UPDATE_TRG
BEFORE UPDATE ON FIDE_GESTION_DE_REPORTE_TB
FOR EACH ROW
BEGIN
    :NEW.V_LAST_UPDATE_DATE := SYSDATE;
    :NEW.V_LAST_UPDATE_BY := USER;
    :NEW.V_ACCION := 'ACTUALIZADO';
END;

--Inserts
INSERT INTO FIDE_ESTADO_TB(v_estado)VALUES('ACTIVO');
INSERT INTO FIDE_ESTADO_TB(v_estado)VALUES('INACTIVO');

INSERT INTO FIDE_ESTADO_CIVIL_TB(id_estado, v_nombre)VALUES(1, 'Casado');
INSERT INTO FIDE_ESTADO_CIVIL_TB(id_estado, v_nombre)VALUES(1, 'Soltero');
INSERT INTO FIDE_ESTADO_CIVIL_TB(id_estado, v_nombre)VALUES(1, 'Divorciado');  

INSERT INTO FIDE_PARENTESCO_TB(id_estado, v_parentesco)VALUES(1, 'Padres');
INSERT INTO FIDE_PARENTESCO_TB(id_estado, v_parentesco)VALUES(1, 'Abuelos');
INSERT INTO FIDE_PARENTESCO_TB(id_estado, v_parentesco)VALUES(1, 'Hijos');  

INSERT INTO FIDE_PRODUCTO_TB(id_estado, v_nombre, v_monto)VALUES(1, 'CREDITO RIFA', 50000);
INSERT INTO FIDE_PRODUCTO_TB(id_estado, v_nombre, v_monto)VALUES(1, 'CREDITO HIPOTECARIO', 150000);
INSERT INTO FIDE_PRODUCTO_TB(id_estado, v_nombre, v_monto)VALUES(1, 'CREDITO MUTUAL', 100000);  

INSERT INTO FIDE_LINEA_DE_CREDITO_TB(id_estado, v_linea)VALUES(1, 'Linea Personal');
INSERT INTO FIDE_LINEA_DE_CREDITO_TB(id_estado, v_linea)VALUES(1, 'Linea Hipotecaria');
INSERT INTO FIDE_LINEA_DE_CREDITO_TB(id_estado, v_linea)VALUES(1, 'Linea Vehicular');  
INSERT INTO FIDE_LINEA_DE_CREDITO_TB(id_estado, v_linea)VALUES(1, 'Linea Comercial');

INSERT INTO FIDE_PLAZO_TB(id_estado, v_plazo)VALUES(1, 'Corto Plazo');
INSERT INTO FIDE_PLAZO_TB(id_estado, v_plazo)VALUES(1, 'Mediano Plazo');
INSERT INTO FIDE_PLAZO_TB(id_estado, v_plazo)VALUES(1, 'Largo Plazo');  
INSERT INTO FIDE_PLAZO_TB(id_estado, v_plazo)VALUES(1, 'Permanente');

INSERT INTO FIDE_CARGOS_ADMINISTRATIVOS_TB(id_estado, v_cargo)VALUES(1, 0.1);

INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Costa Rica');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Panama');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Nicaragua');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Honduras');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'El Salvador');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Guatemala');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Mexico');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Estados Unidos');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Canada');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Colombia');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Peru');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Brazil');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Venezuela');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Paraguay');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Uruguay');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Bolivia');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Ecuador');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Puerto Rico');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Haiti');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Republica Dominicana');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Jamaica');
INSERT INTO FIDE_PAIS_TB(id_estado, v_nombre_pais)VALUES(1, 'Bahamas');

INSERT INTO FIDE_PROVINCIA_TB(id_estado, id_pais, v_nombre_provincia)VALUES(1, 1, 'San Jose');
INSERT INTO FIDE_PROVINCIA_TB(id_estado, id_pais, v_nombre_provincia)VALUES(1, 1, 'Cartago');
INSERT INTO FIDE_PROVINCIA_TB(id_estado, id_pais, v_nombre_provincia)VALUES(1, 1, 'Heredia');
INSERT INTO FIDE_PROVINCIA_TB(id_estado, id_pais, v_nombre_provincia)VALUES(1, 1, 'Alajuela');
INSERT INTO FIDE_PROVINCIA_TB(id_estado, id_pais, v_nombre_provincia)VALUES(1, 1, 'Guanacaste ');
INSERT INTO FIDE_PROVINCIA_TB(id_estado, id_pais, v_nombre_provincia)VALUES(1, 1, 'Puntarenas');
INSERT INTO FIDE_PROVINCIA_TB(id_estado, id_pais, v_nombre_provincia)VALUES(1, 1, 'Limon');

INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'San Jose');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Escazú');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Desamparados');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Puriscal');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Tarrazú');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Aserrí');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Mora');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Goicoechea');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Santa Ana');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Goicoechea');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Alajuelita');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Vasquez de Coronado');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Acosta');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Tibás');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Moravia');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Montes de Oca');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Turrubares');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Dota');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Curridabat');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'Pérez Zeledón');
INSERT INTO FIDE_CANTON_TB(id_estado, id_provincia, v_nombre_canton)VALUES(1, 1, 'León Cortés Castro');
 
INSERT INTO FIDE_DISTRITO_TB(id_estado, id_canton, v_nombre_distrito)VALUES(1, 1, 'San Jose');
INSERT INTO FIDE_DISTRITO_TB(id_estado, id_canton, v_nombre_distrito)VALUES(1, 1, 'Carmen');
INSERT INTO FIDE_DISTRITO_TB(id_estado, id_canton, v_nombre_distrito)VALUES(1, 1, 'Hospital');
INSERT INTO FIDE_DISTRITO_TB(id_estado, id_canton, v_nombre_distrito)VALUES(1, 1, 'Catedral');
INSERT INTO FIDE_DISTRITO_TB(id_estado, id_canton, v_nombre_distrito)VALUES(1, 1, 'Zapote');
INSERT INTO FIDE_DISTRITO_TB(id_estado, id_canton, v_nombre_distrito)VALUES(1, 1, 'San Francisco de Dos Ríos');
INSERT INTO FIDE_DISTRITO_TB(id_estado, id_canton, v_nombre_distrito)VALUES(1, 1, 'Uruca');
INSERT INTO FIDE_DISTRITO_TB(id_estado, id_canton, v_nombre_distrito)VALUES(1, 1, 'Mata Redonda');
INSERT INTO FIDE_DISTRITO_TB(id_estado, id_canton, v_nombre_distrito)VALUES(1, 1, 'Pavas');
INSERT INTO FIDE_DISTRITO_TB(id_estado, id_canton, v_nombre_distrito)VALUES(1, 1, 'Hatillo');
INSERT INTO FIDE_DISTRITO_TB(id_estado, id_canton, v_nombre_distrito)VALUES(1, 1, 'San Sebastián');

--(orden ids:  estado, distrito, canton, provincia, pais)
INSERT INTO FIDE_DIRECCION_TB(id_estado, id_distrito, id_canton, id_provincia, id_pais, v_descripcion)VALUES(1, 1, 1, 1, 1,'Ubicado en los hoteles de la Plaza de la Cultura');
INSERT INTO FIDE_DIRECCION_TB(id_estado, id_distrito, id_canton, id_provincia, id_pais, v_descripcion)VALUES(1, 10, 1, 1, 1,'Cerca de la autopista');
INSERT INTO FIDE_DIRECCION_TB(id_estado, id_distrito, id_canton, id_provincia, id_pais, v_descripcion)VALUES(1, 9, 1, 1, 1,'En el barrio cerca del parque');
INSERT INTO FIDE_DIRECCION_TB(id_estado, id_distrito, id_canton, id_provincia, id_pais, v_descripcion)VALUES(1, 5, 1, 1, 1,'En la feria');
INSERT INTO FIDE_DIRECCION_TB(id_estado, id_distrito, id_canton, id_provincia, id_pais, v_descripcion)VALUES(1, 1, 1, 1, 1,'Cerca del parque central');
 
--(orden ids:  estado, estado civil, direccion, parentesco)
INSERT INTO FIDE_BENEFICIARIOS_TB(id_estado, id_estado_civil, id_direccion, id_parentesco, v_cedula, v_nombre, v_apellido, v_correo, v_telefono)VALUES(1, 1, 5, 1,'183272283', 'Cachito', 'Comino', 'CachitoCo@gmail.com', '32345321');
INSERT INTO FIDE_BENEFICIARIOS_TB(id_estado, id_estado_civil, id_direccion, id_parentesco, v_cedula, v_nombre, v_apellido, v_correo, v_telefono)VALUES(1, 3, 3, 1,'127429834', 'Paco', 'Perez', 'PacoPe@gmail.com', '23938713');
INSERT INTO FIDE_BENEFICIARIOS_TB(id_estado, id_estado_civil, id_direccion, id_parentesco, v_cedula, v_nombre, v_apellido, v_correo, v_telefono)VALUES(1, 2, 1, 1,'134633224', 'Jaime', 'Jimenez', 'JaimeJi@gmail.com', '96847332');
INSERT INTO FIDE_BENEFICIARIOS_TB(id_estado, id_estado_civil, id_direccion, id_parentesco, v_cedula, v_nombre, v_apellido, v_correo, v_telefono)VALUES(1, 1, 5, 1,'157383721', 'Pablo', 'Quesada', 'PabloQue@gmail.com', '83765382');
INSERT INTO FIDE_BENEFICIARIOS_TB(id_estado, id_estado_civil, id_direccion, id_parentesco, v_cedula, v_nombre, v_apellido, v_correo, v_telefono)VALUES(1, 2, 2, 1,'138291812', 'Teresa', 'Mendez', 'TeresaMen@gmail.com', '65748326');
 
--(orden ids:  estado, beneficiario, estado civil, direccion)
INSERT INTO FIDE_ASOCIADO_TB(id_estado, id_beneficiario, id_estado_civil, id_direccion, v_cedula, v_nombre, v_apellido, v_correo, v_telefono)VALUES(1, 4, 3, 4,'122422283', 'Saul', 'Fernandez', 'SaulFer@gmail.com', '29057382');
INSERT INTO FIDE_ASOCIADO_TB(id_estado, id_beneficiario, id_estado_civil, id_direccion, v_cedula, v_nombre, v_apellido, v_correo, v_telefono)VALUES(1, 1, 2, 2,'192749834', 'Matt', 'Quiros', 'MattQui@gmail.com', '23957398');
INSERT INTO FIDE_ASOCIADO_TB(id_estado, id_beneficiario, id_estado_civil, id_direccion, v_cedula, v_nombre, v_apellido, v_correo, v_telefono)VALUES(1, 2, 3, 5,'138293224', 'James', 'Ramos', 'JamesRa@gmail.com', '43827421');
INSERT INTO FIDE_ASOCIADO_TB(id_estado, id_beneficiario, id_estado_civil, id_direccion, v_cedula, v_nombre, v_apellido, v_correo, v_telefono)VALUES(1, 5, 1, 3,'182749324', 'Michael', 'Naranjo', 'MichaelNa@gmail.com', '39147312');
INSERT INTO FIDE_ASOCIADO_TB(id_estado, id_beneficiario, id_estado_civil, id_direccion, v_cedula, v_nombre, v_apellido, v_correo, v_telefono)VALUES(1, 2, 1, 1,'162433205', 'Tadeus', 'Esquivel', 'TadeusEs@gmail.com', '92874923');

--(orden ids:  estado, asociado, producto)
INSERT INTO FIDE_EXCEDENTES_TB(id_estado, id_asociado, id_producto, v_excedente)VALUES(1, 4, 2, 4000.2);
INSERT INTO FIDE_EXCEDENTES_TB(id_estado, id_asociado, id_producto, v_excedente)VALUES(1, 2, 2, 2000.1);
INSERT INTO FIDE_EXCEDENTES_TB(id_estado, id_asociado, id_producto, v_excedente)VALUES(1, 5, 2, 5400.5);
INSERT INTO FIDE_EXCEDENTES_TB(id_estado, id_asociado, id_producto, v_excedente)VALUES(1, 1, 3, 3945.2);
INSERT INTO FIDE_EXCEDENTES_TB(id_estado, id_asociado, id_producto, v_excedente)VALUES(1, 3, 1, 4300.6);
   
--(orden ids:  estado, asociado, plazo, linea de credito, cargo)
INSERT INTO FIDE_GESTION_DE_CREDITO_TB(id_estado, id_asociado, id_plazo, id_linea_credito, id_cargo_administrativo, v_monto, v_tasa, v_cuota, v_poliza, v_total_mensual, v_refinanciamiento, v_adelanto_intereses, v_desembolso)VALUES(1, 4, 3, 2, 1, 4.2, 4.2, 4.2, 4.2, 4.2, 4.2, 4.2, 4.2);
INSERT INTO FIDE_GESTION_DE_CREDITO_TB(id_estado, id_asociado, id_plazo, id_linea_credito, id_cargo_administrativo, v_monto, v_tasa, v_cuota, v_poliza, v_total_mensual, v_refinanciamiento, v_adelanto_intereses, v_desembolso)VALUES(1, 2, 2, 2, 1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1);
INSERT INTO FIDE_GESTION_DE_CREDITO_TB(id_estado, id_asociado, id_plazo, id_linea_credito, id_cargo_administrativo, v_monto, v_tasa, v_cuota, v_poliza, v_total_mensual, v_refinanciamiento, v_adelanto_intereses, v_desembolso)VALUES(1, 5, 4, 2, 1, 5.5, 5.5, 5.5, 5.5, 5.5, 5.5, 5.5, 5.5);
INSERT INTO FIDE_GESTION_DE_CREDITO_TB(id_estado, id_asociado, id_plazo, id_linea_credito, id_cargo_administrativo, v_monto, v_tasa, v_cuota, v_poliza, v_total_mensual, v_refinanciamiento, v_adelanto_intereses, v_desembolso)VALUES(1, 1, 1, 3, 1, 3.2, 4.5, 4.5, 4.5, 4.5, 4.5, 4.5, 4.5);
INSERT INTO FIDE_GESTION_DE_CREDITO_TB(id_estado, id_asociado, id_plazo, id_linea_credito, id_cargo_administrativo, v_monto, v_tasa, v_cuota, v_poliza, v_total_mensual, v_refinanciamiento, v_adelanto_intereses, v_desembolso)VALUES(1, 3, 4, 1, 1, 4.4, 4.4, 4.4, 4.4, 4.4, 4.4, 4.4, 4.5);

--(orden ids:  estado, gestion credito, asociado, producto)
INSERT INTO FIDE_REBAJO_PLANILLA_TB(id_estado, id_gestion_credito, id_asociado, id_producto)VALUES(1, 3, 4, 2);
INSERT INTO FIDE_REBAJO_PLANILLA_TB(id_estado, id_gestion_credito, id_asociado, id_producto)VALUES(1, 4, 3, 2);
INSERT INTO FIDE_REBAJO_PLANILLA_TB(id_estado, id_gestion_credito, id_asociado, id_producto)VALUES(1, 2, 2, 3);
INSERT INTO FIDE_REBAJO_PLANILLA_TB(id_estado, id_gestion_credito, id_asociado, id_producto)VALUES(1, 5, 5, 1);
INSERT INTO FIDE_REBAJO_PLANILLA_TB(id_estado, id_gestion_credito, id_asociado, id_producto)VALUES(1, 1, 1, 1);

--(orden ids:  estado, gestion credito, asociado)
INSERT INTO FIDE_GESTION_FACTURA_TB(id_estado, id_gestion_credito, id_asociado, v_pago, v_factura)VALUES(1, 3, 4, 2.2, 'Factura 1');
INSERT INTO FIDE_GESTION_FACTURA_TB(id_estado, id_gestion_credito, id_asociado, v_pago, v_factura)VALUES(1, 4, 3, 2.1, 'Factura 2');
INSERT INTO FIDE_GESTION_FACTURA_TB(id_estado, id_gestion_credito, id_asociado, v_pago, v_factura)VALUES(1, 2, 2, 3.4, 'Factura 3');
INSERT INTO FIDE_GESTION_FACTURA_TB(id_estado, id_gestion_credito, id_asociado, v_pago, v_factura)VALUES(1, 5, 5, 1.5, 'Factura 4');
INSERT INTO FIDE_GESTION_FACTURA_TB(id_estado, id_gestion_credito, id_asociado, v_pago, v_factura)VALUES(1, 1, 1, 1.3, 'Factura 5');

--(orden ids:  estado, gestion credito, asociado, producto, planilla, factura)
INSERT INTO FIDE_GESTION_DE_REPORTE_TB(id_estado, id_gestion_credito, id_asociado, id_producto, id_planilla, id_gestion_factura)VALUES(1, 3, 4, 1, 2, 3);
INSERT INTO FIDE_GESTION_DE_REPORTE_TB(id_estado, id_gestion_credito, id_asociado, id_producto, id_planilla, id_gestion_factura)VALUES(1, 4, 3, 2, 1, 5);
INSERT INTO FIDE_GESTION_DE_REPORTE_TB(id_estado, id_gestion_credito, id_asociado, id_producto, id_planilla, id_gestion_factura)VALUES(1, 2, 2, 3, 4, 2);
INSERT INTO FIDE_GESTION_DE_REPORTE_TB(id_estado, id_gestion_credito, id_asociado, id_producto, id_planilla, id_gestion_factura)VALUES(1, 5, 5, 3, 5, 1);
INSERT INTO FIDE_GESTION_DE_REPORTE_TB(id_estado, id_gestion_credito, id_asociado, id_producto, id_planilla, id_gestion_factura)VALUES(1, 1, 1, 2, 3, 4);

DROP TABLE FIDE_GESTION_DE_REPORTE_TB;
--views
CREATE OR REPLACE VIEW FIDE_ASOCIADOS_V AS 
SELECT A.ID_ASOCIADO,  A.V_CEDULA, A.V_NOMBRE, A.V_APELLIDO, A.V_CORREO, A.V_FECHA, A.V_TELEFONO, 
       EC.ID_ESTADO_CIVIL, EC.ID_ESTADO AS ESTADO_CIVIL, D.ID_DIRECCION, D.V_DESCRIPCION AS DIRECCION, 
       E.V_ESTADO AS ESTADO 
FROM FIDE_ASOCIADO_TB A 
JOIN FIDE_ESTADO_CIVIL_TB EC ON A.ID_ESTADO_CIVIL = EC.ID_ESTADO_CIVIL 
JOIN FIDE_DIRECCION_TB D ON A.ID_DIRECCION = D.ID_DIRECCION 
JOIN FIDE_ESTADO_TB E ON A.ID_ESTADO = E.ID_ESTADO; 

SELECT * FROM FIDE_ASOCIADOS_V;


CREATE OR REPLACE VIEW FIDE_BENEFICIARIOS_V AS 

SELECT B.V_CEDULA, B.V_NOMBRE, B.V_APELLIDO, B.V_CORREO, B.V_FECHA, B.V_TELEFONO, A.ID_ASOCIADO,  
       A.V_NOMBRE AS ASOCIADO, EC.ID_ESTADO_CIVIL, EC.ID_ESTADO AS ESTADO_CIVIL, D.ID_DIRECCION, 
       D.V_DESCRIPCION AS DIRECCION, P.V_PARENTESCO, E.V_ESTADO AS ESTADO 
FROM FIDE_BENEFICIARIOS_TB B 
JOIN FIDE_ESTADO_CIVIL_TB EC ON B.ID_ESTADO_CIVIL = EC.ID_ESTADO_CIVIL 
JOIN FIDE_DIRECCION_TB D ON B.ID_DIRECCION = D.ID_DIRECCION 
JOIN FIDE_ESTADO_TB E ON B.ID_ESTADO = E.ID_ESTADO
JOIN FIDE_ASOCIADO_TB A ON B.ID_BENEFICIARIO = A.ID_BENEFICIARIO 
JOIN FIDE_PARENTESCO_TB P ON B.ID_PARENTESCO = P.ID_PARENTESCO; 

SELECT * FROM FIDE_BENEFICIARIOS_V; 

 

CREATE OR REPLACE VIEW FIDE_PRODUCTOS_V AS 

SELECT P.ID_PRODUCTO,  P.V_NOMBRE, E.V_ESTADO AS ESTADO 
FROM FIDE_PRODUCTO_TB P 
JOIN FIDE_ESTADO_TB E ON P.ID_ESTADO = E.ID_ESTADO; 

SELECT * FROM FIDE_PRODUCTOS_V; 
 

CREATE OR REPLACE VIEW FIDE_CREDITOS_V AS 
SELECT C.ID_GESTION_CREDITO, A.V_NOMBRE AS ASOCIADO, LC.V_LINEA AS LINEA_CREDITO, P.V_PLAZO, 
       C.V_MONTO, C.V_TASA, C.V_CUOTA, C.V_TOTAL_MENSUAL, C.V_FECHA, E.V_ESTADO AS ESTADO 
FROM FIDE_GESTION_DE_CREDITO_TB C 
JOIN FIDE_ASOCIADO_TB A ON C.ID_ASOCIADO = A.ID_ASOCIADO 
JOIN FIDE_LINEA_DE_CREDITO_TB LC ON C.ID_LINEA_CREDITO = LC.ID_LINEA_CREDITO
JOIN FIDE_PLAZO_TB P ON C.ID_PLAZO = P. ID_PLAZO
JOIN FIDE_ESTADO_TB E ON C.ID_ESTADO = E.ID_ESTADO; 

SELECT * FROM FIDE_CREDITOS_V;  

 

CREATE OR REPLACE VIEW FIDE_FACTURAS_V AS 
SELECT F.ID_GESTION_FACTURA, A.V_NOMBRE AS ASOCIADO, F.V_PAGO, F.V_FACTURA, E.V_ESTADO AS ESTADO 
FROM FIDE_GESTION_FACTURA_TB F 
JOIN FIDE_ASOCIADO_TB A ON F.ID_ASOCIADO = A.ID_ASOCIADO
JOIN FIDE_ESTADO_TB E ON F.ID_ESTADO = E.ID_ESTADO;

SELECT * FROM FIDE_FACTURAS_V; 
 

CREATE OR REPLACE VIEW FIDE_EXCEDENTES_V AS 
SELECT E.ID_ASOCIADO, A.V_NOMBRE AS ASOCIADO, P.V_NOMBRE AS PRODUCTO, E.V_EXCEDENTE, EST.V_ESTADO AS ESTADO 
FROM FIDE_EXCEDENTES_TB E 
JOIN FIDE_ASOCIADO_TB A ON E.ID_ASOCIADO = A.ID_ASOCIADO 
JOIN FIDE_PRODUCTO_TB P ON E.ID_PRODUCTO = P.ID_PRODUCTO 
JOIN FIDE_ESTADO_TB EST ON E.ID_ESTADO = EST.ID_ESTADO; 

SELECT * FROM FIDE_EXCEDENTES_V;  



CREATE OR REPLACE VIEW FIDE_DIRECCIONES_V AS 
SELECT D.ID_DIRECCION, D.V_DESCRIPCION, DIST.V_NOMBRE_DISTRITO AS DISTRITO, CANT.V_NOMBRE_CANTON AS CANTON, 
PROV.V_NOMBRE_PROVINCIA AS PROVINCIA, PA.V_NOMBRE_PAIS AS PAIS, EST.V_ESTADO AS ESTADO 
FROM FIDE_DIRECCION_TB D 
JOIN FIDE_DISTRITO_TB DIST ON D.ID_DISTRITO = DIST.ID_DISTRITO 
JOIN FIDE_CANTON_TB CANT ON D.ID_CANTON = CANT.ID_CANTON 
JOIN FIDE_PROVINCIA_TB PROV ON D.ID_PROVINCIA = PROV.ID_PROVINCIA 
JOIN FIDE_PAIS_TB PA ON PROV.ID_PAIS = PA.ID_PAIS 
JOIN FIDE_ESTADO_TB EST ON D.ID_ESTADO = EST.ID_ESTADO; 
 
SELECT * FROM FIDE_DIRECCIONES_V;  
 

 

CREATE OR REPLACE VIEW FIDE_ESTADISTICAS_CREDITOS_V AS 

SELECT LC.V_LINEA AS LINEA_CREDITO, COUNT(C.ID_GESTION_CREDITO) AS TOTAL_CREDITOS, SUM(C.V_MONTO) AS MONTO_TOTAL, 
AVG(C.V_TASA) AS TASA_PROMEDIO, AVG(C.V_CUOTA) AS CUOTA_PROMEDIO 
FROM FIDE_GESTION_DE_CREDITO_TB C 
JOIN FIDE_LINEA_DE_CREDITO_TB LC ON C.ID_LINEA_CREDITO = LC.ID_LINEA_CREDITO 
GROUP BY LC.V_LINEA 
ORDER BY MONTO_TOTAL DESC; 

SELECT * FROM FIDE_ESTADISTICAS_CREDITOS_V;


CREATE OR REPLACE VIEW FIDE_CREDITOS_DETALLADOS_V AS 
SELECT C.ID_GESTION_CREDITO, A.V_NOMBRE AS ASOCIADOS, A.V_CEDULA, LC.V_LINEA AS LINEA_CREDITO, 
       P.V_PLAZO AS PLAZO_MESES, C.V_MONTO, C.V_TASA, C.V_CUOTA, C.V_TOTAL_MENSUAL, C.V_FECHA AS FECHA_SOLICITUD, 
       EST.V_ESTADO AS ESTADO_CREDITO 
FROM FIDE_GESTION_DE_CREDITO_TB C 
JOIN FIDE_ASOCIADO_TB A ON C.ID_ASOCIADO = A.ID_ASOCIADO 
JOIN FIDE_LINEA_DE_CREDITO_TB LC ON C.ID_LINEA_CREDITO = LC.ID_LINEA_CREDITO
JOIN FIDE_PLAZO_TB P ON C.ID_PLAZO = P.ID_PLAZO 
JOIN FIDE_ESTADO_TB EST ON C.ID_ESTADO = EST.ID_ESTADO 
ORDER BY C.V_FECHA DESC; 

SELECT * FROM FIDE_CREDITOS_DETALLADOS_V; 

 
CREATE OR REPLACE VIEW FIDE_FACTURAS_PENDIENTES_V AS 
SELECT F.ID_GESTION_FACTURA, A.V_NOMBRE AS ASOCIADOS, A.V_CEDULA, F.V_FACTURA, F.V_PAGO AS MONTO_PAGO, 
       EST.V_ESTADO AS ESTADO_FACTURA 
FROM FIDE_GESTION_FACTURA_TB F 
JOIN FIDE_ASOCIADO_TB A ON F.ID_ASOCIADO = A.ID_ASOCIADO
JOIN FIDE_ESTADO_TB EST ON F.ID_ESTADO = EST.ID_ESTADO 
WHERE EST.V_ESTADO NOT IN('INACTIVO') 
ORDER BY F.V_FACTURA DESC; 

SELECT * FROM FIDE_FACTURAS_PENDIENTES_V; 


CREATE OR REPLACE VIEW FIDE_PRODUCTOS_ALTOS_V AS
SELECT ID_PRODUCTO, V_NOMBRE, V_MONTO 
FROM FIDE_PRODUCTO_TB
WHERE V_MONTO > 1000
 AND ID_ESTADO IN (SELECT ID_ESTADO FROM FIDE_ESTADO_TB WHERE V_ESTADO = 'ACTIVO');
 
SELECT * FROM FIDE_PRODUCTOS_ALTOS_V; 


CREATE OR REPLACE VIEW FIDE_CARGOS_ORDENADOS_V AS
SELECT C.ID_CARGO_ADMINISTRATIVO, C.V_CARGO, EST.V_ESTADO 
FROM FIDE_CARGOS_ADMINISTRATIVOS_TB C
JOIN FIDE_ESTADO_TB EST ON C.ID_ESTADO = EST.ID_ESTADO
ORDER BY V_CARGO DESC;
 
SELECT * FROM FIDE_CARGOS_ORDENADOS_V; 


CREATE OR REPLACE VIEW FIDE_CREDITOS_PLANILLA_V AS
SELECT RP.ID_PLANILLA, A.V_NOMBRE AS ASOCIADO, P.V_NOMBRE AS PRODUCTO, GC.V_MONTO, GC.V_CUOTA, EST.V_ESTADO 
FROM FIDE_REBAJO_PLANILLA_TB RP
JOIN FIDE_ASOCIADO_TB A ON RP.ID_ASOCIADO = A.ID_ASOCIADO
JOIN FIDE_PRODUCTO_TB P ON RP.ID_PRODUCTO = P.ID_PRODUCTO
JOIN FIDE_GESTION_DE_CREDITO_TB GC ON RP.ID_GESTION_CREDITO = GC.ID_GESTION_CREDITO
JOIN FIDE_ESTADO_TB EST ON RP.ID_ESTADO = EST.ID_ESTADO;
 
SELECT * FROM FIDE_CREDITOS_PLANILLA_V; 



CREATE OR REPLACE VIEW FIDE_BENEFICIARIOS_CLASIFICADOS_V AS
SELECT B.ID_BENEFICIARIO, B.V_NOMBRE, B.V_APELLIDO, EC.V_NOMBRE AS ESTADO_CIVIL, 
       P.V_PARENTESCO, EST.V_ESTADO 
FROM FIDE_BENEFICIARIOS_TB B
JOIN FIDE_ESTADO_CIVIL_TB EC ON B.ID_ESTADO_CIVIL = EC.ID_ESTADO_CIVIL
JOIN FIDE_PARENTESCO_TB P ON B.ID_PARENTESCO = P.ID_PARENTESCO
JOIN FIDE_ESTADO_TB EST ON B.ID_ESTADO = EST.ID_ESTADO;

SELECT * FROM FIDE_BENEFICIARIOS_CLASIFICADOS_V; 


--Procedimientos almacenados (orden: insertar, actualizar y eliminar)
CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_ESTADO_TB_SP (
    p_v_estado VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_ESTADO_TB (v_estado)
    VALUES(p_v_estado);
END;

BEGIN
    FIDE_INSERTAR_FIDE_ESTADO_TB_SP('Adentro');
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_ESTADO_TB_SP (
    p_id_estado INT,
    p_v_estado VARCHAR
) AS
BEGIN
    UPDATE FIDE_ESTADO_TB  
    SET v_estado = p_v_estado
    WHERE id_estado = p_id_estado;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_ESTADO_TB_SP(5, 'Afuera');
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_ESTADO_TB_SP (
    p_id_estado INT
)AS
BEGIN
    DELETE FROM FIDE_ESTADO_TB
    WHERE id_estado = p_id_estado;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_ESTADO_TB_SP(5);
END;


CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_ESTADO_CIVIL_TB_SP (
    p_id_estado INT,
    p_v_nombre VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_ESTADO_CIVIL_TB (id_estado, v_nombre)
    VALUES(p_id_estado, p_v_nombre);
END;

BEGIN
    FIDE_INSERTAR_FIDE_ESTADO_CIVIL_TB_SP(1, 'Divorciado');
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_ESTADO_CIVIL_TB_SP (
    p_id_estado_civil INT,
    p_v_nombre VARCHAR
) AS
BEGIN
    UPDATE FIDE_ESTADO_CIVIL_TB  
    SET v_nombre = p_v_nombre
    WHERE id_estado_civil = p_id_estado_civil;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_ESTADO_CIVIL_TB_SP(1, 'En proceso');
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_ESTADO_CIVIL_TB_SP (
    p_id_estado_civil INT
) AS
BEGIN
    UPDATE FIDE_ESTADO_CIVIL_TB  
    SET id_estado = 2
    WHERE id_estado_civil = p_id_estado_civil;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_ESTADO_CIVIL_TB_SP(4);
END;


CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_PARENTESCO_TB_SP (
    p_id_estado INT,
    p_v_parentesco VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_PARENTESCO_TB (id_estado, v_parentesco)
    VALUES(p_id_estado, p_v_parentesco);
END;

BEGIN
    FIDE_INSERTAR_FIDE_PARENTESCO_TB_SP(1, 'Tio');
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_PARENTESCO_TB_SP (
    p_id_parentesco INT,
    p_v_parentesco VARCHAR
) AS
BEGIN
    UPDATE FIDE_PARENTESCO_TB  
    SET v_parentesco = p_v_parentesco
    WHERE id_parentesco = p_id_parentesco;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_PARENTESCO_TB_SP(4, 'Tia');
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_PARENTESCO_TB_SP (
    p_id_parentesco INT
) AS
BEGIN
    UPDATE FIDE_PARENTESCO_TB  
    SET id_estado = 2
    WHERE id_parentesco = p_id_parentesco;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_PARENTESCO_TB_SP(4);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_PRODUCTO_TB_SP (
    p_id_estado INT,
    p_v_nombre VARCHAR, 
    p_v_monto DECIMAL
) AS
BEGIN
    INSERT INTO FIDE_PRODUCTO_TB (id_estado, v_nombre, v_monto)
    VALUES(p_id_estado, p_v_nombre, p_v_monto);
END;

BEGIN
    FIDE_INSERTAR_FIDE_PRODUCTO_TB_SP(1, 'Credito Popular', 10000);
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_PRODUCTO_TB_SP (
    p_id_producto INT,
    p_v_nombre VARCHAR, 
    p_v_monto DECIMAL
) AS
BEGIN
    UPDATE FIDE_PRODUCTO_TB  
    SET v_nombre = p_v_nombre, v_monto = p_v_monto
    WHERE id_producto = p_id_producto;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_PRODUCTO_TB_SP(4, 'Credito Nacional', 1000000);
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_PRODUCTO_TB_SP (
    p_id_producto INT
) AS
BEGIN
    UPDATE FIDE_PRODUCTO_TB  
    SET id_estado = 2
    WHERE id_producto = p_id_producto;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_PRODUCTO_TB_SP(4);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_LINEA_DE_CREDITO_TB_SP (
    p_id_estado INT,
    p_v_linea VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_LINEA_DE_CREDITO_TB (id_estado, v_linea)
    VALUES(p_id_estado, p_v_linea);
END;

BEGIN
    FIDE_INSERTAR_FIDE_LINEA_DE_CREDITO_TB_SP(1, 'Linea Internacional');
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_LINEA_DE_CREDITO_TB_SP (
    p_id_linea_credito INT,
    p_v_linea VARCHAR
) AS
BEGIN
    UPDATE FIDE_LINEA_DE_CREDITO_TB  
    SET v_linea = p_v_linea
    WHERE id_linea_credito = p_id_linea_credito;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_LINEA_DE_CREDITO_TB_SP(5, 'Linea Marzo');
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_LINEA_DE_CREDITO_TB_SP (
    p_id_linea_credito INT
) AS
BEGIN
    UPDATE FIDE_LINEA_DE_CREDITO_TB  
    SET id_estado = 2
    WHERE id_linea_credito = p_id_linea_credito;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_LINEA_DE_CREDITO_TB_SP(5);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_PLAZO_TB_SP (
    p_id_estado INT,
    p_v_plazo VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_PLAZO_TB (id_estado, v_plazo)
    VALUES(p_id_estado, p_v_plazo);
END;

BEGIN
    FIDE_INSERTAR_FIDE_PLAZO_TB_SP(1, 'Temporal');
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_PLAZO_TB_SP (
    p_id_plazo INT,
    p_v_plazo VARCHAR
) AS
BEGIN
    UPDATE FIDE_PLAZO_TB  
    SET v_plazo = p_v_plazo
    WHERE id_plazo = p_id_plazo;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_PLAZO_TB_SP(1, 'Aemporal');
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_PLAZO_TB_SP (
    p_id_plazo INT
) AS
BEGIN
    UPDATE FIDE_PLAZO_TB  
    SET id_estado = 2
    WHERE id_plazo = p_id_plazo;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_PLAZO_TB_SP(5);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_CARGOS_ADMINISTRATIVOS_TB_SP (
    p_id_estado INT,
    p_v_cargo DECIMAL
) AS
BEGIN
    INSERT INTO FIDE_CARGOS_ADMINISTRATIVOS_TB (id_estado, v_cargo)
    VALUES(p_id_estado, p_v_cargo);
END;

BEGIN
    FIDE_INSERTAR_FIDE_CARGOS_ADMINISTRATIVOS_TB_SP(1, 0,9);
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_CARGOS_ADMINISTRATIVOS_TB_SP (
    p_id_cargo_administrativo INT,
    p_v_cargo VARCHAR
) AS
BEGIN
    UPDATE FIDE_CARGOS_ADMINISTRATIVOS_TB  
    SET v_cargo = p_v_cargo
    WHERE id_cargo_administrativo = p_id_cargo_administrativo;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_CARGOS_ADMINISTRATIVOS_TB_SP(2, 2);
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_CARGOS_ADMINISTRATIVOS_TB_SP (
    p_id_cargo_administrativo INT
) AS
BEGIN
    UPDATE FIDE_CARGOS_ADMINISTRATIVOS_TB  
    SET id_estado = 2
    WHERE id_cargo_administrativo = p_id_cargo_administrativo;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_CARGOS_ADMINISTRATIVOS_TB_SP(2);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_PAIS_TB_SP (
    p_id_estado INT,
    p_v_nombre_pais VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_PAIS_TB (id_estado, v_nombre_pais)
    VALUES(p_id_estado, p_v_nombre_pais);
END;

BEGIN
    FIDE_INSERTAR_FIDE_PAIS_TB_SP(1, 'Reino Unido');
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_PAIS_TB_SP (
    p_id_pais INT,
    p_v_nombre_pais VARCHAR
) AS
BEGIN
    UPDATE FIDE_PAIS_TB  
    SET v_nombre_pais = p_v_nombre_pais
    WHERE id_pais = p_id_pais;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_PAIS_TB_SP(23, 'Alemania');
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_PAIS_TB_SP (
    p_id_pais INT
) AS
BEGIN
    UPDATE FIDE_PAIS_TB  
    SET id_estado = 2
    WHERE id_pais = p_id_pais;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_PAIS_TB_SP(23);
END;


CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_PROVINCIA_TB_SP (
    p_id_pais INT,
    p_id_estado INT,
    p_v_nombre_provincia VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_PROVINCIA_TB (id_pais, id_estado, v_nombre_provincia)
    VALUES(p_id_pais, p_id_estado, p_v_nombre_provincia);
END;

BEGIN
    FIDE_INSERTAR_FIDE_PROVINCIA_TB_SP(1, 1, 'Partifo de Nicoya');
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_PROVINCIA_TB_SP (
    p_id_provincia INT,
    p_v_nombre_provincia VARCHAR
) AS
BEGIN
    UPDATE FIDE_PROVINCIA_TB  
    SET v_nombre_provincia = p_v_nombre_provincia
    WHERE id_provincia = p_id_provincia;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_PROVINCIA_TB_SP(8, 'Nicoya');
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_PROVINCIA_TB_SP (
    p_id_provincia INT
) AS
BEGIN
    UPDATE FIDE_PROVINCIA_TB  
    SET id_estado = 2
    WHERE id_provincia = p_id_provincia;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_PROVINCIA_TB_SP(8);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_CANTON_TB_SP (
    p_id_provincia INT,
    p_id_estado INT,
    p_v_nombre_canton VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_CANTON_TB (id_provincia, id_estado, v_nombre_canton)
    VALUES(p_id_provincia, p_id_estado, p_v_nombre_canton);
END;

BEGIN
    FIDE_INSERTAR_FIDE_CANTON_TB_SP(1, 1, 'Goicochea');
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_CANTON_TB_SP (
    p_id_canton INT,
    p_v_nombre_canton VARCHAR
) AS
BEGIN
    UPDATE FIDE_CANTON_TB  
    SET v_nombre_canton = p_v_nombre_canton
    WHERE id_canton = p_id_canton;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_CANTON_TB_SP(22, 'Rhomosher');
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_CANTON_TB_SP (
    p_id_canton INT
) AS
BEGIN
    UPDATE FIDE_CANTON_TB  
    SET id_estado = 2
    WHERE id_canton = p_id_canton;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_CANTON_TB_SP(22);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_DISTRITO_TB_SP (
    p_id_canton INT,
    p_id_estado INT,
    p_v_nombre_distrito VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_DISTRITO_TB (id_canton, id_estado, v_nombre_distrito)
    VALUES(p_id_canton, p_id_estado, p_v_nombre_distrito);
END;

BEGIN
    FIDE_INSERTAR_FIDE_DISTRITO_TB_SP(1, 1, 'La Sabana');
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_DISTRITO_TB_SP (
    p_id_distrito INT,
    p_v_nombre_distrito VARCHAR
) AS
BEGIN
    UPDATE FIDE_DISTRITO_TB  
    SET v_nombre_distrito = p_v_nombre_distrito
    WHERE id_distrito = p_id_distrito;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_DISTRITO_TB_SP(12, 'Sabana');
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_DISTRITO_TB_SP (
    p_id_distrito INT
) AS
BEGIN
    UPDATE FIDE_DISTRITO_TB  
    SET id_estado = 2
    WHERE id_distrito = p_id_distrito;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_DISTRITO_TB_SP(12);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_DIRECCION_TB_SP (
    p_id_distrito INT,
    p_id_canton INT,
    p_id_provincia INT,
    p_id_pais INT,
    p_id_estado INT,
    p_v_descripcion VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_DIRECCION_TB (id_distrito, id_canton, id_provincia,
                                  id_pais, id_estado, v_descripcion)
    VALUES(p_id_distrito, p_id_canton, p_id_provincia, p_id_pais, 
           p_id_estado, p_v_descripcion);
END;

BEGIN
    FIDE_INSERTAR_FIDE_DIRECCION_TB_SP(1, 1, 1, 1, 1, 'Cerca del Centro Comercial' );
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_DIRECCION_TB_SP (
    p_id_direccion INT,
    p_v_descripcion VARCHAR
) AS
BEGIN
    UPDATE FIDE_DIRECCION_TB  
    SET v_descripcion = p_v_descripcion
    WHERE id_direccion = p_id_direccion;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_DIRECCION_TB_SP(6, 'Cerca del Comercial' );
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_DIRECCION_TB_SP (
    p_id_direccion INT
) AS
BEGIN
    UPDATE FIDE_DIRECCION_TB  
    SET id_estado = 2
    WHERE id_direccion = p_id_direccion;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_DIRECCION_TB_SP(6 );
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_BENEFICIARIOS_TB_SP (
    p_id_estado_civil INT,
    p_id_direccion INT,
    p_id_estado INT,
    p_id_parentesco INT,
    p_v_cedula VARCHAR,
    p_v_nombre VARCHAR,
    p_v_apellido VARCHAR,
    p_v_correo VARCHAR,
    p_v_telefono VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_BENEFICIARIOS_TB (id_estado_civil, id_direccion, id_estado,
                                   id_parentesco, v_cedula, v_nombre, v_apellido,
                                   v_correo, v_telefono)
    VALUES(p_id_estado_civil, p_id_direccion, p_id_estado, p_id_parentesco, 
           p_v_cedula, p_v_nombre, p_v_apellido, p_v_correo, p_v_telefono);
END;

BEGIN
    FIDE_INSERTAR_FIDE_BENEFICIARIOS_TB_SP(1,1, 2, 3, '123456789', 'Bonnie', 'Carmona', 'BoCa@gmail.com', '73496137');
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_BENEFICIARIOS_TB_SP (
    p_id_beneficiario INT,
    p_v_cedula VARCHAR,
    p_v_nombre VARCHAR,
    p_v_apellido VARCHAR,
    p_v_correo VARCHAR,
    p_v_telefono VARCHAR
) AS
BEGIN
    UPDATE FIDE_BENEFICIARIOS_TB  
    SET v_cedula = p_v_cedula, v_nombre = p_v_nombre,
        v_apellido = p_v_apellido, v_correo = p_v_correo,
        v_telefono = p_v_telefono
    WHERE id_beneficiario = p_id_beneficiario;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_BENEFICIARIOS_TB_SP(6, '123456789', 'Bonni', 'Carmona', 'BoCa@gmail.com', '73496137');
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_BENEFICIARIOS_TB_SP (
    p_id_beneficiario INT
) AS
BEGIN
    UPDATE FIDE_BENEFICIARIOS_TB  
    SET id_estado = 2
    WHERE id_beneficiario = p_id_beneficiario;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_BENEFICIARIOS_TB_SP(6);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_ASOCIADO_TB_SP (
    p_id_beneficiario INT,
    p_id_estado_civil INT,
    p_id_direccion INT, 
    p_id_estado INT,
    p_v_cedula VARCHAR, 
    p_v_nombre VARCHAR,
    p_v_apellido VARCHAR,
    p_v_correo VARCHAR,
    p_v_fecha DATE,
    p_v_telefono VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_ASOCIADO_TB (id_beneficiario, id_estado_civil, id_direccion, 
    id_estado, v_cedula, v_nombre, v_apellido, v_correo, v_fecha, v_telefono
    )
    VALUES(p_id_beneficiario, p_id_estado_civil, p_id_direccion, p_id_estado, 
    p_v_cedula, p_v_nombre, p_v_apellido, p_v_correo, SYSDATE, p_v_telefono
    );
END;

BEGIN
    FIDE_INSERTAR_FIDE_ASOCIADO_TB_SP(6, 1, 3, 1, '098765443', 'Paquita', 'Parrita', 'PaPa@gmail.com', SYSDATE, '36536534');
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_ASOCIADO_TB_SP (
    p_id_asociado INT,
    p_v_cedula VARCHAR, 
    p_v_nombre VARCHAR, 
    p_v_apellido VARCHAR, 
    p_v_correo VARCHAR, 
    p_v_telefono VARCHAR
) AS
BEGIN
    UPDATE FIDE_ASOCIADO_TB  
    SET v_cedula = p_v_cedula, v_nombre = p_v_nombre, v_apellido = p_v_apellido,
        v_correo = p_v_correo, v_telefono = p_v_telefono
    WHERE id_asociado = p_id_asociado;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_ASOCIADO_TB_SP(6, '098765443', 'Paquita', 'Parrita', 'PaPITA@gmail.com', '36536534');
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_ASOCIADO_TB_SP (
    p_id_asociado INT
) AS
BEGIN
    UPDATE FIDE_ASOCIADO_TB  
    SET id_estado = 2
    WHERE id_asociado = p_id_asociado;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_ASOCIADO_TB_SP(6);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_EXCEDENTES_TB_SP (
    p_id_asociado INT,
    p_id_producto INT,
    p_id_estado INT,
    p_v_excedente DECIMAL
) AS
BEGIN
    INSERT INTO FIDE_EXCEDENTES_TB (id_asociado, id_producto, id_estado, v_excedente
    )
    VALUES(p_id_asociado, p_id_producto, p_id_estado, p_v_excedente);
END;

BEGIN
    FIDE_INSERTAR_FIDE_EXCEDENTES_TB_SP(6, 3, 1, 5000);
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_EXCEDENTES_TB_SP (
    p_id_excedente INT,
    p_v_excedente VARCHAR
) AS
BEGIN
    UPDATE FIDE_EXCEDENTES_TB  
    SET v_excedente = p_v_excedente
    WHERE id_excedente = p_id_excedente;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_EXCEDENTES_TB_SP(6, 5001);
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_EXCEDENTES_TB_SP (
    p_id_excedente INT
) AS
BEGIN
    UPDATE FIDE_EXCEDENTES_TB  
    SET id_estado = 2
    WHERE id_excedente = p_id_excedente;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_EXCEDENTES_TB_SP(6);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_GESTION_DE_CREDITO_TB_SP (
    p_id_asociado INT,
    p_id_plazo INT,
    p_id_linea_credito INT,
    p_id_cargo_administrativo INT,
    p_id_estado INT,
    p_v_monto DECIMAL,
    p_v_tasa DECIMAL,
    p_v_cuota DECIMAL,
    p_v_poliza DECIMAL,
    p_v_total_mensual DECIMAL,
    p_v_refinanciamiento DECIMAL,
    p_v_adelanto_intereses DECIMAL,
    p_v_desembolso DECIMAL,
    p_v_fecha DATE
) AS
BEGIN
    INSERT INTO FIDE_GESTION_DE_CREDITO_TB (id_asociado, id_plazo, id_cargo_administrativo, id_estado,
    v_monto, v_tasa, v_cuota, v_poliza, v_total_mensual, v_refinanciamiento,
    v_adelanto_intereses, v_desembolso, v_fecha
    )
    VALUES(p_id_asociado, p_id_plazo, p_id_linea_credito, p_id_cargo_administrativo, p_id_estado,
    p_v_monto, p_v_tasa, p_v_poliza, p_v_total_mensual, p_v_refinanciamiento, p_v_adelanto_intereses,
    p_v_desembolso, p_v_fecha);
END;

BEGIN
    FIDE_INSERTAR_FIDE_GESTION_DE_CREDITO_TB_SP(6, 2, 1, 1, 1, 3, 5, 3, 2, 4, 3, 2, 1, SYSDATE);
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_GESTION_DE_CREDITO_TB_SP (
    p_id_gestion_credito INT,
    p_v_monto DECIMAL,
    p_v_tasa DECIMAL,
    p_v_cuota DECIMAL,
    p_v_poliza DECIMAL,
    p_v_total_mensual DECIMAL,
    p_v_refinanciamiento DECIMAL,
    p_v_desembolso DECIMAL
) AS
BEGIN
    UPDATE FIDE_GESTION_DE_CREDITO_TB  
    SET v_monto = p_v_monto,
        v_tasa = p_v_tasa,
        v_cuota = p_v_cuota,
        v_poliza = p_v_poliza,
        v_total_mensual = p_v_total_mensual,
        v_refinanciamiento = p_v_refinanciamiento,
        v_desembolso = p_v_desembolso
    WHERE id_gestion_credito = p_id_gestion_credito;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_GESTION_DE_CREDITO_TB_SP(6, 3, 5, 2, 2, 4, 3, 2);
END;



CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_GESTION_DE_CREDITO_TB_SP (
    p_id_gestion_credito INT
) AS
BEGIN
    UPDATE FIDE_GESTION_DE_CREDITO_TB  
    SET id_estado = 2
    WHERE id_gestion_credito  = p_id_gestion_credito ;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_GESTION_DE_CREDITO_TB_SP(6);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_REBAJO_PLANILLA_TB_SP (
    p_id_gestion_credito INT,
    p_id_asociado INT,
    p_id_producto INT,
    p_id_estado INT
) AS
BEGIN
    INSERT INTO FIDE_REBAJO_PLANILLA_TB(id_gestion_credito, id_asociado, id_producto, id_estado
    )
    VALUES(p_id_gestion_credito, p_id_asociado, p_id_producto, p_id_estado);
END;

BEGIN
    FIDE_INSERTAR_FIDE_REBAJO_PLANILLA_TB_SP(6, 2, 4, 1);
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_REBAJO_PLANILLA_TB_SP (
    p_id_planilla INT,
    p_id_gestion_credito INT,
    p_id_asociado INT,
    p_id_producto INT
) AS
BEGIN
    UPDATE FIDE_REBAJO_PLANILLA_TB  
    SET id_gestion_credito = p_id_gestion_credito,
        id_asociado = p_id_asociado,
        id_producto = p_id_producto
    WHERE id_planilla = p_id_planilla;
END;
 
BEGIN
    FIDE_MODIFICAR_FIDE_REBAJO_PLANILLA_TB_SP(6 , 2, 3, 1);
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_REBAJO_PLANILLA_TB_SP  (
    p_id_planilla INT
) AS
BEGIN
    UPDATE FIDE_REBAJO_PLANILLA_TB   
    SET id_estado = 2
    WHERE id_planilla  = p_id_planilla ;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_REBAJO_PLANILLA_TB_SP(6);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_GESTION_FACTURA_TB_SP (
    p_id_asociado INT,
    p_id_gestion_credito INT,
    p_id_estado INT,
    p_v_pago DECIMAL,
    p_v_factura VARCHAR
) AS
BEGIN
    INSERT INTO FIDE_GESTION_FACTURA_TB (id_asociado, id_gestion_credito, id_estado,
    v_pago, v_factura
    )
    VALUES(p_id_asociado, p_id_gestion_credito, p_id_estado, p_v_pago, p_v_factura
    );
END;

BEGIN
    FIDE_INSERTAR_FIDE_GESTION_FACTURA_TB_SP(3, 2, 1, 300, 'Factura 6');
END;


CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_GESTION_FACTURA_TB_SP (
    p_id_gestion_factura INT,
    p_v_pago VARCHAR,
    p_v_factura VARCHAR
) AS
BEGIN
    UPDATE FIDE_GESTION_FACTURA_TB  
    SET v_pago = p_v_pago,
        v_factura = p_v_factura
    WHERE id_gestion_factura = p_id_gestion_factura;
END;

BEGIN
    FIDE_MODIFICAR_FIDE_GESTION_FACTURA_TB_SP(6, 300, 'Factura #6');
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_GESTION_FACTURA_TB_SP (
    p_id_gestion_factura INT
) AS
BEGIN
    UPDATE FIDE_GESTION_FACTURA_TB  
    SET id_estado = 2
    WHERE id_gestion_factura  = p_id_gestion_factura ;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_GESTION_FACTURA_TB_SP(6);
END;

CREATE OR REPLACE PROCEDURE FIDE_INSERTAR_FIDE_GESTION_DE_REPORTE_TB_SP (
    p_id_gestion_credito INT,
    p_id_asociado INT,
    p_id_producto INT,
    p_id_planilla INT,
    p_id_gestion_factura INT,
    p_id_estado INT
) AS
BEGIN
    INSERT INTO FIDE_GESTION_DE_REPORTE_TB(id_gestion_credito, id_asociado, id_producto, id_planilla, id_gestion_factura, id_estado
    )
    VALUES(p_id_gestion_credito, p_id_asociado, p_id_producto, p_id_planilla, p_id_gestion_factura, p_id_estado);
END;

BEGIN
    FIDE_INSERTAR_FIDE_GESTION_DE_REPORTE_TB_SP(6, 2, 2, 1, 2, 1);
END;

CREATE OR REPLACE PROCEDURE FIDE_MODIFICAR_FIDE_GESTION_DE_REPORTE_TB_SP (
    p_id_gestion_reporte INT,
    p_id_gestion_credito INT,
    p_id_asociado INT,
    p_id_producto INT,
    p_id_planilla INT,
    p_id_gestion_factura INT,
    p_id_estado INT
) AS
BEGIN
    UPDATE FIDE_GESTION_DE_REPORTE_TB  
    SET id_gestion_credito = p_id_gestion_credito,
        id_asociado = p_id_asociado,
        id_producto = p_id_producto,
        id_planilla = p_id_planilla,
        id_gestion_factura = p_id_gestion_factura
    WHERE id_gestion_reporte = p_id_gestion_reporte;
END; 
  
BEGIN
    FIDE_MODIFICAR_FIDE_GESTION_DE_REPORTE_TB_SP(6, 6, 2, 2, 1, 2, 1);
END;

CREATE OR REPLACE PROCEDURE FIDE_ELIMINAR_FIDE_GESTION_DE_REPORTE_TB_SP  (
    p_id_gestion_reporte INT
) AS
BEGIN
    UPDATE FIDE_GESTION_DE_REPORTE_TB   
    SET id_estado = 2 
    WHERE id_gestion_reporte  = p_id_gestion_reporte ;
END;

BEGIN
    FIDE_ELIMINAR_FIDE_GESTION_DE_REPORTE_TB_SP(6);
END;

--Funciones
CREATE OR REPLACE FUNCTION FIDE_OBTENER_ESTADO_CIVIL_FN(
p_id_estado_civil INT
)RETURN VARCHAR IS
    v_nombre VARCHAR(50);
BEGIN
    SELECT v_nombre INTO v_nombre
    FROM FIDE_ESTADO_CIVIL_TB
    WHERE id_estado_civil = p_id_estado_civil;
    RETURN v_nombre;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN RETURN 'No definido';
END;

SELECT FIDE_OBTENER_ESTADO_CIVIL_FN(1) AS estado_civil FROM DUAL;

CREATE OR REPLACE FUNCTION FIDE_OBTENER_ESTADO_ASOCIADO_FN(
p_id_asociado INT
)RETURN VARCHAR IS
    v_estado VARCHAR(50);
BEGIN
    SELECT v_estado INTO v_estado
    FROM FIDE_ASOCIADO_TB A
    JOIN FIDE_ESTADO_TB E ON A.id_estado = E.id_estado
    WHERE A.id_asociado = p_id_asociado;
    RETURN v_estado;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN RETURN 'No definido';
END;

SELECT FIDE_OBTENER_ESTADO_ASOCIADO_FN(1) AS Estado_del_Asociado FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_OBTENER_NOMBRE_PRODUCTO_FN(
p_id_producto INT
)RETURN VARCHAR IS
    v_nombre VARCHAR(100);
BEGIN
    SELECT v_nombre INTO v_nombre
    FROM FIDE_PRODUCTO_TB 
    WHERE id_producto = p_id_producto;
    RETURN v_nombre;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN RETURN 'No definido';
END;

SELECT FIDE_OBTENER_NOMBRE_PRODUCTO_FN(1) AS Nombre_Producto FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_OBTENER_NOMBRE_PRODUCTO_FN(
p_id_producto INT
)RETURN VARCHAR IS
    v_nombre VARCHAR(100);
BEGIN
    SELECT v_nombre INTO v_nombre
    FROM FIDE_PRODUCTO_TB 
    WHERE id_producto = p_id_producto;
    RETURN v_nombre;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN RETURN 'No definido';
END;

SELECT FIDE_OBTENER_NOMBRE_PRODUCTO_FN(1) AS Nombre_Producto FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_EXISTE_BENEFICIARIO_FN(
p_cedula VARCHAR
)RETURN VARCHAR IS
    v_nombre_completo VARCHAR(200);
BEGIN
    SELECT v_nombre || ' ' ||  v_apellido
    INTO v_nombre_completo
    FROM FIDE_BENEFICIARIOS_TB 
    WHERE v_cedula = p_cedula;
    RETURN v_nombre_completo;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN RETURN 'No definido';
END;
                

SELECT FIDE_EXISTE_BENEFICIARIO_FN ('183272283') AS Beneficiario FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_OBTENER_MONTO_EXCEDENTE_FN(
p_id_asociado INT
)RETURN DECIMAL IS
    v_total DECIMAL(10,2);
BEGIN
    SELECT NVL(SUM(v_excedente), 0)
    INTO v_total
    FROM FIDE_EXCEDENTES_TB 
    WHERE id_asociado = p_id_asociado;
    RETURN v_total;
END;

SELECT FIDE_OBTENER_MONTO_EXCEDENTE_FN (4) AS monto_total FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_OBTENER_ESTADO_FACTURA_FN(
p_id_gestion_factura INT
)RETURN VARCHAR IS
    v_estado VARCHAR(50);
BEGIN
    SELECT E.v_estado 
    INTO v_estado
    FROM FIDE_GESTION_FACTURA_TB F
    JOIN FIDE_ESTADO_TB E ON F.id_estado = E.id_estado
    WHERE F.id_gestion_factura = p_id_gestion_factura;
    RETURN v_estado;
END;

SELECT FIDE_OBTENER_ESTADO_FACTURA_FN (3) AS Estado FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_CALCULAR_TOTAL_CREDITOS_ASOCIADO_FN(
p_id_asociado INT
)RETURN NUMBER IS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*) 
    INTO v_total 
    FROM FIDE_GESTION_DE_CREDITO_TB
    WHERE id_asociado = p_id_asociado;
    RETURN v_total;
END;

SELECT FIDE_CALCULAR_TOTAL_CREDITOS_ASOCIADO_FN (2) AS Creditos FROM DUAL;



CREATE OR REPLACE FUNCTION FIDE_OBTENER_PROVINCIA_DE_DIRECCION_FN(
p_id_direccion INT
)RETURN VARCHAR IS
    v_provincia VARCHAR(100);
BEGIN
    SELECT PR.v_nombre_provincia 
    INTO v_provincia 
    FROM FIDE_DIRECCION_TB D
    JOIN FIDE_PROVINCIA_TB PR ON D.id_provincia = PR.id_provincia
    WHERE D.id_direccion = p_id_direccion;
    RETURN v_provincia;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN RETURN 'No definido';
END;

SELECT FIDE_OBTENER_PROVINCIA_DE_DIRECCION_FN (2) AS Provincia FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_CUENTA_PRODUCTOS_ACTIVOS_FN
RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) 
    INTO v_count 
    FROM FIDE_PRODUCTO_TB P
    JOIN FIDE_ESTADO_TB E ON P.id_estado = E.id_estado
    WHERE E.v_estado = 'ACTIVO';
    RETURN v_count;
END;

SELECT FIDE_CUENTA_PRODUCTOS_ACTIVOS_FN  AS PRODUCTOS FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_OBTENER_NOMBRE_ASOCIADO_FN(
    p_id_asociado INT
)
RETURN VARCHAR IS
    v_nombre VARCHAR(200);
BEGIN
    SELECT v_nombre || ' ' || v_apellido  
    INTO v_nombre
    FROM FIDE_ASOCIADO_TB 
    WHERE id_asociado = p_id_asociado;
    RETURN v_nombre;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN RETURN 'No definido';
END; 

SELECT FIDE_OBTENER_NOMBRE_ASOCIADO_FN (3)  AS ASOCIADO FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_TOTAL_EXCEDENTE_GENERAL_FN RETURN
DECIMAL IS 
    v_total DECIMAL(10.2);
BEGIN
    SELECT NVL(SUM(v_excedente), 0) INTO v_total
    FROM FIDE_EXCEDENTES_TB;
    RETURN v_total;
END;

SELECT FIDE_TOTAL_EXCEDENTE_GENERAL_FN AS TOTAL FROM DUAL;

CREATE OR REPLACE FUNCTION FIDE_PROMEDIO_CUOTA_CREDITOS_FN RETURN
DECIMAL IS 
    v_promedio DECIMAL(10.2);
BEGIN
    SELECT AVG(v_cuota) INTO v_promedio
    FROM FIDE_GESTION_DE_CREDITO_TB
    WHERE id_estado = 1;
    RETURN v_promedio;
END;

SELECT FIDE_PROMEDIO_CUOTA_CREDITOS_FN AS PROMEDIO FROM DUAL;

CREATE OR REPLACE FUNCTION FIDE_TOTAL_FACTURADO_POR_ASOCIADO_FN(
    p_id_asociado INT
)RETURN DECIMAL IS 
    v_total DECIMAL(10, 2);
BEGIN
    SELECT NVL(SUM(v_pago), 0) INTO v_total
    FROM FIDE_GESTION_FACTURA_TB
    WHERE id_asociado = p_id_asociado;
    RETURN v_total;
END;

SELECT FIDE_TOTAL_FACTURADO_POR_ASOCIADO_FN(3) AS TOTAL FROM DUAL;

CREATE OR REPLACE FUNCTION FIDE_PORCENTAJE_EXCEDENTE_PRODUCTO_FN(
    p_id_producto INT
)RETURN DECIMAL IS 
    v_producto DECIMAL(10, 2);
    v_total DECIMAL(10, 2);
BEGIN
    SELECT NVL(SUM(v_excedente), 0) INTO v_producto
    FROM FIDE_EXCEDENTES_TB
    WHERE id_producto = p_id_producto;
    
    SELECT NVL(SUM(v_excedente), 0) INTO v_total
    FROM FIDE_EXCEDENTES_TB;
    
    RETURN CASE WHEN v_total > 0 THEN (v_producto / v_total)*100
                ELSE 0
    END;
END;

SELECT FIDE_PORCENTAJE_EXCEDENTE_PRODUCTO_FN(3) AS TOTAL FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_CREDITOS_MAYORES_A_PROMEDIO_FN
RETURN DECIMAL IS 
    v_promedio DECIMAL(10, 2);
    v_count NUMBER;
BEGIN
    SELECT AVG(v_monto) INTO v_promedio
    FROM FIDE_GESTION_DE_CREDITO_TB;
    
    SELECT COUNT(*) INTO v_count
    FROM FIDE_GESTION_DE_CREDITO_TB
    WHERE v_monto > v_promedio;
    
    RETURN v_count;
END;

SELECT FIDE_CREDITOS_MAYORES_A_PROMEDIO_FN AS TOTAL FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_MAX_CUOTA_CREDITO_FN RETURN DECIMAL IS
    v_max DECIMAL(10, 2);
BEGIN
    SELECT MAX(v_cuota) INTO v_max
    FROM FIDE_GESTION_DE_CREDITO_TB;
    
    RETURN v_max;
END;

SELECT FIDE_MAX_CUOTA_CREDITO_FN AS TOTAL FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_MIN_MONTO_EXCEDENTE_POR_ASOCIADO_FN(
    p_id_asociado INT
)RETURN DECIMAL IS
    v_min DECIMAL(10, 2);
BEGIN
    SELECT NVL(MIN(v_excedente), 0) INTO v_min
    FROM FIDE_EXCEDENTES_TB
    WHERE id_asociado = p_id_asociado;
    
    RETURN v_min;
END;

SELECT FIDE_MIN_MONTO_EXCEDENTE_POR_ASOCIADO_FN(3) AS TOTAL FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_SUMAR_TODOS_LOS_PAGOS_FACTURAS_FN
RETURN DECIMAL IS
    v_total DECIMAL(10, 2);
BEGIN
    SELECT NVL(SUM(v_pago), 0) INTO v_total
    FROM FIDE_GESTION_FACTURA_TB;
    
    RETURN v_total;
END;

SELECT FIDE_SUMAR_TODOS_LOS_PAGOS_FACTURAS_FN AS TOTAL FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_CONTAR_ASOCIADOS_ACTIVOS_FN
RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM FIDE_ASOCIADO_TB A
    JOIN FIDE_ESTADO_TB E ON A.id_estado = E.id_estado
    WHERE E.v_estado = 'ACTIVO';
    
    RETURN v_count;
END;

SELECT FIDE_CONTAR_ASOCIADOS_ACTIVOS_FN AS TOTAL FROM DUAL;


CREATE OR REPLACE FUNCTION FIDE_PORCENTAJE_FACTURAS_INACTIVAS_FN
RETURN DECIMAL IS
    v_total NUMBER;
    v_inactivos NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total FROM FIDE_GESTION_FACTURA_TB;
    SELECT COUNT(*) INTO v_inactivos FROM FIDE_GESTION_FACTURA_TB F
    JOIN FIDE_ESTADO_TB E ON F.id_estado = E.id_estado
    WHERE E.v_estado = 'INACTIVO';
     
    RETURN CASE WHEN v_total > 0 THEN (v_inactivos/ v_total) * 100
                ELSE 0
    END;
END;

SELECT FIDE_PORCENTAJE_FACTURAS_INACTIVAS_FN AS Porcentaje FROM DUAL;

----- CURSORES 
--ASOCIADO QUES ESTAN ACTIVOS
CURSOR c_asociados_activos IS
SELECT * FROM FIDE_ASOCIADO_TB
WHERE id_estado = 1;
 --INACTIVO
 --
CURSOR c_asociados_activos IS
SELECT * FROM FIDE_ASOCIADO_TB
WHERE id_estado = 2;

--- LOS QUE TIENEN CREDITOS
CURSOR c_creditos_altos IS
SELECT * FROM FIDE_GESTION_DE_CREDITO_TB
WHERE v_monto > 0;

--- LOS QUE TIENEN EXECEDENTES
CURSOR c_excedentes IS
SELECT a.v_nombre, e.v_excedente
FROM FIDE_EXCEDENTES_TB e
JOIN FIDE_ASOCIADO_TB a ON e.id_asociado = a.id_asociado;

---- CURSOR PARA LOS ASOCIADO LOS TIPOS DE LINEA DE CREDITO QUE TIENEN
SET SERVEROUTPUT ON;
DECLARE 
CURSOR c_creditos IS
SELECT * FROM FIDE_GESTION_DE_CREDITO_TB;
r_credito c_creditos%ROWTYPE;
BEGIN
FOR r_credito IN c_creditos LOOP
IF r_credito.id_asociado = 3 THEN
DBMS_OUTPUT.PUT_LINE('Credito: ' || r_credito.id_gestion_credito || 'Monto: ' || r_credito.v_monto);
END IF;
END LOOP;
END;
--- VER LOS REBAJO POR PLANILLA POR PRODUCTO
CURSOR c_planilla_producto IS
SELECT p.v_nombre, r.*
FROM FIDE_REBAJO_PLANILLA_TB r
JOIN FIDE_PRODUCTO_TB p ON r.id_producto = p.id_producto;

--Asociados sin beneficiario relacionado
CURSOR c_asociados_sin_beneficiario IS
SELECT * FROM FIDE_ASOCIADO_TB
WHERE id_beneficiario IS NULL;

 --Créditos aprobados el último mes
CURSOR c_creditos_mes_actual IS
SELECT * FROM FIDE_GESTION_DE_CREDITO_TB
WHERE v_fecha >= TRUNC(SYSDATE, 'MM');

---- ASOCIADOS QUE NO TIENEN EL TELEFONO AGREGADO
CURSOR c_asociados_sin_telefono IS
SELECT * FROM FIDE_ASOCIADO_TB
WHERE v_telefono IS NULL OR TRIM(v_telefono) = '';

--Asociados con crédito y sin rebajo de planilla

CURSOR c_creditos_sin_planilla IS
SELECT DISTINCT g.id_asociado
FROM FIDE_GESTION_DE_CREDITO_TB g
WHERE NOT EXISTS (
  SELECT 1 FROM FIDE_REBAJO_PLANILLA_TB r
  WHERE r.id_gestion_credito = g.id_gestion_credito
);

--Créditos cuyo total mensual no considera la póliza (cuota + poliza ? total)

CURSOR c_creditos_con_error_total IS
SELECT * FROM FIDE_GESTION_DE_CREDITO_TB
WHERE v_cuota + v_poliza != v_total_mensual;


--Cursor actualizado: Asociados que no han generado créditos
CURSOR c_asociados_sin_creditos IS
SELECT * FROM FIDE_ASOCIADO_TB a
WHERE NOT EXISTS (
  SELECT 1 FROM FIDE_GESTION_DE_CREDITO_TB c
  WHERE c.id_asociado = a.id_asociado 
);

---Facturas con monto negativo (posibles reversiones o errores)
CURSOR c_facturas_negativas IS
SELECT * FROM FIDE_GESTION_FACTURA_TB
WHERE v_pago < 0;

--Excedentes mayores a ?500.000 (revisión por montos elevados)
CURSOR c_excedentes_altos IS
SELECT * FROM FIDE_EXCEDENTES_TB 
WHERE v_excedente > 500000;