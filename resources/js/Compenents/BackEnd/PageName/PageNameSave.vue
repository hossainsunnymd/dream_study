<script setup>
import { usePage, useForm, router } from "@inertiajs/vue3";
import { createToaster } from "@meforma/vue-toaster";
import { ref, computed } from "vue";

const toaster = createToaster({
  position: "top-right"
});
const page = usePage();
const page_id = new URLSearchParams(window.location.search).get("page_id") ?? 0;
const pageName = page.props.pageName;
const errors = computed(() => page.props.errors || {});

const form = useForm({
    name: "",
    rank: "",
});

if (page_id != 0 && pageName != null) {
    form.name = pageName.name;
    form.rank = pageName.rank;
}

const URL = page_id != 0 ? `/admin/page/${page_id}` : "/admin/page";

function submitForm() {
    form.post(URL, {
        preserveScroll: true,
        onSuccess: () => {
            if (page.props.flash.status == true) {
                toaster.success(page.props.flash.message);
                router.get("/admin/pages");
            } else if (page.props.flash.status == false) {
                toaster.error(page.props.flash.message);
            }
        },
    });
}
</script>

<template>
    <div class="container-fluid vh-100 d-flex justify-content-center">
        <div class="row w-100 justify-content-center">
            <!-- Booking Form -->
            <div class="col-md-6">
                <div class="card shadow p-4 bg-white">
                    <h4 class="text-center mb-3">
                        {{ page_id == 0 ? "Create Page" : "Update Page" }}
                    </h4>
                    <form @submit.prevent="submitForm">
                        <div class="mb-3">
                            <!-- Rank -->
                            <div class="mb-3">
                                <label class="form-label">Rank</label>
                                <input
                                    v-model="form.rank"
                                    type="number"
                                    class="form-control"
                                />
                                <div v-if="errors.rank" class="text-danger">
                                    {{ errors.rank[0] }}
                                </div>
                            </div>
                            <label class="form-label">Page Name</label>
                            <input
                                v-model="form.name"
                                type="text"
                                class="form-control"
                            />
                            <div v-if="errors.name" class="text-danger">
                                {{ errors.name[0] }}
                            </div>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">
                                {{
                                    page_id == 0
                                        ? "Create Page "
                                        : "Update Page"
                                }}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>
