<script setup>
import { ref, onMounted, onBeforeUnmount } from "vue";
import { Link, usePage, router } from "@inertiajs/vue3";

const page = usePage();
const selectedCountry = ref(null);
const showDropdown = ref(false);
const isSmallScreen = ref(window.innerWidth < 992);
const isNavbarHidden = ref(false);

function toggleDropdown() {
  if (isSmallScreen.value) {
    showDropdown.value = !showDropdown.value;
  } else {
    showDropdown.value = true;
  }
}

function selectCountry(country) {
  selectedCountry.value = country;
  showDropdown.value = false;
  router.get(`/country-by-id/${country.id}`, {}, { preserveScroll: true, preserveState: true });
}

function handleScroll() {
  isNavbarHidden.value = window.scrollY > 50;
}

function checkScreenSize() {
  isSmallScreen.value = window.innerWidth < 992;
}

onMounted(() => {
  window.addEventListener("scroll", handleScroll);
  window.addEventListener("resize", checkScreenSize);
});

onBeforeUnmount(() => {
  window.removeEventListener("scroll", handleScroll);
  window.removeEventListener("resize", checkScreenSize);
});

const navLinks = [
  { href: "/", label: "Home" },
  { href: "/about", label: "About" },
  { href: "/services", label: "Services" },
  { href: "/contact", label: "Contact" },
];
</script>

<template>
  <nav class="navbar navbar-expand-lg shadow p-0 custom-navbar" :class="{ 'navbar-hidden': isNavbarHidden }">
    <div class="container-fluid px-4 px-lg-5">
      <img :src="`/storage/logo/${page.props.setting.site_logo}`" alt="Logo" height="50px">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto align-items-lg-center">
          <li class="nav-item" v-for="link in navLinks" :key="link.href">
            <Link :href="link.href" class="nav-link" :class="{ active: page.url === link.href }">{{ link.label }}</Link>
          </li>

          <!-- Country Dropdown -->
          <li class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" @click.prevent="toggleDropdown">
              {{ selectedCountry?.country_name ?? "Select Country" }}
            </a>
            <div :class="['dropdown-menu country-dropdown', { 'd-block': showDropdown }]">
              <ul class="list-unstyled m-0 p-2" style="max-height: 250px; overflow-y: auto">
                <li v-for="(country, index) in page.props.countries" :key="index" @click.stop="selectCountry(country)"
                  class="dropdown-item d-flex align-items-center gap-2 hover-country" style="cursor: pointer">
                  <img :src="`/storage/country/${country.country_flag}`" alt="flag" style="width:20px; height:14px; object-fit:cover"/>
                  {{ country.country_name }}
                </li>
              </ul>
            </div>
          </li>

          <li class="nav-item ms-lg-3">
            <Link href="/travel-booking" class="btn btn-outline-light btn-animate typing-btn">
              <span class="typing-text"><span>Book Now</span></span>
              <i class="fa fa-arrow-right ms-2"></i>
            </Link>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<style scoped>
.custom-navbar {
  background: linear-gradient(90deg, #1d3557, #457b9d);
  transition: transform 0.4s ease, background-color 0.3s ease;
  border-bottom: 2px solid #a8dadc;
  z-index: 1070;
  position: sticky;
  top: 50px; /* Topbar height */
}

.navbar-hidden {
  transform: translateY(-100%);
}

.navbar-nav .nav-link {
  color: white;
  font-weight: 600;
  margin: 0 10px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  border-bottom: 2px solid transparent;
  transition: color 0.3s ease, border-bottom-color 0.3s ease;
}
.navbar-nav .nav-link.active {
  color: #a8dadc;
  border-bottom-color: #a8dadc;
}

.btn-animate {
  font-weight: 600;
  color: #fff;
  border: 2px solid #fff;
  transition: all 0.3s ease;
  overflow: hidden;
  position: relative;
}

.btn-animate:hover {
  background-color: #fff;
  color: #1d3557;
  transform: translateY(-2px) scale(1.05);
  box-shadow: 0 8px 15px rgba(0,0,0,0.3);
}



.typing-btn {
    display: inline-flex;
    align-items: center;
    white-space: nowrap;
    overflow: hidden;
    position: relative;
}

.typing-text {
    display: inline-block;
    white-space: nowrap;
    overflow: hidden;
    position: relative;
    width: 9ch; /* Fixed width so cursor stays at same place */
}

.typing-text span {
    display: inline-block;
    animation: typingLoop 4s steps(9) infinite;
    overflow: hidden;
    white-space: nowrap;
}

/* Fixed blinking cursor */
.typing-text::after {
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    height: 100%;
    width: 2px;
    background-color: #fff;
    animation: blink 1.5s steps(1) infinite;
}

@keyframes typingLoop {
    0% {
        width: 0ch;
    }
    40% {
        width: 9ch;
    }
    60% {
        width: 9ch;
    }
    100% {
        width: 0ch;
    }
}

@keyframes blink {
  0%,50%,100% { opacity: 1; }
  25%,75% { opacity: 0; }
}

.country-dropdown {
  position: absolute;
  top: 100%;
  left: 0;
  min-width: 220px;
  background: #fff;
  border-radius: 6px;
  box-shadow: 0 6px 15px rgba(0,0,0,0.15);
  opacity: 0;
  transform: translateY(-10px);
  pointer-events: none;
  transition: all 0.3s ease;
  z-index: 1050;
}
.country-dropdown.d-block {
  opacity: 1;
  transform: translateY(0);
  pointer-events: auto;
}

.hover-country {
  padding: 8px 12px;
  border-radius: 4px;
  font-weight: 500;
  transition: background 0.3s ease;
}
.hover-country:hover {
  background-color: #f1f5f9;
}
</style>
