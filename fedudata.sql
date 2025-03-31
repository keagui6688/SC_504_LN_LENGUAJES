CREATE TABLE FIDE_ASOCIADO_TB (
    ID_ASOCIADO NUMBER PRIMARY KEY,
    V_CEDULA VARCHAR2(20),
    V_NOMBRE VARCHAR2(100),
    V_APELLIDO VARCHAR2(100),
    V_CORREO VARCHAR2(100),
    V_FECHA DATE,
    V_TELEFONO VARCHAR2(20),
    ID_BENEFICIARIO NUMBER,
    ID_ESTADO_CIVIL NUMBER,
    ID_DIRECION NUMBER,
    ID_ESTADO NUMBER
);
ALTER TABLE FIDE_ASOCIADO_TB
ADD CONSTRAINT FIDE_ASOCIADO_FK_BENEFICIARIO FOREIGN KEY (ID_BENEFICIARIO) REFERENCES FIDE_BENEFICIARIOS_TB(ID_BENEFICIARIO);

ALTER TABLE FIDE_ASOCIADO_TB
ADD CONSTRAINT FIDE_ASOCIADO_FK_ESTADO_CIVIL FOREIGN KEY (ID_ESTADO_CIVIL) REFERENCES FIDE_ESTADO_CIVIL_TB(ID_ESTADO_CIVIL);

ALTER TABLE FIDE_ASOCIADO_TB
ADD CONSTRAINT FIDE_ASOCIADO_FK_DIRECCION FOREIGN KEY (ID_DIRECION) REFERENCES FIDE_DIRECCION_TB(ID_DIRECCION);

ALTER TABLE FIDE_ASOCIADO_TB
ADD CONSTRAINT FIDE_ASOCIADO_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);

CREATE TABLE FIDE_BENEFICIARIOS_TB (
    ID_BENEFICIARIO NUMBER PRIMARY KEY,
    V_CEDULA VARCHAR2(20),
    V_NOMBRE VARCHAR2(100),
    V_APELLIDO VARCHAR2(100),
    V_CORREO VARCHAR2(100),
    V_FECHA DATE,
    V_TELEFONO VARCHAR2(20),
    ID_ASOCIADO NUMBER,
    ID_ESTADO_CIVIL NUMBER,
    ID_DIRECION NUMBER,
    ID_ESTADO NUMBER,
    ID_PARENTESCO NUMBER
);
ALTER TABLE FIDE_BENEFICIARIOS_TB
ADD CONSTRAINT FIDE_BENEFICIARIOS_FK_ASOCIADO FOREIGN KEY (ID_ASOCIADO) REFERENCES FIDE_ASOCIADO_TB(ID_ASOCIADO);

ALTER TABLE FIDE_BENEFICIARIOS_TB
ADD CONSTRAINT FIDE_BENEFICIARIOS_FK_ESTADO_CIVIL FOREIGN KEY (ID_ESTADO_CIVIL) REFERENCES FIDE_ESTADO_CIVIL_TB(ID_ESTADO_CIVIL);

ALTER TABLE FIDE_BENEFICIARIOS_TB
ADD CONSTRAINT FIDE_BENEFICIARIOS_FK_DIRECCION FOREIGN KEY (ID_DIRECION) REFERENCES FIDE_DIRECCION_TB(ID_DIRECCION);

ALTER TABLE FIDE_BENEFICIARIOS_TB
ADD CONSTRAINT FIDE_BENEFICIARIOS_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);

ALTER TABLE FIDE_BENEFICIARIOS_TB
ADD CONSTRAINT FIDE_BENEFICIARIOS_FK_PARENTESCO FOREIGN KEY (ID_PARENTESCO) REFERENCES FIDE_PARENTESCO_TB(ID_PARENTESCO);


CREATE TABLE FIDE_ESTADO_TB (
    ID_ESTADO NUMBER PRIMARY KEY,
    V_ESTADO VARCHAR2(100)
);

