// Importar dependencias
const express = require('express');
const bodyParser = require('body-parser');
const oracledb = require('oracledb');

// Configuración de Express
const app = express();
const PORT = 3000; // Puerto en el que correrá el servidor

// Middleware
app.use(bodyParser.json()); // Manejar datos en formato JSON
app.use(express.static('public')); // Servir archivos estáticos desde la carpeta "public"

// Configuración de la base de datos
const dbConfig = {
    user: 'fidudata',           // Cambia por tu usuario de la BD
    password: '12345',     // Cambia por tu contraseña de la BD
    connectString: 'localhost:1521/XE' // Cambia según tu instancia de Oracle
};

// Función para manejar consultas a la base de datos
async function executeQuery(query, params = {}, options = {}) {
    let connection;
    try {
        connection = await oracledb.getConnection(dbConfig);
        const result = await connection.execute(query, params, { ...options, outFormat: oracledb.OUT_FORMAT_OBJECT });
        return result;
    } catch (err) {
        console.error('Error al ejecutar la consulta:', err);
        throw err;
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error('Error al cerrar la conexión:', err);
            }
        }
    }
}

// **Rutas para Cargos Administrativos**
app.get('/cargos_administrativos', async (req, res) => {
    const query = 'SELECT * FROM FIDE_CARGOS_ADMINISTRATIVOS_TB';
    try {
        const result = await executeQuery(query);
        res.json(result.rows);
    } catch (err) {
        console.error('Error al obtener los cargos administrativos:', err);
        res.status(500).send('Error al obtener los cargos administrativos.');
    }
});

app.post('/cargos_administrativos', async (req, res) => {
    const { id_cargo_administrativo, id_estado, v_cargo } = req.body;
    const query = `
        INSERT INTO FIDE_CARGOS_ADMINISTRATIVOS_TB (ID_CARGO_ADMINISTRATIVO, ID_ESTADO, V_CARGO, V_CREATED_BY, V_CREATION_DATE, V_LAST_UPDATE_BY, V_LAST_UPDATE_DATE, V_ACCION)
        VALUES (:id_cargo_administrativo, :id_estado, :v_cargo, 'admin', SYSDATE, 'admin', SYSDATE, 'CREADO')
    `;
    try {
        const result = await executeQuery(query, { id_cargo_administrativo, id_estado, v_cargo }, { autoCommit: true });
        res.status(201).json({ mensaje: 'Cargo administrativo agregado correctamente.', result });
    } catch (err) {
        console.error('Error al agregar el cargo administrativo:', err);
        res.status(500).send('Error al agregar el cargo administrativo.');
    }
});

// **Rutas para Cantones**
app.get('/cantones', async (req, res) => {
    const query = 'SELECT * FROM FIDE_CANTON_TB';
    try {
        const result = await executeQuery(query);
        res.json(result.rows);
    } catch (err) {
        console.error('Error al obtener los cantones:', err);
        res.status(500).send('Error al obtener los cantones.');
    }
});

app.post('/cantones', async (req, res) => {
    const { id_canton, id_provincia, id_estado, v_nombre_canton } = req.body;
    const query = `
        INSERT INTO FIDE_CANTON_TB (ID_CANTON, ID_PROVINCIA, ID_ESTADO, V_NOMBRE_CANTON, V_CREATED_BY, V_CREATION_DATE, V_LAST_UPDATE_BY, V_LAST_UPDATE_DATE, V_ACCION)
        VALUES (:id_canton, :id_provincia, :id_estado, :v_nombre_canton, 'admin', SYSDATE, 'admin', SYSDATE, 'CREADO')
    `;
    try {
        const result = await executeQuery(query, { id_canton, id_provincia, id_estado, v_nombre_canton }, { autoCommit: true });
        res.status(201).json({ mensaje: 'Cantón agregado correctamente.', result });
    } catch (err) {
        console.error('Error al agregar el cantón:', err);
        res.status(500).send('Error al agregar el cantón.');
    }
});

// **Rutas para Beneficiarios**
app.get('/beneficiarios', async (req, res) => {
    const query = 'SELECT * FROM FIDE_BENEFICIARIOS_TB';
    try {
        const result = await executeQuery(query);
        res.json(result.rows);
    } catch (err) {
        console.error('Error al obtener los beneficiarios:', err);
        res.status(500).send('Error al obtener los beneficiarios.');
    }
});

