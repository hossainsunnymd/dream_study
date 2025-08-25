<script setup>
import { computed } from "vue";
import { Head } from "@inertiajs/vue3";
import { usePage } from "@inertiajs/vue3";
const page = usePage();

</script>

<template>
  <Head>
    <title>{{ page.props.pageView.pages.meta_title }}</title>
    <meta name="description" :content="page.props.pageView.pages.meta_description" />
  </Head>
  <div
    class="container-fluid bg-breadcrumb professional-header"
    :style="{
      backgroundImage: `url(/storage/pageContent/${page.props.pageView.pages.image})`,
      backgroundSize: 'cover',
      backgroundPosition: 'center',
      backgroundRepeat: 'no-repeat',
    }"
  >
    <div class="container text-center py-5">
    <h3 class="display-3 mb-4 animate-slide-down text-white">{{ page.props.pageView.pages.title }}</h3>
    </div>
  </div>

  <div class="container-fluid country-section py-5">
    <div class="container py-5 d-flex justify-content-center">
      <div
        class="glass-card p-4 mt-4 text-white animate-slide-left"
        v-html="page.props.pageView.pages.description"
        style="max-width: 900px; width: 100%;"
      ></div>
    </div>
  </div>
</template>

<style scoped>
.country-section {
  background: linear-gradient(135deg, #0a1a2f, #05152b);
  padding-top: 60px;
  padding-bottom: 60px;
}
.glass-card {
  background: rgba(255, 255, 255, 0.05);
  backdrop-filter: blur(12px);
  border-radius: 16px;
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  color: #fff;
  transition: transform 0.4s ease, box-shadow 0.4s ease;
}
.glass-card:hover {
  transform: scale(1.03);
  box-shadow: 0 15px 40px rgba(0, 0, 0, 0.35);
}
.animate-slide-left {
  animation: slideLeft 1s ease forwards;
}
@keyframes slideLeft {
  0% {
    transform: translateX(-50px);
    opacity: 0;
  }
  100% {
    transform: translateX(0);
    opacity: 1;
  }
}
</style>
