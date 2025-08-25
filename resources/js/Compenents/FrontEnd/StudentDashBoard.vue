<script setup>
import { ref } from "vue";
import { Link, usePage } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";
import axios from "axios";

// Modal state
const showModal = ref(false);
const paymentId = ref(null);
const paymentDescription = ref(""); // spelling corrected

// Open modal and set booking ID
function openModal(id) {
    showModal.value = true;
    paymentId.value = id;
    paymentDescription.value = ""; // reset description each time
}

// Close modal
function closeModal() {
    showModal.value = false;
}

// Toaster
const toaster = createToaster({
  position: "top-right"
});
const page = usePage();

// Table headers
const headers = [
    { text: "ID", value: "id" },
    { text: "Name", value: "name" },
    { text: "Email", value: "email" },
    { text: "BD Phone", value: "bd_mobile" },
    { text: "Preffered Country", value: "prefferred_country" },
    { text: "Last Education", value: "last_education" },
    { text: "Status", value: "status" },
    { text: "Payment Status", value: "payment_status" },
    { text: "Payment Description", value: "payment_description" },
    { text: "Action", value: "action" },
];

// Table items and search
const items = ref(page.props.bookings || []);
const searchField = ref(["id", "name", "email"]);
const searchItem = ref("");

// Payment gateway redirect
async function goToGateway() {
    if (!paymentDescription.value) {
        toaster.error("Please enter a payment description");
        return;
    }

    closeModal();
    try {
        const response = await axios.get(
            `/initiate-payment?booking_id=${paymentId.value}&payment_description=${encodeURIComponent(paymentDescription.value)}`
        );
        if (response.data?.GatewayPageURL) {
            window.location.href = response.data.GatewayPageURL;
        } else {
            toaster.error("Payment initiation failed.");
        }
    } catch (error) {
        toaster.error("Error during payment.");
    }
}

</script>

<template>
    <!-- Modal -->
    <div
        v-if="showModal"
        class="modal fade show d-block"
        tabindex="-1"
        style="background-color: rgba(0, 0, 0, 0.5)"
    >
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Select Payment Method</h5>
                    <button type="button" class="btn-close" @click="closeModal"></button>
                </div>
                <div class="modal-body text-center">
                    <label for="payment-description">Add Description</label>
                    <input
                        type="text"
                        id="payment-description"
                        class="form-control m-2"
                        v-model="paymentDescription"
                        placeholder="Enter payment description"
                    />
                    <button
                        class="btn btn-outline-danger me-3"
                        @click="goToGateway"
                    >
                        Select Payment Method
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Overlay if user is disabled -->
    <div
        v-if="page.props.user?.authUser?.is_active === 'Disable'"
        class="overlay"
    >
        <div class="overlay-content">
            <h4>Your ID is not active</h4>
            <p>Please contact admin for activation.</p>
        </div>
    </div>

    <!-- Booking Section -->
    <h3 class="fw-bold mb-4">My Bookings</h3>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <input
            type="text"
            class="form-control w-25"
            v-model="searchItem"
            placeholder="Search here"
        />
        <div>
            <Link href="/travel-booking" class="btn btn-success me-2">Add Booking</Link>
        </div>
    </div>

    <!-- Booking Table -->
    <EasyDataTable
        :headers="headers"
        :items="items"
        :search-field="searchField"
        :search-value="searchItem"
        alternating
        :rows-per-page="5"
        table-class="table table-striped table-bordered"
    >
        <template #item-action="{ id ,payment_status}">
            <button  :disabled="payment_status === 'success'"  @click="openModal(id)" class="btn btn-success">Pay Now</button>
        </template>
    </EasyDataTable>
</template>

<style scoped>
.overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    z-index: 9999;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    text-align: center;
}

.overlay-content {
    background-color: #222;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 0 20px #000;
}

.modal {
    z-index: 1050;
}
</style>
