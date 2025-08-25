<script setup>
import { usePage, useForm, router } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";
import { ref, computed } from "vue";
import CountryImage from "./CountryImage.vue";

const toaster = createToaster({
  position: "top-right"
});
const page = usePage();
const country_id = new URLSearchParams(window.location.search).get("country_id") ?? 0;
const country = page.props.country;
const errors = computed(() => page.props.errors || {});


const form = useForm({
    country_name: "",
    image: "",
    rank: "",
});

if(country_id != 0 && country != null){
    form.country_name = country.country_name;
    form.image = country.country_flag;
    form.rank = country.rank;

}

const URL = country_id != 0 ? `/admin/country/${country_id}` : "/admin/country";

function submitForm() {
  form.post(URL, {
    preserveScroll: true,
    onSuccess: () => {
      if (page.props.flash.status == true) {
        toaster.success(page.props.flash.message);
        router.get("/admin/countries");
      } else if (page.props.flash.status == false) {
        toaster.error(page.props.flash.message);
      }
    },
  });
}

</script>

<template>
  <div class="container-fluid vh-100 d-flex justify-content-center">
    <div class="row w-100 justify-content-center">
      <!-- Booking Form -->
      <div class="col-md-6">
        <div class="card shadow p-4 bg-white">
          <h4 class="text-center mb-3">{{ country_id == 0 ? "Create Country" : "Update Country" }}</h4>
          <form @submit.prevent="submitForm">
            <div class="mb-3">
              <label class="form-label">Rank</label>
              <input v-model="form.rank" type="text" class="form-control" />
              <div v-if="errors.rank" class="text-danger">{{ errors.rank[0] }}</div>
            </div>

              <div class="mb-3">
              <label class="form-label">Country Name</label>
              <input v-model="form.country_name" type="text" class="form-control" />
              <div v-if="errors.country_name" class="text-danger">{{ errors.country_name[0] }}</div>
            </div>

            <div class="mb-3">
              <CountryImage :countryImage="form.image" @image="(e)=> form.image = e" />
              <div v-if="errors.image" class="text-danger">{{ errors.image[0] }}</div>
            </div>
            <div class="d-grid">
              <button type="submit" class="btn btn-primary">
                {{ country_id == 0 ? "Create Country" : "Update Country" }}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
