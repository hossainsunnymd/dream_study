<script setup>
import { Link, usePage } from "@inertiajs/vue3";
const page = usePage();
</script>

<template>
  <!-- Header Start -->
  <div
    class="container-fluid bg-breadcrumb"
    :style="{
      backgroundImage: `url(/storage/logo/${page.props.setting.service_banner_image})`,
      backgroundSize: 'cover',
      backgroundPosition: 'center',
      backgroundRepeat: 'no-repeat',
    }"
  >
    <div class="container text-center py-5" style="max-width: 900px">
      <h3 class="text-white display-3 mb-4">
        {{ page.props.logo?.title ?? '' }}
      </h3>
      <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Services</li>
      </ol>
    </div>
  </div>
  <!-- Header End -->

  <!-- Services Start -->
  <div class="container-fluid service-section py-5">
    <div class="container py-5">
      <div class="mx-auto text-center mb-5" style="max-width: 900px">
        <h5 class="section-title px-3">Services</h5>
        <h1 class="mb-0 text-white">Our Services</h1>
      </div>
      <div class="row g-4">
        <div
          v-for="(category, index) in page.props.serviceCategories"
          :key="category.id"
          class="col-md-4"
          :style="{ animationDelay: `${index * 0.2}s` }"
        >
          <div class="card service-card h-100">
            <img
              :src="`/storage/serviceCategory/${category.image}`"
              class="card-img-top service-img"
              :alt="category.service_name"
            />
            <div class="card-body d-flex flex-column">
              <h5 class="card-title text-white">{{ category.service_name }}</h5>
              <p class="card-text text-white-50 flex-grow-1">
                {{ category.service_title }}
              </p>
              <Link
                :href="`/service-by-category/${category.id}`"
                class="btn btn-primary mt-auto align-self-start"
              >
                Learn More
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Services End -->
</template>

<style scoped>
/* Background Section */
.service-section {
  background: radial-gradient(circle at top left, #1f2937, #111827);
  box-shadow: inset 0 0 80px rgba(255, 255, 255, 0.05);
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
  transition: transform 0.4s ease, box-shadow 0.4s ease;
  animation: slideInLeft 0.8s ease forwards;
  opacity: 0;
  border: 1px solid rgba(255, 255, 255, 0.15);

  /* Default dark shadow */
  box-shadow:
    0 8px 16px rgba(0, 0, 0, 0.6),
    0 0 10px rgba(255, 255, 255, 0.05);
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
  height: 160px;
  object-fit: cover;
  border-top-left-radius: 0.5rem;
  border-top-right-radius: 0.5rem;
  transition: transform 0.4s ease;
}

.service-card:hover .service-img {
  transform: scale(1.05);
}

/* Card content */
.card-body {
  padding: 1rem 1.25rem;
}
.card-title {
  font-weight: 600;
  margin-bottom: 0.5rem;
  font-size: 1.25rem;
}
.card-text {
  font-size: 0.95rem;
  margin-bottom: 1rem;
}

/* Button */
.btn-primary {
  font-size: 0.9rem;
  padding: 0.4rem 1rem;
  border-radius: 0.3rem;
}

/* Section heading */
.section-title {
  color: #38bdf8;
  font-weight: 600;
  letter-spacing: 1px;
}
</style>
