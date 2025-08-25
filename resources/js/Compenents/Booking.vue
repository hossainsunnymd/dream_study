<script setup>
import { usePage } from "@inertiajs/vue3";
import BookingForm from "./BookingForm.vue";

const page = usePage();


</script>

<template>
    <!-- Header Start -->
    <div
        class="container-fluid bg-breadcrumb"
        :style="{
            backgroundImage: page.props.university
                ? `url(/storage/university/${page.props.university.image})`
                : `url(/storage/logo/${page.props.setting.booking_banner_image})`,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            backgroundRepeat: 'no-repeat',
            height: '400px',
        }"
    >
        <div class="container text-center py-5" style="max-width: 900px">
            <h3 class="text-white display-3 mb-4">
                {{
                    page.props.university
                        ? page.props.university.name
                        : "Book Your Destination"
                }}
            </h3>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">
                    Online Booking
                </li>
            </ol>
        </div>
    </div>
    <!-- Header End -->

    <!-- Tour Booking Start -->
    <BookingForm />
    <!-- Tour Booking End -->
</template>

<style scoped></style>
