<script setup>
import { Swiper, SwiperSlide } from "swiper/vue";
import { Pagination, Navigation, Autoplay } from "swiper/modules";
import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/navigation";
import { computed } from "vue";
import { usePage, Link } from "@inertiajs/vue3";
import StudentReviews from "./StudentReviews.vue";
import SuccessStoriesCarousel from "./SuccessStoriesCarousel.vue";
import BookingForm from "./BookingForm.vue";
const universities = computed(() => page.props.universities ?? []);
const countries = computed(() => page.props.countries ?? []);

const page = usePage();
</script>

<template>
    <a
        :href="`https://wa.me/${page.props.setting.whatsapp_number}`"
        target="_blank"
        class="whatsapp-float"
    >
        <i class="fab fa-whatsapp fa-3x text-white"></i>
    </a>

    <!-- country Start -->
    <div class="container-fluid packages py-5">
        <div class="container py-5 mt-5">
            <div class="mx-auto text-center mb-5" style="max-width: 900px">

                  <h5 class="section-title px-3">Choose Your Desired Destination</h5>
            </div>

            <template v-if="countries.length > 0">
                <Swiper
                    :modules="[Pagination, Navigation, Autoplay]"
                    :slides-per-view="4"
                    :space-between="15"
                    :loop="universities.length >= 1"
                    :autoplay="{ delay: 2000, disableOnInteraction: false }"
                    :pagination="{ clickable: true }"
                    navigation
                    :breakpoints="{
                        0: { slidesPerView: 1 },
                        576: { slidesPerView: 2 },
                        768: { slidesPerView: 3 },
                        992: { slidesPerView: 4 },
                    }"
                    class="mySwiper"
                >
                    <SwiperSlide v-for="country in countries" :key="country.id">
                        <div
                            class="card university-card shadow-sm rounded overflow-hidden position-relative p-0 animate-card"
                        >
                            <img
                                :src="`/storage/country/${country.country_flag}`"
                                class="img-fluid w-100"
                                alt="country Image"
                            />
                            <div
                                class="university-name-overlay d-flex justify-content-between p-2"
                            >
                                <span>{{ country.country_name }}</span>
                                <Link
                                    class="text-white text-decoration-none"
                                    :href="`/country-by-id/${country.id}`"
                                    >Read More</Link
                                >
                            </div>
                        </div>
                    </SwiperSlide>
                </Swiper>
            </template>

            <template v-else>
                <h2 class="text-center">No Countries Found</h2>
            </template>
        </div>
    </div>

    <!-- country End -->

    <!-- Universities start -->
    <div class="container-fluid packages py-5">
        <div class="container py-5 mt-5">
            <div class="mx-auto text-center mb-5" style="max-width: 900px">
                <h5 class="section-title px-3">Affiliated Universities</h5>
                <h1 class="mb-0">Affiliated Universities</h1>
            </div>

            <template v-if="universities.length > 0">
                <Swiper
                    :modules="[Pagination, Navigation, Autoplay]"
                    :slides-per-view="4"
                    :space-between="15"
                    :loop="universities.length >= 1"
                    :autoplay="{ delay: 2000, disableOnInteraction: false }"
                    :pagination="{ clickable: true }"
                    navigation
                    :breakpoints="{
                        0: { slidesPerView: 1 },
                        576: { slidesPerView: 2 },
                        768: { slidesPerView: 3 },
                        992: { slidesPerView: 4 },
                    }"
                    class="mySwiper"
                >
                    <SwiperSlide
                        v-for="university in universities"
                        :key="university.id"
                    >
                        <a :href="`${university.university_link}`"
                            class="card university-card shadow-sm rounded overflow-hidden position-relative p-0 animate-card"
                        >
                            <img
                                :src="`/storage/university/${university.image}`"
                                class="img-fluid w-100"
                                alt="University Image"
                            />
                            <div
                                class="university-name-overlay d-flex justify-content-between p-2"
                            >
                                <span>{{ university.name }}</span>
                                <Link
                                    class="text-white text-decoration-none"
                                    :href="`/country-by-id/${university.country.id}`"
                                    >Read More</Link
                                >
                            </div>
                        </a>
                    </SwiperSlide>
                </Swiper>
            </template>

            <template v-else>
                <h2 class="text-center">No Universities Found</h2>
            </template>
        </div>
    </div>
    <!-- Universities end -->

    <SuccessStoriesCarousel />
    <BookingForm />
    <StudentReviews />
</template>

<style scoped>
.whatsapp-float {
    position: fixed;
    bottom: 20px;
    right: 20px;
    z-index: 1000;
    cursor: pointer;
    transition: transform 0.3s ease;
}

.whatsapp-float:hover {
    transform: scale(1.1);
}
/* Background gradient animation */
@keyframes animatedBg {
    0% {
        background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    }
    50% {
        background: linear-gradient(135deg, #203a43, #2c5364, #0f2027);
    }
    100% {
        background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    }
}

.container-fluid.packages {
    animation: animatedBg 15s ease-in-out infinite;
    background-size: 400% 400%;
    padding-top: 60px;
    padding-bottom: 60px;
    color: #fff;
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

/* Floating animation for cards */
@keyframes floatCard {
    0% {
        transform: translateY(0px) rotate(0deg);
    }
    25% {
        transform: translateY(-6px) rotate(-1deg);
    }
    50% {
        transform: translateY(-12px) rotate(1deg);
    }
    75% {
        transform: translateY(-6px) rotate(-1deg);
    }
    100% {
        transform: translateY(0px) rotate(0deg);
    }
}

.university-card.animate-card {
    width: 100%;
    max-width: 300px;
    margin: auto;
    height: 250px;
    overflow: hidden;
    cursor: pointer;
    animation: floatCard 6s ease-in-out infinite;
    transition: transform 0.5s ease, box-shadow 0.5s ease;
}

.university-card:hover {
    transform: scale(1.05) rotate(2deg);
    box-shadow: 0 15px 30px rgba(255, 255, 255, 0.3);
}

.university-card img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transform: scale(1.05);
    transition: transform 0.5s ease;
}

.university-card img:hover {
    transform: scale(1.1);
}

.university-name-overlay {
    position: absolute;
    bottom: 0;
    width: 100%;
    background: rgba(0, 0, 0, 0.5);
    color: #fff;
    text-align: center;
    padding: 10px 0;
    font-weight: 600;
    font-size: 1rem;
    transition: background 0.3s ease;
}

.university-card:hover .university-name-overlay {
    background: rgba(0, 0, 0, 0.7);
}

/* Owl Carousel Nav Buttons */
.owl-carousel .owl-nav button.owl-prev,
.owl-carousel .owl-nav button.owl-next {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0, 212, 255, 0.8);
    color: #fff;
    padding: 8px 16px;
    border-radius: 50%;
    font-size: 1rem;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.owl-carousel .owl-nav button.owl-prev:hover,
.owl-carousel .owl-nav button.owl-next:hover {
    background-color: rgba(0, 212, 255, 1);
    transform: scale(1.1);
}

.owl-carousel .owl-nav button.owl-next {
    right: -10px;
}
.owl-carousel .owl-nav button.owl-prev {
    left: -10px;
}
</style>
