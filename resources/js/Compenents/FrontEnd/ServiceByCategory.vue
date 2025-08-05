<script setup>
import { useForm, router, usePage } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";
import { computed, ref } from "vue";

const toaster = createToaster({});
const page = usePage();
const services = ref(page.props.services);
</script>

<template>
  <!-- Header Section -->
  <div
    v-if="services.length > 0"
    class="container-fluid bg-dark text-white d-flex align-items-center justify-content-center"
    :style="{
      backgroundImage: `url(/storage/serviceCategory/${services[0]?.service_category?.image})`,
      backgroundSize: 'cover',
      backgroundPosition: 'center',
      backgroundRepeat: 'no-repeat',
      height: '400px',
    }"
  >
    <div class="text-center py-5 px-3 bg-dark bg-opacity-50 rounded-4 shadow-lg">
      <h1 class="display-4 fw-bold">{{ services[0]?.service_category?.name ?? 'Our Services' }}</h1>
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-center mt-3">
          <li class="breadcrumb-item"><a href="/" class="text-white-50 text-decoration-none">Home</a></li>
          <li class="breadcrumb-item"><a href="#" class="text-white-50 text-decoration-none">Pages</a></li>
          <li class="breadcrumb-item active text-white" aria-current="page">Online Booking</li>
        </ol>
      </nav>
    </div>
  </div>

  <div v-else class="bg-secondary text-white py-5 text-center">
    <div class="container">
      <h1 class="display-4 fw-bold">Our Services</h1>
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-center mt-3">
          <li class="breadcrumb-item"><a href="/" class="text-white-50 text-decoration-none">Home</a></li>
          <li class="breadcrumb-item"><a href="#" class="text-white-50 text-decoration-none">Pages</a></li>
          <li class="breadcrumb-item active text-white" aria-current="page">Online Booking</li>
        </ol>
      </nav>
    </div>
  </div>

  <!-- Services Section -->
  <section v-if="services.length > 0" class="py-5 bg-light">
    <div class="container">
      <div class="text-center mb-5">
        <h5 class="text-primary fw-semibold">Our Services</h5>
        <h2 class="fw-bold">What We Offer</h2>
        <p class="text-muted">Browse through our latest services below.</p>
      </div>

      <div class="row g-4">
        <div
          class="col-12 col-sm-6 col-md-4 col-lg-3"
          v-for="(service, index) in services"
          :key="index"
        >
          <div class="card border-0 shadow-sm h-100 hover-shadow transition rounded-4">
            <img
              :src="`/storage/service/${service.service_image}`"
              :alt="service.service_title"
              class="card-img-top rounded-top-4 service-img"
            />
            <div class="card-body">
              <h5 class="card-title text-primary">{{ service.service_title }}</h5>
              <p class="card-text text-muted" v-html="service.service_description"></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.service-img {
  height: 200px;
  object-fit: cover;
}

.hover-shadow:hover {
  box-shadow: 0 0.75rem 1.5rem rgba(0, 0, 0, 0.15);
  transform: translateY(-5px);
  transition: all 0.3s ease-in-out;
}

.transition {
  transition: all 0.3s ease;
}
</style>
