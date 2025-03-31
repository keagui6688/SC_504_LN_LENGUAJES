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
    user: 'fidu',           // Cambia por tu usuario de la BD
    password: 'admin1',     // Cambia por tu contraseña de la BD
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

// **Rutas para Asociados**
app.get('/asociados', async (req, res) => {
    const query = 'SELECT * FROM FIDE_ASOCIADO_TB';
    try {
        const result = await executeQuery(query);
        res.json(result.rows);
    } catch (err) {
        console.error('Error al obtener los asociados:', err);
        res.status(500).send('Error al obtener los asociados.');
    }
});

app.post('/asociados', async (req, res) => {
    const { id_beneficiario, id_estado_civil, id_direccion, id_estado, v_cedula, v_nombre, v_apellido, v_correo, v_telefono } = req.body;

    const beneficiaryCheckQuery = 'SELECT 1 FROM FIDE_BENEFICIARIOS_TB WHERE ID_BENEFICIARIO = :id_beneficiario';
    try {
        const beneficiaryCheck = await executeQuery(beneficiaryCheckQuery, { id_beneficiario });
        if (beneficiaryCheck.rows.length === 0) {
            return res.status(400).send('El ID_BENEFICIARIO no existe en la tabla FIDE_BENEFICIARIOS_TB.');
        }
    } catch (err) {
        console.error('Error al verificar el ID_BENEFICIARIO:', err);
        return res.status(500).send('Error interno al verificar el ID_BENEFICIARIO.');
    }

    const insertQuery = `
        INSERT INTO FIDE_ASOCIADO_TB (ID_BENEFICIARIO, ID_ESTADO_CIVIL, ID_DIRECCION, ID_ESTADO, V_CEDULA, V_NOMBRE, V_APELLIDO, V_CORREO, V_TELEFONO)
        VALUES (:id_beneficiario, :id_estado_civil, :id_direccion, :id_estado, :v_cedula, :v_nombre, :v_apellido, :v_correo, :v_telefono)
    `;
    try {
        const result = await executeQuery(insertQuery, { id_beneficiario, id_estado_civil, id_direccion, id_estado, v_cedula, v_nombre, v_apellido, v_correo, v_telefono }, { autoCommit: true });
        res.status(201).json({ mensaje: 'Asociado agregado correctamente.', result });
    } catch (err) {
        console.error('Error al agregar el asociado:', err);
        res.status(500).send('Error al agregar el asociado.');
    }
});

// **Servidor escuchando**
app.listen(PORT, () => {
    console.log(`Servidor escuchando en http://localhost:${PORT}`);
});