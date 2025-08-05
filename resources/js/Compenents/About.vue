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
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">About</li>
            </ol>
        </div>
    </div>

    <!-- Header End -->

    <!-- About Start -->
    <div class="container-fluid about py-5">
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <div class="col-lg-5">
                    <div
                        class="h-100"
                        style="
                            border: 50px solid;
                            border-color: transparent #13357b transparent
                                #13357b;
                        "
                    >
                        <img
                            :src="`/storage/logo/${page.props.setting.about_hero_image}`"
                            class="img-fluid w-100 h-100"
                            alt=""
                        />
                    </div>
                </div>
                <div
                    class="col-lg-7"
                    style="
                        background: linear-gradient(
                                rgba(255, 255, 255, 0.8),
                                rgba(255, 255, 255, 0.8)
                            ),
                            url(img/about-img-1.png);
                    "
                >
                <div v-html="page.props.setting.about_content"></div>



                </div>
            </div>
        </div>
    </div>
    <!-- About End -->
</template>

<style scoped></style>
