<template>
  <div class="container py-4">
    <div class="row justify-content-center">
      <div class="col-12 col-lg-10">
        <div class="card shadow p-4">
          <h4 class="text-center mb-4">
            {{ logo_id == 0 ? "Create Settings" : "Update Settings" }}
          </h4>

          <form @submit.prevent="submitForm">
            <!-- Image Upload Fields -->
            <div class="row">
              <div class="col-12 col-md-6 mb-3">
                <label class="form-label">Site Favicon</label>
                <SiteFabicon :siteFavicon="form.site_favicon" @image="e => form.site_favicon = e" />
                <div v-if="errors.site_favicon" class="text-danger">{{ errors.site_favicon[0] }}</div>
              </div>

              <div class="col-12 col-md-6 mb-3">
                <label class="form-label">Payment Image</label>
                <PaymentImage :paymentImage="form.payment_image" @image="e => form.payment_image = e" />
                <div v-if="errors.payment_image" class="text-danger">{{ errors.payment_image[0] }}</div>
              </div>

              <div class="col-12 col-md-6 mb-3">
                <label class="form-label">About Banner</label>
                <AboutBannerImage :aboutBannerImage="form.about_banner_image" @image="e => form.about_banner_image = e" />
                <div v-if="errors.about_banner_image" class="text-danger">{{ errors.about_banner_image[0] }}</div>
              </div>

              <div class="col-12 col-md-6 mb-3">
                <label class="form-label">About Hero</label>
                <AboutHeroImage :aboutHeroImage="form.about_hero_image" @image="e => form.about_hero_image = e" />
                <div v-if="errors.about_hero_image" class="text-danger">{{ errors.about_hero_image[0] }}</div>
              </div>

              <div class="col-12 col-md-6 mb-3">
                <label class="form-label">Login Banner</label>
                <LoginBannerImage :loginBannerImage="form.login_banner_image" @image="e => form.login_banner_image = e" />
                <div v-if="errors.login_banner_image" class="text-danger">{{ errors.login_banner_image[0] }}</div>
              </div>

              <div class="col-12 col-md-6 mb-3">
                <label class="form-label">Register Banner</label>
                <RegisterBannerImage :registerBannerImage="form.register_banner_image" @image="e => form.register_banner_image = e" />
                <div v-if="errors.register_banner_image" class="text-danger">{{ errors.register_banner_image[0] }}</div>
              </div>

              <div class="col-12 col-md-6 mb-3">
                <label class="form-label">Service Banner</label>
                <ServiceBannerImage :serviceBannerImage="form.service_banner_image" @image="e => form.service_banner_image = e" />
                <div v-if="errors.service_banner_image" class="text-danger">{{ errors.service_banner_image[0] }}</div>
              </div>

              <div class="col-12 col-md-6 mb-3">
                <label class="form-label">Contact Banner</label>
                <ContactBannerImage :contactBannerImage="form.contact_banner_image" @image="e => form.contact_banner_image = e" />
                <div v-if="errors.contact_banner_image" class="text-danger">{{ errors.contact_banner_image[0] }}</div>
              </div>

               <div class="col-12 col-md-6 mb-3">
                <label class="form-label">Booking Banner</label>
                <BookingBannerImage :bookingBannerImage="form.booking_banner_image" @image="e => form.booking_banner_image = e" />
                <div v-if="errors.booking_banner_image" class="text-danger">{{ errors.booking_banner_image[0] }}</div>
              </div>

              <div class="col-12 col-md-6 mb-3">
                <label class="form-label">Verify Email Banner</label>
                <VerifyEmailBannerImage :verifyEmailBannerImage="form.verify_email_banner_image" @image="e => form.verify_email_banner_image = e" />
                <div v-if="errors.verify_email_banner_image" class="text-danger">{{ errors.verify_email_banner_image[0] }}</div>
              </div>

              <div class="col-12 col-md-6 mb-3">
                <label class="form-label">Verify Otp Banner</label>
                <VerifyOtpBannerImage :verifyOtpBannerImage="form.verify_otp_banner_image" @image="e => form.verify_otp_banner_image = e" />
                <div v-if="errors.verify_otp_banner_image" class="text-danger">{{ errors.verify_otp_banner_image[0] }}</div>
              </div>

              <div class="col-12 col-md-6 mb-3">
                <label class="form-label">Reset Password Banner</label>
                <ResetPasswordBannerImage :resetPasswordBannerImage="form.reset_password_banner_image" @image="e => form.reset_password_banner_image = e" />
                <div v-if="errors.reset_password_banner_image" class="text-danger">{{ errors.reset_password_banner_image[0] }}</div>
              </div>

              <div class="col-12 col-md-6 mb-3">
                <label class="form-label">Site Logo</label>
                <SiteLogo :siteLogo="form.site_logo" @image="e => form.site_logo = e" />
                <div v-if="errors.site_logo" class="text-danger">{{ errors.site_logo[0] }}</div>
              </div>
            </div>

            <!-- Text Fields -->
            <div class="row">
              <div class="col-12 col-md-6 mb-3" v-for="field in textFields" :key="field">
                <label class="form-label text-capitalize">{{ field.replaceAll('_', ' ') }}</label>
                <input type="text" v-model="form[field]" class="form-control" />
                <div v-if="errors[field]" class="text-danger">{{ errors[field][0] }}</div>
              </div>
            </div>


            <!-- Quill Editors -->
            <div class="mb-3">
              <label class="form-label">About Content</label>
              <QuillEditor v-model:content="form.about_content" contentType="html" class="bg-white" />
              <div v-if="errors.about_content" class="text-danger">{{ errors.about_content[0] }}</div>
            </div>

            <div class="mb-3">
              <label class="form-label">Booking Content</label>
              <QuillEditor v-model:content="form.booking_content" contentType="html" class="bg-white" />
              <div v-if="errors.booking_content" class="text-danger">{{ errors.booking_content[0] }}</div>
            </div>

            <!-- Submit Button -->
            <div class="d-grid">
              <button type="submit" class="btn btn-primary">
                {{ logo_id == 0 ? "Create Settings" : "Update Settings" }}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { usePage, useForm, router } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";
