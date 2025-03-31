const API_URL = 'http://localhost:3000/asociados'; // URL base del backend

// Función para cargar los asociados y llenar la tabla
const loadAssociates = async () => {
    const tableBody = document.getElementById('associateTableBody');
    if (!tableBody) {
        console.error("No se encontró el cuerpo de la tabla.");
        return;
    }
    tableBody.innerHTML = '<tr><td colspan="16">Cargando...</td></tr>'; // Mensaje de carga

    try {
        const response = await axios.get(API_URL); // Solicitud GET al backend
        tableBody.innerHTML = ''; // Limpiar el mensaje de carga

        response.data.forEach(associate => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${associate.ID_ASOCIADO}</td>
                <td>${associate.ID_BENEFICIARIO || 'N/A'}</td>
                <td>${associate.ID_ESTADO_CIVIL || 'N/A'}</td>
                <td>${associate.ID_DIRECCION || 'N/A'}</td>
                <td>${associate.ID_ESTADO || 'N/A'}</td>
                <td>${associate.V_CEDULA}</td>
                <td>${associate.V_NOMBRE}</td>
                <td>${associate.V_APELLIDO}</td>
                <td>${associate.V_CORREO}</td>
                <td>${associate.V_FECHA}</td>
                <td>${associate.V_TELEFONO}</td>
                <td>${associate.V_CREATED_BY || 'Sin información'}</td>
                <td>${associate.V_CREATION_DATE}</td>
                <td>${associate.V_LAST_UPDATE_BY || 'Sin información'}</td>
                <td>${associate.V_LAST_UPDATE_DATE}</td>
                <td>${associate.V_ACCION || 'Sin información'}</td>
                <td>
                    <button class="btn btn-warning btn-sm" onclick="editAssociate(${associate.ID_ASOCIADO}, '${associate.ID_BENEFICIARIO}', '${associate.ID_ESTADO_CIVIL}', '${associate.ID_DIRECCION}', '${associate.ID_ESTADO}', '${associate.V_CEDULA}', '${associate.V_NOMBRE}', '${associate.V_APELLIDO}', '${associate.V_CORREO}', '${associate.V_TELEFONO}')">Editar</button>
                    <button class="btn btn-danger btn-sm" onclick="deleteAssociate(${associate.ID_ASOCIADO})">Eliminar</button>
                </td>
            `;
            tableBody.appendChild(row);
        });
    } catch (err) {
        console.error('Error al cargar los asociados:', err);
        tableBody.innerHTML = '<tr><td colspan="16">Error al cargar los datos.</td></tr>'; // Mensaje de error
    }
};

// Función para guardar un asociado (Agregar o Editar)
const saveAssociate = async () => {
    const id = document.getElementById('associateId').value; // ID para edición
    const idBeneficiario = document.getElementById('associateBeneficiary').value;
    const estadoCivil = document.getElementById('associateCivilStatus').value;
    const direccion = document.getElementById('associateAddress').value;
    const estado = document.getElementById('associateState').value;
    const cedula = document.getElementById('associateCedula').value;
    const nombre = document.getElementById('associateName').value;
    const apellido = document.getElementById('associateLastName').value;
    const correo = document.getElementById('associateEmail').value;
    const telefono = document.getElementById('associatePhone').value;

    // Solo enviamos las columnas relevantes
    const associate = { 
        id_beneficiario: idBeneficiario, 
        id_estado_civil: estadoCivil, 
        id_direccion: direccion, 
        id_estado: estado, 
        v_cedula: cedula, 
        v_nombre: nombre, 
        v_apellido: apellido, 
        v_correo: correo, 
        v_telefono: telefono 
    };

    try {
        if (id) {
            // Editar asociado
            await axios.put(`${API_URL}/${id}`, associate);
            alert('Asociado actualizado correctamente.');
        } else {
            // Agregar nuevo asociado
            await axios.post(API_URL, associate);
            alert('Asociado agregado correctamente.');
        }

        // Recargar la tabla
        loadAssociates();
    } catch (err) {
        console.error('Error al guardar el asociado:', err);
        alert('Ocurrió un error al guardar el asociado.');
    }

    // Cerrar modal
    const addAssociateModal = bootstrap.Modal.getInstance(document.getElementById('addAssociateModal'));
    addAssociateModal.hide();
};

// Función para editar un asociado
const editAssociate = (id, idBeneficiario, estadoCivil, direccion, estado, cedula, nombre, apellido, correo, telefono) => {
    document.getElementById('associateId').value = id;
    document.getElementById('associateBeneficiary').value = idBeneficiario;
    document.getElementById('associateCivilStatus').value = estadoCivil;
    document.getElementById('associateAddress').value = direccion;
    document.getElementById('associateState').value = estado;
    document.getElementById('associateCedula').value = cedula;
    document.getElementById('associateName').value = nombre;
    document.getElementById('associateLastName').value = apellido;
    document.getElementById('associateEmail').value = correo;
    document.getElementById('associatePhone').value = telefono;

    // Mostrar modal
    const addAssociateModal = new bootstrap.Modal(document.getElementById('addAssociateModal'));
    addAssociateModal.show();
};

// Función para eliminar un asociado
const deleteAssociate = async (id) => {
    if (confirm('¿Estás seguro de que deseas eliminar este asociado?')) {
        try {
            // Llamar al backend para ejecutar el procedimiento almacenado
            await axios.delete(`${API_URL}/${id}`);
            alert('Asociado marcado como eliminado.');
            loadAssociates(); // Recargar la tabla
        } catch (err) {
            console.error('Error al eliminar el asociado:', err);
            alert('Ocurrió un error al intentar eliminar el asociado.');
        }
    }
};

// Inicializar la página
document.addEventListener('DOMContentLoaded', () => {
    loadAssociates();

    const form = document.getElementById('associateForm');
    form.addEventListener('submit', (event) => {
        event.preventDefault();
        saveAssociate();
    });
});