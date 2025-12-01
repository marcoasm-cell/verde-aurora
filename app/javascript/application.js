// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
const btn = document.getElementById('menu-btn');
const menu = document.getElementById('mobile-menu');

btn.addEventListener('click', () => {
  menu.classList.toggle('hidden');
});

document.getElementById("images_input")?.addEventListener("change", function (event) {
  const container = document.getElementById("preview_container");
  container.innerHTML = ""; // limpar previews anteriores

  Array.from(event.target.files).forEach(file => {
    const img = document.createElement("img");
    img.src = URL.createObjectURL(file);
    img.className = "w-32 h-32 object-cover rounded shadow-md";
    container.appendChild(img);
  });
});

document.getElementById("add_item")?.addEventListener("click", function () {
    const container = document.getElementById("items_container");
    const index = container.children.length;

    const template = document.getElementById("item_template").innerHTML;
    container.insertAdjacentHTML("beforeend", template);
});

  // Remover item
document.addEventListener("click", function(e) {
  if (e.target.classList.contains("remove_item")) {
    const hiddenFields = e.target.parentElement.getElementsByClassName("remove_item_hidden");
    Array.from(hiddenFields).forEach(item => {
      item.value = 1;
    });
    e.target.parentElement.classList.add("hidden");

  }
});

document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();

        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
    });
});


document.getElementById("close")?.addEventListener("click", function () {
    document.getElementById("alert").remove();
});