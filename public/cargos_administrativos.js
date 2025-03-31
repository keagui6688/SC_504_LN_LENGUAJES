const API_URL = 'http://localhost:3000/cargos_administrativos'; // URL base del backend

// Función para cargar los cargos administrativos y llenar la tabla
const loadAdministrativePositions = async () => {
    const tableBody = document.getElementById('positionsTableBody');
    if (!tableBody) {
        console.error("No se encontró el cuerpo de la tabla.");
        return;
    }

    tableBody.innerHTML = '<tr><td colspan="8">Cargando...</td></tr>'; // Mensaje de carga

    try {
        const response = await axios.get(API_URL); // Solicitud GET al backend
        tableBody.innerHTML = ''; // Limpiar el mensaje de carga

        response.data.forEach(position => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${position.ID_CARGO_ADMINISTRATIVO}</td>
                <td>${position.ID_ESTADO || 'N/A'}</td>
                <td>${position.V_CARGO}</td>
                <td>${position.V_CREATED_BY || 'Sin información'}</td>
                <td>${position.V_CREATION_DATE}</td>
                <td>${position.V_LAST_UPDATE_BY || 'Sin información'}</td>
                <td>${position.V_LAST_UPDATE_DATE}</td>
                <td>${position.V_ACCION || 'Sin información'}</td>
                <td>
                    <button class="btn btn-warning btn-sm" onclick="editPosition(${position.ID_CARGO_ADMINISTRATIVO}, '${position.ID_ESTADO}', '${position.V_CARGO}')">Editar</button>
                    <button class="btn btn-danger btn-sm" onclick="deletePosition(${position.ID_CARGO_ADMINISTRATIVO})">Eliminar</button>
                </td>
            `;
            tableBody.appendChild(row);
        });
    } catch (err) {
        console.error('Error al cargar los cargos administrativos:', err);
        tableBody.innerHTML = '<tr><td colspan="8">Error al cargar los datos.</td></tr>'; // Mensaje de error
    }
};

// Función para guardar un cargo administrativo (Agregar o Editar)
const savePosition = async () => {
    const id = document.getElementById('positionId').value; // ID para edición
    const idEstado = document.getElementById('positionState').value;
    const cargo = document.getElementById('positionName').value;

    const position = {
        id_estado: idEstado,
        v_cargo: cargo
    };

    try {
        if (id) {
            // Editar cargo administrativo
            await axios.put(`${API_URL}/${id}`, position);
            alert('Cargo administrativo actualizado correctamente.');
        } else {
            // Agregar nuevo cargo administrativo
            await axios.post(API_URL, position);
            alert('Cargo administrativo agregado correctamente.');
        }

        loadAdministrativePositions(); // Recargar la tabla
    } catch (err) {
        console.error('Error al guardar el cargo administrativo:', err);
        alert('Ocurrió un error al guardar el cargo administrativo.');
    }

    // Cerrar modal
    const addPositionModal = bootstrap.Modal.getInstance(document.getElementById('addPositionModal'));
    addPositionModal.hide();
};

// Función para editar un cargo administrativo
const editPosition = (id, idEstado, cargo) => {
    document.getElementById('positionId').value = id;
    document.getElementById('positionState').value = idEstado;
    document.getElementById('positionName').value = cargo;

    const addPositionModal = new bootstrap.Modal(document.getElementById('addPositionModal'));
    addPositionModal.show();
};

// Función para eliminar un cargo administrativo
const deletePosition = async (id) => {
    if (confirm('¿Estás seguro de que deseas eliminar este cargo administrativo?')) {
        try {
            await axios.delete(`${API_URL}/${id}`);
            alert('Cargo administrativo eliminado correctamente.');
            loadAdministrativePositions(); // Recargar la tabla
        } catch (err) {
            console.error('Error al eliminar el cargo administrativo:', err);
            alert('Ocurrió un error al intentar eliminar el cargo administrativo.');
        }
    }
};

// Inicializar la página
document.addEventListener('DOMContentLoaded', () => {
    loadAdministrativePositions();

    const form = document.getElementById('positionForm');
    form.addEventListener('submit', (event) => {
        event.preventDefault();
        savePosition();
    });
});