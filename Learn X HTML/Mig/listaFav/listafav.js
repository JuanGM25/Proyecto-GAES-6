// Datos de ejemplo para la lista de favoritos
const favorites = [
    { title: "Curso 1", description: "Descripción del curso 1", subscribers: 321 },
    { title: "Curso 2", description: "Descripción del curso 2", subscribers: 123 },
    { title: "Curso 3", description: "Descripción del curso 3", subscribers: 412 },
    { title: "Curso 4", description: "Descripción del curso 4", subscribers: 234 },
    { title: "Curso 5", description: "Descripción del curso 5", subscribers: 345 },
];

// Número de favoritos por página
const ITEMS_PER_PAGE = 3;
let currentPage = 1;

function renderFavorites() {
    const list = document.getElementById("favorites-list");
    list.innerHTML = ""; // Limpiar lista

    // Obtener elementos de la página actual
    const startIndex = (currentPage - 1) * ITEMS_PER_PAGE;
    const endIndex = startIndex + ITEMS_PER_PAGE;
    const currentItems = favorites.slice(startIndex, endIndex);

    // Crear elementos HTML para cada favorito
    currentItems.forEach((fav) => {
        const item = document.createElement("div");
        item.className = "favorite-item";
        item.innerHTML = `
            <div>
                <h3>${fav.title}</h3>
                <p>${fav.description}</p>
                <p><strong>Subscriptores:</strong> ${fav.subscribers}</p>
            </div>
            <button class="add-button">➕</button>
        `;
        list.appendChild(item);
    });
}

function updatePagination() {
    document.querySelector(".pagination span").textContent = `Página ${currentPage}`;
}

function filterFavorites() {
    const query = document.getElementById("search-input").value.toLowerCase();
    const filtered = favorites.filter(fav => fav.title.toLowerCase().includes(query));
    renderFavorites(filtered);
}

// Navegación entre páginas
document.getElementById("prev-page").addEventListener("click", () => {
    if (currentPage > 1) {
        currentPage--;
        renderFavorites();
        updatePagination();
    }
});

document.getElementById("next-page").addEventListener("click", () => {
    if (currentPage * ITEMS_PER_PAGE < favorites.length) {
        currentPage++;
        renderFavorites();
        updatePagination();
    }
});

// Inicializar página
renderFavorites();
updatePagination();
