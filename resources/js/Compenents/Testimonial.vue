<script setup>
import { usePage } from "@inertiajs/vue3";

const page = usePage();
</script>

<template>
    <!-- Header Start -->
    <div
        class="container-fluid bg-breadcrumb"
        :style="{
            backgroundImage: `url(/storage/pageContent/${page.props.testimonial.image})`,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            backgroundRepeat: 'no-repeat',
            height: '400px',
        }"
    >
        <div class="container text-center py-5" style="max-width: 900px">
            <h3 class="text-white display-3 mb-4">{{ page.props.testimonial.title }}</h3>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Testimonial</li>
            </ol>
        </div>
    </div>
    <!-- Header End -->

    <!-- Testimonial Start -->
    <div class="container-fluid testimonial py-5">
        <div class="container py-5">
            <div class="mx-auto text-center mb-5" style="max-width: 900px">
              <div v-html="page.props.testimonial.description"></div>
            </div>
            <div class="testimonial-carousel owl-carousel">
                <div class="testimonial-item text-center rounded pb-4">
                    <div class="testimonial-comment bg-light rounded p-4">
                        <p class="text-center mb-5">
                            Lorem ipsum dolor, sit amet consectetur adipisicing
                            elit. Quis nostrum cupiditate, eligendi repellendus
                            saepe illum earum architecto dicta quisquam quasi
                            porro officiis. Vero reiciendis,
                        </p>
                    </div>
                    <div class="testimonial-img p-1">
                        <img
                            src="../img/testimonial-1.jpg"
                            class="img-fluid rounded-circle"
                            alt="Image"
                        />
                    </div>
                    <div style="margin-top: -35px">
                        <h5 class="mb-0">John Abraham</h5>
                        <p class="mb-0">New York, USA</p>
                        <div class="d-flex justify-content-center">
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                        </div>
                    </div>
                </div>
                <div class="testimonial-item text-center rounded pb-4">
                    <div class="testimonial-comment bg-light rounded p-4">
                        <p class="text-center mb-5">
                            Lorem ipsum dolor, sit amet consectetur adipisicing
                            elit. Quis nostrum cupiditate, eligendi repellendus
                            saepe illum earum architecto dicta quisquam quasi
                            porro officiis. Vero reiciendis,
                        </p>
                    </div>
                    <div class="testimonial-img p-1">
                        <img
                            src="../img/testimonial-2.jpg"
                            class="img-fluid rounded-circle"
                            alt="Image"
                        />
                    </div>
                    <div style="margin-top: -35px">
                        <h5 class="mb-0">John Abraham</h5>
                        <p class="mb-0">New York, USA</p>
                        <div class="d-flex justify-content-center">
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                        </div>
                    </div>
                </div>
                <div class="testimonial-item text-center rounded pb-4">
                    <div class="testimonial-comment bg-light rounded p-4">
                        <p class="text-center mb-5">
                            Lorem ipsum dolor, sit amet consectetur adipisicing
                            elit. Quis nostrum cupiditate, eligendi repellendus
                            saepe illum earum architecto dicta quisquam quasi
                            porro officiis. Vero reiciendis,
                        </p>
                    </div>
                    <div class="testimonial-img p-1">
                        <img
                            src="../img/testimonial-3.jpg"
                            class="img-fluid rounded-circle"
                            alt="Image"
                        />
                    </div>
                    <div style="margin-top: -35px">
                        <h5 class="mb-0">John Abraham</h5>
                        <p class="mb-0">New York, USA</p>
                        <div class="d-flex justify-content-center">
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                        </div>
                    </div>
                </div>
                <div class="testimonial-item text-center rounded pb-4">
                    <div class="testimonial-comment bg-light rounded p-4">
                        <p class="text-center mb-5">
                            Lorem ipsum dolor, sit amet consectetur adipisicing
                            elit. Quis nostrum cupiditate, eligendi repellendus
                            saepe illum earum architecto dicta quisquam quasi
                            porro officiis. Vero reiciendis,
                        </p>
                    </div>
                    <div class="testimonial-img p-1">
                        <img
                            src="../img/testimonial-4.jpg"
                            class="img-fluid rounded-circle"
                            alt="Image"
                        />
                    </div>
                    <div style="margin-top: -35px">
                        <h5 class="mb-0">John Abraham</h5>
                        <p class="mb-0">New York, USA</p>
                        <div class="d-flex justify-content-center">
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                            <i class="fas fa-star text-primary"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->
</template>

<style scoped></style>
