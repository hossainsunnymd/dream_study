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
  <section v-if="services.length > 0" class="py-5 service-bg">
    <div class="container">
      <div class="text-center mb-5">
        <h5 class="text-primary fw-semibold">Our Services</h5>
        <h2 class="fw-bold text-white">What We Offer</h2>
        <p class="text-white-50">Browse through our latest services below.</p>
      </div>

      <div class="row g-4">
        <div
          class="col-12 col-sm-6 col-md-4 col-lg-3"
          v-for="(service, index) in services"
          :key="index"
          :style="{ animationDelay: `${index * 0.2}s` }"
        >
          <div class="card service-card h-100">
            <img
              :src="`/storage/service/${service.service_image}`"
              :alt="service.service_title"
              class="card-img-top service-img"
            />
            <div class="card-body">
              <h5 class="card-title text-white">{{ service.service_title }}</h5>
              <p class="card-text text-white" v-html="service.service_description"></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* Page Background */
.service-bg {
  background: radial-gradient(circle at top left, #1f2937, #111827);
  padding-top: 60px;
  padding-bottom: 60px;
}

/* Slide-in animation from left */
@keyframes slideInLeft {
  0% {
    transform: translateX(-40px);
    opacity: 0;
  }
  100% {
    transform: translateX(0);
    opacity: 1;
  }
}

/* Transparent service card with dark shadow + light glow on hover */
.service-card {
  background: rgba(0, 0, 0, 0.7); /* Black transparent */
  backdrop-filter: blur(10px);
  border-radius: 16px;
  overflow: hidden;
  border: 1px solid rgba(255, 255, 255, 0.15);
  box-shadow:
    0 8px 16px rgba(0, 0, 0, 0.6),
    0 0 10px rgba(255, 255, 255, 0.05);
  transition: transform 0.4s ease, box-shadow 0.4s ease;
  animation: slideInLeft 0.8s ease forwards;
  opacity: 0;
}

/* Hover: light glowing shadow */
.service-card:hover {
  transform: scale(1.05);
  box-shadow:
    0 4px 40px rgba(255, 255, 255, 0.3),
    0 0 60px rgba(255, 255, 255, 0.2);
}

/* Card image */
.service-img {
  height: 200px;
  object-fit: cover;
  border-top-left-radius: 16px;
  border-top-right-radius: 16px;
  transition: transform 0.4s ease;
}

.service-card:hover .service-img {
  transform: scale(1.08);
}

/* Card Body */
.card-body {
  padding: 1rem;
}
.card-title {
  font-weight: 600;
  margin-bottom: 0.5rem;
}
.card-text {
  font-size: 0.9rem;
  color: #fff; /* White text */
}

/* Section heading */
.section-title {
  color: #38bdf8;
  font-weight: 600;
  letter-spacing: 1px;
}
</style>
