<script setup>
import { Swiper, SwiperSlide } from "swiper/vue";
import { Pagination, Navigation, Autoplay } from "swiper/modules";
import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/navigation";
import { computed } from "vue";
import { usePage, Link } from "@inertiajs/vue3";
import Footer from "../Footer.vue";
import { Head } from "@inertiajs/vue3";

import SuccessStoriesCarousel from "../SuccessStoriesCarousel.vue";

const page = usePage();
const universities = computed(() => page.props.universities ?? []);
</script>

<template>
    <Head>
        <title>
            {{
                page.props.country
                    ? page.props.country.title
                    : "Study Abroad"
            }}
        </title>
    </Head>
    <!-- Header Start -->
    <div
        class="container-fluid bg-breadcrumb professional-header"
        :style="{
            backgroundImage: page?.props?.country?.image
                ? `url('/storage/countryDetail/${page.props.country.image}')`
                : `url('/img/default-banner.jpg')`,
            height: '400px',
        }"
    >
        <div class="container text-center py-5">
            <h3 class="display-3 mb-4 animate-slide-down text-white">
                {{
                    page.props.country
                        ? page.props.country.title
                        : "Study Abroad"
                }}
            </h3>
            <ol class="breadcrumb justify-content-center mb-0 animate-slide-up">
                <li class="breadcrumb-item">
                    <Link href="/" class="text-white">Home</Link>
                </li>
                <li class="breadcrumb-item">
                    <a href="#" class="text-white">Pages</a>
                </li>
                <li class="breadcrumb-item active text-white">Services</li>
            </ol>
        </div>
    </div>
    <!-- Header End -->

    <!-- Country Details Section -->
    <div class="container-fluid country-section py-5">
        <div class="container py-5">
            <div
                class="mx-auto text-center mb-5 animate-fade-in"
                style="max-width: 900px"
            >
                <h1 class="mb-0 text-white">
                    {{
                        page.props.country
                            ? page.props.country.title
                            : "Study Abroad"
                    }}
                </h1>
            </div>

            <div class="row g-5">
                <!-- Key Points -->
                <div
                    class="col-lg-8 animate-slide-left glass-card p-4 text-white"
                    v-html="page.props.country?.key_points"
                ></div>

                <!-- Country List -->
                <div class="col-lg-4 animate-slide-right countries-list-section">
                    <h2 class="section-title px-3 mb-3 text-white">
                        Countries We Work
                    </h2>
                    <div class="d-grid gap-2">
                        <div
                            class="glass-card p-3 text-white"
                            v-for="country in page.props.countries"
                            :key="country.id"
                        >
                            <img :src="`/storage/country/${country.country_flag}`" alt="" height="20px">
                            <Link
                                :href="`/country-by-id/${country.id}`"
                                class="text-white"
                                style="text-decoration: none"
                            >
                                Study in {{ country.country_name }}
                            </Link>
                        </div>
                    </div>
                </div>

                <!-- Description -->
                <div
                    class="col-lg-8 animate-slide-left glass-card p-4 mt-4 text-white"
                    v-html="page.props.country?.description"
                ></div>
            </div>
        </div>
    </div>

    <!-- Universities start -->
    <div class="container-fluid packages py-5">
        <div class="container py-5">
            <div class="mx-auto text-center mb-5" style="max-width: 900px">
                <h5 class="section-title px-3">Universities</h5>
                <h1 v-if="universities.length > 0" class="mb-0">
                    Universities Of {{ universities[0].country.country_name }}
                </h1>
            </div>

            <template v-if="universities.length > 0">
                <Swiper
                    :modules="[Pagination, Navigation, Autoplay]"
                    :slides-per-view="4"
                    :space-between="15"
                    :loop="universities.length >= 1"
                    :autoplay="{ delay: 1000, disableOnInteraction: false }"
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
                        <div
                            class="card university-card shadow-sm rounded overflow-hidden position-relative p-0 animate-card"
                        >
                            <img
                                :src="`/storage/university/${university.image}`"
                                class="img-fluid w-100"
                                alt="University Image"
                            />
                            <div class="university-name-overlay">
                                {{ university.name }}
                            </div>
                        </div>
                    </SwiperSlide>
                </Swiper>
            </template>

            <template v-else>
                <h2 class="text-center">No Universities Found</h2>
            </template>
        </div>
    </div>
    <!-- Universities end -->

    <!-- success stories start -->
     <SuccessStoriesCarousel />
    <!-- success stories end -->

    <Footer />
</template>

<style scoped>

.countries-list-section {
    margin-top: 0 !important;
    padding-top: 0 !important;
}

/* Header Background */
.professional-header {
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    position: relative;
    z-index: 1;
}
.professional-header::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        to bottom,
        rgba(10, 25, 47, 0.85),
        rgba(5, 15, 35, 0.85)
    );
    z-index: -1;
}
.professional-header .container {
    position: relative;
    z-index: 2;
}

/* Country Section Professional Background */
.country-section {
    background: linear-gradient(135deg, #0a1a2f, #05152b);
    padding-top: 60px;
    padding-bottom: 60px;
}

/* Glassmorphism Cards */
.glass-card {
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(12px);
    border-radius: 16px;
    border: 1px solid rgba(255, 255, 255, 0.1);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    color: #fff;
    transition: transform 0.4s ease, box-shadow 0.4s ease;
}
.glass-card:hover {
    transform: scale(1.03);
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.35);
}

/* Animations */
@keyframes slideLeft {
    0% {
        transform: translateX(-50px);
        opacity: 0;
    }
    100% {
        transform: translateX(0);
        opacity: 1;
    }
}
@keyframes slideRight {
    0% {
        transform: translateX(50px);
        opacity: 0;
    }
    100% {
        transform: translateX(0);
        opacity: 1;
    }
}
@keyframes slideUp {
    0% {
        transform: translateY(50px);
        opacity: 0;
    }
    100% {
        transform: translateY(0);
        opacity: 1;
    }
}
@keyframes slideDown {
    0% {
        transform: translateY(-50px);
        opacity: 0;
    }
    100% {
        transform: translateY(0);
        opacity: 1;
    }
}
@keyframes fadeIn {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}

.animate-slide-left {
    animation: slideLeft 1s ease forwards;
}
.animate-slide-right {
    animation: slideRight 1s ease forwards;
}
.animate-slide-up {
    animation: slideUp 1s ease forwards;
}
.animate-slide-down {
    animation: slideDown 1s ease forwards;
}
.animate-fade-in {
    animation: fadeIn 1.2s ease forwards;
}

/* Cards for Stories */
.card {
    border-radius: 16px;
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.card-body .card-title,
.card-body .card-text {
    color: #fff !important;
}
.btn-outline-light {
    border-color: #fff;
    color: #fff;
}
.btn-outline-light:hover {
    background-color: rgba(255, 255, 255, 0.1);
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
</style>
