<script setup>
import { Link, usePage } from "@inertiajs/vue3";
import { computed } from "vue";

const page = usePage();

const chunkedStories = computed(() => {
  const stories = page.props.successStories ?? [];
  const size = 3;
  const chunks = [];
  for (let i = 0; i < stories.length; i += size) {
    chunks.push(stories.slice(i, i + size));
  }
  return chunks;
});

function extractVideoID(url) {
  const regExp =
    /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/;
  const match = url.match(regExp);
  return match ? match[1] : '';
}
</script>

<template>
  <!-- Header Start -->
  <div
    class="container-fluid bg-breadcrumb background-image-fixed"
    :style="{
      backgroundImage: page?.props?.country?.image
        ? `url('/storage/countryDetail/${page.props.country.image}')`
        : `url('/img/default-banner.jpg')`,
      backgroundSize: 'cover',
      backgroundPosition: 'center',
      height: '400px',
    }"
  >
    <div class="container text-center py-5" style="max-width: 900px">
      <h3 class="text-white display-3 mb-4">
        {{ page.props.country ? page.props.country.title : 'Study Abroad' }}
      </h3>
      <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><Link href="/">Home</Link></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Services</li>
      </ol>
    </div>
  </div>
  <!-- Header End -->

  <!-- Country Details Section -->
  <div class="container-fluid bg-light service py-5">
    <div class="container py-5">
      <div class="mx-auto text-center mb-5" style="max-width: 900px">
        <h1 class="mb-0">
          {{ page.props.country ? page.props.country.title : 'Study Abroad' }}
        </h1>
      </div>

      <div class="row g-5">
        <!-- Key Points -->
        <div class="col-lg-8" v-html="page.props.country?.key_points"></div>

        <!-- Description -->
        <div class="col-lg-8" v-html="page.props.country?.description"></div>

        <!-- Country List -->
        <div class="col-lg-4">
          <h2 class="section-title px-3 mb-3">Countries We Work</h2>
          <div class="d-grid gap-2">
            <div
              class="bg-primary-subtle border border-primary-subtle rounded-3 p-2"
              v-for="country in page.props.countries"
              :key="country.id"
            >
              <h5>Study in {{ country.country_name }}</h5>
            </div>
          </div>
        </div>
      </div>

      <!-- Success Stories -->
      <div class="mt-5 pt-5 text-center">
        <h2 class="section-title px-3 mb-4">Our Success Stories</h2>

        <!-- First carousel: Left to Right -->
        <div id="cardCarouselLeft" class="carousel slide mb-4" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div
              v-for="(chunk, index) in chunkedStories"
              :key="index"
              class="carousel-item"
              :class="{ active: index === 0 }"
            >
              <div class="d-flex justify-content-center gap-3 flex-wrap">
                <div
                  v-for="story in chunk"
                  :key="story.id"
                  class="card"
                  style="width: 18rem"
                >
                  <iframe
                    width="288"
                    height="288"
                    :src="`https://www.youtube.com/embed/${extractVideoID(story.video)}`"
                    title="YouTube video player"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    referrerpolicy="strict-origin-when-cross-origin"
                    allowfullscreen
                  ></iframe>
                  <div class="card-body">
                    <h5 class="card-title">{{ story.title }}</h5>
                    <p class="card-text">{{ story.description }}</p>
                    <a :href="story.link ?? '#'" class="btn btn-primary">Learn More</a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <button
            class="carousel-control-prev "
            type="button"
            data-bs-target="#cardCarouselLeft"
            data-bs-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button
            class="carousel-control-next"
            type="button"
            data-bs-target="#cardCarouselLeft"
            data-bs-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>

        <!-- Second carousel: Right to Left -->
        <!-- <div
          id="cardCarouselRight"
          class="carousel slide rtl-slide"
          data-bs-ride="carousel"
        >
          <div class="carousel-inner">
            <div
              v-for="(chunk, index) in chunkedStories"
              :key="index"
              class="carousel-item"
              :class="{ active: index === 0 }"
            >
              <div class="d-flex justify-content-center gap-3 flex-wrap">
                <div
                  v-for="story in chunk"
                  :key="story.id"
                  class="card"
                  style="width: 18rem"
                >
                  <iframe
                    width="288"
                    height="288"
                    :src="`https://www.youtube.com/embed/${extractVideoID(story.video_link)}`"
                    title="YouTube video player"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    referrerpolicy="strict-origin-when-cross-origin"
                    allowfullscreen
                  ></iframe>
                  <div class="card-body">
                    <h5 class="card-title">{{ story.title }}</h5>
                    <p class="card-text">{{ story.description }}</p>
                    <a :href="story.link ?? '#'" class="btn btn-primary">Learn More</a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <button
            class="carousel-control-prev"
            type="button"
            data-bs-target="#cardCarouselRight"
            data-bs-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button
            class="carousel-control-next"
            type="button"
            data-bs-target="#cardCarouselRight"
            data-bs-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div> -->
      </div>
    </div>
  </div>
</template>

<style scoped>
.background-image-fixed {
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
  background-attachment: fixed;
  position: relative;
  z-index: 1;
}
.background-image-fixed::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  z-index: -1;
}
.background-image-fixed .container {
  position: relative;
  z-index: 2;
}

/* Right to Left Slide */
.rtl-slide.carousel.slide .carousel-item {
  transition: transform 0.6s ease;
}

.rtl-slide.carousel.slide .carousel-item-next,
.rtl-slide.carousel.slide .carousel-item-prev.carousel-item-right {
  transform: translateX(-100%);
}

.rtl-slide.carousel.slide .carousel-item-prev,
.rtl-slide.carousel.slide .carousel-item-next.carousel-item-left {
  transform: translateX(-100%);
}

.rtl-slide.carousel.slide .active.carousel-item-left,
.rtl-slide.carousel.slide .carousel-item-prev.carousel-item-left,
.rtl-slide.carousel.slide .active.carousel-item-right,
.rtl-slide.carousel.slide .carousel-item-next.carousel-item-right {
  transform: translateX(100%);
}


</style>
