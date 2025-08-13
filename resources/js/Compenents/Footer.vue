<script setup>
import { Link, usePage } from "@inertiajs/vue3";

const page = usePage();

</script>

<template>
    <!-- Subscribe Start -->
    <!-- <div class="container-fluid subscribe py-5">
        <div class="container text-center py-5">
            <div class="mx-auto text-center" style="max-width: 900px">
                <h5 class="subscribe-title px-3">Subscribe</h5>
                <h1 class="text-white mb-4">Our Newsletter</h1>
                <p class="text-white mb-5">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                    Laborum tempore nam, architecto doloremque velit explicabo?
                    Voluptate sunt eveniet fuga eligendi! Expedita laudantium
                    fugiat corrupti eum cum repellat a laborum quasi.
                </p>
                <div class="position-relative mx-auto">
                    <input
                        class="form-control border-primary rounded-pill w-100 py-3 ps-4 pe-5"
                        type="text"
                        placeholder="Your email"
                    />
                    <button
                        type="button"
                        class="btn btn-primary rounded-pill position-absolute top-0 end-0 py-2 px-4 mt-2 me-2"
                    >
                        Subscribe
                    </button>
                </div>
            </div>
        </div>
    </div> -->
    <!-- Subscribe End -->

    <!-- Footer Start -->
    <div class="container-fluid footer py-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="footer-item d-flex flex-column">
                        <h4 class="mb-4 text-white">Get In Touch</h4>
                        <Link :href="'#'"
                            ><i class="fas fa-home me-2"></i>{{ page.props.setting.site_address }}
                           </Link
                        >
                        <Link :href="'#'"
                            ><i class="fas fa-envelope me-2"></i>
                            {{ page.props.setting.site_email }}</Link>
                        <Link :href="'#'"
                            ><i class="fas fa-phone me-2"></i> {{ page.props.setting.site_phone }}</Link>
                        <Link  :href="'#'"
                            ><i class="fas fa-print me-2"></i>{{ page.props.setting.site_fax }}</Link
                        >
                        <div class="d-flex align-items-center">
                            <i class="fas fa-share fa-2x text-white me-2"></i>
                            <Link
                                class="btn-square btn btn-primary rounded-circle mx-1"
                                :href="page.props.setting.fb_link?page.props.setting.fb_link:'#'"
                                ><i class="fab fa-facebook-f"></i
                            ></Link>
                            <Link
                                class="btn-square btn btn-primary rounded-circle mx-1"
                                :href="page.props.setting.twitter_link?page.props.setting.twitter_link:'#'"
                                ><i class="fab fa-twitter"></i
                            ></Link>
                            <Link
                                class="btn-square btn btn-primary rounded-circle mx-1"
                                :href="page.props.setting.instagram_link?page.props.setting.instagram_link:'#'"
                                ><i class="fab fa-instagram"></i
                            ></Link>
                            <Link
                                class="btn-square btn btn-primary rounded-circle mx-1"
                                :href="page.props.setting.linkedin_link?page.props.setting.linkedin_link:'#'"
                                ><i class="fab fa-linkedin-in"></i
                            ></Link>
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
                            class="mb-3"
                        >
                            <i class="fas fa-angle-right me-2"></i>
                            {{ page.name }}
                    </Link>
                    </div>
                </div>
                <!-- <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="footer-item d-flex flex-column">
                        <h4 class="mb-4 text-white">Support</h4>
                        <a href=""
                            ><i class="fas fa-angle-right me-2"></i> Contact</a
                        >
                        <a href=""
                            ><i class="fas fa-angle-right me-2"></i> Legal
                            Notice</a
                        >
                        <a href=""
                            ><i class="fas fa-angle-right me-2"></i> Privacy
                            Policy</a
                        >
                        <a href=""
                            ><i class="fas fa-angle-right me-2"></i> Terms and
                            Conditions</a
                        >
                        <a href=""
                            ><i class="fas fa-angle-right me-2"></i> Sitemap</a
                        >
                        <a href=""
                            ><i class="fas fa-angle-right me-2"></i> Cookie
                            policy</a
                        >
                    </div>
                </div> -->
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="footer-item">
                        <h4 class="text-white mb-3">Payments</h4>
                        <div class="footer-bank-card">
                            <a href="#" class="text-white me-2"
                                ><i class="fab fa-cc-amex fa-2x"></i
                            ></a>
                            <a href="#" class="text-white me-2"
                                ><i class="fab fa-cc-visa fa-2x"></i
                            ></a>
                            <a href="#" class="text-white me-2"
                                ><i class="fas fa-credit-card fa-2x"></i
                            ></a>
                            <a href="#" class="text-white me-2"
                                ><i class="fab fa-cc-mastercard fa-2x"></i
                            ></a>
                            <a href="#" class="text-white me-2"
                                ><i class="fab fa-cc-paypal fa-2x"></i
                            ></a>
                            <a href="#" class="text-white"
                                ><i class="fab fa-cc-discover fa-2x"></i
                            ></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->

</template>

<style scoped></style>
