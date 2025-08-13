<script setup>
import { Swiper, SwiperSlide } from "swiper/vue";
import { Pagination, Navigation, Autoplay } from "swiper/modules";
import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/navigation";
import { computed } from "vue";
import { usePage } from "@inertiajs/vue3";

const page = usePage();
const reviews = computed(() => page.props.reviews ?? []);
</script>

<template>
  <div class="container-fluid packages">
    <!-- Animated background -->
    <div class="animated-bg"></div>

    <div class="container py-5 position-relative">
      <div class="mx-auto text-center mb-4" style="max-width: 900px">
        <h5 class="section-title px-3">Reviews</h5>
        <h1 class="mb-0">Our Students Say!!</h1>
      </div>

      <!-- Swiper Carousel -->
      <div class="carousel-container">
        <Swiper
          :modules="[Pagination, Navigation, Autoplay]"
          :slides-per-view="4"
          :space-between="20"
          :loop="reviews.length >= 1"
          :autoplay="{ delay: 3000, disableOnInteraction: false }"
          :pagination="{ clickable: true }"
          navigation
          :breakpoints="{
            0: { slidesPerView: 1, spaceBetween: 10 },
            576: { slidesPerView: 2, spaceBetween: 15 },
            768: { slidesPerView: 3, spaceBetween: 15 },
            992: { slidesPerView: 4, spaceBetween: 15 }
          }"
          class="mySwiper"
        >
          <SwiperSlide v-for="review in reviews" :key="review.id">
            <div
              class="card story-card shadow-sm rounded overflow-hidden animate-card"
              style="margin: 0 auto; border: none"
            >
              <div class="ratio ratio-16x9">
                <img
                  :src="`/storage/review/${review.image}`"
                  :alt="review.name"
                />
              </div>
              <div class="p-3 text-white">
                <h5 class="mb-1">{{ review.name }}</h5>
                <div class="rating mb-2">
                  <span
                    v-for="n in 5"
                    :key="n"
                    class="star"
                    :class="{ filled: n <= review.rating }"
                    >★</span
                  >
                </div>
                <p class="mb-0" style="font-size: 14px">
                  {{ review.description }}
                </p>
              </div>
            </div>
          </SwiperSlide>
        </Swiper>
      </div>
    </div>
  </div>
</template>

<style scoped>
.container-fluid.packages {
  position: relative;
  overflow: hidden;
  padding-top: 60px;
  padding-bottom: 60px;
  color: #fff;
  min-height: 60vh;
}

.animated-bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(270deg, #0f2027, #203a43, #2c5364, #00d4ff);
  background-size: 800% 800%;
  animation: gradientAnimation 25s ease infinite;
  z-index: 0;
}

@keyframes gradientAnimation {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

.container-fluid.packages .container {
  position: relative;
  z-index: 1;
}

.container-fluid.packages h5.section-title {
  color: #00d4ff;
  font-weight: 600;
  letter-spacing: 2px;
  text-transform: uppercase;
}

.container-fluid.packages h1 {
  font-weight: 700;
  color: #fff;
  margin-bottom: 40px;
}

.story-card {
  background-color: rgba(255, 255, 255, 0.05);
  border-radius: 10px;
  overflow: hidden;
  cursor: pointer;
  animation: floatCard 6s ease-in-out infinite;
  margin: 0 auto;
}

@keyframes floatCard {
  0%,
  100% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-10px);
  }
}

.story-card:hover {
  transform: scale(1.05);
  box-shadow: 0 15px 30px rgba(255, 255, 255, 0.2);
}

.ratio {
  aspect-ratio: 16 / 9;
  width: 100%;
  overflow: hidden;
}

.ratio img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 10px;
  display: block;
}

.rating {
  font-size: 18px;
  color: #ffffff99;
}

.rating .star {
  margin-right: 2px;
  transition: color 0.2s;
}

.rating .star.filled {
  color: gold;
}

.carousel-container {
  max-width: 1200px;
  margin: 0 auto;
  position: relative;
  overflow: hidden;
}

.mySwiper {
  width: 100%;
  position: relative;
  overflow: hidden;
}


</style>