CREATE TABLE FIDE_ESTADO_CIVIL_TB (
    ID_ESTADO_CIVIL NUMBER PRIMARY KEY,
    ID_ESTADO NUMBER,
    V_ESTADO_CIVIL VARCHAR2(100) 
);
ALTER TABLE FIDE_ESTADO_CIVIL_TB
ADD CONSTRAINT FIDE_ESTADO_CIVIL_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);

CREATE TABLE FIDE_PARENTESCO_TB (
    ID_PARENTESCO NUMBER PRIMARY KEY,
    V_PARENTESCO VARCHAR2(50)
);

CREATE TABLE FIDE_PRODUCTO_TB (
    ID_PRODUCTO NUMBER PRIMARY KEY,
    ID_ESTADO NUMBER,
    V_NOMBRE VARCHAR2(100),
    V_MONTO NUMBER
);
ALTER TABLE FIDE_PRODUCTO_TB
ADD CONSTRAINT FIDE_PRODUCTO_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);

CREATE TABLE FIDE_EXCEDENTES_TB (
    ID_ASOCIADO NUMBER,
    ID_PRODUCTO NUMBER,
    ID_ESTADO NUMBER,
    V_EXCEDENTE NUMBER
);
ALTER TABLE FIDE_EXCEDENTES_TB
ADD CONSTRAINT FIDE_EXCEDENTES_FK_ASOCIADO FOREIGN KEY (ID_ASOCIADO) REFERENCES FIDE_ASOCIADO_TB(ID_ASOCIADO);

ALTER TABLE FIDE_EXCEDENTES_TB
ADD CONSTRAINT FIDE_EXCEDENTES_FK_PRODUCTO FOREIGN KEY (ID_PRODUCTO) REFERENCES FIDE_PRODUCTO_TB(ID_PRODUCTO);

ALTER TABLE FIDE_EXCEDENTES_TB
ADD CONSTRAINT FIDE_EXCEDENTES_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);


CREATE TABLE FIDE_GESTION_FACTURA_TB (
    ID_GESTION_FACTURA NUMBER PRIMARY KEY,
    ID_GESTON_CREDITO NUMBER,
    ID_ASOCIADO NUMBER,
    ID_ESTADO NUMBER,
    V_PAGO NUMBER,
    V_FACTURA VARCHAR2(100)
);
ALTER TABLE FIDE_GESTION_FACTURA_TB
ADD CONSTRAINT FIDE_GESTION_FACTURA_FK_GESTION_CREDITO FOREIGN KEY (ID_GESTON_CREDITO) REFERENCES FIDE_GESTION_DE_CREDITO_TB(ID_GESTION_CREDITO);

ALTER TABLE FIDE_GESTION_FACTURA_TB
ADD CONSTRAINT FIDE_GESTION_FACTURA_FK_ASOCIADO FOREIGN KEY (ID_ASOCIADO) REFERENCES FIDE_ASOCIADO_TB(ID_ASOCIADO);

ALTER TABLE FIDE_GESTION_FACTURA_TB
ADD CONSTRAINT FIDE_GESTION_FACTURA_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);


CREATE TABLE FIDE_CARGOS_ADMINISTRATIVOS_TB (
    ID_CARGO_ADMINISTRATIVO NUMBER PRIMARY KEY,
    ID_ESTADO NUMBER,
    V_CARGO VARCHAR2(100)
);
ALTER TABLE FIDE_CARGOS_ADMINISTRATIVOS_TB
ADD CONSTRAINT FIDE_CARGOS_ADMINISTRATIVOS_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);


CREATE TABLE FIDE_DISTRITO_TB (
    ID_DISTRITO NUMBER PRIMARY KEY,
    ID_CANTON NUMBER,
    ID_ESTADO NUMBER,
    V_NOMBRE_DISTRITO VARCHAR2(100)
);
ALTER TABLE FIDE_DISTRITO_TB
ADD CONSTRAINT FIDE_DISTRITO_FK_CANTON FOREIGN KEY (ID_CANTON) REFERENCES FIDE_CANTON_TB(ID_CANTON);

