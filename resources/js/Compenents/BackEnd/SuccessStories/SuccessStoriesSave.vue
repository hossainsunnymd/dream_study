<script setup>
import { usePage, useForm, router } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";
import { computed } from "vue";
import SuccessImage from "./SuccessImage.vue";

const toaster = createToaster({
  position: "top-right"
});
const page = usePage();
const success_id = new URLSearchParams(window.location.search).get("success_id") ?? 0;
const successStory = page.props.successStory;
const errors = computed(() => page.props.errors || {});


const form = useForm({
    image: "",
    video: "",
    rank: "",
});

if(success_id != 0 && successStory != null){
    form.image = successStory.image;
    form.video = successStory.video;
    form.rank = successStory.rank;

}

const URL = success_id != 0 ? `/admin/success-stories/${success_id}` : "/admin/success-stories";

function submitForm() {
  form.post(URL, {
    preserveScroll: true,
    onSuccess: () => {
      if (page.props.flash.status == true) {
        toaster.success(page.props.flash.message);
        router.get("/admin/success-stories");
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
          <h4 class="text-center mb-3">{{ success_id == 0 ? "Create Success Story" : "Update Success Story" }}</h4>
          <form @submit.prevent="submitForm">

             <div class="mb-3">
              <label class="form-label">Rank</label>
              <input v-model="form.rank" type="text" class="form-control" />
              <div v-if="errors.rank" class="text-danger">{{ errors.rank[0] }}</div>
            </div>

            <div class="mb-3">
              <label class="form-label">Success Video Link</label>
              <input v-model="form.video" type="text" class="form-control" />
            </div>


            <div class="mb-3">
              <SuccessImage :successImage="form.image" @image="(e)=> form.image = e" />
              <div v-if="errors.image" class="text-danger">{{ errors.image[0] }}</div>
            </div>
            <div class="d-grid">
              <button type="submit" class="btn btn-primary">
                {{ success_id == 0 ? "Create Success Story" : "Update Success Story" }}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