import { computed } from "vue";
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";

// Image components
import SiteFabicon from "./SiteFavicon.vue";
import AboutBannerImage from "./AboutBannerImage.vue";
import AboutHeroImage from "./AboutHeroImage.vue";
import LoginBannerImage from "./LoginBannerImage.vue";
import RegisterBannerImage from "./RegisterBannerImage.vue";
import ServiceBannerImage from "./ServiceBannerImage.vue";
import ContactBannerImage from "./ContactBannerImage.vue";
import BookingBannerImage from "./BookingBannerImage.vue";
import VerifyOtpBannerImage from "./VerifyOtpBannerImage.vue";
import ResetPasswordBannerImage from "./ResetPasswordBannerImage.vue";
import VerifyEmailBannerImage from "./VerifyEmailBannerImage.vue";
import PaymentImage from "./PaymentImage.vue";
import SiteLogo from "./SiteLogo.vue";



const toaster = createToaster({
  position: "top-right"
});
const page = usePage();
const logo_id = new URLSearchParams(window.location.search).get("logo_id") ?? 0;
const logo = page.props.logo;
const errors = computed(() => page.props.errors || {});

const form = useForm({
  site_name: "",
  site_favicon: "",
  site_logo: "",
  fb_logo: "",
  fb_link: "",
  twitter_logo: "",
  twitter_link: "",
  instagram_logo: "",
  instagram_link: "",
  linkedin_logo: "",
  linkedin_link: "",
  youtube_logo: "",
  youtube_link: "",
  about_banner_image: "",
  about_hero_image: "",
  about_content: "",
  booking_content: "",
  login_banner_image: "",
  register_banner_image: "",
  site_address: "",
  site_email: "",
  site_phone: "",
  site_fax: "",
  service_banner_image: "",
  contact_banner_image: "",
  booking_banner_image: "",
  verify_otp_banner_image: "",
  verify_email_banner_image: "",
  reset_password_banner_image: "",
  payment_image: "",
  google_map_link: "",
  whatsapp_number: "",
});

if (logo_id != 0 && logo != null) {
  for (const key in logo) {
    if (Object.prototype.hasOwnProperty.call(form, key)) {
      form[key] = logo[key] ?? "";
    }
  }
}

const URL = logo_id != 0 ? `/admin/logo/${logo_id}` : "/admin/logo";

function submitForm() {
  form.post(URL, {
    preserveScroll: true,
    onSuccess: () => {
      if (page.props.flash.status == true) {
        toaster.success(page.props.flash.message);
        router.get("/admin/logos");
      } else if (page.props.flash.status == false) {
        toaster.error(page.props.flash.message);
      }
    },
  });
}

const textFields = [
  "site_name",
  "fb_link",
  "twitter_link",
  "instagram_link",
  "linkedin_link",
  "youtube_link",
  "site_address",
  "site_email",
  "site_phone",
  "site_fax",
  "google_map_link",
  "whatsapp_number",
];
</script>

<style>
.ql-editor {
  min-height: 200px;
}
</style>
