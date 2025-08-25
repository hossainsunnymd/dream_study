<script setup>
import { Link, usePage } from "@inertiajs/vue3";

const page = usePage();
</script>

<template>


    <!-- Footer Start -->
    <div class="container-fluid footer py-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="footer-item d-flex flex-column">
                        <h4 class="mb-4 text-white">Get In Touch</h4>
                        <Link class="text-decoration-none" :href="'#'"
                            ><i class="fas fa-home me-2"></i
                            >{{ page.props.setting.site_address }}
                        </Link>
                        <Link class="text-decoration-none" :href="'#'"
                            ><i class="fas fa-envelope me-2"></i>
                            {{ page.props.setting.site_email }}</Link
                        >
                        <Link class="text-decoration-none" :href="'#'"
                            ><i class="fas fa-phone me-2"></i>
                            {{ page.props.setting.site_phone }}</Link
                        >
                        <Link class="text-decoration-none" :href="'#'"
                            ><i class="fas fa-print me-2"></i
                            >{{ page.props.setting.site_fax }}</Link
                        >
                        <div class="d-flex align-items-center">
                            <i class="fas fa-share fa-2x text-white me-2"></i>

                            <Link
                                class="btn-square btn rounded-circle mx-1 text-white"
                                style="background-color: #1877f2"
                                :href="
                                    page.props.setting.fb_link
                                        ? page.props.setting.fb_link
                                        : '#'
                                "
                            >
                                <i class="fab fa-facebook-f"></i>
                            </Link>

                            <Link
                                class="btn-square btn rounded-circle mx-1 text-white"
                                style="background-color: #1da1f2"
                                :href="
                                    page.props.setting.twitter_link
                                        ? page.props.setting.twitter_link
                                        : '#'
                                "
                            >
                                <i class="fab fa-twitter"></i>
                            </Link>

                            <Link
                                class="btn-square btn rounded-circle mx-1 text-white"
                                style="background-color: #e4405f"
                                :href="
                                    page.props.setting.instagram_link
                                        ? page.props.setting.instagram_link
                                        : '#'
                                "
                            >
                                <i class="fab fa-instagram"></i>
                            </Link>

                            <Link
                                class="btn-square btn rounded-circle mx-1 text-white"
                                style="background-color: #ff0000"
                                :href="
                                    page.props.setting.youtube_link
                                        ? page.props.setting.youtube_link
                                        : '#'
                                "
                            >
                                <i class="fab fa-youtube"></i>
                            </Link>

                            <Link
                                class="btn-square btn rounded-circle mx-1 text-white"
                                style="background-color: #0077b5"
                                :href="
                                    page.props.setting.linkedin_link
                                        ? page.props.setting.linkedin_link
                                        : '#'
                                "
                            >
                                <i class="fab fa-linkedin-in"></i>
                            </Link>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="footer-item d-flex flex-column">
                        <h4 class="mb-4 text-white">Company</h4>

                        <Link
                            v-for="page in page.props.pageNameList"
                            :key="page.id"
                            :href="`/page-view/${page.slug}`"
                            class="mb-3 text-decoration-none"
                        >
                            <i class="fas fa-angle-right me-2"></i>
                            {{ page.name }}
                        </Link>
                    </div>
                </div>

                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="footer-item">
                        <h4 class="text-white mb-3">Payments</h4>
                        <div class="footer-bank-card">
                            <img :src="`/storage/logo/${page.props.setting.payment_image}`" alt="image" height="100px">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
</template>

<style scoped></style>
