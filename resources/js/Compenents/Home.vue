<script setup>
import { useForm, router, usePage ,Link} from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";
import { computed, ref ,onMounted} from "vue";

const toaster = createToaster({});
const page = usePage();
const errors = computed(() => page.props.errors || {});

const form = useForm({
    user_id: page.props.user.authUser.id,
    name: "",
    email: "",
    bd_phone: "",
    last_education: "",
    prefferred_country: "",
    pdf: "",
});

// Custom dropdown logic
const isOpen = ref(false);
const selectedCountry = ref(null);

const toggleDropdown = () => {
    isOpen.value = !isOpen.value;
};

const selectCountry = (country) => {
    selectedCountry.value = country;
    form.prefferred_country = country.country_name;
    isOpen.value = false;
};

function submitForm() {
    form.post("/student/booking", {
        preserveScroll: true,
        forceFormData: true,
        onSuccess: () => {
            if (page.props.flash.status == false) {
                toaster.error(page.props.flash.message);
            } else if (page.props.flash.status == true) {
                toaster.success(page.props.flash.message);
                router.get("/");
            }
        },
    });
}


onMounted(() => {
    // Wait for DOM to render before initializing carousel
    setTimeout(() => {
        $(".packages-carousel").owlCarousel({
            items: 3,
            margin: 30,
            loop: true,
            autoplay: true,
            autoplayTimeout: 3000,
            smartSpeed: 800,
            nav: true,
            dots: true,
            responsive: {
                0: { items: 1 },
                768: { items: 2 },
                992: { items: 3 },
            },
        });
    }, 100); // slight delay
});
</script>
<template>

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

    <!-- Packages Start -->
    <div class="container-fluid packages py-5">
        <div class="container py-5">
            <div class="mx-auto text-center mb-5" style="max-width: 900px">
                <!-- <div v-html="page.props.packages.description"></div> -->
                 Packages
            </div>
            <div class="packages-carousel owl-carousel">
                <div v-for="university in page.props.universities" :key="university.id" class="packages-item">
                        <div class="packages-img">
                            <img :src="`/storage/university/${university.image}`" class="img-fluid w-100 rounded-top" alt="Image">
                            <div class="packages-info d-flex border border-start-0 border-end-0 position-absolute" style="width: 100%; bottom: 0; left: 0; z-index: 5;">
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-map-marker-alt me-2"></i>{{ university.country.country_name }}</small>
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-calendar-alt me-2"></i>{{ university.name }}</small>
                            </div>
                            <div class="packages-price py-2 px-4 w-100 text-center">{{ university.title }}</div>
                        </div>
                        <div class="packages-content bg-light">
                            <div class="row bg-primary rounded-bottom mx-0">
                                <div class="col-6 text-start px-0">
                                    <Link :href="`/country-by-id/${university.country_id}`" class="btn-hover btn text-white py-2 px-4">Read More</Link>
                                </div>
                                <div class="col-6 text-end px-0">
                                    <Link :href="`/travel-booking?university_id=${university.id}`" class="btn-hover btn text-white py-2 px-4">Book Now</Link>
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
        </div>
    </div>
    <!-- Packages End -->

    <!-- Tour Booking Start -->
    <div class="container-fluid booking py-5">
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6">
                    <h5 class="section-booking-title pe-3">Booking</h5>
                    <h1 class="text-white mb-4">Online Booking</h1>
                    <p class="text-white mb-4">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Aspernatur maxime ullam esse fuga blanditiis accusantium
                        pariatur quis sapiente, veniam doloribus praesentium?
                        Repudiandae iste voluptatem fugiat doloribus quasi quo
                        iure officia.
                    </p>
                    <p class="text-white mb-4">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Aspernatur maxime ullam esse fuga blanditiis accusantium
                        pariatur quis sapiente, veniam doloribus praesentium?
                        Repudiandae iste voluptatem fugiat doloribus quasi quo
                        iure officia.
                    </p>
                    <a
                        href="#"
                        class="btn btn-light text-primary rounded-pill py-3 px-5 mt-2"
                        >Read More</a
                    >
                </div>
                <div class="col-lg-6">
                    <h1 class="text-white mb-3">Book A Tour Deals</h1>
                    <p class="text-white mb-4">
                        Get <span class="text-warning">50% Off</span> On Your
                        First Adventure Trip With Travela. Get More Deal Offers
                        Here.
                    </p>
                    <form @submit.prevent="submitForm">
                        <div class="row g-3">
                            <!-- Name -->
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input
                                        v-model="form.name"
                                        type="text"
                                        class="form-control bg-white border-0"
                                        id="name"
                                        placeholder="Your Name"
                                    />
                                    <label for="name">Your Name</label>
                                    <div
                                        v-if="errors.name"
                                        class="text-white mt-1"
                                    >
                                        {{ errors.name[0] }}
                                    </div>
                                </div>
                            </div>

                            <!-- Email -->
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input
                                        v-model="form.email"
                                        type="email"
                                        class="form-control bg-white border-0"
                                        id="email"
                                        placeholder="Your Email"
                                    />
                                    <label for="email">Your Email</label>
                                    <div
                                        v-if="errors.email"
                                        class="text-white mt-1"
                                    >
                                        {{ errors.email[0] }}
                                    </div>
                                </div>
                            </div>

                            <!-- BD Phone -->
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input
                                        v-model="form.bd_phone"
                                        type="text"
                                        class="form-control bg-white border-0"
                                        placeholder="Mobile No"
                                    />
                                    <label for="bd_phone">Mobile</label>
                                    <div
                                        v-if="errors.bd_phone"
                                        class="text-white mt-1"
                                    >
                                        {{ errors.bd_phone[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input
                                        @input="
                                            form.pdf = $event.target.files[0]
                                        "
                                        type="file"
                                        class="form-control bg-white border-0"
                                        placeholder="PDF"
                                    />
                                    <label for="pdf">PDF</label>
                                    <div
                                        v-if="errors.pdf"
                                        class="text-white mt-1"
                                    >
                                        {{ errors.pdf[0] }}
                                    </div>
                                    <progress
                                        v-if="form.progress"
                                        class="w-100"
                                        :max="form.pdf.size"
                                    >
                                        {{ form.progress.percentage }}
                                    </progress>
                                </div>
                            </div>

                            <!-- Last Education -->
                            <div class="col-xl-6">
                                <div class="form-floating">
                                    <select
                                        v-model="form.last_education"
                                        class="form-select border"
                                    >
                                        <option value="hsc">HSC</option>
                                        <option value="bechelor">
                                            Bechelor
                                        </option>
                                    </select>
                                    <label for="last-education"
                                        >Last Education</label
                                    >
                                    <div
                                        v-if="errors.last_education"
                                        class="text-white mt-1"
                                    >
                                        {{ errors.last_education[0] }}
                                    </div>
                                </div>
                            </div>

                            <!-- Preferred Country (custom dropdown) -->
                            <div class="col-xl-6">
                                <div class="form-floating position-relative">
                                    <div class="dropdown w-100">
                                        <!-- Button -->
                                        <button
                                            class="btn bg-white border dropdown-toggle w-100 d-flex align-items-center justify-content-between"
                                            type="button"
                                            @click="toggleDropdown"
                                        >
                                            <div
                                                class="d-flex align-items-center gap-2"
                                                style="height: 44px"
                                            >
                                                <div
                                                    class="d-flex justify-content-center align-items-center gap-2"
                                                >
                                                    <img
                                                        v-if="selectedCountry"
                                                        :src="`/storage/country/${selectedCountry.country_flag}`"
                                                        alt="flag"
                                                        style="
                                                            width: 20px;
                                                            height: 14px;
                                                            object-fit: cover;
                                                        "
                                                    />
                                                    <span>
                                                        {{
                                                            selectedCountry
                                                                ? selectedCountry.country_name
                                                                : "Select Country"
                                                        }}
                                                    </span>
                                                </div>
                                            </div>
                                        </button>

                                        <!-- Dropdown List -->
                                        <ul
                                            v-if="isOpen"
                                            class="dropdown-menu show w-100 mt-1 shadow-sm"
                                            style="
                                                max-height: 200px;
                                                overflow-y: auto;
                                                background: white;
                                                z-index: 1000;
                                            "
                                        >
                                            <li
                                                v-for="(country, index) in page
                                                    .props.countries"
                                                :key="index"
                                                @click.stop="
                                                    selectCountry(country)
                                                "
                                                class="dropdown-item d-flex align-items-center gap-2"
                                                style="cursor: pointer"
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
                                                {{ country.country_name }}
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- Error -->
                                    <div
                                        v-if="errors.prefferred_country"
                                        class="text-white mt-1"
                                    >
                                        {{ errors.prefferred_country[0] }}
                                    </div>
                                </div>
                            </div>

                            <!-- Submit -->
                            <div class="col-12">
                                <button
                                    class="btn btn-primary text-white w-100 py-3"
                                    type="submit"
                                >
                                    Book Now
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Tour Booking End -->


</template>

<style scoped>
.service-card {
    height: 350px;
    display: flex;
    flex-direction: column;
    transition: transform 0.3s ease;
    cursor: pointer;
}
.service-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 20px rgba(0, 0, 0, 0.12);
}
.service-img {
    height: 160px;
    object-fit: cover;
    border-top-left-radius: 0.5rem;
    border-top-right-radius: 0.5rem;
}
.card-body {
    padding: 1rem 1.25rem;
}
.card-title {
    font-weight: 600;
    margin-bottom: 0.5rem;
    font-size: 1.25rem;
}
.card-text {
    font-size: 0.95rem;
    color: #555;
    margin-bottom: 1rem;
}
.btn-primary {
    font-size: 0.9rem;
    padding: 0.4rem 1rem;
    border-radius: 0.3rem;
}
</style>

