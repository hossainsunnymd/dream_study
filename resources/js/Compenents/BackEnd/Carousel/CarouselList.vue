<script setup>
import { ref } from "vue";
import { Link, router, usePage } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";

const toaster = createToaster({
  position: "top-right"
});
const page = usePage();

// Table headers
const headers = [
    { text: "Image", value: "image" },
    { text: "Title", value: "title" },
    { text: "Description", value: "description" },
    { text: "Rank", value: "rank" },
    { text: "Action", value: "action" },
];

// Users and search fields
const items = ref(page.props.carousels || []);

const searchField = ref(["id", "name"]);
const searchItem = ref();

// Delete User
function deleteCarousel(id) {
    if (confirm("Are you sure you want to delete this Carousel?")) {
        router.get(`/admin/carousel/${id}`);
    }
}

// Flash message toast
if (page.props.flash.status === false) {
    toaster.error(page.props.flash.message);
} else if (page.props.flash.status === true) {
    toaster.success(page.props.flash.message);
}
</script>

<template>
    <h3 class="fw-bold mb-4">Carousel List</h3>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <!-- Search Input -->
        <input
            type="text"
            class="form-control w-25"
            v-model="searchItem"
            placeholder="Search here"
        />

        <!-- Add Button -->
        <Link v-if="page.props.user.can['carousel-save']"
            :href="`/admin/carousel-save-page?carousel_id=${0}`"
            class="btn btn-success"
        >
            Add Carousel
        </Link>
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
        <template #item-image="{ image }">
            <img
                :src="`/storage/carousel/${image}`"
                style="width: 50px; height: 50px"
            />
        </template>
        <!-- Action Column -->
        <template #item-action="{ id }">
            <div class="d-flex gap-2">
                <Link v-if="page.props.user.can['carousel-update']"
                    :href="`/admin/carousel-save-page?carousel_id=${id}`"
                    class="btn btn-sm btn-primary"
                >
                    Edit
                </Link>
                <button v-if="page.props.user.can['carousel-delete']"
                    @click="deleteCarousel(id)"
                    class="btn btn-sm btn-danger"
                >
                    Delete
                </button>
            </div>
        </template>
    </EasyDataTable>
</template>

<style scoped></style>