ALTER TABLE FIDE_DISTRITO_TB
ADD CONSTRAINT FIDE_DISTRITO_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);

CREATE TABLE FIDE_CANTON_TB (
    ID_CANTON NUMBER PRIMARY KEY,
    ID_PROVINCIA NUMBER,
    ID_ESTADO NUMBER,
    V_NOMBRE_CANTON VARCHAR2(100)
);
ALTER TABLE FIDE_CANTON_TB
ADD CONSTRAINT FIDE_CANTON_FK_PROVINCIA FOREIGN KEY (ID_PROVINCIA) REFERENCES FIDE_PROVINCIA_TB(ID_PROVINCIA);

ALTER TABLE FIDE_CANTON_TB
ADD CONSTRAINT FIDE_CANTON_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);


CREATE TABLE FIDE_PROVINCIA_TB (
    ID_PROVINCIA NUMBER PRIMARY KEY,
    ID_PAIS NUMBER,
    ID_ESTADO NUMBER,
    V_NOMBRE_PROVINCIA VARCHAR2(100)
);
ALTER TABLE FIDE_PROVINCIA_TB
ADD CONSTRAINT FIDE_PROVINCIA_FK_PAIS FOREIGN KEY (ID_PAIS) REFERENCES FIDE_PAIS_TB(ID_PAIS);

ALTER TABLE FIDE_PROVINCIA_TB
ADD CONSTRAINT FIDE_PROVINCIA_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);


CREATE TABLE FIDE_PAIS_TB (
    ID_PAIS NUMBER PRIMARY KEY,
    ID_ESTADO NUMBER,
    V_NOMBRE_PAIS VARCHAR2(100)
);
ALTER TABLE FIDE_PAIS_TB
ADD CONSTRAINT FIDE_PAIS_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);

CREATE TABLE FIDE_DIRECCION_TB (
    ID_DIRECCION NUMBER PRIMARY KEY,
    ID_DISTRITO NUMBER,
    ID_CANTON NUMBER,
    ID_PROVINCIA NUMBER,
    ID_ESTADO NUMBER,
    V_DESCRIPCION VARCHAR2(200)
);
ALTER TABLE FIDE_DIRECCION_TB
ADD CONSTRAINT FIDE_DIRECCION_FK_DISTRITO FOREIGN KEY (ID_DISTRITO) REFERENCES FIDE_DISTRITO_TB(ID_DISTRITO);

ALTER TABLE FIDE_DIRECCION_TB
ADD CONSTRAINT FIDE_DIRECCION_FK_CANTON FOREIGN KEY (ID_CANTON) REFERENCES FIDE_CANTON_TB(ID_CANTON);

ALTER TABLE FIDE_DIRECCION_TB
ADD CONSTRAINT FIDE_DIRECCION_FK_PROVINCIA FOREIGN KEY (ID_PROVINCIA) REFERENCES FIDE_PROVINCIA_TB(ID_PROVINCIA);

ALTER TABLE FIDE_DIRECCION_TB
ADD CONSTRAINT FIDE_DIRECCION_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);

CREATE TABLE FIDE_REBAJO_PLANILLA_TB (
    ID_PLANILLA NUMBER PRIMARY KEY,
    ID_GESTION_CREDITO NUMBER,
    ID_ASOCIADO NUMBER,
    ID_PRODUCTO NUMBER,
    ID_ESTADO NUMBER
);
ALTER TABLE FIDE_REBAJO_PLANILLA_TB
ADD CONSTRAINT FIDE_REBAJO_PLANILLA_FK_GESTION_CREDITO FOREIGN KEY (ID_GESTION_CREDITO) REFERENCES FIDE_GESTION_DE_CREDITO_TB(ID_GESTION_CREDITO);

ALTER TABLE FIDE_REBAJO_PLANILLA_TB
ADD CONSTRAINT FIDE_REBAJO_PLANILLA_FK_ASOCIADO FOREIGN KEY (ID_ASOCIADO) REFERENCES FIDE_ASOCIADO_TB(ID_ASOCIADO);

