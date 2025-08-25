<script setup>
import { usePage } from '@inertiajs/vue3';
const page = usePage();
</script>

<template>
  <div>
    <!-- Dashboard Content -->
    <div class="container-fluid my-4">
      <h1 class="mb-4 text-primary fw-bold">📊 Dashboard Overview</h1>

      <!-- Stats Cards -->
      <div class="row g-3">
        <div class="col-md-4">
          <div class="card border-0 shadow-sm text-white" style="background-color: #198754;">
            <div class="card-body">
              <h5 class="card-title">Total Users</h5>
              <p class="card-text display-6 fw-bold">{{ page.props.users }}</p>
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card border-0 shadow-sm text-white" style="background-color: #0dcaf0;">
            <div class="card-body">
              <h5 class="card-title">Total Studens</h5>
              <p class="card-text display-6 fw-bold">{{ page.props.students }}</p>
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card border-0 shadow-sm text-white" style="background-color: #ffc107;">
            <div class="card-body">
              <h5 class="card-title">Total Services</h5>
              <p class="card-text display-6 fw-bold">{{ page.props.services }}</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Recent Activity -->
      <!-- <div class="card shadow-sm border-0 mt-4" style="border-left: 5px solid #0d6efd;">
        <div class="card-body">
          <h5 class="card-title mb-3 text-primary">Recent Activities</h5>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">🆕 New user registered</li>
            <li class="list-group-item">💰 Sale completed - $120</li>
            <li class="list-group-item">📦 Order #1023 shipped</li>
          </ul>
        </div>
      </div> -->
    </div>
  </div>
</template>

<style scoped>
.card {
  border-radius: 12px;
}
</style>
