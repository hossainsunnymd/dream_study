<script setup>
import { usePage, router } from "@inertiajs/vue3";
import { computed, ref, onMounted } from "vue";
import { Swiper, SwiperSlide } from "swiper/vue";
import { Pagination, Navigation, Autoplay } from "swiper/modules";

import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/navigation";

const page = usePage();
const carousels = computed(() => page.props.carousels ?? []);
const countries = computed(() => page.props.countries ?? []);
const selectedCountry = ref(null);
const showDropdown = ref(false);
const showSearchBar = ref(false);

const typedTitles = ref([]);
const typedDescriptions = ref([]);
const typedPlaceholder = ref("");
const currentSlideIndex = ref(0);

const titleSpeed = 100;
const descSpeed = 50;
const placeholderSpeed = 150;
let typingTimeouts = [];


// Typing animation loop function
function loopTyping(index) {
  // Check if the slide exists
  if (!carousels.value[index]) return;

  clearTimeouts();
  typedTitles.value[index] = "";
  typedDescriptions.value[index] = "";

  let title = carousels.value[index].title;
  let desc = carousels.value[index].description;
  let i = 0, j = 0;

  function typeTitle() {
    if (i < title.length) {
      typedTitles.value[index] += title.charAt(i);
      i++;
      typingTimeouts.push(setTimeout(typeTitle, titleSpeed));
    } else {
      typingTimeouts.push(setTimeout(typeDescription, 300));
    }
  }

  function typeDescription() {
    if (j < desc.length) {
      typedDescriptions.value[index] += desc.charAt(j);
      j++;
      typingTimeouts.push(setTimeout(typeDescription, descSpeed));
    } else {
      typingTimeouts.push(setTimeout(() => loopTyping(index), 2000));
    }
  }

  typeTitle();
}



function typePlaceholder(text) {
  typedPlaceholder.value = "";
  let i = 0;
  function typeChar() {
    if (i < text.length) {
      typedPlaceholder.value += text.charAt(i);
      i++;
      setTimeout(typeChar, placeholderSpeed);
    } else {
      setTimeout(() => typePlaceholder(text), 3000);
    }
  }
  typeChar();
}

function clearTimeouts() {
  typingTimeouts.forEach((t) => clearTimeout(t));
  typingTimeouts = [];
}

function onSlideChange(swiper) {
  currentSlideIndex.value = swiper.realIndex;
  loopTyping(currentSlideIndex.value);
}

function toggleDropdown() {
  showDropdown.value = !showDropdown.value;
}

function selectCountry(country) {
  selectedCountry.value = country;
  showDropdown.value = false;

  router.get(
    `/country-by-id/${country.id}`,
    {},
    {
      preserveScroll: true,
      preserveState: true,
    }
  );
}

onMounted(() => {
  showSearchBar.value = true;
  carousels.value.forEach((_, index) => {
    typedTitles.value[index] = "";
    typedDescriptions.value[index] = "";
  });
  loopTyping(currentSlideIndex.value);

  typePlaceholder("Country");
});
</script>

<template>
  <!-- Carousel -->
  <div class="carousel-header">
    <Swiper
      :modules="[Pagination, Navigation, Autoplay]"
      :slides-per-view="1"
      :loop="carousels.length > 1"
      :autoplay="{ delay: 5000, disableOnInteraction: false }"
      :pagination="{ clickable: true }"
      navigation
      @slideChange="onSlideChange"
      class="mySwiper"
    >
      <SwiperSlide v-for="(carousel, index) in carousels" :key="carousel.id">
        <div class="carousel-slide-content position-relative">
          <img
            :src="`/storage/carousel/${carousel.image}`"
            class="img-fluid w-100"
            style="max-height: 700px; object-fit: cover"
            alt="Carousel Image"
          />
          <div
            class="carousel-caption position-absolute top-50 start-50 translate-middle text-center text-white px-3"
          >
            <h1 class="display-2 text-capitalize mb-4">
              {{ typedTitles[index] }}<span class="typing-cursor"></span>
            </h1>
            <p class="fs-5">{{ typedDescriptions[index] }}</p>
          </div>
        </div>
      </SwiperSlide>
    </Swiper>
  </div>

  <!-- Search Dropdown -->
  <div
    v-if="showSearchBar"
    class="container-fluid search-bar position-absolute start-50 translate-middle-x"
    style="top: 80%; z-index: 10"
  >
    <div class="container">
      <div
        class="position-relative rounded-pill w-100 mx-auto p-5"
        style="background: rgba(19, 53, 123, 0.8)"
      >
        <p class="nav-item dropdown" style="background-color: white; border-radius: 10px; text-decoration: none;">
          <a
            href="#"
            class="nav-link dropdown-toggle d-flex align-items-center"
            @click.prevent="toggleDropdown"
            style="width: auto; height: 40px; border-radius: 50px; background-color: white; padding: 0 10px; text-decoration: none;"
          >
            <img
              v-if="selectedCountry"
              :src="`/storage/country/${selectedCountry.country_flag}`"
              alt="flag"
              style="width: 35px; height: 35px; border-radius: 50%; object-fit: cover;"
            />
            <span v-else style="font-size: 14px; margin-left: 10px;">{{ typedPlaceholder }}<span class="typing-cursor">|</span></span>
          </a>

          <div
            :class="['dropdown-menu country-dropdown', { 'd-block': showDropdown }] "
            style="max-height: 250px; overflow-y: auto; padding: 0"
          >
            <ul class="list-unstyled m-0 p-2">
              <li
                v-for="(country, index) in countries"
                :key="index"
                @click.stop="selectCountry(country)"
                class="dropdown-item d-flex align-items-center gap-2 hover-country"
                style="background-color: white; border-radius: 100%; text-decoration: none; height: 35px; cursor: pointer;"
              >
                <img
                  :src="`/storage/country/${country.country_flag}`"
                  alt="flag"
                  style="width: 20px; height: 14px; object-fit: cover;"
                />
                <span class="text-black">{{ country.country_name }}</span>
              </li>
            </ul>
          </div>
        </p>
      </div>
    </div>
  </div>
</template>

<style scoped>
.carousel-header {
  position: relative;
  background-color: #0a192f;
  overflow: hidden;
}

.carousel-slide-content {
  position: relative;
}

.carousel-caption {
  text-shadow: 0 2px 5px rgba(0, 0, 0, 0.8);
}

.typing-cursor {
  display: inline-block;
  width: 2px;
  background-color: white;
  animation: blink 0.7s infinite;
}

@keyframes blink {
  0%, 50%, 100% { opacity: 1; }
  25%, 75% { opacity: 0; }
}

.swiper-button-next,
.swiper-button-prev {
  color: white;
  background: rgba(0, 0, 0, 0.3);
  padding: 1rem;
  border-radius: 50%;
}

.swiper-pagination-bullet {
  background: white;
  opacity: 0.7;
}

.swiper-pagination-bullet-active {
  background: #0d6efd;
  opacity: 1;
}
</style>