ALTER TABLE FIDE_REBAJO_PLANILLA_TB
ADD CONSTRAINT FIDE_REBAJO_PLANILLA_FK_PRODUCTO FOREIGN KEY (ID_PRODUCTO) REFERENCES FIDE_PRODUCTO_TB(ID_PRODUCTO);

ALTER TABLE FIDE_REBAJO_PLANILLA_TB
ADD CONSTRAINT FIDE_REBAJO_PLANILLA_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);

CREATE TABLE FIDE_GESTION_DE_CREDITO_TB (
    ID_GESTION_CREDITO NUMBER PRIMARY KEY,
    ID_ASOCIADO NUMBER,
    ID_GESTION_COBRO NUMBER,
    ID_PLAZO NUMBER,
    ID_LINEA_CREDITO NUMBER,
    ID_CARGO_ADMINISTRATIVO NUMBER,
    ID_ESTADO NUMBER,
    V_MONTO NUMBER,
    V_TASA NUMBER,
    V_CUOTA NUMBER,
    V_POLIZA VARCHAR2(100),
    V_TOTAL_MENSUAL NUMBER,
    V_REFINANCIAMIENTO NUMBER,
    V_ADELANTO_INTERESES NUMBER,
    V_DESEMBOLSO NUMBER,
    V_FECHA DATE
);
ALTER TABLE FIDE_GESTION_DE_CREDITO_TB
ADD CONSTRAINT FIDE_GESTION_DE_CREDITO_FK_ASOCIADO FOREIGN KEY (ID_ASOCIADO) REFERENCES FIDE_ASOCIADO_TB(ID_ASOCIADO);

ALTER TABLE FIDE_GESTION_DE_CREDITO_TB
ADD CONSTRAINT FIDE_GESTION_DE_CREDITO_FK_GESTION_COBRO FOREIGN KEY (ID_GESTION_COBRO) REFERENCES FIDE_GESTION_DE_COBRO_TB(ID_GESTION_COBRO);

ALTER TABLE FIDE_GESTION_DE_CREDITO_TB
ADD CONSTRAINT FIDE_GESTION_DE_CREDITO_FK_PLAZO FOREIGN KEY (ID_PLAZO) REFERENCES FIDE_PLAZO_TB(ID_PLAZO);

ALTER TABLE FIDE_GESTION_DE_CREDITO_TB
ADD CONSTRAINT FIDE_GESTION_DE_CREDITO_FK_LINEA_CREDITO FOREIGN KEY (ID_LINEA_CREDITO) REFERENCES FIDE_LINEA_DE_CREDITO_TB(ID_LINEA_CREDITO);

ALTER TABLE FIDE_GESTION_DE_CREDITO_TB
ADD CONSTRAINT FIDE_GESTION_DE_CREDITO_FK_CARGO_ADMINISTRATIVO FOREIGN KEY (ID_CARGO_ADMINISTRATIVO) REFERENCES FIDE_CARGOS_ADMINISTRATIVOS_TB(ID_CARGO_ADMINISTRATIVO);

ALTER TABLE FIDE_GESTION_DE_CREDITO_TB
ADD CONSTRAINT FIDE_GESTION_DE_CREDITO_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);

CREATE TABLE FIDE_LINEA_DE_CREDITO_TB (
    ID_LINEA_CREDITO NUMBER PRIMARY KEY,
    V_LINEA VARCHAR2(100)
);
ALTER TABLE FIDE_LINEA_DE_CREDITO_TB
ADD CONSTRAINT FIDE_LINEA_DE_CREDITO_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);

CREATE TABLE FIDE_PLAZO_TB (
    ID_PLAZO NUMBER PRIMARY KEY,
    V_PLAZO VARCHAR2(50)
);
ALTER TABLE FIDE_PLAZO_TB
ADD CONSTRAINT FIDE_PLAZO_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);

