<script setup>
import { ref } from "vue";
import { Link, usePage, router } from "@inertiajs/vue3";

const page = usePage();
const selectedCountry = ref(null);
const selectedCountryId = ref(null);

// Country select handler
function selectCountry(country) {
  selectedCountry.value = country;
  selectedCountryId.value = country.id;
  router.get(`/country-by-id/${country.id}`, {}, {
    preserveScroll: true,
    preserveState: true,
  });
}
</script>

<template>
  <div class="container-fluid position-relative p-0">
    <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
      <img :src="`/storage/logo/${page.props.setting.site_logo}`" alt="logo" style="width: 200px; height: 50px">

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="fa fa-bars"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto py-0">
          <Link href="/" class="nav-item nav-link">Home</Link>
          <Link href="/about" class="nav-item nav-link">About</Link>
          <Link href="/services" class="nav-item nav-link">Services</Link>

          <!-- Country Dropdown -->
          <div class="nav-item dropdown custom-dropdown-hover">
            <a href="#" class="nav-link dropdown-toggle">Countries</a>
            <div class="dropdown-menu m-0 shadow">
              <ul class="list-unstyled m-0 p-2" style="max-height: 250px; overflow-y: auto;">
                <li
                  v-for="(country, index) in page.props.countries"
                  :key="index"
                  @click.stop="selectCountry(country)"
                  class="dropdown-item d-flex align-items-center gap-2"
                  style="cursor: pointer;"
                >
                  <img
                    :src="`/storage/country/${country.country_flag}`"
                    alt="flag"
                    style="width: 20px; height: 14px; object-fit: cover;"
                  />
                  {{ country.country_name }}
                </li>
              </ul>
            </div>
          </div>

          <Link href="/contact" class="nav-item nav-link">Contact</Link>
        </div>

        <Link href="/travel-booking" class="btn btn-primary rounded-pill py-2 px-4 ms-lg-4">
          Book Now
        </Link>
      </div>
    </nav>
  </div>
</template>

<style scoped>
/* Hover Dropdown */
.custom-dropdown-hover:hover .dropdown-menu {
  display: block !important;
}
</style>
