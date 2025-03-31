const API_URL = 'http://localhost:3000/cantones'; // URL base del backend

// Función para cargar los cantones y llenar la tabla
const loadCantons = async () => {
    const tableBody = document.getElementById('cantonTableBody');
    if (!tableBody) {
        console.error("No se encontró el cuerpo de la tabla.");
        return;
    }

    tableBody.innerHTML = '<tr><td colspan="9">Cargando...</td></tr>'; // Mensaje de carga

    try {
        const response = await axios.get(API_URL); // Solicitud GET al backend
        tableBody.innerHTML = ''; // Limpiar el mensaje de carga

        response.data.forEach(canton => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${canton.ID_CANTON}</td>
                <td>${canton.ID_PROVINCIA || 'N/A'}</td>
                <td>${canton.ID_ESTADO || 'N/A'}</td>
                <td>${canton.V_NOMBRE_CANTON}</td>
                <td>${canton.V_CREATED_BY || 'Sin información'}</td>
                <td>${canton.V_CREATION_DATE}</td>
                <td>${canton.V_LAST_UPDATE_BY || 'Sin información'}</td>
                <td>${canton.V_LAST_UPDATE_DATE}</td>
                <td>${canton.V_ACCION || 'Sin información'}</td>
                <td>
                    <button class="btn btn-warning btn-sm" onclick="editCanton(${canton.ID_CANTON}, '${canton.ID_PROVINCIA}', '${canton.ID_ESTADO}', '${canton.V_NOMBRE_CANTON}')">Editar</button>
                    <button class="btn btn-danger btn-sm" onclick="deleteCanton(${canton.ID_CANTON})">Eliminar</button>
                </td>
            `;
            tableBody.appendChild(row);
        });
    } catch (err) {
        console.error('Error al cargar los cantones:', err);
        tableBody.innerHTML = '<tr><td colspan="9">Error al cargar los datos.</td></tr>'; // Mensaje de error
    }
};

// Función para guardar un cantón (Agregar o Editar)
const saveCanton = async () => {
    const id = document.getElementById('cantonId').value; // ID para edición
    const idProvincia = document.getElementById('cantonProvince').value;
    const idEstado = document.getElementById('cantonState').value;
    const nombreCanton = document.getElementById('cantonName').value;

    const canton = {
        id_provincia: idProvincia,
        id_estado: idEstado,
        v_nombre_canton: nombreCanton
    };

    try {
        if (id) {
            // Editar cantón
            await axios.put(`${API_URL}/${id}`, canton);
            alert('Cantón actualizado correctamente.');
        } else {
            // Agregar nuevo cantón
            await axios.post(API_URL, canton);
            alert('Cantón agregado correctamente.');
        }

        loadCantons(); // Recargar la tabla
    } catch (err) {
        console.error('Error al guardar el cantón:', err);
        alert('Ocurrió un error al guardar el cantón.');
    }

    // Cerrar modal
    const addCantonModal = bootstrap.Modal.getInstance(document.getElementById('addCantonModal'));
    addCantonModal.hide();
};

// Función para editar un cantón
const editCanton = (id, idProvincia, idEstado, nombreCanton) => {
    document.getElementById('cantonId').value = id;
    document.getElementById('cantonProvince').value = idProvincia;
    document.getElementById('cantonState').value = idEstado;
    document.getElementById('cantonName').value = nombreCanton;

    const addCantonModal = new bootstrap.Modal(document.getElementById('addCantonModal'));
    addCantonModal.show();
};

// Función para eliminar un cantón
const deleteCanton = async (id) => {
    if (confirm('¿Estás seguro de que deseas eliminar este cantón?')) {
        try {
            await axios.delete(`${API_URL}/${id}`);
            alert('Cantón eliminado correctamente.');
            loadCantons(); // Recargar la tabla
        } catch (err) {
            console.error('Error al eliminar el cantón:', err);
            alert('Ocurrió un error al intentar eliminar el cantón.');
        }
    }
};

// Inicializar la página
document.addEventListener('DOMContentLoaded', () => {
    loadCantons();

    const form = document.getElementById('cantonForm');
    form.addEventListener('submit', (event) => {
        event.preventDefault();
        saveCanton();
    });
});