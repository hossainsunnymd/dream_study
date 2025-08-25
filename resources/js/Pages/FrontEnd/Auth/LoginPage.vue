<script setup>
import { useForm,usePage,router,Link } from '@inertiajs/vue3';
import { createToaster } from "@meforma/vue-toaster";
import { computed } from 'vue';

const page=usePage();

const toaster = createToaster({
  position: "top-right"
});
const errors=computed(() => page.props.errors|| {});

const form = useForm({
    email: '',
    password: '',
});

const handleLogin=() => {
    form.post('/user-login',{
        preserveScroll: true,
        onSuccess: () => {
            if(page.props.flash.status==true){
                toaster.success(page.props.flash.message);
            }else if(page.props.flash.status==false){
                toaster.error(page.props.flash.message);
            }
        },
    });
};



</script>

<template>
  <div
    class="login-wrapper"
    :style="{
      backgroundImage: `linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('${
        page.props.setting?.login_banner_image
          ? '/storage/logo/' + page.props.setting.login_banner_image
          : 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1600&q=80'
      }')`,
      backgroundSize: 'cover',
      backgroundPosition: 'center',
      backgroundRepeat: 'no-repeat',
      minHeight: '100vh',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
    }"
  >
    <div class="login-box">
      <h2>Traveler Login</h2>
      <form @submit.prevent="handleLogin">
        <div class="mb-3">
          <label for="email" class="form-label">Email address</label>
          <input v-model="form.email" type="email" class="form-control" id="email" placeholder="Enter email">
          <span class="text-danger" v-if="errors.email">{{ errors.email[0] }}</span>
        </div>

        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <input v-model="form.password" type="password" class="form-control" id="password" placeholder="Enter password">
          <span class="text-danger" v-if="errors.password">{{ errors.password[0] }}</span>
        </div>

        <div class="d-grid mb-3">
          <button type="submit" class="btn btn-travel text-white">Login</button>
        </div>

        <div class="text-center">
          <Link href="/verify-email-page" class="text-decoration-none">Forgot your password?</Link>
        </div>
      </form>
    </div>
  </div>
</template>


<style scoped>


.login-box {
  background-color: rgba(255, 255, 255, 0.95);
  padding: 40px;
  border-radius: 15px;
  max-width: 400px;
  width: 100%;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
}

.login-box h2 {
  text-align: center;
  margin-bottom: 25px;
  color: #0d6efd;
}

.btn-travel {
  background-color: #0d6efd;
  border: none;
}
.btn-travel:hover {
  background-color: #084298;
}
</style>