CREATE TABLE FIDE_GESTION_DE_REPORTE_TB (
    ID_GESTION_REPORTE NUMBER PRIMARY KEY,
    ID_GESTION_CREDITO NUMBER,
    ID_GESTION_COBRO NUMBER,
    ID_PRODUCTO NUMBER,
    ID_PLANILLA NUMBER,
    ID_ASOCIADO NUMBER,
    ID_FACTURA NUMBER,
    ID_ESTADO NUMBER
);
ALTER TABLE FIDE_GESTION_DE_REPORTE_TB
ADD CONSTRAINT FIDE_GESTION_DE_REPORTE_FK_GESTION_CREDITO FOREIGN KEY (ID_GESTION_CREDITO) REFERENCES FIDE_GESTION_DE_CREDITO_TB(ID_GESTION_CREDITO);

ALTER TABLE FIDE_GESTION_DE_REPORTE_TB
ADD CONSTRAINT FIDE_GESTION_DE_REPORTE_FK_GESTION_COBRO FOREIGN KEY (ID_GESTION_COBRO) REFERENCES FIDE_GESTION_DE_COBRO_TB(ID_GESTION_COBRO);

ALTER TABLE FIDE_GESTION_DE_REPORTE_TB
ADD CONSTRAINT FIDE_GESTION_DE_REPORTE_FK_PRODUCTO FOREIGN KEY (ID_PRODUCTO) REFERENCES FIDE_PRODUCTO_TB(ID_PRODUCTO);

ALTER TABLE FIDE_GESTION_DE_REPORTE_TB
ADD CONSTRAINT FIDE_GESTION_DE_REPORTE_FK_PLANILLA FOREIGN KEY (ID_PLANILLA) REFERENCES FIDE_REBAJO_PLANILLA_TB(ID_PLANILLA);

ALTER TABLE FIDE_GESTION_DE_REPORTE_TB
ADD CONSTRAINT FIDE_GESTION_DE_REPORTE_FK_ASOCIADO FOREIGN KEY (ID_ASOCIADO) REFERENCES FIDE_ASOCIADO_TB(ID_ASOCIADO);

ALTER TABLE FIDE_GESTION_DE_REPORTE_TB
ADD CONSTRAINT FIDE_GESTION_DE_REPORTE_FK_FACTURA FOREIGN KEY (ID_FACTURA) REFERENCES FIDE_GESTION_FACTURA_TB(ID_GESTION_FACTURA);

ALTER TABLE FIDE_GESTION_DE_REPORTE_TB
ADD CONSTRAINT FIDE_GESTION_DE_REPORTE_FK_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES FIDE_ESTADO_TB(ID_ESTADO);



CREATE OR REPLACE PROCEDURE GENERAR_REBAJO_PLANILLA AS
  CURSOR c_cedulas IS
    SELECT V_CEDULA FROM FIDE_ASOCIADO_TB;

  CURSOR c_creditos IS
    SELECT a.V_CEDULA, g.V_CUOTA
    FROM FIDE_ASOCIADO_TB a
    JOIN FIDE_GESTION_DE_CREDITO_TB g ON a.ID_ASOCIADO = g.ID_ASOCIADO
    WHERE g.V_CUOTA > 0;

  v_linea VARCHAR2(4000);
  v_output_file UTL_FILE.FILE_TYPE;
BEGIN
  v_output_file := UTL_FILE.FOPEN('DIRECTORY_PATH', 'rebajo_planilla.txt', 'w'); -- Ajusta el directorio

  FOR r IN c_cedulas LOOP
    v_linea := r.V_CEDULA || ', 800001, 1.0000, 0';
    UTL_FILE.PUT_LINE(v_output_file, v_linea);
  END LOOP;

  FOR r IN c_creditos LOOP
    v_linea := r.V_CEDULA || ', 800002, ' || r.V_CUOTA || ', 0';
    UTL_FILE.PUT_LINE(v_output_file, v_linea);
  END LOOP;

  FOR r IN c_cedulas LOOP
    v_linea := r.V_CEDULA || ', 800003, 1.500, 0';
    UTL_FILE.PUT_LINE(v_output_file, v_linea);
  END LOOP;
  UTL_FILE.FCLOSE(v_output_file);
  DBMS_OUTPUT.PUT_LINE('Archivo generado correctamente.');

