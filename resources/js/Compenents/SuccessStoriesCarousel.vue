<script setup>
import { Swiper, SwiperSlide } from "swiper/vue";
import { Pagination, Navigation, Autoplay } from "swiper/modules";
import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/navigation";
import { computed, ref } from "vue";
import { usePage } from "@inertiajs/vue3";

const page = usePage();
const stories = computed(() => page.props.successStories ?? []);

// Video ID extractor (YouTube URL থেকে)
function extractVideoID(url) {
  const regExp = /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/;
  const match = url.match(regExp);
  return match ? match[1] : "";
}


const showModal = ref(false);
const currentVideoId = ref(null);

function openModal(videoUrl) {
  currentVideoId.value = extractVideoID(videoUrl);
  showModal.value = true;
}

function closeModal() {
  showModal.value = false;
  currentVideoId.value = null;
}
</script>

<template>
  <div class="container-fluid packages">
    <div class="animated-bg"></div>

    <div class="container py-5 position-relative">
      <div class="mx-auto text-center mb-4" style="max-width: 900px">
        <h5 class="section-title px-3">Success Stories</h5>
        <h1 class="mb-0">Success Stories</h1>
      </div>

          <!-- Swiper Carousel -->
      <div class="carousel-container mt-4">
        <Swiper
          :modules="[Pagination, Navigation, Autoplay]"
          :slides-per-view="4"
          :space-between="20"
          :loop="stories.length >= 1"
          :autoplay="{ delay: 3000, disableOnInteraction: false }"
          :pagination="{ clickable: true }"
          navigation
          :breakpoints="{
            0: { slidesPerView: 1, spaceBetween: 10 },
            576: { slidesPerView: 2, spaceBetween: 15 },
            768: { slidesPerView: 3, spaceBetween: 15 },
            992: { slidesPerView: 4, spaceBetween: 15 }
          }"
          class="rtl-mySwiper "
        >
          <SwiperSlide v-for="story in stories" :key="story.id">
           <div class="ratio ratio-16x9">
             <img :src="`/storage/success/${story.image}`" alt="">
            </div>
          </SwiperSlide>
        </Swiper>
      </div>

      <div class="carousel-container mt-4">
        <Swiper
          :modules="[Pagination, Navigation, Autoplay]"
          :slides-per-view="4"
          :space-between="20"
          :loop="stories.length >= 1"
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
          <SwiperSlide v-for="story in stories" :key="story.id">
            <div
              class="ratio ratio-16x9"
              @click="openModal(story.video)"
              style="cursor: pointer"
            >

              <img
                :src="`https://img.youtube.com/vi/${extractVideoID(story.video)}/hqdefault.jpg`"
                alt="Video Thumbnail"
                style="width: 100%; height: 100%; object-fit: cover; border-radius: 10px"
              />
              <div class="play-button">&#9658;</div>
            </div>
          </SwiperSlide>
        </Swiper>
      </div>
    </div>

    <!-- Modal -->
    <div v-if="showModal" class="modal-overlay" @click.self="closeModal">
      <div class="modal-content">
        <button class="close-btn" @click="closeModal">&times;</button>
        <iframe
          v-if="currentVideoId"
          :src="`https://www.youtube.com/embed/${currentVideoId}?autoplay=1`"
          frameborder="0"
          allow="autoplay; encrypted-media"
          allowfullscreen
          class="modal-video"
        ></iframe>
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

.story-card {
  position: relative;
  border-radius: 10px;
  overflow: hidden;
  transition: transform 0.3s ease;
}
.story-card:hover {
  transform: scale(1.05);
}
.play-button {
  position: absolute;
  font-size: 50px;
  color: rgba(255, 255, 255, 0.8);
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  pointer-events: none;
}

.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.8);
  z-index: 9999;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px;
}

.modal-content {
  position: relative;
  max-width: 900px;
  width: 100%;
  background: #000;
  border-radius: 10px;
  overflow: hidden;
}

.close-btn {
  position: absolute;
  top: 10px;
  right: 15px;
  background: transparent;
  border: none;
  color: white;
  font-size: 30px;
  cursor: pointer;
  z-index: 10;
}

.modal-video {
  width: 100%;
  height: 500px;
}

.rtl-mySwiper {
  direction: rtl;
}
</style>
