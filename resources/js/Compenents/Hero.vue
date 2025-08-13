<script setup>
import { usePage, router } from "@inertiajs/vue3"; // router import দরকার
import { computed, ref, onMounted } from "vue";
import { Swiper, SwiperSlide } from "swiper/vue";
import { Pagination, Navigation, Autoplay } from "swiper/modules";

import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/navigation";

const page = usePage();
const carousels = computed(() => page.props.carousels ?? []);
const selectedCountry = ref(null);
const selectedCountryId = ref(null);
const showDropdown = ref(false);

// Small screen check
const isSmallScreen = computed(() => window.innerWidth < 768);

// Animation trigger
const showSearchBar = ref(false);

onMounted(() => {
    setTimeout(() => {
        showSearchBar.value = true;
    }, 300);

    // Optional: update screen size dynamically
    window.addEventListener("resize", () => {
        isSmallScreen.value = window.innerWidth < 768;
    });
});

function toggleDropdown() {
    showDropdown.value = !showDropdown.value;
}

function selectCountry(country) {
    selectedCountry.value = country;
    selectedCountryId.value = country.id;
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
</script>

<template>
    <!-- Carousel Start -->
    <div class="carousel-header">
        <Swiper
            :modules="[Pagination, Navigation, Autoplay]"
            :slides-per-view="1"
            :loop="carousels.length > 1"
            :autoplay="{ delay: 2000, disableOnInteraction: false }"
            :pagination="{ clickable: true }"
            navigation
            class="mySwiper"
        >
            <SwiperSlide
                v-for="(carousel, index) in carousels"
                :key="carousel.id"
            >
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
                            {{ carousel.title }}
                        </h1>
                        <p class="fs-5">{{ carousel.description }}</p>
                    </div>
                </div>
            </SwiperSlide>
        </Swiper>
    </div>
    <!-- Carousel End -->

    <!-- Animated Search Bar -->
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
                <p
                    class="nav-item dropdown"
                    style="
                        background-color: white;
                        border-radius: 10px;
                        text-decoration: none;
                    "
                >
                    <!-- Dropdown toggle -->
                 <a
                    href="#"
                    class="nav-link dropdown-toggle d-flex align-items-center"
                    @click.prevent="toggleDropdown"
                    style="
                        width: auto;
                        height: 40px;
                        border-radius: 50px;
                        background-color: white;
                        padding: 0 10px;
                        text-decoration: none;
                    "
                >
    <!-- Flag circular -->
    <img
        v-if="selectedCountry"
        :src="`/storage/country/${selectedCountry.country_flag}`"
        alt="flag"
        style="
            width: 35px;
            height: 35px;
            border-radius: 50%;
            object-fit: cover;
        "
    />
    <!-- Default text -->
    <span
        v-else
        style="font-size: 14px; margin-left: 10px;"
    >
        Country
    </span>
</a>


                    <!-- Dropdown menu -->
                    <div
                        :class="[
                            'dropdown-menu country-dropdown',
                            { 'd-block': showDropdown },
                        ]"
                        style="max-height: 250px; overflow-y: auto; padding: 0"
                    >
                        <ul
                            class="list-unstyled m-0 p-2"
                        >
                            <li
                                v-for="(country, index) in page.props.countries"
                                :key="index"
                                @click.stop="selectCountry(country)"
                                class="dropdown-item d-flex align-items-center gap-2 hover-country"
                                style="
                                    background-color: white;
                                    border-radius: 100%;
                                    text-decoration: none;
                                    height: 35px;
                                    align-items: center;
                                    cursor: pointer;
                                "
                            >
                                <img
                                    :src="`/storage/country/${country.country_flag}`"
                                    alt="flag"
                                    style="
                                        width: 20px;
                                        height: 14px;
                                        object-fit: cover;
                                    "
                                />
                               <span class="text-black"> {{ country.country_name }}</span>
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
    background: #0d6efd; /* Bootstrap primary */
    opacity: 1;
}
</style>
