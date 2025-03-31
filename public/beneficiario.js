const API_URL = 'http://localhost:3000/beneficiarios'; // URL base del backend

// Función para cargar los beneficiarios y llenar la tabla
const loadBeneficiaries = async () => {
    const tableBody = document.getElementById('beneficiaryTableBody');
    if (!tableBody) {
        console.error("No se encontró el cuerpo de la tabla.");
        return;
    }

    tableBody.innerHTML = '<tr><td colspan="16">Cargando...</td></tr>'; // Mensaje de carga

    try {
        const response = await axios.get(API_URL); // Solicitud GET al backend
        tableBody.innerHTML = ''; // Limpiar el mensaje de carga

        response.data.forEach(beneficiary => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${beneficiary.ID_BENEFICIARIO}</td>
                <td>${beneficiary.ID_ESTADO_CIVIL || 'N/A'}</td>
                <td>${beneficiary.ID_DIRECCION || 'N/A'}</td>
                <td>${beneficiary.ID_ESTADO || 'N/A'}</td>
                <td>${beneficiary.ID_PARENTESCO || 'N/A'}</td>
                <td>${beneficiary.V_CEDULA}</td>
                <td>${beneficiary.V_NOMBRE}</td>
                <td>${beneficiary.V_APELLIDO}</td>
                <td>${beneficiary.V_CORREO}</td>
                <td>${beneficiary.V_FECHA}</td>
                <td>${beneficiary.V_TELEFONO}</td>
                <td>${beneficiary.V_CREATED_BY || 'Sin información'}</td>
                <td>${beneficiary.V_CREATION_DATE}</td>
                <td>${beneficiary.V_LAST_UPDATE_BY || 'Sin información'}</td>
                <td>${beneficiary.V_LAST_UPDATE_DATE}</td>
                <td>${beneficiary.V_ACCION || 'Sin información'}</td>
                <td>
                    <button class="btn btn-warning btn-sm" onclick="editBeneficiary(${beneficiary.ID_BENEFICIARIO}, '${beneficiary.ID_ESTADO_CIVIL}', '${beneficiary.ID_DIRECCION}', '${beneficiary.ID_ESTADO}', '${beneficiary.ID_PARENTESCO}', '${beneficiary.V_CEDULA}', '${beneficiary.V_NOMBRE}', '${beneficiary.V_APELLIDO}', '${beneficiary.V_CORREO}', '${beneficiary.V_TELEFONO}')">Editar</button>
                    <button class="btn btn-danger btn-sm" onclick="deleteBeneficiary(${beneficiary.ID_BENEFICIARIO})">Eliminar</button>
                </td>
            `;
            tableBody.appendChild(row);
        });
    } catch (err) {
        console.error('Error al cargar los beneficiarios:', err);
        tableBody.innerHTML = '<tr><td colspan="16">Error al cargar los datos.</td></tr>'; // Mensaje de error
    }
};

// Función para guardar un beneficiario (Agregar o Editar)
const saveBeneficiary = async () => {
    const id = document.getElementById('beneficiaryId').value; // ID para edición
    const idEstadoCivil = document.getElementById('beneficiaryCivilStatus').value;
    const idDireccion = document.getElementById('beneficiaryAddress').value;
    const idEstado = document.getElementById('beneficiaryState').value;
    const idParentesco = document.getElementById('beneficiaryRelationship').value;
    const cedula = document.getElementById('beneficiaryCedula').value;
    const nombre = document.getElementById('beneficiaryName').value;
    const apellido = document.getElementById('beneficiaryLastName').value;
    const correo = document.getElementById('beneficiaryEmail').value;
    const telefono = document.getElementById('beneficiaryPhone').value;

    const beneficiary = {
        id_estado_civil: idEstadoCivil,
        id_direccion: idDireccion,
        id_estado: idEstado,
        id_parentesco: idParentesco,
        v_cedula: cedula,
        v_nombre: nombre,
        v_apellido: apellido,
        v_correo: correo,
        v_telefono: telefono
    };

    try {
        if (id) {
            // Editar beneficiario
            await axios.put(`${API_URL}/${id}`, beneficiary);
            alert('Beneficiario actualizado correctamente.');
        } else {
            // Agregar nuevo beneficiario
            await axios.post(API_URL, beneficiary);
            alert('Beneficiario agregado correctamente.');
        }

        loadBeneficiaries(); // Recargar la tabla
    } catch (err) {
        console.error('Error al guardar el beneficiario:', err);
        alert('Ocurrió un error al guardar el beneficiario.');
    }

    // Cerrar modal
    const addBeneficiaryModal = bootstrap.Modal.getInstance(document.getElementById('addBeneficiaryModal'));
    addBeneficiaryModal.hide();
};

// Función para editar un beneficiario
const editBeneficiary = (id, idEstadoCivil, idDireccion, idEstado, idParentesco, cedula, nombre, apellido, correo, telefono) => {
    document.getElementById('beneficiaryId').value = id;
    document.getElementById('beneficiaryCivilStatus').value = idEstadoCivil;
    document.getElementById('beneficiaryAddress').value = idDireccion;
    document.getElementById('beneficiaryState').value = idEstado;
    document.getElementById('beneficiaryRelationship').value = idParentesco;
    document.getElementById('beneficiaryCedula').value = cedula;
    document.getElementById('beneficiaryName').value = nombre;
    document.getElementById('beneficiaryLastName').value = apellido;
    document.getElementById('beneficiaryEmail').value = correo;
    document.getElementById('beneficiaryPhone').value = telefono;

    const addBeneficiaryModal = new bootstrap.Modal(document.getElementById('addBeneficiaryModal'));
    addBeneficiaryModal.show();
};

// Función para eliminar un beneficiario
const deleteBeneficiary = async (id) => {
    if (confirm('¿Estás seguro de que deseas eliminar este beneficiario?')) {
        try {
            await axios.delete(`${API_URL}/${id}`);
            alert('Beneficiario eliminado correctamente.');
            loadBeneficiaries(); // Recargar la tabla
        } catch (err) {
            console.error('Error al eliminar el beneficiario:', err);
            alert('Ocurrió un error al intentar eliminar el beneficiario.');
        }
    }
};

// Inicializar la página
document.addEventListener('DOMContentLoaded', () => {
    loadBeneficiaries();

    const form = document.getElementById('beneficiaryForm');
    form.addEventListener('submit', (event) => {
        event.preventDefault();
        saveBeneficiary();
    });
});