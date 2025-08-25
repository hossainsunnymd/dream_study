<script setup>
import { usePage } from "@inertiajs/vue3";

const page = usePage();
</script>

<template>
  <!-- Header Start -->
  <div
    class="container-fluid professional-header"
    :style="{
      backgroundImage: `url('/storage/logo/${page.props.setting.contact_banner_image}')`,
      height: '400px',
    }"
  >
    <div class="container text-center py-5" style="max-width: 900px">
      <h3 class="text-white display-3 mb-4 animate-slide-down">Contact Us</h3>
      <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="/" class="text-white-50">Home</a></li>
        <li class="breadcrumb-item"><a href="#" class="text-white-50">Pages</a></li>
        <li class="breadcrumb-item active text-white">Contact</li>
      </ol>
    </div>
  </div>
  <!-- Header End -->

  <!-- Contact Section Start -->
  <div class="container-fluid contact-section">
    <div class="container py-5">
      <div class="mx-auto text-center mb-5" style="max-width: 900px">
        <h5 class="section-title px-3 text-white animate-fade-in">Contact Us</h5>
        <h1 class="mb-0 text-white animate-slide-up">Contact For Any Query</h1>
      </div>

      <div class="row g-5 align-items-center">
        <!-- Contact Info -->
        <div class="col-lg-4 animate-slide-left">
          <div class="glass-card p-4 glass-hover">
            <div class="text-center mb-4">
              <i class="fa fa-map-marker-alt fa-3x text-primary"></i>
              <p class="mb-0 text-white mt-2">{{ page.props.setting.site_address }}</p>
            </div>
            <div class="text-center mb-4">
              <i class="fa fa-phone-alt fa-3x text-primary mb-3"></i>
              <h4 class="text-primary">Mobile</h4>
              <p class="mb-0 text-white typing-text">{{ page.props.setting.site_phone }}</p><br />
              <p class="mb-0 text-white typing-text">{{ page.props.setting.site_fax }}</p>
            </div>
            <div class="text-center">
              <i class="fa fa-envelope-open fa-3x text-primary mb-3"></i>
              <h4 class="text-primary">Email</h4>
              <p class="mb-0 text-white typing-text">{{ page.props.setting.site_email }}</p>
            </div>
          </div>
        </div>

        <!-- Contact Form -->
        <div class="col-lg-8 animate-slide-right">
          <div class="glass-card p-4 glass-hover">
            <h3 class="mb-4 text-white">Send us a message</h3>
            <form>
              <div class="row g-3">
                <div class="col-md-6">
                  <div class="form-floating">
                    <input type="text" class="form-control border-0 form-hover" id="name" placeholder="Your Name" />
                    <label for="name">Your Name</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-floating">
                    <input type="email" class="form-control border-0 form-hover" id="email" placeholder="Your Email" />
                    <label for="email">Your Email</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-floating">
                    <input type="text" class="form-control border-0 form-hover" id="subject" placeholder="Subject" />
                    <label for="subject">Subject</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-floating">
                    <textarea class="form-control border-0 form-hover" placeholder="Leave a message here" id="message" style="height: 160px"></textarea>
                    <label for="message">Message</label>
                  </div>
                </div>
                <div class="col-12">
                  <button class="btn btn-primary w-100 py-3" type="submit">Send Message</button>
                </div>
              </div>
            </form>
          </div>
        </div>

        <!-- Map -->
        <div class="col-12 mt-4 animate-fade-in">
          <div class="rounded">
            <iframe
              class="rounded w-100"
              style="height: 450px"
              :src="page.props.setting.google_map_link??''"
              loading="lazy"
              referrerpolicy="no-referrer-when-downgrade"
            ></iframe>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Contact Section End -->
</template>

<style scoped>
/* Header Background Professional */
.professional-header {
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  background-attachment: fixed;
  position: relative;
  z-index: 1;
}
.professional-header::before {
  content: "";
  position: absolute;
  top: 0; left: 0;
  width: 100%; height: 100%;
  /* background: linear-gradient(to bottom, rgba(10,25,47,0.85), rgba(5,15,35,0.85)); */
  z-index: -1;
}
.professional-header .container { position: relative; z-index: 2; }

/* Contact Section Professional Background */
.contact-section {
  background: linear-gradient(135deg, #0a1a2f, #05152b);
  padding-top: 60px;
  padding-bottom: 60px;
}

/* Glassmorphism Cards */
.glass-card {
  background: rgba(255, 255, 255, 0.05);
  backdrop-filter: blur(12px);
  border-radius: 16px;
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 6px 20px rgba(0,0,0,0.15);
  color: #fff;
  transition: transform 0.4s ease, box-shadow 0.4s ease;
}
.glass-hover:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 30px rgba(255,255,255,0.2);
}

/* Form Inputs Professional */
.form-control {
  color: #000 !important;
  background-color: rgba(255, 255, 255, 0.9);
  transition: all 0.3s ease;
  border-radius: 8px;
}
.form-control::placeholder { color: #555; }
.form-hover:hover, .form-hover:focus {
  background-color: rgba(255,255,255,1);
  box-shadow: 0 4px 15px rgba(255,255,255,0.3);
  color: #000;
}
label { color: #000 !important; }

/* Buttons */
.btn-primary {
  transition: all 0.3s ease;
}
.btn-primary:hover {
  box-shadow: 0 8px 20px rgba(255,255,255,0.25);
}

/* Animations */
@keyframes slideLeft { 0% { transform: translateX(-50px); opacity: 0; } 100% { transform: translateX(0); opacity: 1; } }
@keyframes slideRight { 0% { transform: translateX(50px); opacity: 0; } 100% { transform: translateX(0); opacity: 1; } }
@keyframes slideUp { 0% { transform: translateY(50px); opacity: 0; } 100% { transform: translateY(0); opacity: 1; } }
@keyframes slideDown { 0% { transform: translateY(-50px); opacity: 0; } 100% { transform: translateY(0); opacity: 1; } }
@keyframes fadeIn { 0% { opacity: 0; } 100% { opacity: 1; } }

.animate-slide-left { animation: slideLeft 1s ease forwards; }
.animate-slide-right { animation: slideRight 1s ease forwards; }
.animate-slide-up { animation: slideUp 1s ease forwards; }
.animate-slide-down { animation: slideDown 1s ease forwards; }
.animate-fade-in { animation: fadeIn 1.2s ease forwards; }


.typing-text {
    display: inline-block;
    white-space: nowrap;
    overflow: hidden;
    position: relative;
    width: 15ch;
}

.typing-text  {
    display: inline-block;
    animation: typingLoop 4s steps(9) infinite;
    overflow: hidden;
    white-space: nowrap;
}

/* Fixed blinking cursor */
.typing-text::after {
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    height: 100%;
    width: 2px;
    background-color: #fff;
    animation: blink 1.5s steps(1) infinite;
}

@keyframes typingLoop {
    0% {
        width: 0ch;
    }
    40% {
        width: 15ch;
    }
    60% {
        width: 15ch;
    }
    100% {
        width: 0ch;
    }
}

@keyframes blink {
    0%,
    50%,
    100% {
        opacity: 1;
    }
    25%,
    75% {
        opacity: 0;
    }
}
</style>
