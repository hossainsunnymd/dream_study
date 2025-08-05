<script setup>
import { ref } from "vue";

const props = defineProps({
    bookingBannerImage: {
        type: [String, File],
        default: null,
    },
});

const currentImage = props.bookingBannerImage
    ? `/storage/logo/${props.bookingBannerImage}`
    : null;
const preview = ref(currentImage);
const emit = defineEmits(["image"]);

const imageSelected = (e) => {
    preview.value = URL.createObjectURL(e.target.files[0]);
    emit("image", e.target.files[0]);
};

</script>

<template>
  <div class="position-relative d-inline-block">
    <label for="image" class="d-block">
      <img
        :src="preview ? preview : bookingBannerImage ? `/storage/logo/${bookingBannerImage}` : 'placeholder.png'"
        class="img-thumbnail border border-dark rounded w-100"
        style="width: 100px; height: 100px; object-fit: cover;"
        alt="Booking Banner Logo"
      />
    </label>

    <!-- Hidden file input (but clickable over the image) -->
    <input
      @change="imageSelected($event)"
      type="file"
      id="image"
      class="position-absolute"
      style="top: 0; left: 0; width: 100%; height: 100%; opacity: 0; cursor: pointer;"
    />
  </div>
</template>



