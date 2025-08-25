<script setup>
import { usePage, useForm, router } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";
import { computed } from "vue";
import ReviewImage from "./ReviewImage.vue";

const toaster = createToaster({
  position: "top-right"
});
const page = usePage();
const review_id = new URLSearchParams(window.location.search).get("review_id") ?? 0;
const review = page.props.review;

const errors = computed(() => page.props.errors || {});


const form = useForm({
    name: "",
    title: "",
    image: "",
    description: "",
    rating: "",
    rank: "",
});

if(review_id != 0 && review != null){
    form.name = review.name;
    form.title = review.title;
    form.image = review.image;
    form.description = review.description;
    form.rating = review.rating;
    form.rank = review.rank;

}

const URL = review_id != 0 ? `/admin/review/${review_id}` : "/admin/review";

function submitForm() {
  form.post(URL, {
    preserveScroll: true,
    onSuccess: () => {
      if (page.props.flash.status == true) {
        toaster.success(page.props.flash.message);
        router.get("/admin/reviews");
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
          <h4 class="text-center mb-3">{{ review_id == 0 ? "Create Review" : "Update Review" }}</h4>
          <form @submit.prevent="submitForm">
            <div class="mb-3">
              <label class="form-label">Rank</label>
              <input v-model="form.rank" type="text" class="form-control" />
              <div v-if="errors.rank" class="text-danger">{{ errors.rank[0] }}</div>
            </div>

              <div class="mb-3">
              <label class="form-label">Name</label>
              <input v-model="form.name" type="text" class="form-control" />
              <div v-if="errors.name" class="text-danger">{{ errors.name[0] }}</div>
            </div>


             <div class="mb-3">
              <label class="form-label">Title</label>
              <input v-model="form.title" type="text" class="form-control" />
              <div v-if="errors.title" class="text-danger">{{ errors.title[0] }}</div>
            </div>

             <div class="mb-3">
              <label class="form-label">Description</label>
              <textarea  v-model="form.description" class="form-control"></textarea>
              <div v-if="errors.description" class="text-danger">{{ errors.description[0] }}</div>
            </div>

             <div class="mb-3">
              <label class="form-label">Rating</label>
              <input v-model="form.rating" type="text" class="form-control" />
              <div v-if="errors.rating" class="text-danger">{{ errors.rating[0] }}</div>
            </div>

            <div class="mb-3">
              <ReviewImage :reviewImage="form.image" @image="(e)=> form.image = e" />
              <div v-if="errors.image" class="text-danger">{{ errors.image[0] }}</div>
            </div>
            <div class="d-grid">
              <button type="submit" class="btn btn-primary">
                {{ review_id == 0 ? "Create Review" : "Update Review" }}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
