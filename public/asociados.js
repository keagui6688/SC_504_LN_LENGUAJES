
const API_URL = 'http://localhost:3000/asociados'; // URL base del backend

// Función para cargar los asociados y llenar la tabla
const loadAssociates = async () => {
    const tableBody = document.getElementById('associateTableBody');
    if (!tableBody) {
        console.error('No se encontró el cuerpo de la tabla.');
        return;
    }

    // Mostrar mensaje de carga
    tableBody.innerHTML = '<tr><td colspan="10">Cargando...</td></tr>';

    try {
        const response = await axios.get(API_URL); // Solicitud GET al backend
        tableBody.innerHTML = ''; // Limpiar mensaje de carga

        // Iterar sobre los datos y agregar filas a la tabla
        response.data.forEach(associate => {
            const [id_beneficiario_fk, id_estado_civil_fk, id_direccion_fk, id_estado_fk, v_cedula, v_nombre, v_apellido, v_correo, v_telefono] = associate;
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${id_beneficiario_fk}</td>
		        <td>${id_estado_civil_fk}</td>
		        <td>${id_direccion_fk}</td>
		        <td>${id_estado_fk}</td>
		        <td>${v_cedula}</td>
                <td>${v_nombre}</td>
                <td>${v_apellido}</td>
                <td>${v_correo}</td>
                <td>${v_telefono}</td>

                <td>
                    <button class="btn btn-warning btn-sm" onclick="editAssociate('${id_beneficiario_fk}', '${id_estado_civil_fk}', '${id_direccion_fk}', '${id_estado_fk}', '${v_cedula}', '${v_nombre}', '${v_apellido}', '${v_correo}', '${v_telefono}')">Editar</button>
                    <button class="btn btn-danger btn-sm" onclick="deleteAssociate('${id_beneficiario_fk}')">Eliminar</button>
                </td>
            `;
            tableBody.appendChild(row);
        });
    } catch (err) {
        console.error('Error al cargar los asociados:', err);
        tableBody.innerHTML = '<tr><td colspan="10">Error al cargar los datos.</td></tr>';
    }
};

// Función para guardar un asociado
const saveAssociate = async () => {
    const associateData = {
        id_beneficiario_fk: document.getElementById('associateBeneficiary').value,
        id_estado_civil_fk: document.getElementById('associateCivilStatus').value,
        id_direccion_fk: document.getElementById('associateAddress').value,
        id_estado_fk: document.getElementById('associateState').value,
        v_cedula: document.getElementById('associateCedula').value,
        v_nombre: document.getElementById('associateName').value,
        v_apellido: document.getElementById('associateLastName').value,
        v_correo: document.getElementById('associateEmail').value,
        v_telefono: document.getElementById('associatePhone').value,
    };

    try {
        const associateId = document.getElementById('associateId').value; // Campo oculto para ID
        if (associateId) {
            // Actualizar asociado existente
            await axios.put(`${API_URL}/${associateId}`, associateData); // Solicitud PUT al backend
            document.getElementById('associateId').value = ''; // Limpiar ID oculto
        } else {
            // Crear un nuevo asociado
            await axios.post(API_URL, associateData); // Solicitud POST al backend
        }

        alert('Asociado guardado correctamente.');
        loadAssociates(); // Recargar la tabla
        document.getElementById('addAssociateForm').reset(); // Resetear formulario
        new bootstrap.Modal(document.getElementById('addAssociateModal')).hide(); // Cerrar modal
    } catch (err) {
        console.error('Error al guardar el asociado:', err);
        alert('Ocurrió un error al guardar el asociado.');
    }
};

// Función para editar un asociado
const editAssociate = (id_beneficiario_fk, id_estado_civil_fk, id_direccion_fk, id_estado_fk, v_cedula, v_nombre, v_apellido, v_correo, v_telefono) => {
    document.getElementById('associateId').value = id_beneficiario_fk; // Campo oculto para ID
    document.getElementById('associateBeneficiary').value = id_beneficiario_fk;
    document.getElementById('associateCivilStatus').value = id_estado_civil_fk;
    document.getElementById('associateAddress').value = id_direccion_fk;
    document.getElementById('associateState').value = id_estado_fk;
    document.getElementById('associateCedula').value = v_cedula;
    document.getElementById('associateName').value = v_nombre;
    document.getElementById('associateLastName').value = v_apellido;
    document.getElementById('associateEmail').value = v_correo;
    document.getElementById('associatePhone').value = v_telefono;

    // Mostrar el modal de edición
    new bootstrap.Modal(document.getElementById('addAssociateModal')).show();
};

// Función para eliminar un asociado
const deleteAssociate = async (id_beneficiario_fk) => {
    if (confirm('¿Estás seguro de que deseas eliminar este asociado?')) {
        try {
            await axios.delete(`${API_URL}/${id_beneficiario_fk}`); // Solicitud DELETE al backend
            alert('Asociado eliminado correctamente.');
            loadAssociates(); // Recargar la tabla
        } catch (err) {
            console.error('Error al eliminar el asociado:', err);
            alert('Ocurrió un error al intentar eliminar el asociado.');
        }
    }
};

// Inicializar la página
document.addEventListener('DOMContentLoaded', () => {
    loadAssociates(); // Cargar los asociados al cargar la página
    const form = document.getElementById('addAssociateForm');
    form.addEventListener('submit', (event) => {
        event.preventDefault();
        saveAssociate(); // Guardar asociado al enviar el formulario
    });
});