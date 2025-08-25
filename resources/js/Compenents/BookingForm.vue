<script setup>
import { useForm, router, usePage } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";
import { computed, ref } from "vue";

const toaster = createToaster({
  position: "top-right" 
});
const page = usePage();
const errors = computed(() => page.props.errors || {});

const form = useForm({
    user_id: page.props.user.authUser?.id || null,
    name: page.props.user.login ? page.props.user.authUser.name : "",
    email: page.props.user.login ? page.props.user.authUser.email : "",
    bd_phone: page.props.user.login ? page.props.user.authUser.phone : "",
    last_education: "",
    prefferred_country: "",
    pdf: "",
});

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
            if (page.props.flash.status === false) {
                toaster.error(page.props.flash.message);
            } else if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                router.get("/");
            }
        },
    });
}
</script>

<template>
  <div class="booking-section">
    <div class="animated-bg"></div> <!-- Animated gradient background -->
    <div class="container position-relative">
      <div class="row align-items-center gx-5">
        <!-- Left Content -->
        <div class="col-lg-6">
          <div class="booking-text" v-html="page.props.setting.booking_content"></div>
        </div>

        <!-- Booking Form -->
        <div class="col-lg-6">
          <div class="form-card glass p-5 rounded-4 animate-card">
            <h2 class="form-title mb-4">Book Your Seat</h2>
            <form @submit.prevent="submitForm">
              <div class="row g-3">
                <!-- Name -->
                <div class="col-md-6">
                  <div class="form-floating">
                    <input v-model="form.name" type="text" class="form-control" placeholder="Your Name" :readonly="page.props.user.login"/>
                    <label>Your Name</label>
                    <div v-if="errors.name" class="error">{{ errors.name[0] }}</div>
                  </div>
                </div>

                <!-- Email -->
                <div class="col-md-6">
                  <div class="form-floating">
                    <input v-model="form.email" type="email" class="form-control" placeholder="Your Email" :readonly="page.props.user.login"/>
                    <label>Your Email</label>
                    <div v-if="errors.email" class="error">{{ errors.email[0] }}</div>
                  </div>
                </div>

                <!-- Mobile -->
                <div class="col-md-6">
                  <div class="form-floating">
                    <input v-model="form.bd_phone" type="text" class="form-control" placeholder="Mobile" :readonly="page.props.user.login"/>
                    <label>Mobile</label>
                    <div v-if="errors.bd_phone" class="error">{{ errors.bd_phone[0] }}</div>
                  </div>
                </div>

                <!-- PDF -->
                <div class="col-md-6">
                  <div class="form-floating">
                    <input @input="form.pdf = $event.target.files[0]" type="file" class="form-control"/>
                    <label>Upload PDF</label>
                    <div v-if="errors.pdf" class="error">{{ errors.pdf[0] }}</div>
                    <progress v-if="form.progress" class="w-100 mt-2" :max="100" :value="form.progress.percentage"></progress>
                  </div>
                </div>

                <!-- Last Education -->
                <div class="col-md-6">
                  <div class="form-floating">
                    <select v-model="form.last_education" class="form-select">
                      <option value="hsc">HSC</option>
                      <option value="bechelor">Bachelor</option>
                    </select>
                    <label>Last Education</label>
                    <div v-if="errors.last_education" class="error">{{ errors.last_education[0] }}</div>
                  </div>
                </div>

                <!-- Preferred Country -->
                <div class="col-md-6">
                  <div class="form-floating position-relative">
                    <div class="dropdown w-100">
                      <button class="btn dropdown-toggle w-100 d-flex align-items-center justify-content-between" type="button" @click="toggleDropdown">
                        <span>
                          <img v-if="selectedCountry" :src="`/storage/country/${selectedCountry.country_flag}`" alt="flag" class="flag">
                          {{ selectedCountry ? selectedCountry.country_name : 'Select Country' }}
                        </span>
                      </button>
                      <ul v-if="isOpen" class="dropdown-menu show">
                        <li v-for="(country, index) in page.props.countries" :key="index" @click.stop="selectCountry(country)" class="dropdown-item d-flex align-items-center gap-2">
                          <img :src="`/storage/country/${country.country_flag}`" class="flag"/>
                          {{ country.country_name }}
                        </li>
                      </ul>
                    </div>
                    <div v-if="errors.prefferred_country" class="error">{{ errors.prefferred_country[0] }}</div>
                  </div>
                </div>

                <!-- Submit -->
                <div class="col-12">
                  <button type="submit" class="btn btn-primary w-100 py-3">Book Now</button>
                </div>
              </div>
            </form>
          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<style scoped>
.booking-section {
  position: relative;
  padding: 80px 0;
  min-height: 100vh;
  overflow: hidden;
}

/* Animated Gradient Background */
.animated-bg {
  position: absolute;
  top: 0; left: 0;
  width: 100%; height: 100%;
  background: linear-gradient(270deg, #0f2027, #203a43, #2c5364, #00d4ff);
  background-size: 800% 800%;
  animation: gradientAnimation 20s ease infinite;
  z-index: 0;
}

@keyframes gradientAnimation {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

.booking-text {
  color: #fff;
  font-size: 1.1rem;
  line-height: 1.8;
  margin-bottom: 30px;
  position: relative;
  z-index: 1;
}

/* Glassmorphism Form Card */
.form-card.glass {
  background: rgba(255, 255, 255, 0.15);
  backdrop-filter: blur(15px);
  border-radius: 20px;
  padding: 40px;
  border: 1px solid rgba(255, 255, 255, 0.3);
  transition: transform 0.5s ease, box-shadow 0.5s ease;
  position: relative;
  z-index: 1;
}

/* Floating animation */
.animate-card {
  animation: floatCard 6s ease-in-out infinite;
}

@keyframes floatCard {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-10px); }
}

.form-title {
  font-weight: 700;
  color: #fff;
}

.form-control, .form-select {
  border-radius: 12px;
  padding: 14px 16px;
  border: 1px solid rgba(255, 255, 255, 0.4);
  background: rgba(255, 255, 255, 0.25);
  color: #fff;
  backdrop-filter: blur(5px);
  transition: border-color 0.3s ease, box-shadow 0.3s ease, background 0.3s ease;
}

.form-control::placeholder {
  color: rgba(255, 255, 255, 0.7);
}

.form-control:focus, .form-select:focus {
  border-color: #00d4ff;
  box-shadow: 0 0 0 0.2rem rgba(0,212,255,0.25);
  background: rgba(255, 255, 255, 0.35);
  color: #000;
}

.error {
  color: #ff6b6b;
  font-size: 13px;
  margin-top: 4px;
}

.dropdown-menu {
  max-height: 200px;
  overflow-y: auto;
  border-radius: 12px;
  z-index: 1000;
}

.dropdown-item:hover {
  background-color: rgba(255,255,255,0.2);
}

.flag {
  width: 20px;
  height: 14px;
  object-fit: cover;
  margin-right: 8px;
}

button[type="submit"] {
  background: #00d4ff;
  border-radius: 12px;
  font-weight: 600;
  font-size: 16px;
  color: #000;
  transition: 0.3s ease;
}

button[type="submit"]:hover {
  background-color: #00a0cc;
}

@media (max-width: 991px) {
  .form-card {
    margin-top: 30px;
    padding: 30px;
  }
}
</style>
