<script setup>
import Topper from '../../Compenents/Topper.vue';
import Navbar from '../../Compenents/Navbar.vue';
import Footer from '../../Compenents/Footer.vue';
import Hero from '../../Compenents/Hero.vue';
import Home from '../../Compenents/Home.vue';
import { Head } from '@inertiajs/vue3';
</script>

<template>
    <Head>
        <title>Home</title>
    </Head>
   <Topper/>
   <Navbar/>
   <Hero/>
   <Home/>
   <Footer/>
</template>

<style scoped>

</style>
