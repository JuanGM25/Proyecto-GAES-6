function enableEdit(fieldId) {
    const field = document.getElementById(fieldId);
    field.removeAttribute('readonly');
    field.focus();
}

function updatePhoto() {
    const fileInput = document.getElementById('file-upload');
    const file = fileInput.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onloadend = function() {
            const profilePic = document.getElementById('profile-pic');
            profilePic.src = reader.result;  
            profilePic.style.maxWidth = '200px';  
            profilePic.style.maxHeight = '200px'; 
        };
        reader.readAsDataURL(file);  
    }
}

function confirmSave() {
    const popup = document.getElementById('confirmation-popup');
    popup.classList.remove('hidden');
}

function closePopup() {
    const popup = document.getElementById('confirmation-popup');
    popup.classList.add('hidden');
}

function saveChanges() {
    closePopup();

    const name = document.getElementById('name').value;
    const description = document.getElementById('description').value;
    const profilePic = document.getElementById('profile-pic').src;

    localStorage.setItem('userName', name);
    localStorage.setItem('userDescription', description);
    localStorage.setItem('userProfilePic', profilePic);

    const successMessage = document.getElementById('success-message');
    successMessage.classList.remove('hidden');
    setTimeout(() => successMessage.classList.add('hidden'), 3000);
}

function goBack() {
    window.location.href = '/Mig/PerfilUsuario/perfilUsuario.html';
}
