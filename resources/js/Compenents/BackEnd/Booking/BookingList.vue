<script setup>
import { ref } from "vue";
import { Link, router, usePage, useForm } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";

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
    { text: "PDF", value: "pdf" },
    { text: "Payment Status", value: "payment_status" },
    { text: "Payment Description", value: "payment_description" },
    { text: "Action", value: "action" },
];

// Users and search fields
const items = ref(page.props.bookings);

const searchField = ref(["id", "name", "email"]);
const searchItem = ref();

// Delete User
function deleteBooking(id) {
    if (confirm("Are you sure you want to delete this Booking?")) {
        router.get(`/admin/booking/${id}`);
    }
}

const form = useForm({
    status: "",
    fromDate: "",
    toDate: "",
    country_name: "",
});

function search() {
    form.get("/admin/bookings", {
        preserveScroll: true,
        preserveState: true,
        onSuccess: () => {
            items.value = page.props.bookings;
        },
    });
}

// Flash message toast
if (page.props.flash.status === false) {
    toaster.error(page.props.flash.message);
} else if (page.props.flash.status === true) {
    toaster.success(page.props.flash.message);
}
</script>

<template>
    <h3 class="fw-bold mb-4">Booking List</h3>

    <div class="row mb-3 g-2 align-items-center">
        <!-- Search Section -->
        <div class="col-12 col-md-9">
            <div class="d-flex flex-wrap gap-2">
                <input
                    type="text"
                    class="form-control flex-grow-1"
                    v-model="searchItem"
                    placeholder="Search by here"
                    style="max-width: 200px"
                />
                <select
                    v-model="form.status"
                    class="form-select"
                    style="max-width: 200px"
                >
                    <option value="" selected>Select Status</option>
                    <option value="pending">Pending</option>
                    <option value="cancel">Cancel</option>
                    <option value="success">Success</option>
                </select>

                <select
                    v-model="form.country_name"
                    class="form-select"
                    style="max-width: 200px"
                >
                    <option value="" selected disabled>Select Country</option>
                    <option value="">All</option>
                    <option
                        v-for="country in page.props.countries"
                        :key="country.id"
                        :value="country.country_name"
                    >
                        {{ country.country_name }}
                    </option>
                </select>
                <input
                    v-model="form.fromDate"
                    type="date"
                    class="form-control"
                    style="max-width: 200px"
                />
                <input
                    v-model="form.toDate"
                    type="date"
                    class="form-control"
                    style="max-width: 200px"
                />
                <button @click="search" class="btn btn-primary">Search</button>
                <Link href="/admin/bookings" class="btn btn-dark">Clear</Link>
            </div>
        </div>

        <!-- Create Sale Button -->
        <div class="col-12 col-md-3 text-md-end mt-2 mt-md-0">
            <Link
                v-if="page.props.user.can['booking-save']"
                :href="`/admin/booking-save-page?booking_id=${0}`"
                class="btn btn-success"
            >
                Add Booking
            </Link>
        </div>
    </div>

    <!-- Data Table -->
    <EasyDataTable
        :headers="headers"
        :items="items"
        :search-field="searchField"
        :search-value="searchItem"
        alternating
        :rows-per-page="5"
        table-class="table table-striped table-bordered"
    >
        <template #item-pdf="{ pdf }">
            <a :href="`/storage/booking/${pdf}`" target="_blank">View</a>
        </template>
        <!-- Action Column -->
        <template #item-action="{ id }">
            <div class="d-flex gap-2">
                <Link
                    v-if="page.props.user.can['booking-update']"
                    :href="`/admin/booking-save-page?booking_id=${id}`"
                    class="btn btn-sm btn-primary"
                >
                    Edit
                </Link>
                <button
                    v-if="page.props.user.can['booking-delete']"
                    @click="deleteBooking(id)"
                    class="btn btn-sm btn-danger"
                >
                    Delete
                </button>
            </div>
        </template>
    </EasyDataTable>
</template>

<style scoped></style>