app.post('/beneficiarios', async (req, res) => {
    const { id_beneficiario, id_estado_civil, id_direccion, id_estado, id_parentesco, v_cedula, v_nombre, v_apellido, v_correo, v_fecha, v_telefono } = req.body;
    const query = `
        INSERT INTO FIDE_BENEFICIARIOS_TB (ID_BENEFICIARIO, ID_ESTADO_CIVIL, ID_DIRECCION, ID_ESTADO, ID_PARENTESCO, V_CEDULA, V_NOMBRE, V_APELLIDO, V_CORREO, V_FECHA, V_TELEFONO)
        VALUES (:id_beneficiario, :id_estado_civil, :id_direccion, :id_estado, :id_parentesco, :v_cedula, :v_nombre, :v_apellido, :v_correo, :v_fecha, :v_telefono)
    `;
    try {
        const result = await executeQuery(query, { id_beneficiario, id_estado_civil, id_direccion, id_estado, id_parentesco, v_cedula, v_nombre, v_apellido, v_correo, v_fecha, v_telefono }, { autoCommit: true });
        res.status(201).json({ mensaje: 'Beneficiario agregado correctamente.', result });
    } catch (err) {
        console.error('Error al agregar el beneficiario:', err);
        res.status(500).send('Error al agregar el beneficiario.');
    }
});
app.get('/asociados', async (req, res) => {
    let connection;
    try {
      connection = await oracledb.getConnection(dbConfig);
  
      // Consulta para obtener los datos
      const query = `
        SELECT id_beneficiario_fk, id_estado_civil_fk, id_direccion_fk, id_estado_fk,
               v_cedula, v_nombre, v_apellido, v_correo, v_telefono
        FROM FIDE_ASOCIADO_TB
      `;
      const result = await connection.execute(query);
  
      // Verifica los datos obtenidos
      console.log('Datos obtenidos:', result.rows);
  
      res.json(result.rows);
    } catch (err) {
      console.error('Error de conexión o consulta:', err);
      res.status(500).send('Error al obtener los asociados.');
    } finally {
      // Asegúrate de cerrar la conexión al final
      if (connection) {
        try {
          await connection.close();
        } catch (closeErr) {
          console.error('Error al cerrar la conexión:', closeErr);
        }
      }
    }
  });
  
  app.post('/asociados', async (req, res) => {
    const { id_beneficiario_fk, id_estado_civil_fk, id_direccion_fk, id_estado_fk, v_cedula, v_nombre, v_apellido, v_correo, v_telefono } = req.body;
  
    if (!v_cedula || !v_nombre || !v_apellido || !v_correo || !v_telefono) {
      return res.status(400).send('Todos los campos son requeridos.');
    }
  
    try {
      const connection = await oracledb.getConnection(dbConfig);
  
      // Llamamos al procedimiento almacenado
      app.post('/asociados', async (req, res) => {
        const {
            id_beneficiario_fk,
            id_estado_civil_fk,
            id_direccion_fk,
            id_estado_fk,
            v_cedula,
            v_nombre,
            v_apellido,
            v_correo,
            v_telefono
        } = req.body;
    
        const plsql = `
            BEGIN
                FIDE_UTILS_PKG.FIDE_INSERTAR_FIDE_ASOCIADO_TB_SP(
                    :idBeneficiario,
                    :idEstadoCivil,
                    :idDireccion,
                    :idEstado,
                    :cedula,
                    :nombre,
                    :apellido,
                    :correo,
                    :telefono
                );
            END;
        `;
    
        let connection;
    
        try {
            connection = await oracledb.getConnection(dbConfig);
    
            await connection.execute(plsql, {
                idBeneficiario: id_beneficiario_fk,
                idEstadoCivil: id_estado_civil_fk,
                idDireccion: id_direccion_fk,
                idEstado: id_estado_fk,
                cedula: v_cedula,
                nombre: v_nombre,
                apellido: v_apellido,
                correo: v_correo,
                telefono: v_telefono
            });
    
            res.status(200).send('Asociado insertado correctamente');
        } catch (err) {
            console.error('Error al ejecutar el procedimiento almacenado:', err);
            res.status(500).send('Error al insertar asociado');
        } finally {
            if (connection) {
                try {
                    await connection.close();
                } catch (closeErr) {
                    console.error('Error al cerrar la conexión:', closeErr);
                }
            }
        }
    });
      // Confirmamos la transacción
      await connection.commit();
      await connection.close();
  
      res.status(201).send('Asociado creado exitosamente.');
    } catch (err) {
      console.error('Error al insertar el asociado:', err);
      res.status(500).send('Error al insertar el asociado.');
    }
  });
  
  app.put('/asociados/:id', async (req, res) => {
    const { id } = req.params; // ID del asociado
    const { id_estado_civil_fk, id_direccion_fk, id_estado_fk, v_cedula, v_nombre, v_apellido, v_correo, v_telefono } = req.body;
  
    if (!v_cedula || !v_nombre || !v_apellido || !v_correo || !v_telefono) {
      return res.status(400).send('Todos los campos son requeridos.');
    }
  
    try {
      const connection = await oracledb.getConnection(dbConfig);
  
      // Actualizar el asociado en la tabla FIDE_ASOCIADO_TB
      await connection.execute(
        `BEGIN
          FIDE_ASOCIADO_TB_ACTUALIZAR_SP(
            p_id_asociado => :id,
            p_id_estado_civil_fk => :id_estado_civil_fk,
            p_id_direccion_fk => :id_direccion_fk,
            p_id_estado_fk => :id_estado_fk,
            p_v_cedula => :v_cedula,
            p_v_nombre => :v_nombre,
            p_v_apellido => :v_apellido,
            p_v_correo => :v_correo,
            p_v_telefono => :v_telefono
          );
         END;`,
        { id, id_estado_civil_fk, id_direccion_fk, id_estado_fk, v_cedula, v_nombre, v_apellido, v_correo, v_telefono }
      );
  
      await connection.commit();
      await connection.close();
  
      res.send('Asociado actualizado correctamente.');
    } catch (err) {
      console.error('Error al actualizar el asociado:', err);
      res.status(500).send('Error al actualizar el asociado.');
    }
  });
  
  app.delete('/asociados/:id', async (req, res) => {
    const { id } = req.params;
  
    try {
      const connection = await oracledb.getConnection(dbConfig);
  
      // Llamamos al procedimiento almacenado para eliminar
      await connection.execute(
        `BEGIN
          FIDE_ASOCIADO_TB_ELIMINAR_SP(p_id_asociado => :id);
         END;`,
        { id }
      );
  
      await connection.commit();
      await connection.close();
  
      res.send('Asociado eliminado correctamente.');
    } catch (err) {
      console.error('Error al eliminar el asociado:', err);
      res.status(500).send('Error al eliminar el asociado.');
    }
  });



// **Servidor escuchando**
app.listen(PORT, () => {
    console.log(`Servidor escuchando en http://localhost:${PORT}`);
});