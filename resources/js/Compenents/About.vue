<script setup>
import { Link, usePage } from "@inertiajs/vue3";
const page = usePage();
</script>

<template>
    <!-- Header Start -->
    <div
        class="container-fluid bg-breadcrumb"
        :style="{
            backgroundImage: `url('/storage/logo/${page.props.setting.about_banner_image}')`,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            backgroundRepeat: 'no-repeat',
        }"
    >
        <div class="container text-center py-5" style="max-width: 900px">
            <h3 class="text-white display-3 mb-4">About Us</h3>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/" class="text-white-50">Home</a></li>
                <li class="breadcrumb-item"><a href="#" class="text-white-50">Pages</a></li>
                <li class="breadcrumb-item active text-white">About</li>
            </ol>
        </div>
    </div>
    <!-- Header End -->

    <!-- About Start -->
    <div class="container-fluid about-section py-5">
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <div class="col-lg-5">
                    <div class="h-100 about-image-border animate-slide-left">
                        <img
                            :src="`/storage/logo/${page.props.setting.about_hero_image}`"
                            class="img-fluid w-100 h-100"
                            alt=""
                        />
                    </div>
                </div>
                <div class="col-lg-7 about-content animate-slide-right p-4 rounded-4 shadow-sm">
                    <div v-html="page.props.setting.about_content"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->
</template>

<style scoped>
/* Professional About Section Background */
.about-section {
    background: linear-gradient(135deg, #1f2937 0%, #3b4252 50%, #f0f4f8 100%);
    position: relative;
    overflow: hidden;
    padding-top: 60px;
    padding-bottom: 60px;
}

/* Optional subtle radial glow for professional look */
.about-section::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle at top left, rgba(255,255,255,0.05), transparent 60%);
    pointer-events: none;
}

/* Image border styling */
.about-image-border {
    border: 20px solid transparent;
    border-color: transparent #13357b transparent #13357b;
    border-radius: 15px;
    overflow: hidden;
    transition: transform 0.8s ease;
}

/* About content card */
.about-content {
    background: rgba(0, 0, 0, 0.7); /* black transparent */
    backdrop-filter: blur(6px);
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
    color: #fff;
    line-height: 1.8;
    transition: transform 0.8s ease, box-shadow 0.8s ease;
}

/* Responsive tweak */
@media (max-width: 991px) {
    .about-content {
        margin-top: 30px;
        padding: 20px;
    }
}

/* Animations */
@keyframes slideInLeft {
    0% {
        transform: translateX(-50px);
        opacity: 0;
    }
    100% {
        transform: translateX(0);
        opacity: 1;
    }
}

@keyframes slideInRight {
    0% {
        transform: translateX(50px);
        opacity: 0;
    }
    100% {
        transform: translateX(0);
        opacity: 1;
    }
}

.animate-slide-left {
    animation: slideInLeft 1s ease forwards;
}

.animate-slide-right {
    animation: slideInRight 1s ease forwards;
}
</style>
