<script setup>
import { usePage, useForm, router } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";
import { ref, computed } from "vue";
import CarouselImage from "./CarouselImage.vue";

const toaster = createToaster({
  position: "top-right"
});
const page = usePage();
const carousel_id = new URLSearchParams(window.location.search).get("carousel_id") ?? 0;
const carousel = page.props.carousel;
const errors = computed(() => page.props.errors || {});


const form = useForm({
    rank: "",
    image: "",
    title: "",
    description: "",
});

if(carousel_id != 0 && carousel != null){
    form.rank = carousel.rank;
    form.image = carousel.image;
    form.title = carousel.title;
    form.description = carousel.description;

}

const URL = carousel_id != 0 ? `/admin/carousel/${carousel_id}` : "/admin/carousel";

function submitForm() {
  form.post(URL, {
    preserveScroll: true,
    onSuccess: () => {
      if (page.props.flash.status == true) {
        toaster.success(page.props.flash.message);
        router.get("/admin/carousels");
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
          <h4 class="text-center mb-3">{{ carousel_id == 0 ? "Create Carousel" : "Update Carousel" }}</h4>
          <form @submit.prevent="submitForm">
            <div class="mb-3">
              <label class="form-label">Carousel Rank</label>
              <input v-model="form.rank" type="text" class="form-control" />
              <div v-if="errors.rank" class="text-danger">{{ errors.rank[0] }}</div>
            </div>

             <div class="mb-3">
              <label class="form-label">Title</label>
              <input v-model="form.title" type="text" class="form-control" />
              <div v-if="errors.title" class="text-danger">{{ errors.title[0] }}</div>
            </div>

             <div class="mb-3">
              <label class="form-label">Description</label>
              <input v-model="form.description" type="text" class="form-control" />
              <div v-if="errors.description" class="text-danger">{{ errors.description[0] }}</div>
            </div>

            <div class="mb-3">
              <CarouselImage :carouselImage="form.image" @image="(e)=> form.image = e" />
              <div v-if="errors.image" class="text-danger">{{ errors.image[0] }}</div>
            </div>
            <div class="d-grid">
              <button type="submit" class="btn btn-primary">
                {{ carousel_id == 0 ? "Create Carousel" : "Update Carousel" }}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
