<script setup>
import { Link, usePage } from "@inertiajs/vue3";
const page = usePage();
</script>

<template>
    <div
        class="container-fluid bg-dark text-white py-2 px-5 d-none d-lg-block animate__animated animate__fadeInDown"
    >
        <div class="row align-items-center">
            <!-- Left Social Icons -->
            <div class="col-lg-8 d-flex align-items-center gap-2">
                <Link
                    :href="page.props.setting.twitter_link?page.props.setting.twitter_link:'#'"
                    class="btn btn-sm btn-outline-light btn-sm-square rounded-circle hover-float"
                >
                    <i class="fab fa-twitter"></i>
                </Link>

                <Link
                    :href="page.props.setting.fb_link?page.props.setting.fb_link:'#'"
                    class="btn btn-sm btn-outline-light btn-sm-square rounded-circle hover-float"
                >
                    <i class="fab fa-facebook-f"></i>
                </Link>

                <Link
                    :href="page.props.setting.linkedin_link?page.props.setting.linkedin_link:'#'"
                    class="btn btn-sm btn-outline-light btn-sm-square rounded-circle hover-float"
                >
                    <i class="fab fa-linkedin-in"></i>
                </Link>

                <Link
                    :href="page.props.setting.instagram_link?page.props.setting.instagram_link:'#'"
                    class="btn btn-sm btn-outline-light btn-sm-square rounded-circle hover-float"
                >
                    <i class="fab fa-instagram"></i>
                </Link>

                <Link
                    :href="page.props.setting.youtube_link?page.props.setting.youtube_link:'#'"
                    class="btn btn-sm btn-outline-light btn-sm-square rounded-circle hover-float"
                >
                    <i class="fab fa-youtube"></i>
                </Link>
            </div>

            <!-- Right Auth Links -->
            <div class="col-lg-4 text-end">
                <div class="d-inline-flex align-items-center gap-3">
                    <Link
                        v-if="!page.props.user.login"
                        href="/register"
                        class="text-white text-decoration-none hover-underline"
                    >
                        <small><i class="fa fa-user me-1"></i>Register</small>
                    </Link>
                    <Link
                        v-if="!page.props.user.login"
                        href="/login"
                        class="text-white text-decoration-none hover-underline"
                    >
                        <small
                            ><i class="fa fa-sign-in-alt me-1"></i>Login</small
                        >
                    </Link>
                    <Link
                        v-if="page.props.user.login"
                        href="/logout"
                        class="text-white text-decoration-none hover-underline"
                    >
                        <small
                            ><i class="fa fa-sign-out-alt me-1"></i
                            >Logout</small
                        >
                    </Link>
                    <Link
                        v-if="page.props.user.login"
                        :href="
                            page.props.user.authUser.user_type === 'admin'
                                ? '/admin/dashboard'
                                : '/student/dashboard'
                        "
                        class="text-white text-decoration-none hover-underline"
                    >
                        <small><i class="fa fa-home me-1"></i>Dashboard</small>
                    </Link>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
/* Social Button Hover Animation */
.btn-sm-square {
    width: 35px;
    height: 35px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    transition: transform 0.3s ease, background-color 0.3s ease;
}
.hover-float:hover {
    transform: translateY(-3px) scale(1.05);
    background-color: #ffffff22;
}

/* Text Link Hover Animation */
.hover-underline {
    position: relative;
    transition: color 0.3s ease;
}
.hover-underline::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -2px;
    width: 0%;
    height: 1px;
    background-color: #fff;
    transition: width 0.3s ease;
}
.hover-underline:hover::after {
    width: 100%;
}
</style>
