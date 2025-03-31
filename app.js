// Importar dependencias
const express = require('express');
const bodyParser = require('body-parser');
const oracledb = require('oracledb');

// Inicializar la aplicación y puerto
const app = express();
const PORT = 3000;

// Middleware para manejar JSON
app.use(bodyParser.json());

// Configuración de la base de datos
const dbConfig = {
    user: 'fidu',           // Reemplaza con tu usuario de Oracle
    password: 'admni1',     // Reemplaza con tu contraseña de Oracle
    connectString: 'localhost:1521/XE' // Ajusta según tu configuración
};

// Habilitar autocommit para simplificar las transacciones
oracledb.autoCommit = true;

// Middleware para permitir CORS manualmente
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*'); // Permite solicitudes desde cualquier origen
    res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS'); // Métodos permitidos
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization'); // Encabezados permitidos
    if (req.method === 'OPTIONS') {
        return res.sendStatus(200); // Finaliza las solicitudes preflight
    }
    next();
});

// Ruta para listar todos los asociados
app.get('/asociados', async (req, res) => {
    let connection;

    try {
        connection = await oracledb.getConnection(dbConfig);
        const result = await connection.execute(
            `SELECT id_asociado, id_beneficiario, id_estado_civil, id_direccion, id_estado,
                    v_cedula, v_nombre, v_apellido, v_correo, v_fecha, v_telefono,
                    v_created_by, v_creation_date, v_last_update_by, v_last_update_date, v_accion
             FROM FIDE_ASOCIADO_TB`,
            [],
            { outFormat: oracledb.OUT_FORMAT_OBJECT }
        );
        res.status(200).send(result.rows);
    } catch (err) {
        console.error('Error al listar los asociados:', err);
        res.status(500).send({ error: 'Error al listar los asociados.', detalle: err.message });
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error('Error al cerrar la conexión:', err);
            }
        }
    }
});

// Ruta para agregar un nuevo asociado
app.post('/asociados', async (req, res) => {
    const { id_beneficiario, id_estado_civil, id_direccion, id_estado, v_cedula, v_nombre, v_apellido, v_correo, v_telefono } = req.body;

    let connection;

    try {
        connection = await oracledb.getConnection(dbConfig);
        await connection.execute(
            `INSERT INTO FIDE_ASOCIADO_TB (id_beneficiario, id_estado_civil, id_direccion, id_estado, v_cedula, v_nombre, v_apellido, v_correo, v_telefono)
             VALUES (:id_beneficiario, :id_estado_civil, :id_direccion, :id_estado, :v_cedula, :v_nombre, :v_apellido, :v_correo, :v_telefono)`,
            { id_beneficiario, id_estado_civil, id_direccion, id_estado, v_cedula, v_nombre, v_apellido, v_correo, v_telefono }
        );
        res.status(201).send({ mensaje: 'Asociado agregado correctamente.' });
    } catch (err) {
        console.error('Error al agregar el asociado:', err);
        res.status(500).send({ error: 'Error al agregar el asociado.', detalle: err.message });
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error('Error al cerrar la conexión:', err);
            }
        }
    }
});

// Ruta para actualizar un asociado
app.put('/asociados/:id', async (req, res) => {
    const id = req.params.id;
    const { id_beneficiario, id_estado_civil, id_direccion, id_estado, v_cedula, v_nombre, v_apellido, v_correo, v_telefono } = req.body;

    let connection;

    try {
        connection = await oracledb.getConnection(dbConfig);
        await connection.execute(
            `UPDATE FIDE_ASOCIADO_TB
             SET id_beneficiario = :id_beneficiario,
                 id_estado_civil = :id_estado_civil,
                 id_direccion = :id_direccion,
                 id_estado = :id_estado,
                 v_cedula = :v_cedula,
                 v_nombre = :v_nombre,
                 v_apellido = :v_apellido,
                 v_correo = :v_correo,
                 v_telefono = :v_telefono,
                 v_last_update_date = SYSDATE,
                 v_last_update_by = USER,
                 v_accion = 'ACTUALIZADO'
             WHERE id_asociado = :id`,
            { id_beneficiario, id_estado_civil, id_direccion, id_estado, v_cedula, v_nombre, v_apellido, v_correo, v_telefono, id }
        );
        res.status(200).send({ mensaje: 'Asociado actualizado correctamente.' });
    } catch (err) {
        console.error('Error al actualizar el asociado:', err);
        res.status(500).send({ error: 'Error al actualizar el asociado.', detalle: err.message });
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error('Error al cerrar la conexión:', err);
            }
        }
    }
});

// Ruta para eliminar un asociado
app.delete('/asociados/:id', async (req, res) => {
    const id = req.params.id;

    let connection;

    try {
        connection = await oracledb.getConnection(dbConfig);
        await connection.execute(
            `BEGIN
                FIDE_ELIMINAR_FIDE_ASOCIADO_TB_SP(:id);
            END;`,
            { id: id }
        );
        res.status(200).send({ mensaje: 'Asociado eliminado correctamente.' });
    } catch (err) {
        console.error('Error al eliminar el asociado:', err);
        res.status(500).send({ error: 'Error al eliminar el asociado.', detalle: err.message });
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error('Error al cerrar la conexión:', err);
            }
        }
    }
});

// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});