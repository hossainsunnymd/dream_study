<script setup>
import { onMounted, computed } from "vue";
import { usePage } from "@inertiajs/vue3";

const page = usePage();
const stories = computed(() => page.props.successStories ?? []);

function extractVideoID(url) {
  const regExp = /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/;
  const match = url.match(regExp);
  return match ? match[1] : "";
}

onMounted(() => {
  setTimeout(() => {
    const owl1 = $(".successStoriesCarousel");
    owl1.owlCarousel({
      items: 3,
      margin: 10,
      loop: true,
      autoplay: true,
      autoplayTimeout: 2000,
      smartSpeed: 800,
      nav: false,
      dots: true,
      rtl: true,
      responsive: { 0: { items: 1 }, 576: { items: 2 }, 768: { items: 3 }, 992: { items: 3 } },
    });
    $(".custom-next-1").click(() => owl1.trigger("next.owl.carousel"));
    $(".custom-prev-1").click(() => owl1.trigger("prev.owl.carousel"));

    const owl2 = $(".successStoriesCarousel-2");
    owl2.owlCarousel({
      items: 3,
      margin: 10,
      loop: true,
      autoplay: true,
      autoplayTimeout: 2000,
      smartSpeed: 800,
      nav: false,
      dots: true,
      rtl: false,
      responsive: { 0: { items: 1 }, 576: { items: 2 }, 768: { items: 3 }, 992: { items: 3 } },
    });
    $(".custom-next-2").click(() => owl2.trigger("next.owl.carousel"));
    $(".custom-prev-2").click(() => owl2.trigger("prev.owl.carousel"));
  }, 100);
});
</script>

<template>
  <div class="container-fluid packages">
    <!-- Animated background -->
    <div class="animated-bg"></div>

    <div class="container py-5 position-relative">
      <div class="mx-auto text-center mb-4" style="max-width: 900px">
        <h5 class="section-title px-3">Success Stories</h5>
        <h1 class="mb-0">Our Success Stories</h1>
      </div>

      <!-- First Carousel -->
      <div class="d-flex align-items-center carousel-container mb-4">
        <button class="custom-prev custom-prev-1">&lt;</button>
        <div class="flex-fill successStoriesCarousel owl-carousel owl-theme">
          <div v-for="story in stories" :key="story.id" class="card story-card shadow-sm rounded overflow-hidden animate-card" style="width: 320px; margin: auto; border: none;">
            <div class="ratio ratio-16x9">
              <iframe loading="lazy" :src="`//www.youtube.com/embed/${extractVideoID(story.video)}`" title="YouTube video player" allowfullscreen></iframe>
            </div>
          </div>
        </div>
        <button class="custom-next custom-next-1">&gt;</button>
      </div>

      <!-- Second Carousel -->
      <div class="d-flex align-items-center carousel-container">
        <button class="custom-prev custom-prev-2">&lt;</button>
        <div class="flex-fill successStoriesCarousel-2 owl-carousel owl-theme">
          <div v-for="story in stories" :key="story.id" class="card story-card shadow-sm rounded overflow-hidden animate-card" style="width: 320px; margin: auto; border: none;">
            <div class="ratio ratio-16x9">
             <img :src="`/storage/success/${story.image}`" alt="">
            </div>
          </div>
        </div>
        <button class="custom-next custom-next-2">&gt;</button>
      </div>
    </div>
  </div>
</template>

<style scoped>
/* Full-page animated background */
.container-fluid.packages {
  position: relative;
  overflow: hidden;
  padding-top: 60px;
  padding-bottom: 60px;
  color: #fff;
  min-height: 100vh;
}

/* Animated gradient */
.animated-bg {
  position: absolute;
  top:0; left:0; width:100%; height:100%;
  background: linear-gradient(270deg, #0f2027, #203a43, #2c5364, #00d4ff);
  background-size: 800% 800%;
  animation: gradientAnimation 25s ease infinite;
  z-index: 0;
}

@keyframes gradientAnimation {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

/* Keep content above background */
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

/* Cards floating animation */
.successStoriesCarousel .story-card,
.successStoriesCarousel-2 .story-card {
  background-color: rgba(255, 255, 255, 0.05);
  border-radius: 10px;
  overflow: hidden;
  cursor: pointer;
  animation: floatCard 6s ease-in-out infinite;
}

@keyframes floatCard {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-10px); }
}

.story-card:hover {
  transform: scale(1.05);
  box-shadow: 0 15px 30px rgba(255, 255, 255, 0.2);
}

.ratio iframe,
.ratio img {
  border-radius: 10px;
  border: 0;
  display: block;
}

/* Carousel buttons */
.custom-prev,
.custom-next {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-color: rgba(0, 212, 255, 0.8);
  color: #fff;
  font-size: 24px;
  border: none;
  opacity: 0;
  transition: opacity 0.3s ease, transform 0.3s ease;
  z-index: 10;
}

.carousel-container:hover .custom-prev,
.carousel-container:hover .custom-next {
  opacity: 1;
}

.custom-prev:hover,
.custom-next:hover {
  transform: scale(1.1);
  background-color: rgba(0, 212, 255, 1);
}

.custom-prev { margin-right: 10px; }
.custom-next { margin-left: 10px; }
</style>