EXCEPTION
  WHEN OTHERS THEN
    IF UTL_FILE.IS_OPEN(v_output_file) THEN
      UTL_FILE.FCLOSE(v_output_file);
    END IF;
    DBMS_OUTPUT.PUT_LINE('Error al generar el archivo: ' || SQLERRM);
END GENERAR_REBAJO_PLANILLA;



CREATE OR REPLACE PROCEDURE PROCESAR_REBAJO_DESDE_TXT (p_directory_name IN VARCHAR2, p_filename IN VARCHAR2) AS
  v_file UTL_FILE.FILE_TYPE;
  v_line VARCHAR2(4000);
  v_cedula VARCHAR2(20);
  v_codigo VARCHAR2(10);
  v_cuota NUMBER;

BEGIN
  v_file := UTL_FILE.FOPEN(p_directory_name, p_filename, 'R');

  LOOP
    BEGIN
      UTL_FILE.GET_LINE(v_file, v_line);

      -- Extraer datos separando por coma
      v_cedula := TRIM(REGEXP_SUBSTR(v_line, '[^,]+', 1, 1)); 
      v_codigo := TRIM(REGEXP_SUBSTR(v_line, '[^,]+', 1, 2)); 
      v_cuota  := TO_NUMBER(TRIM(REGEXP_SUBSTR(v_line, '[^,]+', 1, 3)));

      IF v_codigo = '800002' THEN
        UPDATE FIDE_GESTION_DE_CREDITO_TB
        SET V_CUOTA = V_CUOTA - v_cuota
        WHERE ID_ASOCIADO = (SELECT ID_ASOCIADO FROM FIDE_ASOCIADO_TB WHERE V_CEDULA = v_cedula);
        COMMIT;
      END IF;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontr� la c�dula: ' || v_cedula);
      WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error en formato num�rico en la l�nea: ' || v_line);
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error desconocido: ' || SQLERRM);
    END;
  END LOOP;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('El archivo est� vac�o o no se pudo leer.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error general: ' || SQLERRM);
    IF UTL_FILE.IS_OPEN(v_file) THEN
    UTL_FILE.FCLOSE(v_file);
  END IF;

END PROCESAR_REBAJO_DESDE_TXT;

--- LLAMR EL CODIGO
BEGIN
  PROCESAR_REBAJO_DESDE_TXT('DIRECTORY_PATH', 'rebajo_planilla.txt');
END;

CREATE OR REPLACE PROCEDURE AUMENTAR_REBAJO_ASOCIADO (p_cedula IN VARCHAR2) AS
  v_id_asociado NUMBER;
  v_id_estado NUMBER;
  v_cuota NUMBER;
  v_tasa_interes NUMBER;
  v_nueva_cuota NUMBER;
  v_nueva_tasa NUMBER;

BEGIN
  SELECT a.ID_ASOCIADO, a.ID_ESTADO, g.V_CUOTA, g.V_TASA
  INTO v_id_asociado, v_id_estado, v_cuota, v_tasa_interes
  FROM FIDE_ASOCIADO_TB a
  JOIN FIDE_GESTION_DE_CREDITO_TB g ON a.ID_ASOCIADO = g.ID_ASOCIADO
  WHERE a.V_CEDULA = p_cedula;

  IF v_id_estado = 2 THEN
    v_nueva_cuota := v_cuota * 1.02;        
    v_nueva_tasa := v_tasa * 1.02;   

    UPDATE FIDE_GESTION_DE_CREDITO_TB
    SET V_CUOTA = v_nueva_cuota,
        V_TASA = v_nueva_tasa
    WHERE ID_ASOCIADO = v_id_asociado;

    DBMS_OUTPUT.PUT_LINE('Se aplic� el aumento del 2% para el asociado con c�dula: ' || p_cedula);
  ELSE
    DBMS_OUTPUT.PUT_LINE('El asociado con c�dula ' || p_cedula || ' no est� en estado de renuncia.');
  END IF;

  COMMIT;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se encontr� un asociado con la c�dula: ' || p_cedula);
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    ROLLBACK; 
END AUMENTAR_REBAJO_ASOCIADO;


