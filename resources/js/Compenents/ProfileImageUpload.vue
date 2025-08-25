<script setup>
import { ref, computed } from "vue";

const props = defineProps({
    profileImage: {
        type: [String, File],
        default: null,
    },
});

const emit = defineEmits(["image"]);
const preview = ref(null);

const currentImage = computed(() => {
    if (preview.value) {
        return preview.value;
    } else if (props.profileImage instanceof File) {
        return URL.createObjectURL(props.profileImage);
    } else if (typeof props.profileImage === "string" && props.profileImage !== '') {
        return `/storage/profile/${props.profileImage}`;
    } else {
        return 'placeholder.png';
    }
});

const imageSelected = (e) => {
    const file = e.target.files[0];
    if (file) {
        preview.value = URL.createObjectURL(file);
        emit("image", file);
    }
};
</script>

<template>
    <div class="text-center position-relative mb-4">
        <img
            :src="currentImage"
            alt="Profile"
            class="profile-img"
        />
        <label for="avatarInput" class="upload-btn">
            <input
                type="file"
                id="avatarInput"
                accept="image/*"
                class="d-none"
                @change="imageSelected"
            />
        </label>
    </div>
</template>

<style scoped>
.profile-img {
    width: 150px;
    height: 150px;
    object-fit: cover;
    border-radius: 50%;
    border: 2px solid #ccc;
}

.upload-btn {
    position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
    cursor: pointer;
    background-color: #007bff;
    color: white;
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 14px;
}
</style>
