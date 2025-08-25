<script setup>
import { ref } from "vue";
import { Link, router, usePage } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";

const toaster = createToaster({
  position: "top-right"
});
const page = usePage();

const headers = [
  { text: "Site Favicon", value: "site_favicon" },
  { text: "Site Logo", value: "site_logo" },
  { text: "FB Link", value: "fb_link" },
  { text: "Twitter Link", value: "twitter_link" },
  { text: "Instagram Link", value: "instagram_link" },
  { text: "LinkedIn Link", value: "linkedin_link" },
  { text: "YouTube Link", value: "youtube_link" },
  { text: "About Banner Image", value: "about_banner_image" },
  { text: "About Hero Image", value: "about_hero_image" },
  { text: "About Content", value: "about_content" },
  { text: "Booking Content", value: "booking_content" },
  { text: "Login Banner Image", value: "login_banner_image" },
  { text: "Register Banner Image", value: "register_banner_image" },
  { text: "Site Address", value: "site_address" },
  { text: "Site Email", value: "site_email" },
  { text: "Site Phone", value: "site_phone" },
  { text: "Site Fax", value: "site_fax" },
  { text: "Service Banner Image", value: "service_banner_image" },
  { text: "Contact Banner Image", value: "contact_banner_image" },
  { text: "Booking Banner Image", value: "booking_banner_image" },
  { text: "Verify Otp Banner Image", value: "verify_otp_banner_image" },
  { text: "Verify Email Banner Image", value: "verify_email_banner_image" },
  { text: "Reset Password Banner Image", value: "reset_password_banner_image" },
  { text: "Payment Image", value: "payment_image" },
  { text: "Whatsapp Number", value: "whatsapp_number" },
  { text: "Google Map Link", value: "google_map_link" },
  { text: "Action", value: "action" },
];


const items = ref(page.props.logos || []);
const searchField = ref(["site_name"]);
const searchItem = ref();

function deleteLogo(id) {
    if (confirm("Are you sure you want to delete this Logo?")) {
        router.get(`/admin/logo/${id}`);
    }
}

if (page.props.flash.status === false) {
    toaster.error(page.props.flash.message);
} else if (page.props.flash.status === true) {
    toaster.success(page.props.flash.message);
}
</script>


<template>
    <h3 class="fw-bold mb-4">Logo/Banner List</h3>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <!-- Search Input -->
        <input
            type="text"
            class="form-control w-25"
            v-model="searchItem"
            placeholder="Search here"
        />

        <!-- Add Button -->
        <Link v-if="page.props.user.can['logo-save']"
            :href="`/admin/logo-save-page?logo_id=${0}`"
            class="btn btn-success"
        >
            Add Logo
        </Link>
    </div>

    <!-- Data Table -->
 <EasyDataTable
    :headers="headers"
    :items="items"
    :search-field="searchField"
    :search-value="searchItem"
    alternating
    :rows-per-page="5"
    table-class="table table-striped table-bordered"
>
    <!-- Site Logo -->
    <template #item-site_logo="{ site_logo }">
        <img :src="`/storage/logo/${site_logo}`" style="width: 50px; height: 50px" />
    </template>

       <!-- Payment Image -->
    <template #item-payment_image="{ payment_image }">
        <img :src="`/storage/logo/${payment_image}`" style="width: 50px; height: 50px" />
    </template>

    <!-- About Banner Image -->
    <template #item-about_banner_image="{ about_banner_image }">
        <img :src="`/storage/logo/${about_banner_image}`" style="width: 50px; height: 50px" />
    </template>

     <!-- About Banner Image -->
    <template #item-booking_banner_image="{ booking_banner_image }">
        <img :src="`/storage/logo/${booking_banner_image}`" style="width: 50px; height: 50px" />
    </template>

    <!-- About Hero Image -->
    <template #item-about_hero_image="{ about_hero_image }">
        <img :src="`/storage/logo/${about_hero_image}`" style="width: 50px; height: 50px" />
    </template>

    <!-- About Content -->
    <template #item-about_content="{ about_content }">
        <span v-html="about_content"></span>
    </template>

    <!-- booking Content -->
    <template #item-booking_content="{ booking_content }">
        <span v-html="booking_content"></span>
    </template>

    <!-- Login Banner Image -->
    <template #item-login_banner_image="{ login_banner_image }">
        <img :src="`/storage/logo/${login_banner_image}`" style="width: 50px; height: 50px" />
    </template>

    <!-- register banner Image -->
    <template #item-register_banner_image="{ register_banner_image }">
        <img :src="`/storage/logo/${register_banner_image}`" style="width: 50px; height: 50px" />
    </template>

    <!-- Service Banner Image -->
    <template #item-service_banner_image="{ service_banner_image }">
        <img :src="`/storage/logo/${service_banner_image}`" style="width: 50px; height: 50px" />
    </template>

    <!-- Contact Banner Image -->
    <template #item-contact_banner_image="{ contact_banner_image }">
        <img :src="`/storage/logo/${contact_banner_image}`" style="width: 50px; height: 50px" />
    </template>

    <!-- Site Favicon -->
    <template #item-site_favicon="{ site_favicon }">
        <img :src="`/storage/logo/${site_favicon}`" style="width: 50px; height: 50px" />
    </template>


    <!-- Action Buttons -->
    <template #item-action="{ id }">
        <div class="d-flex gap-2">
            <Link v-if="page.props.user.can['logo-update']"
                :href="`/admin/logo-save-page?logo_id=${id}`"
                class="btn btn-sm btn-primary"
            >
                Edit
            </Link>
            <button v-if="page.props.user.can['logo-delete']"
                @click="deleteLogo(id)"
                class="btn btn-sm btn-danger"
            >
                Delete
            </button>
        </div>
    </template>
</EasyDataTable>

</template>

<style scoped></style>