CREATE OR REPLACE PROCEDURE PROCESAR_EXCEDENTES_CURSOR (p_directory VARCHAR2, p_filename VARCHAR2) AS
  
  v_file UTL_FILE.FILE_TYPE;
  v_linea VARCHAR2(4000);
  v_cedula_txt VARCHAR2(20);
  v_id_asociado NUMBER;
  v_nombre_completo VARCHAR2(255);
  v_existe NUMBER;
  v_monto NUMBER := 100; 
  CURSOR c_excedentes IS
    SELECT V_CEDULA FROM FIDE_ASOCIADO_TB; 

BEGIN
  v_file := UTL_FILE.FOPEN(p_directory, p_filename, 'r');
  LOOP
    BEGIN
      UTL_FILE.GET_LINE(v_file, v_linea);
      v_cedula_txt := TRIM(SUBSTR(v_linea, 1, INSTR(v_linea, ',') - 1));

      OPEN c_excedentes;
      LOOP
        FETCH c_excedentes INTO v_cedula_txt;
        EXIT WHEN c_excedentes%NOTFOUND;

        BEGIN
          SELECT ID_ASOCIADO, V_NOMBRE_COMPLETO 
          INTO v_id_asociado, v_nombre_completo
          FROM FIDE_ASOCIADO_TB
          WHERE V_CEDULA = v_cedula_txt
          FETCH FIRST 1 ROWS ONLY;

          SELECT COUNT(*) INTO v_existe 
          FROM FIDE_EXCEDENTES_TB 
          WHERE ID_ASOCIADO = v_id_asociado;

          IF v_existe = 0 THEN
            INSERT INTO FIDE_EXCEDENTES_TB (ID_ASOCIADO, V_CEDULA, V_NOMBRE_COMPLETO, V_EXCEDENTE)
            VALUES (v_id_asociado, v_cedula_txt, v_nombre_completo, v_monto * 1.005);

            DBMS_OUTPUT.PUT_LINE('Excedente agregado: ' || v_nombre_completo || 
                                 ' (C�dula: ' || v_cedula_txt || ')');

          ELSE
            DBMS_OUTPUT.PUT_LINE('Ya existe en excedentes: ' || v_nombre_completo || 
                                 ' (C�dula: ' || v_cedula_txt || ')');
          END IF;

        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('C�dula no encontrada en FIDE_ASOCIADO_TB: ' || v_cedula_txt);
        END;

      END LOOP;
      CLOSE c_excedentes;

    EXCEPTION
      WHEN UTL_FILE.END_OF_FILE THEN
        EXIT;
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error en procesamiento: ' || SQLERRM);
    END;
  END LOOP;
  UTL_FILE.FCLOSE(v_file);
  COMMIT;

EXCEPTION
  WHEN UTL_FILE.INVALID_PATH THEN
    DBMS_OUTPUT.PUT_LINE('Error: Ruta del archivo no v�lida.');
  WHEN UTL_FILE.INVALID_OPERATION THEN
    DBMS_OUTPUT.PUT_LINE('Error: Operaci�n de archivo no v�lida.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
    ROLLBACK;
END PROCESAR_EXCEDENTES_CURSOR;





INSERT INTO FIDE_ASOCIADO_TB (ID_ASOCIADO, V_CEDULA, V_NOMBRE, V_APELLIDO, V_CORREO, V_FECHA, V_TELEFONO, ID_BENEFICIARIO, ID_ESTADO_CIVIL, ID_DIRECCION, ID_ESTADO) VALUES (1, '1234567890', 'Juan', 'Perez', 'juan.perez@example.com', TO_DATE('2023-01-01', 'YYYY-MM-DD'), '1234567890', 1, 1, 1, 1);




