// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import Splide from "@splidejs/splide";

function initializeSplide() {
  document.querySelectorAll(".splide").forEach((el) => {
    // Check if Splide is already initialized on this element to avoid re-initialization
    if (!el.splide) {
      // Check if this is a card carousel (inside a product card)
      const isCardCarousel = el.closest('.bg-white') !== null;
      
      const config = {
        type: "loop",
        perPage: 1,
        arrows: true,
        pagination: false
      };
      
      // Only enable autoplay for hero carousels, not card carousels
      if (!isCardCarousel) {
        config.autoplay = true;
        config.pauseOnHover = true;
      }
      
      new Splide(el, config).mount();
    }
  });
}

// Initialize on page load (for initial load)
document.addEventListener("DOMContentLoaded", initializeSplide);

// Initialize on Turbolinks navigation (for Turbolinks 5)
document.addEventListener("turbolinks:load", initializeSplide);


// Initialize other event handlers on page load
function initializeEventHandlers() {
  // Image input preview
  const imagesInput = document.getElementById("images_input");
  if (imagesInput) {
    imagesInput.addEventListener("change", function (event) {
      const container = document.getElementById("preview_container");
      if (container) {
        container.innerHTML = ""; // limpar previews anteriores

        Array.from(event.target.files).forEach(file => {
          const img = document.createElement("img");
          img.src = URL.createObjectURL(file);
          img.className = "w-32 h-32 object-cover rounded shadow-md";
          container.appendChild(img);
        });
      }
    });
  }

  // Add item button
  const addItemBtn = document.getElementById("add_item");
  if (addItemBtn) {
    addItemBtn.addEventListener("click", function () {
      const container = document.getElementById("items_container");
      if (container) {
        const index = container.children.length;
        const template = document.getElementById("item_template");
        if (template) {
          container.insertAdjacentHTML("beforeend", template.innerHTML);
        }
      }
    });
  }

  // Smooth scroll for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        target.scrollIntoView({
          behavior: 'smooth'
        });
      }
    });
  });

  // Close alert button
  const closeBtn = document.getElementById("close");
  if (closeBtn) {
    closeBtn.addEventListener("click", function () {
      const alert = document.getElementById("alert");
      if (alert) {
        alert.remove();
      }
    });
  }

  // Toggle mobile menu
  const menuBtn = document.getElementById("menu-btn");
  if (menuBtn) {
    menuBtn.addEventListener("click", function () {
      const mobileMenu = document.getElementById("mobile-menu");
      if (mobileMenu) {
        mobileMenu.classList.toggle("hidden");
      }
    });
  }
}

// Remover item - use event delegation for dynamic content
document.addEventListener("click", function(e) {
  if (e.target.classList.contains("remove_item")) {
    const hiddenFields = e.target.parentElement.getElementsByClassName("remove_item_hidden");
    Array.from(hiddenFields).forEach(item => {
      item.value = 1;
    });
    e.target.parentElement.classList.add("hidden");
  }
});

// Initialize event handlers on page load
document.addEventListener("DOMContentLoaded", initializeEventHandlers);
document.addEventListener("turbolinks:load", initializeEventHandlers);